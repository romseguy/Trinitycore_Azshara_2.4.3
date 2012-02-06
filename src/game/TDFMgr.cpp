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

#include "ObjectMgr.h"
#include "World.h"
#include "WorldPacket.h"
#include "DatabaseEnv.h"
#include "TDFMgr.h"
#include "Chat.h"
#include "Player.h"
#include "Mail.h"
#include "DBCEnums.h"
#include "DBCStores.h"
#include "Policies/SingletonImp.h"

INSTANTIATE_SINGLETON_1(TDFGlobalMgr);

void TDFGlobalMgr::LoadTDFFromDB()
{
    uint32 oldMSTime = getMSTime();
    m_TDFEntryMap.clear();
    uint32 count = 0;
//                                                    0   1         2            3            4            5            6               7             8                9            10        11     12     13      14      15      16      17      18
    QueryResult_AutoPtr result = WorldDatabase.Query("SELECT Id, Name, Description, TitleReward, TabardReward, ItemReward, ItemRewardCount, MoneyReward, MoneyRewardCount, HonorReward, ArenaReward, NData0, Data0, NData1, Data1, NData2, Data2, NData3, Data3 FROM tdf_entry");

    if (!result)
    {
        sLog.outString();
        sLog.outString( ">> Loaded %u tdf entry data", count);
        return;
    }

    do
    {
        Field *fields = result->Fetch();
        uint32 entry = fields[0].GetUInt32();

        TDFEntry tdfe;

        tdfe.Id = entry;
        tdfe.Name = fields[1].GetString();
        tdfe.Description = fields[2].GetString();
        tdfe.Title = fields[3].GetUInt32();
        tdfe.Tabard = fields[4].GetUInt32();
        tdfe.Item = fields[5].GetUInt32();
        tdfe.Itemcount = fields[6].GetUInt32();
        tdfe.Money = fields[7].GetUInt32();
        tdfe.Moneycount = fields[8].GetUInt32();
        tdfe.Honor = fields[9].GetUInt32();
        tdfe.Arena = fields[10].GetUInt32();
        tdfe.NData0 = fields[11].GetString();
        tdfe.Data0 = fields[12].GetUInt32();
        tdfe.NData1 = fields[13].GetString();
        tdfe.Data1 = fields[14].GetUInt32();
        tdfe.NData2 = fields[15].GetString();
        tdfe.Data2 = fields[16].GetUInt32();
        tdfe.NData3 = fields[17].GetString();
        tdfe.Data3 = fields[18].GetUInt32();

        m_TDFEntryMap[entry] = tdfe;
        count++;
    } while (result->NextRow());

    sLog.outString(">> Loaded %u tdf entry data in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
    sLog.outString();
}

TDFMgr::TDFMgr(Player* pl)
{
    m_player = pl;
}

TDFMgr::~TDFMgr()
{
}

void TDFMgr::Reset()
{
    for (CritariaTDFMap::const_iterator itr = m_CritariaTDFMap.begin(); itr != m_CritariaTDFMap.end(); ++itr)
    {
        ChatHandler(m_player).PSendSysMessage("La progression de [%s] est annulee.", ((itr->first)->Name).c_str());
    }

    for (CompletedTDFMap::const_iterator itr = m_CompletedTDF.begin(); itr != m_CompletedTDF.end(); ++itr)
    {
        ChatHandler(m_player).PSendSysMessage("Le tour de force [%s] a disparu.", ((itr->first)->Name).c_str());
    }

    m_CritariaTDFMap.clear();
    m_CompletedTDF.clear();
    DeleteFromDB();
}

void TDFMgr::DeleteFromDB(uint32 id)
{
    if (id)
    {
        TDFEntry const* tdfe = sTDFMgr.GetTDFEntryById(id);
        if (!tdfe)
            return;
        CharacterDatabase.PExecute("DELETE FROM character_tdf WHERE guid = '%u' AND id = '%u'",m_player->GetGUIDLow(), id);
        CharacterDatabase.PExecute("DELETE FROM character_tdf_progress WHERE guid = '%u' AND id = '%u'",m_player->GetGUIDLow(), id);
    }
    else
    {
        CharacterDatabase.PExecute("DELETE FROM character_tdf WHERE guid = %u",m_player->GetGUIDLow());
        CharacterDatabase.PExecute("DELETE FROM character_tdf_progress WHERE guid = %u",m_player->GetGUIDLow());
    }
}

void TDFMgr::LoadFromDB(QueryResult_AutoPtr achievementResult, QueryResult_AutoPtr criteriaResult)
{
    if (achievementResult)
    {
        m_CompletedTDF.clear();
        do
        {
            Field* fields = achievementResult->Fetch();
            uint32 id = fields[0].GetUInt32();

            TDFEntry const* tdfe = sTDFMgr.GetTDFEntryById(id);

            if (!tdfe)
                continue;

            CompletedTDF ctdf;
            uint64 time = fields[1].GetUInt64();
            ctdf.time = time_t(time);
            m_CompletedTDF[tdfe] = ctdf;

            if (sTDFMgr.TDFHasReward(tdfe))
                if (uint32 titleId = tdfe->Title)
                    if (CharTitlesEntry const* titleEntry = sCharTitlesStore.LookupEntry(titleId))
                        if (!GetPlayer()->HasTitle(titleEntry))
                            GetPlayer()->SetTitle(titleEntry);
        }
        while (achievementResult->NextRow());
    }

    if (criteriaResult)
    {
        m_CritariaTDFMap.clear();
        do
        {
            Field* fields = criteriaResult->Fetch();
            uint32 id      = fields[0].GetUInt32();
            uint32 data0    = fields[1].GetUInt32();
            uint32 data1    = fields[2].GetUInt32();
            uint32 data2    = fields[3].GetUInt32();
            uint32 data3    = fields[4].GetUInt32();

            TDFEntry const* tdfe = sTDFMgr.GetTDFEntryById(id);

            if (!tdfe || !sTDFMgr.TDFHasData(tdfe))
                continue;

            if ((tdfe->Data0 == 0 || data0 == tdfe->Data0) && (tdfe->Data1 == 0 || data1 == tdfe->Data1) && (tdfe->Data2 == 0 || data2 == tdfe->Data2) && (tdfe->Data3 == 0 || data3 == tdfe->Data3))
            {
                CompleteTDF(tdfe);
                continue;
            }

            CritariaTDF crtdf;

            crtdf.data0 = data0;
            crtdf.data1 = data1;
            crtdf.data2 = data2;
            crtdf.data3 = data3;

            m_CritariaTDFMap[tdfe] = crtdf;
        }
        while (criteriaResult->NextRow());
    }
}

void TDFMgr::CompleteTDF(TDFEntry const* TDF)
{
    if (!TDF || HasAchievedTDF(TDF))
        return;

    time_t now = time(NULL);
    CharacterDatabase.PExecute("INSERT INTO character_tdf (`guid`,`id`,`time`) VALUES ('%u','%u','%u')", m_player->GetGUIDLow(), TDF->Id, uint64(now));

    CritariaTDFMap::iterator iter = m_CritariaTDFMap.find(TDF);

    if (iter != m_CritariaTDFMap.end())
    {
        CharacterDatabase.PExecute("DELETE FROM character_tdf_progress WHERE guid = '%u' AND id = '%u'",m_player->GetGUIDLow(), TDF->Id);
        m_CritariaTDFMap.erase(iter);
    }

    CompletedTDF ctdf;
    ctdf.time = now;
    m_CompletedTDF[TDF] = ctdf;

    std::string str = "|cFFFFFC00Vous venez d'accomplir |cFFFF0000[" + TDF->Name + "]|cFFFFFC00 Felicitation!";
    WorldPacket data(SMSG_NOTIFICATION, (str.size()+1));
    data << str;
    m_player->GetSession()->SendPacket(&data);
    ChatHandler(m_player).PSendSysMessage("%s", str.c_str());

    if (sTDFMgr.TDFHasReward(TDF))
    {
        if (TDF->Title)
        {
            if (CharTitlesEntry const* titleEntry = sCharTitlesStore.LookupEntry(TDF->Title))
                if (!GetPlayer()->HasTitle(titleEntry))
                {
                    ChatHandler(m_player).PSendSysMessage("|cFFFFFC00You have been awarded a title for achieving |cFFFF0000[%s]", TDF->Name.c_str());
                    GetPlayer()->SetTitle(titleEntry);
                }
        }

        if (TDF->Honor && TDF->Honor > 0)
        {
            m_player->ModifyHonorPoints(TDF->Honor);
            ChatHandler(m_player).PSendSysMessage("|cFFFFFC00You have been awarded %u honor points for achieving |cFFFF0000[%s]", TDF->Honor, TDF->Name.c_str());
        }

        if (TDF->Arena && TDF->Arena > 0)
        {
            m_player->ModifyArenaPoints(TDF->Arena);
            ChatHandler(m_player).PSendSysMessage("|cFFFFFC00You have been awarded %u arena points for achieving |cFFFF0000[%s]", TDF->Arena, TDF->Name.c_str());
        }

        if (TDF->Tabard)
        {
            ChatHandler(m_player).PSendSysMessage("|cFFFFFC00You have been awarded a tabard for achieving |cFFFF0000[%s]", TDF->Name.c_str());
            SendItemReward(TDF->Tabard, 1, TDF);
        }

        if (TDF->Item)
        {
            ChatHandler(m_player).PSendSysMessage("|cFFFFFC00You have been awarded items for achieving |cFFFF0000[%s]", TDF->Name.c_str());
            SendItemReward(TDF->Item, TDF->Itemcount, TDF);
        }
    }

    // custom
    CompletedTDFUpdateCriteriaTDF(TDF);
}

void TDFMgr::SendItemReward(uint32 id, uint32 count, TDFEntry const* TDF)
{
    if (count <= 0)
        count = 1;

    ItemPosCountVec dest;
    uint32 no_space_count = 0;
    uint8 msg = m_player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, id, count, &no_space_count);

    if( msg != EQUIP_ERR_OK )
        count -= no_space_count;

    if( count != 0 && !dest.empty())
        if(Item* item = m_player->StoreNewItem(dest, id, true, 0))
            m_player->SendNewItem(item, count, false, true);

    if(no_space_count > 0)
        SendItemRewardByMail(id, no_space_count, TDF);
}

