/*
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

#include "OutdoorPvPFFA.h"
#include "SpellAuras.h"
#include "ObjectMgr.h"
#include "World.h"
#include "Chat.h"
#include "MapManager.h"
#include "ScriptedCreature.h"
#include "ScriptPCH.h"
#include "Group.h"
#include "Item.h"
#include "TDFMgr.h"

OutdoorPvPFFA::OutdoorPvPFFA()
{
    m_TypeId = OUTDOOR_PVP_FFA;
}

bool OutdoorPvPFFA::SetupOutdoorPvP()
{
    if (!LoadFFAZone())
        return false;

    for (FFAZoneMap::const_iterator itr = m_FFAZoneMap.begin(); itr != m_FFAZoneMap.end(); itr++)
        RegisterZone((&itr->second)->ZoneId);

    GenerateFFAZone();
    m_killreward.clear();
    m_pTimer.clear();
    m_flagownerGUID = 0;
    m_flagGUID = 0;
    IsMastodonte = false;
    MTimer = 0;
    DespawnFlagTime = 0;
    DespawnFlag = false;
    amount = 0.0f;
    return true;
}

void OutdoorPvPFFA::HandlePlayerEnterZone(Player *plr, uint32 zone)
{
    if (plr->IsFFAZone())
    {
        if (Group* group = plr->GetGroup())
        {
            group->RemoveMember(plr->GetGUID(), 0);
            ChatHandler(plr).PSendSysMessage("You can't enter FFA zone in group.");
        }

        if (Group * groupInvite = plr->GetGroupInvite())
            groupInvite->RemoveInvite(plr);

        m_killreward[plr->GetGUID()] = 0;
        m_pTimer[plr->GetGUID()] = 0;

        OutdoorPvP::HandlePlayerEnterZone(plr,zone);
    }
}

void OutdoorPvPFFA::HandlePlayerLeaveZone(Player *plr, uint32 zone)
{
    OutdoorPvP::HandlePlayerLeaveZone(plr, zone);
    KillReward::iterator itr = m_killreward.find(plr->GetGUID());

    if (itr != m_killreward.end())
    {
        ModScalePerKill(plr, itr->second, false);
        m_killreward.erase(itr);
    }

    pTimer::iterator iter = m_pTimer.find(plr->GetGUID());

    if (iter != m_pTimer.end())
        m_pTimer.erase(iter);

    if (IsFlagOwner(plr->GetGUID()))
        HandleDropFlag(plr, GO_FLAG_ENTRY);
}

void OutdoorPvPFFA::HandleKill(Player *killer, Unit *victim)
{
    if (!killer->IsFFAZone() || victim->GetTypeId() != TYPEID_PLAYER || victim->getLevel() != 70)
        return;

    KillReward::iterator itr2 = m_killreward.find(victim->GetGUID());
    ModScalePerKill(victim->ToPlayer(), itr2->second, false);
    m_killreward[victim->GetGUID()] = 0;

    if (m_pTimer.find(victim->GetGUID()) != m_pTimer.end())
        m_pTimer[victim->GetGUID()] = 0;

    if (IsFlagOwner(victim->GetGUID()))
        HandleDropFlag(victim->ToPlayer(), GO_FLAG_ENTRY);

    ChatHandler(victim->ToPlayer()).PSendSysMessage("End of spree. You are back to your normal height.");

    if (killer->HasAura(2479, 0) || victim->HasAura(2479, 0))
    {
        ChatHandler(killer).PSendSysMessage("You did not receive your reward because it was an honorless target.");
        return;
    }

    TDFEntry const* TDF = sTDFMgr.GetTDFEntryById(6);

    if (TDF && !killer->GetTDFMgr().HasAchievedTDFById(6))
        killer->GetTDFMgr().UpdateCriteriaTDF(TDF, 1 ,0 ,0 ,0);

    TDF = sTDFMgr.GetTDFEntryById(7);

    if (TDF && !killer->GetTDFMgr().HasAchievedTDFById(7))
        killer->GetTDFMgr().UpdateCriteriaTDF(TDF, 1 ,0 ,0 ,0);

    TDF = sTDFMgr.GetTDFEntryById(8);

    if (TDF && !killer->GetTDFMgr().HasAchievedTDFById(8))
        killer->GetTDFMgr().UpdateCriteriaTDF(TDF, 1 ,0 ,0 ,0);

    m_killreward[killer->GetGUID()] += 1;
    KillReward::iterator itr = m_killreward.find(killer->GetGUID());
    SetNewKillReward(killer->GetGUID(), itr->second);
    //killer->CastSpell(killer, 48085, true);

    if (IsFlagOwner(killer->GetGUID()) || IsFlagOwner(victim->GetGUID()))
        AddItem(killer, TOKEN_ID, 2);
    else
        AddItem(killer, TOKEN_ID, 1);
}

void OutdoorPvPFFA::AddItem(Player *plr, uint32 id, int32 count)
{
    // ajouter le token
    uint32 noSpaceForCount = 0;
    uint32 itemId = id;

    // nombre de place dans les sac
    ItemPosCountVec dest;
    uint8 msg = plr->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, itemId, count, &noSpaceForCount);

    if (msg != EQUIP_ERR_OK)   // convert to possible store amount
        count -= noSpaceForCount;

    if (count == 0 || dest.empty()) // owned pas asser de place
    {
        ChatHandler(plr).PSendSysMessage("You don't have any room left in your bags to receive your reward.");
        return;
    }

     // ajout du token
    Item* item = plr->StoreNewItem(dest, itemId, true, Item::GenerateItemRandomPropertyId(itemId));
    plr->SendNewItem(item,count,true,false);

    //ChatHandler(plr).PSendSysMessage("Vous avez recu une recompense pour avoir tue un joueur ennemi."); // Spam le chat si on vh beaucoup :/
}

void OutdoorPvPFFA::ModScalePerKill(Player *player, uint32 kill, bool apply)
{
    float scale = 0.0f;

    if (!apply)
    {
        if (kill < 5)
            scale = 0.0f;
        else if (kill >= 5 && kill < 10)
            scale = 10.0f;
        else if (kill >= 10 && kill < 15)
            scale = 20.0f;
        else if (kill >= 15 && kill < 20)
            scale = 30.0f;
        else if (kill >= 20 && kill < 25)
            scale = 40.0f;
        else
            scale = 50.0f;
    }
    else
    {
        if (kill < 5)
            scale = 0.0f;
        else
            scale = 10.0f;
    }

    player->ApplyPercentModFloatValue(OBJECT_FIELD_SCALE_X, scale, apply);
}

void OutdoorPvPFFA::SetNewKillReward(uint64 guid, uint32 kill)
{
    if (!guid)
        return;

    Player *plr = objmgr.GetPlayer(guid);

    if (!plr)
        return;

    switch (kill)
    {
        case 0:
        {
            if (IsFlagOwner(plr->GetGUID()))
                HandleDropFlag(plr, GO_FLAG_ENTRY);
            ChatHandler(plr).PSendSysMessage("End of spree. You are back to your normal height.");
            break;
        }
        case 1:
            ChatHandler(plr).PSendSysMessage("First Blood !");
            break;
        case 5:
            //AddItem(plr, 43228, 1);
            ModScalePerKill(plr, kill, true);
            ChatHandler(plr).PSendSysMessage("Multi Kill !");
            break;
        case 10:
        {
            TDFEntry const* TDF = sTDFMgr.GetTDFEntryById(1);

            if (TDF)
                plr->GetTDFMgr().CompleteTDF(TDF);

            //AddItem(plr, 43228, 2);
            ModScalePerKill(plr, kill, true);
            ChatHandler(plr).PSendSysMessage("Rampage !");
            break;
        }
        case 15:
            //AddItem(plr, 43228, 3);
            ModScalePerKill(plr, kill, true);
            ChatHandler(plr).PSendSysMessage("Unstoppable !");
            break;
        case 20:
            //AddItem(plr, 43228, 4);
            ModScalePerKill(plr, kill, true);
            ChatHandler(plr).PSendSysMessage("Godlike !");
            break;
        case 25:
        {
            TDFEntry const* TDF = sTDFMgr.GetTDFEntryById(2);

            if (TDF)
                plr->GetTDFMgr().CompleteTDF(TDF);

            //AddItem(plr, 43228, 5);
            ModScalePerKill(plr, kill, true);
            ChatHandler(plr).PSendSysMessage("Legendary !");
            break;
        }
        case 50:
        {
            TDFEntry const* TDF = sTDFMgr.GetTDFEntryById(3);

            if (TDF)
                plr->GetTDFMgr().CompleteTDF(TDF);

            break;
        }
    }
}

bool OutdoorPvPFFA::Update(uint32 diff)
{
    for (int i = 0; i < 2; ++i)
        for (PlayerSet::iterator itr = m_players[i].begin(); itr != m_players[i].end(); ++itr)
        {
            if ((*itr)->IsInWorld())
            {
                if ((*itr)->IsFFAZone())
                {
                    if (m_killreward.find((*itr)->GetGUID()) == m_killreward.end())
                        m_killreward[(*itr)->GetGUID()] = 0;

                    if (m_pTimer.find((*itr)->GetGUID()) == m_pTimer.end() && !(*itr)->GetTDFMgr().HasAchievedTDFById(4))
                    {
                        m_pTimer[(*itr)->GetGUID()] = 0;
                    }
                    else if (!(*itr)->GetTDFMgr().HasAchievedTDFById(4) && m_pTimer.find((*itr)->GetGUID()) != m_pTimer.end())
                    {
                        m_pTimer[(*itr)->GetGUID()] += diff;
                        pTimer::iterator iter = m_pTimer.find((*itr)->GetGUID());

                        if (iter->second >= 30*MINUTE*IN_MILLISECONDS)
                        {
                            TDFEntry const* TDF = sTDFMgr.GetTDFEntryById(4);
                            if (TDF)
                                (*itr)->GetTDFMgr().CompleteTDF(TDF);

                            TDF = sTDFMgr.GetTDFEntryById(10);
                            if (TDF)
                                (*itr)->GetTDFMgr().UpdateCriteriaTDF(TDF, 1 ,0 ,0 ,0);

                            m_pTimer.erase(iter);
                        }
                    }

                    if (Group* group = (*itr)->GetGroup())
                    {
                            group->RemoveMember((*itr)->GetGUID(), 0);
                            ChatHandler(*itr).PSendSysMessage("You can't enter FFA zone in group.");
                    }

                    if (IsFlagOwner((*itr)->GetGUID()))
                    {
                        if (!(*itr)->isAlive() || !IsMastodonte)
                            HandleDropFlag((*itr), GO_FLAG_ENTRY);

                        if ((*itr)->GetTeam() == ALLIANCE)
                        {
                            if (!(*itr)->HasAura(32609, 0))
                                HandleDropFlag((*itr), GO_FLAG_ENTRY);
                        }
                        else
                        {
                            if (!(*itr)->HasAura(32610, 0))
                                HandleDropFlag((*itr), GO_FLAG_ENTRY);
                        }

                        MTimer += diff;

                        if (MTimer >= 15*MINUTE*IN_MILLISECONDS && !(*itr)->GetTDFMgr().HasAchievedTDFById(5))
                        {
                            TDFEntry const* TDF = sTDFMgr.GetTDFEntryById(5);
                            if (TDF)
                                (*itr)->GetTDFMgr().CompleteTDF(TDF);

                            TDF = sTDFMgr.GetTDFEntryById(10);
                            if (TDF)
                                (*itr)->GetTDFMgr().UpdateCriteriaTDF(TDF, 0 ,1 ,0 ,0);
                        }
                    }
                    if (m_flagownerGUID != 0)
                    {
                        if (IsMastodonte && m_flagGUID == 0)
                        {
                            if (Player *plr = objmgr.GetPlayer(m_flagownerGUID))
                                (*itr)->PlayerTalkClass->SendPointOfInterest(plr->GetPositionX(), plr->GetPositionY(), 7, 99, 30, "Drapeau FFA");
                        }

                    }
                    else
                    {
                        if (IsMastodonte && m_flagGUID != 0)
                        {
                            if (GameObject* obj = (*itr)->GetMap()->GetGameObject(MAKE_NEW_GUID(m_flagGUID, GO_FLAG_ENTRY, HIGHGUID_GAMEOBJECT)))
                                (*itr)->PlayerTalkClass->SendPointOfInterest(obj->GetPositionX(), obj->GetPositionY(), 7, 99, 30, "Drapeau FFA");
                        }
                    }
                }
                else
                {
                    KillReward::iterator itr2 = m_killreward.find((*itr)->GetGUID());
                    if (itr2 != m_killreward.end())
                    {
                        ModScalePerKill((*itr), itr2->second, false);
                        m_killreward.erase(itr2);
                    }
                    pTimer::iterator iter = m_pTimer.find((*itr)->GetGUID());
                    if (iter != m_pTimer.end())
                       m_pTimer.erase(iter);

                    if (IsFlagOwner((*itr)->GetGUID()))
                        HandleDropFlag((*itr), GO_FLAG_ENTRY);
                }
            }
        }

        if (IsMastodonte && DespawnFlag)
        {
            if (DespawnFlagTime <= diff)
            {
                DespawnFlag = false;
                SetMastodonte(false);
                m_flagGUID = 0;
                std::string str = "";
                str = "|cFF00FFFF Fin de l'event mastodonte en zone FFA!";
                WorldPacket data(SMSG_NOTIFICATION, (str.size()+1));
                data << str;
                sWorld.SendGlobalMessage(&data);
            }
            else DespawnFlagTime -= diff;
        }

        if (time(NULL) >= NextFFA && m_FFAZoneMap.size() > 1)
        {
            std::string str = "|cFF00FFFF Changement de zone FFA !";
            SendMessage(str);
            GenerateFFAZone(true);
        }

        return true;
}

void OutdoorPvPFFA::SetMastodonte(Player *player)
{
    if (!player || !IsMastodonte)
        return;

    player->ApplyPercentModFloatValue(OBJECT_FIELD_SCALE_X, 100.0f, true);

    player->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_DISARM, true);
    player->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_INTERRUPT, true);
    player->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_FEAR, true);
    player->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_STUN, true);
    player->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_ROOT, true);
    player->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_DECREASE_SPEED, true);
    player->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_CONFUSE, true);
    player->ApplySpellImmune(0, IMMUNITY_ID, 33786, true); // Cyclone

    float percent = player->GetHealthPct();
    amount = 0.0f;

    for (uint32 i = 1; i < 50; ++i)
    {
        if (i >= uint32(m_killreward.size()))
            break;

        amount += 10.0f;
    }

    player->HandleStatModifier(UNIT_MOD_HEALTH, TOTAL_PCT, amount, true);

    if (player->isAlive())
        player->SetHealth(player->CountPctFromMaxHealth(int32(percent)));
    else
        player->HandleStatModifier(UNIT_MOD_HEALTH, TOTAL_PCT, amount, false);

    ChatHandler(player).PSendSysMessage("You are now in juggernaut mode !");
}

void OutdoorPvPFFA::RemoveMastodonte(Player *player)
{
    if (!player)
        return;

    player->ApplyPercentModFloatValue(OBJECT_FIELD_SCALE_X, 100.0f, false);

    player->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_DISARM, false);
    player->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_INTERRUPT, false);
    player->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_FEAR, false);
    player->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_STUN, false);
    player->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_ROOT, false);
    player->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_DECREASE_SPEED, false);
    player->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_CONFUSE, false);
    player->ApplySpellImmune(0, IMMUNITY_ID, 33786, false); // Cyclone

    player->HandleStatModifier(UNIT_MOD_HEALTH, TOTAL_PCT, amount, false);

    if (player->isAlive())
        player->SetHealth(player->CountPctFromMaxHealth(int32(player->GetHealthPct())));

    amount = 0.0f;

    ChatHandler(player).PSendSysMessage("You are no longer in juggernaut mode !");
}

bool OutdoorPvPFFA::HandleCustomSpell(Player *plr, uint32 spellId, GameObject *go)
{
    if (!IsMastodonte)
    {
        go->SetRespawnTime(0);
        go->Delete();
        m_flagGUID = 0;
        return false;
    }

    if (!go || spellId != GO_FLAG_ENTRY || !plr->IsFFAZone() || go->GetGOInfo()->id != GO_FLAG_ENTRY)
        return false;

    if (plr->GetTeam() == ALLIANCE)
        plr->CastSpell(plr, 32609, true);
    else
        plr->CastSpell(plr, 32610, true);

    // despawn go
    go->SetRespawnTime(0);
    go->Delete();
    m_flagGUID = 0;
    SetMastodonte(plr);
    SetFlagOwner(plr->GetGUID());
    std::string str = "";
    str = "|cFFFFFC00[FFA]|cFF00FFFF[|cFF60FF00" + std::string(plr->GetName()) + "|cFF00FFFF] has captured the flag !";
    SendMessage(str);

    plr->SetFullHealth();
    plr->SetPower(POWER_MANA, plr->GetMaxPower(POWER_MANA));
    plr->SetPower(POWER_ENERGY, plr->GetMaxPower(POWER_ENERGY));
    plr->SetPower(POWER_RAGE, plr->GetMaxPower(POWER_RAGE));

    MTimer = 0;

    return true;
}

bool OutdoorPvPFFA::HandleDropFlag(Player *plr, uint32 spellId)
{
    if (spellId == GO_FLAG_ENTRY)
    {
        if (!IsFlagOwner(plr->GetGUID()))
            return false;

        if (plr->HasAura(32610, 0))
            plr->RemoveAurasDueToSpell(32610);
        else if (plr->HasAura(32609, 0))
            plr->RemoveAurasDueToSpell(32609);

        RemoveMastodonte(plr);
        SetFlagOwner(0);

        if (IsMastodonte)
        {
            GameObject * go = new GameObject;
            Map * map = plr->GetMap();

            if (!map)
            {
                delete go;
                return true;
            }

            if (plr->IsFFAZone())
            {
                if (!go->Create(objmgr.GenerateLowGuid(HIGHGUID_GAMEOBJECT),GO_FLAG_ENTRY, map, plr->GetPositionX(),plr->GetPositionY(),plr->GetPositionZ(),plr->GetOrientation(),0,0,0,0,100,GO_STATE_READY))
                    delete go;
                else
                {
                    go->SetRespawnTime(0);
                    map->Add(go);
                    m_flagGUID = go->GetGUIDLow();
                }
            }
            else
            {
                FFAZone const* ffa = FFA();
                if (!ffa)
                {
                    delete go;
                    return true;
                }

                map = MapManager::Instance().FindMap(ffa->Map);

                if (!map)
                {
                    delete go;
                    return true;
                }

                if (!go->Create(objmgr.GenerateLowGuid(HIGHGUID_GAMEOBJECT),GO_FLAG_ENTRY, map, ffa->FlagX,ffa->FlagY,ffa->FlagZ,plr->GetOrientation(),0,0,0,0,100,GO_STATE_READY))
                    delete go;
                else
                {
                    go->SetRespawnTime(0);
                    map->Add(go);
                    m_flagGUID = go->GetGUIDLow();
                }
            }

            std::string str = "";
            str = "|cFF00FFFF Flag has been dropped !";
            SendMessage(str);
        }

    }
    return true;
}

bool OutdoorPvPFFA::SpawnFlag(uint32 time)
{
    FFAZone const* ffa = FFA();

    if (!ffa)
        return false;

    if (uint32 guid = objmgr.AddGOData(GO_FLAG_ENTRY, ffa->Map, ffa->FlagX,ffa->FlagY,ffa->FlagZ, 0 , 0, 0, 0, 0, 0))
    {
        m_flagGUID = guid;

        if (time > 0)
        {
            DespawnFlagTime = time*MINUTE*IN_MILLISECONDS;
            DespawnFlag = true;
        }

        SetMastodonte(true);
        return true;
    }

    return false;
}

bool OutdoorPvPFFA::LoadFFAZone()
{
    uint32 oldMSTime = getMSTime();
    m_FFAZoneMap.clear();
    uint32 count = 0;

    QueryResult_AutoPtr result = WorldDatabase.Query("SELECT id, mapid, zoneid, areacount, areaid, spawncount, spawnX, spawnY, spawnZ, flagX, flagY, flagZ, name FROM ffa_zone");

    if (!result)
    {
        sLog.outString();
        sLog.outString( ">> Loaded %u ffa zone", count);
        return false;
    }

    do
    {
        Field *fields = result->Fetch();
        uint32 entry = fields[0].GetUInt32();
        uint32 map = fields[1].GetUInt32();
        uint32 zoneid = fields[2].GetUInt32();

        FFAZone ffaz;
        ffaz.ZoneId = zoneid;
        ffaz.Map = map;

        uint32 areacount = fields[3].GetUInt32();
        std::string area = fields[4].GetString();
        char *c_area = const_cast<char*>(area.c_str());
        uint32 areaid;

        for (int i = 0; i < areacount; i++)
        {
            if (i == 0)
                areaid = atoi(strtok (c_area, ","));
            else
                areaid = atoi(strtok (NULL, ","));

            (ffaz.AreaId).push_back(areaid);
        }

        std::string spawnX = fields[6].GetString();
        std::string spawnY = fields[7].GetString();
        std::string spawnZ = fields[8].GetString();
        char *c_spawnx = const_cast<char*>(spawnX.c_str());
        char *c_spawny = const_cast<char*>(spawnY.c_str());
        char *c_spawnz = const_cast<char*>(spawnZ.c_str());
        SpawnLocations sl;
        float x[3];
        float y[3];
        float z[3];
        // TODO: se servir du spawncount

        for (int i = 0; i < 1; i++)
        {
            if (i == 0)
                x[i] = atof(strtok (c_spawnx, ","));
            else
                x[i] = atof(strtok (NULL, ","));
        }

        for (int i = 0; i < 1; i++)
        {
            if (i == 0)
                y[i] = atof(strtok (c_spawny, ","));
            else
                y[i] = atof(strtok (NULL, ","));
        }

        for (int i = 0; i < 1; i++)
        {
            if (i == 0)
                z[i] = atof(strtok (c_spawnz, ","));
            else
                z[i] = atof(strtok (NULL, ","));
        }

        for (int i = 0; i < 1; i++)
        {
            sl.x = x[i];
            sl.y = y[i];
            sl.z = z[i];
            (ffaz.SpawnLocationsMap)[i] = sl;
        }

        ffaz.FlagX = fields[9].GetFloat();
        ffaz.FlagY = fields[10].GetFloat();
        ffaz.FlagZ = fields[11].GetFloat();
        ffaz.Name  = fields[12].GetString();
        ffaz.Id    = entry;

        m_FFAZoneMap[entry] = ffaz;
        count++;
    } while (result->NextRow());

    if (m_FFAZoneMap.empty())
        return false;

    sLog.outString(">> Loaded %u ffa zone in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
    sLog.outString();
    return true;
}

void OutdoorPvPFFA::GenerateFFAZone(bool New)
{
    if (!New)
    {
        QueryResult_AutoPtr result = CharacterDatabase.Query("SELECT FFA_WORLDSTATETIME, FFA_WORLDSTATEID FROM saved_variables");

        if (result)
        {
            Field *fields = result->Fetch();
            ffazoneatm = fields[1].GetUInt32();
            FFAZoneMap::const_iterator itr = m_FFAZoneMap.find(ffazoneatm);

            if (itr != m_FFAZoneMap.end())
            {
                sWorld.setFFAZoneId((&itr->second)->ZoneId);
                NextFFA = time_t(fields[0].GetUInt32());
                return;
            }

            sLog.outString(">> ERROR FFA ZONE ID(%u) IS BROKEN", ffazoneatm);
        }
    }

    if (m_FFAZoneMap.size() > 1)
    {
        uint32 lastzone = ffazoneatm;

        do
        {
            uint32 rand = urand(0, m_FFAZoneMap.size());
            uint32 count = 0;

            for (FFAZoneMap::const_iterator iter = m_FFAZoneMap.begin(); iter != m_FFAZoneMap.end(); iter++)
            {
                if (rand == count)
                {
                    ffazoneatm = iter->first;
                    break;
                }
                count++;
            }
        } while (ffazoneatm == lastzone);
    }
    else
        for (FFAZoneMap::const_iterator iter = m_FFAZoneMap.begin(); iter != m_FFAZoneMap.end(); iter++)
            ffazoneatm = iter->first;


    NextFFA = time(NULL) + sWorld.getConfig(CONFIG_NEXT_TIME_FFA);
    FFAZoneMap::const_iterator itr = m_FFAZoneMap.find(ffazoneatm);

    CharacterDatabase.PExecute("UPDATE saved_variables SET FFA_WORLDSTATEID = %u", uint64(ffazoneatm));
    CharacterDatabase.PExecute("UPDATE saved_variables SET FFA_WORLDSTATETIME = %u", uint64(NextFFA));
    sWorld.setFFAZoneId((&itr->second)->ZoneId);
}

bool OutdoorPvPFFA::SetFFAZone(uint32 id)
{
    if (ffazoneatm == id)
        return false;

    FFAZoneMap::const_iterator itr = m_FFAZoneMap.find(id);

    if (itr == m_FFAZoneMap.end())
        return false;

    ffazoneatm = id;
    NextFFA = time(NULL) + sWorld.getConfig(CONFIG_NEXT_TIME_FFA);

    CharacterDatabase.PExecute("UPDATE saved_variables SET FFA_WORLDSTATEID = %u", uint64(ffazoneatm));
    CharacterDatabase.PExecute("UPDATE saved_variables SET FFA_WORLDSTATETIME = %u", uint64(NextFFA));
    sWorld.setFFAZoneId((&itr->second)->ZoneId);

    return true;
}

uint32 OutdoorPvPFFA::GetMaxSpawn()
{
    FFAZoneMap::const_iterator itr = m_FFAZoneMap.find(ffazoneatm);

    if (itr == m_FFAZoneMap.end())
        return 0;

    return ((&itr->second)->SpawnLocationsMap).size();
}

bool OutdoorPvPFFA::IsInFFA(uint32 zoneid, uint32 areaid)
{
    FFAZoneMap::const_iterator itr = m_FFAZoneMap.find(ffazoneatm);

    if (itr == m_FFAZoneMap.end())
        return false;

    if (((&itr->second)->AreaId).empty())
    {
        if (zoneid == (&itr->second)->ZoneId)
            return true;
        return false;
    }
    else
    {
        for (std::vector<uint32>::const_iterator it =  ((&itr->second)->AreaId).begin(); it != ((&itr->second)->AreaId).end(); ++it)
            if (areaid == *it)
                return true;
        return false;
    }

    return false;
}

void OutdoorPvPFFA::SendMessage(std::string str)
{
    if (m_killreward.empty() || str.empty())
        return;

    WorldPacket data(SMSG_NOTIFICATION, (str.size()+1));
    data << str;

    for (KillReward::const_iterator itr = m_killreward.begin(); itr != m_killreward.end(); itr++)
    {
        Player *plr = objmgr.GetPlayer(itr->first);

        if (plr)
        {
            plr->GetSession()->SendPacket(&data);
            ChatHandler(plr).PSendSysMessage("%s", str.c_str());
        }
    }
}

void OutdoorPvPFFA::HandlePlayerAreaChanged(Player *plr, uint32 zoneId, uint32 oldArea, uint32 newArea)
{
    if (!plr || !plr->IsInWorld() || oldArea == newArea)
        return;

    FFAZoneMap::const_iterator itr = m_FFAZoneMap.find(ffazoneatm);

    if (((&itr->second)->AreaId).empty())
    {
        if (zoneId == (&itr->second)->ZoneId)
        {
            plr->RemoveSpellsCausingAura(SPELL_AURA_MOD_FLIGHT_SPEED_MOUNTED);
            plr->RemoveSpellsCausingAura(SPELL_AURA_FLY);
        }
    }
    else
    {
        for (std::vector<uint32>::const_iterator it =  ((&itr->second)->AreaId).begin(); it != ((&itr->second)->AreaId).end(); ++it)
            if (newArea == *it)
            {
                plr->RemoveSpellsCausingAura(SPELL_AURA_MOD_FLIGHT_SPEED_MOUNTED);
                plr->RemoveSpellsCausingAura(SPELL_AURA_FLY);
            }
    }
}

