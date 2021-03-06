/*
 * Copyright (C) 2005-2008 MaNGOS <http://www.mangosproject.org/>
 *
 * Copyright (C) 2008 Trinity <http://www.trinitycore.org/>
 *
 * Copyright (C) 2010 Oregon <http://www.oregoncore.com/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

#include "Totem.h"
#include "WorldPacket.h"
#include "MapManager.h"
#include "Log.h"
#include "Group.h"
#include "Player.h"
#include "ObjectMgr.h"
#include "SpellMgr.h"

Totem::Totem(SummonPropertiesEntry const *properties, Unit *owner) : Minion(properties, owner)
{
    m_summonMask |= SUMMON_MASK_TOTEM;
    m_duration = 0;
    m_type = TOTEM_PASSIVE;
}

void Totem::Update(uint32 time)
{
    if (!m_owner->isAlive() || !isAlive())
    {
        UnSummon();                                         // remove self
        return;
    }

    if (m_duration <= time)
    {
        UnSummon();                                         // remove self
        return;
    }
    else
        m_duration -= time;

    Creature::Update(time);
}

void Totem::InitStats(uint32 duration)
{
    Minion::InitStats(duration);

    CreatureInfo const *cinfo = GetCreatureInfo();
    if (m_owner->GetTypeId() == TYPEID_PLAYER && cinfo)
    {
        uint32 modelid = 0;
        if (m_owner->ToPlayer()->GetTeam() == HORDE)
        {
            if (cinfo->Modelid_H1)
                modelid = cinfo->Modelid_H1;
            else if (cinfo->Modelid_H2)
                modelid = cinfo->Modelid_H2;
        }
        else
        {
            if (cinfo->Modelid_A1)
                modelid = cinfo->Modelid_A1;
            else if (cinfo->Modelid_A2)
                modelid = cinfo->Modelid_A2;
        }
        if (modelid)
            SetDisplayId(modelid);
        else
            sLog.outErrorDb("Totem::Summon: Missing modelid information for entry %u, team %u, totem will use default values.",GetEntry(),m_owner->ToPlayer()->GetTeam());
    }

    // Get spell casted by totem
    SpellEntry const * totemSpell = sSpellStore.LookupEntry(GetSpell());
    if (totemSpell)
    {
        // If spell have cast time -> so its active totem
        if (GetSpellCastTime(totemSpell))
            m_type = TOTEM_ACTIVE;
    }

    if (GetEntry() == SENTRY_TOTEM_ENTRY)
        SetReactState(REACT_AGGRESSIVE);

    m_duration = duration;

    SetLevel(m_owner->getLevel());
}

void Totem::InitSummon()
{
    WorldPacket data(SMSG_GAMEOBJECT_SPAWN_ANIM_OBSOLETE, 8);
    data << GetGUID();
    SendMessageToSet(&data, true);
    
    if (m_type == TOTEM_PASSIVE)
	    CastSpell(this, GetSpell(), true);
                
    // temp fix, for the first tick when dropped 
    switch(GetEntry())
    {       
        case 5923: CastSpell(this, 8168, true); break; // Poison Cleansing
        case 5924: CastSpell(this, 8171, true); break; // Disease Cleansing
		case 2630: CastSpell(this, 3600, true); break; // Earthbind
		case 6112: CastSpell(this, 8514, true); break; // Windfury I
		case 7483: CastSpell(this, 10607, true); break; // Windfury II
		case 7484: CastSpell(this, 10611, true); break; // Windfury III
		case 15496: CastSpell(this, 25581, true); break; // Windfury IV
		case 15497: CastSpell(this, 25580, true); break; // Windfury V
		case 5950: CastSpell(this, 8230, true); break; // Flametongue I
		case 6012: CastSpell(this, 8250, true); break; // Flametongue II
		case 7423: CastSpell(this, 10521, true); break; // Flametongue III
		case 10557: CastSpell(this, 15036, true); break; // Flametongue IV
		case 15485: CastSpell(this, 25554, true); break; // Flametongue V
            default:
        break;
    }       
}

void Totem::UnSummon()
{
    SendObjectDeSpawnAnim(GetGUID());

    CombatStop();
    RemoveAurasDueToSpell(GetSpell());

    // clear owner's totem slot
    for (int i = SUMMON_SLOT_TOTEM; i < MAX_TOTEM_SLOT; ++i)
    {
        if (m_owner->m_SummonSlot[i] == GetGUID())
        {
            m_owner->m_SummonSlot[i] = 0;
            break;
        }
    }

    m_owner->RemoveAurasDueToSpell(GetSpell());

    //remove aura all party members too
    Group *pGroup = NULL;
    if (m_owner->GetTypeId() == TYPEID_PLAYER)
    {
        // Not only the player can summon the totem (scripted AI)
        pGroup = m_owner->ToPlayer()->GetGroup();
        if (pGroup)
        {
            for (GroupReference *itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
            {
                Player* Target = itr->getSource();
                if (Target && pGroup->SameSubGroup(m_owner->ToPlayer(), Target))
                    Target->RemoveAurasDueToSpell(GetSpell());
            }
        }
    }

    AddObjectToRemoveList();
}

bool Totem::IsImmunedToSpellEffect(SpellEntry const* spellInfo, uint32 index) const
{
    // TODO: possibly all negative auras immuned?
    switch(spellInfo->EffectApplyAuraName[index])
    {
        case SPELL_AURA_MOD_FEAR:
        case SPELL_AURA_TRANSFORM:
            return true;
        default:
            break;
    }
    return Creature::IsImmunedToSpellEffect(spellInfo, index);
}

