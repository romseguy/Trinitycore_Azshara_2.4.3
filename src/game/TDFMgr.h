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

#ifndef __TRINITY_TDFMGR_H
#define __TRINITY_TDFMGR_H

#include <map>
#include <string>

#include "Common.h"
#include "DatabaseEnv.h"
#include "Policies/Singleton.h"

struct TDFEntry
{
    uint32 Id;
    std::string Name;
    std::string Description;
    uint32 Title;
    uint32 Tabard;
    uint32 Item;
    uint32 Itemcount;
    uint32 Money;
    uint32 Moneycount;
    uint32 Honor;
    uint32 Arena;
    std::string NData0;
    uint32 Data0;
    std::string NData1;
    uint32 Data1;
    std::string NData2;
    uint32 Data2;
    std::string NData3;
    uint32 Data3;
};

typedef std::map<uint32,TDFEntry> TDFEntryMap;

struct CritariaTDF
{
    uint32 data0;
    uint32 data1;
    uint32 data2;
    uint32 data3;
};

typedef std::map<TDFEntry const*,CritariaTDF> CritariaTDFMap;

struct CompletedTDF
{
    time_t time;
};

typedef std::map<TDFEntry const*,CompletedTDF> CompletedTDFMap;

class TDFMgr
{
public:
    TDFMgr(Player* pl);
    ~TDFMgr();

    CritariaTDFMap const& GetCriteriaTDF() const { return m_CritariaTDFMap; }
    CompletedTDFMap const& GetCompletedTDF() const { return m_CompletedTDF; }

    void Reset();
    void DeleteFromDB(uint32 id = 0);
    void LoadFromDB(QueryResult_AutoPtr achievementResult, QueryResult_AutoPtr criteriaResult);
    void CompleteTDF(TDFEntry const* TDF);
    void UpdateCriteriaTDF(TDFEntry const* TDF, uint32 data0, uint32 data1, uint32 data2, uint32 data3);
    bool HasAchievedTDF(TDFEntry const* TDF);
    bool HasAchievedTDFById(uint32 entry);
    Player* GetPlayer() { return m_player; }

private:
    Player* m_player;
    CritariaTDFMap m_CritariaTDFMap;
    CompletedTDFMap m_CompletedTDF;
    void SendItemReward(uint32 id, uint32 count, TDFEntry const* TDF);
    void SendItemRewardByMail(uint32 id, uint32 count, TDFEntry const* TDF);
    void CompletedTDFUpdateCriteriaTDF(TDFEntry const* TDF);
};

class TDFGlobalMgr
{
public:
    TDFGlobalMgr() {};
    ~TDFGlobalMgr() {};

    void LoadTDFFromDB();

    TDFEntryMap const& GetTDFEntry() const { return m_TDFEntryMap; }

    TDFEntry const* GetTDFEntryById(uint32 id) const
    {
        TDFEntryMap::const_iterator itr = m_TDFEntryMap.find(id);

        return itr != m_TDFEntryMap.end() ? &itr->second : NULL;
    }

    bool IsTDFEntry(uint32 id)
    {
        TDFEntryMap::const_iterator itr = m_TDFEntryMap.find(id);

        return itr != m_TDFEntryMap.end() ? true : false;
    }

    bool TDFHasReward(TDFEntry const* TDF)
    {
        if (!TDF)
            return false;

        return (TDF->Title || TDF->Tabard || TDF->Item || TDF->Money || TDF->Honor || TDF->Arena);
    }

    bool TDFHasData(TDFEntry const* TDF)
    {
        if (!TDF)
            return false;

        return (TDF->Data0 || TDF->Data1 || TDF->Data2|| TDF->Data3);
    }

private:
    TDFEntryMap m_TDFEntryMap;
};

#define sTDFMgr Oregon::Singleton<TDFGlobalMgr>::Instance()

#endif