void TDFMgr::SendItemRewardByMail(uint32 id, uint32 count, TDFEntry const* TDF)
{
    ItemPrototype const* itemProto = ObjectMgr::GetItemPrototype(id);

    if(!itemProto)
        return;

    MailSender sender(MAIL_NORMAL, m_player->GetGUIDLow(), MAIL_STATIONERY_GM);

    std::string subject = TDF->Name;
    std::string text = "Voici votre récompense pour le tour de force " + TDF->Name + ".";
    MailDraft draft(subject);


    if(Item* item = Item::CreateItem(id,count,m_player))
    {
        item->SaveToDB();
        draft.AddItem(item);
    }

    draft.SendMailTo(MailReceiver(m_player, m_player->GetGUIDLow()), sender);
}

void TDFMgr::UpdateCriteriaTDF(TDFEntry const* TDF, uint32 data0, uint32 data1, uint32 data2, uint32 data3)
{
    if (!TDF)
        return;

    CritariaTDFMap::iterator iter = m_CritariaTDFMap.find(TDF);
    if (iter != m_CritariaTDFMap.end())
    {
        (&iter->second)->data0 += data0;
        (&iter->second)->data1 += data1;
        (&iter->second)->data2 += data2;
        (&iter->second)->data3 += data3;
        CharacterDatabase.PExecute("UPDATE character_tdf_progress SET data0 = %u, data1 = %u, data2 = %u, data3 = %u WHERE guid = '%u' AND id = '%u'", (&iter->second)->data0, (&iter->second)->data1, (&iter->second)->data2, (&iter->second)->data3, m_player->GetGUIDLow(), TDF->Id);

        if ((TDF->Data0 == 0 || (&iter->second)->data0 >= TDF->Data0) && (TDF->Data1 == 0 || (&iter->second)->data1 >= TDF->Data1) && (TDF->Data2 == 0 || (&iter->second)->data2 >= TDF->Data2) && (TDF->Data3 == 0 || (&iter->second)->data3 >= TDF->Data3))
        {
            CompleteTDF(TDF);
            return;
        }
    }
    else
    {
        CritariaTDF crtdf;

        crtdf.data0 = data0;
        crtdf.data1 = data1;
        crtdf.data2 = data2;
        crtdf.data3 = data3;

        m_CritariaTDFMap[TDF] = crtdf;
        CharacterDatabase.PExecute("INSERT INTO character_tdf_progress (`guid`, `id`, `data0`, `data1`, `data2`, `data3`) VALUES ('%u', '%u', '%u', '%u', '%u', '%u')", m_player->GetGUIDLow(), TDF->Id, data0,  data1, data2, data3);
    }
}

