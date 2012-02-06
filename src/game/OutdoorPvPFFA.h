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

#ifndef OUTDOOR_PVP_FFA_
#define OUTDOOR_PVP_FFA_

#include "OutdoorPvP.h"

#define TOKEN_ID      19858
#define GO_FLAG_ENTRY 123456

struct SpawnLocations
{
    float x, y, z;
};

struct FFAZone
{
    uint32 Id;
    std::string Name;
    uint32 Map;
    uint32 ZoneId;
    std::vector<uint32> AreaId;
    std::map<uint32, SpawnLocations> SpawnLocationsMap;
    float FlagX;
    float FlagY;
    float FlagZ;
};

typedef std::map<uint32, FFAZone> FFAZoneMap;

class OutdoorPvPFFA : public OutdoorPvP
{
    public:
        OutdoorPvPFFA();

        bool SetupOutdoorPvP();

        void HandlePlayerEnterZone(Player *plr, uint32 zone);
        void HandlePlayerLeaveZone(Player *plr, uint32 zone);
        void HandleKill(Player *killer, Unit *victim);

        bool Update(uint32 diff);

        void HandlePlayerAreaChanged(Player *plr, uint32 zoneId, uint32 oldArea, uint32 newArea);

        bool HandleDropFlag(Player * plr, uint32 spellId);

        bool HandleCustomSpell(Player * plr, uint32 spellId, GameObject *go);

        bool IsFlagOwner(uint64 guid) { if (guid == m_flagownerGUID) return true; else return false; }
        void SetFlagOwner(uint64 guid) { m_flagownerGUID = guid; }
        void SetMastodonte(Player *player);
        bool GetMastodonte() { return IsMastodonte; }
        void RemoveMastodonte(Player *player);
        bool SpawnFlag(uint32 time = 0);
        void GetDespawnFlag() { SetMastodonte(false); DespawnFlag = false; DespawnFlagTime = 0; m_flagGUID = 0; return; }
        uint32 GetFlagGUID() const { return m_flagGUID; }

        FFAZone const* FFA() const
        {
            FFAZoneMap::const_iterator itr = m_FFAZoneMap.find(ffazoneatm);
            if (itr == m_FFAZoneMap.end())
                return NULL;
            return &itr->second;
        }

        std::string FFAName()
        {
            FFAZoneMap::const_iterator itr = m_FFAZoneMap.find(ffazoneatm);
            if (itr == m_FFAZoneMap.end())
                return "";
            return (&itr->second)->Name;
        }

        FFAZoneMap const& GetAllFFAInfo() const { return m_FFAZoneMap; }
        void GenerateFFAZone(bool New = false);
        uint32 GetMaxSpawn();
        bool SetFFAZone(uint32 id);
        void SendMessage(std::string str);
        bool IsInFFA(uint32 zoneid, uint32 areaid);
    private:
        typedef std::map<uint64, uint32> KillReward;
        typedef std::map<uint64, uint32> pTimer;
        pTimer m_pTimer;
        KillReward m_killreward;
        void SetNewKillReward(uint64 guid, uint32 kill);
        void AddItem(Player *plr, uint32 id, int32 count);
        uint64 m_flagownerGUID;
        bool IsMastodonte;
        void SetMastodonte(bool state) { IsMastodonte = state; }
        void ModScalePerKill(Player *player, uint32 kill, bool apply);
        uint32 DespawnFlagTime;
        bool DespawnFlag;
        float amount;
        uint32 m_flagGUID;
        uint32 MTimer;

        FFAZoneMap m_FFAZoneMap;
        bool LoadFFAZone();

        time_t NextFFA;
        uint32 ffazoneatm;
};

#endif
