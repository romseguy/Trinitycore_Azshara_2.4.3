/* Copyright (C) 2009 - D_Skywalk <http://www.trinitycore.org/>
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

/* ScriptData
 SDName: npc_beastmaster
 SD%Complete: 100
 SDComment: Pet manager
 SDCategory: Script Arena
 EndScriptData */

#include "ScriptPCH.h"
#include "Pet.h"
#include "Formulas.h"

#define GOSSIP_ITEM_STABLE "Stable"
#define GOSSIP_ITEM_NEWPET "New Pet"
#define GOSSIP_ITEM_BOAR "Boar"
#define GOSSIP_ITEM_SERPENT "Snake"
#define GOSSIP_ITEM_SCRAB "Scorpid"
#define GOSSIP_ITEM_LION "Lion"
#define GOSSIP_ITEM_WOLF "Wolf"
#define GOSSIP_ITEM_RAVAGER "Ravager"

void CreatePet(Player *player, Creature * m_creature, uint32 entry)
{
    if (player->GetPet())
    {
        m_creature->Say("You have to dismiss your pet first.", LANG_UNIVERSAL, 0);
        player->PlayerTalkClass->CloseGossip();
        return;
    }

    Creature *creatureTarget = m_creature->SummonCreature(entry, player->GetPositionX(), player->GetPositionY() + 2, player->GetPositionZ(),
            player->GetOrientation(), TEMPSUMMON_CORPSE_TIMED_DESPAWN, 500);

    if (!creatureTarget)
        return;

    Pet* pet = player->CreateTamedPetFrom(creatureTarget, 0);
    if (!pet)
        return;

    // kill original creature
    creatureTarget->setDeathState(JUST_DIED);
    creatureTarget->RemoveCorpse();
    creatureTarget->SetHealth(0); // just for nice GM-mode view

    // 1500 training points, max happiness and loyalty
    pet->SetTP(1500);
    pet->SetPower(POWER_HAPPINESS, 1048000);
    pet->SetLoyaltyLevel(BEST_FRIEND);

    // prepare visual effect for levelup
    pet->SetUInt32Value(UNIT_FIELD_LEVEL, 69);
    pet->GetMap()->Add((Creature*) pet);

    // visual effect for levelup
    pet->SetUInt32Value(UNIT_FIELD_LEVEL, 70);

    if (!pet->InitStatsForLevel(70))
        error_log("Pet Create fail: no init stats for entry %u", entry);

    pet->UpdateAllStats();

    // caster have pet now
    player->SetMinion(pet, true);

    pet->SavePetToDB(PET_SAVE_AS_CURRENT);
    player->PetSpellInitialize();

    //end
    player->PlayerTalkClass->CloseGossip();
}

bool GossipHello_npc_beastmaster(Player *player, Creature *_Creature)
{
    if (player->getClass() != CLASS_HUNTER)
        return true;

    player->ADD_GOSSIP_ITEM(0, GOSSIP_ITEM_BOAR, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
    player->ADD_GOSSIP_ITEM(0, GOSSIP_ITEM_WOLF, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
    player->ADD_GOSSIP_ITEM(0, GOSSIP_ITEM_SERPENT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
    player->ADD_GOSSIP_ITEM(0, GOSSIP_ITEM_SCRAB, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
    player->ADD_GOSSIP_ITEM(0, GOSSIP_ITEM_LION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
    player->ADD_GOSSIP_ITEM(0, GOSSIP_ITEM_RAVAGER, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
    player->SEND_GOSSIP_MENU(100000, _Creature->GetGUID());

    return true;
}

bool GossipSelect_npc_beastmaster(Player *player, Creature *_Creature, uint32 sender, uint32 action)
{
    switch (action)
    {
        case GOSSIP_ACTION_INFO_DEF + 1: //BOAR
            CreatePet(player, _Creature, 1192);
            break;

        case GOSSIP_ACTION_INFO_DEF + 2: //WOLF
            CreatePet(player, _Creature, 20058);
            break;

        case GOSSIP_ACTION_INFO_DEF + 3: //SERPENT
            CreatePet(player, _Creature, 20749);
            break;

        case GOSSIP_ACTION_INFO_DEF + 4: //SCORPID
            CreatePet(player, _Creature, 21864);
            break;

        case GOSSIP_ACTION_INFO_DEF + 5: //LION
            CreatePet(player, _Creature, 20671);
            break;

        case GOSSIP_ACTION_INFO_DEF + 6: //RAVAGER
            CreatePet(player, _Creature, 24922);
            break;
    }

    return true;
}

void AddSC_npc_beastmaster()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_beastmaster";
    newscript->pGossipHello = &GossipHello_npc_beastmaster;
    newscript->pGossipSelect = &GossipSelect_npc_beastmaster;
    newscript->RegisterSelf();
}