bool TDFMgr::HasAchievedTDF(TDFEntry const* TDF)
{
    if (!TDF)
        return false;

    CompletedTDFMap::const_iterator itr = m_CompletedTDF.find(TDF);

    return itr != m_CompletedTDF.end();
}

bool TDFMgr::HasAchievedTDFById(uint32 entry)
{
    TDFEntry const* TDF = sTDFMgr.GetTDFEntryById(entry);

    if (!TDF)
        return false;

    CompletedTDFMap::const_iterator itr = m_CompletedTDF.find(TDF);

    return itr != m_CompletedTDF.end();
}

void TDFMgr::CompletedTDFUpdateCriteriaTDF(TDFEntry const* TDF)
{
    switch (TDF->Id)
    {
        // FFA
        case 3:
            if (TDFEntry const* TDF2 = sTDFMgr.GetTDFEntryById(9))
                UpdateCriteriaTDF(TDF2, 1 , 0, 0, 0);
            break;
        case 8:
            if (TDFEntry const* TDF2 = sTDFMgr.GetTDFEntryById(9))
                UpdateCriteriaTDF(TDF2, 0 , 0, 1, 0);
            break;
        case 10:
            if (TDFEntry const* TDF2 = sTDFMgr.GetTDFEntryById(9))
                UpdateCriteriaTDF(TDF2, 0 , 1, 0, 0);
            break;
        // 3v3
        case 11:
            if (TDFEntry const* TDF2 = sTDFMgr.GetTDFEntryById(18))
                UpdateCriteriaTDF(TDF2, 1 , 0, 0, 0);
            break;
        case 12:
            if (TDFEntry const* TDF2 = sTDFMgr.GetTDFEntryById(18))
                UpdateCriteriaTDF(TDF2, 0 , 0, 1, 0);
            break;
        case 15:
            if (TDFEntry const* TDF2 = sTDFMgr.GetTDFEntryById(18))
                UpdateCriteriaTDF(TDF2, 0 , 1, 0, 0);
            break;
        case 16:
            if (TDFEntry const* TDF2 = sTDFMgr.GetTDFEntryById(17))
                UpdateCriteriaTDF(TDF2, 0 , 1, 0, 0);
            break;
        case 17:
            if (TDFEntry const* TDF2 = sTDFMgr.GetTDFEntryById(18))
                UpdateCriteriaTDF(TDF2, 0 , 0, 0, 1);
            break;
    }
}
