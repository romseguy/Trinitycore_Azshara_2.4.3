#include "BattleGround.h"
#include "BattleGroundMgr.h"
#include "ArenaTeam.h"
#include "ScriptPCH.h"
#include "Chat.h"
#include "GameEventMgr.h"
#include "Player.h"

#define GOSSIP_SENDER                       11
#define GMLEVEL                             SEC_PLAYER

// 130303 = Hello there, $N. Ready to spectate some arena's?
// 130304 = Sorry, no matches are currently being played in this arena bracket.

std::string StrToInt(int number) // I have NO idea how to do this in another way...
{
    std::stringstream ss;
    ss << number;
    return ss.str();
}

bool GossipHello_arenaspectate(Player *player, Creature *_Creature)
{
    if(player->GetSession()->GetSecurity() >= GMLEVEL)
    {
        if(player->InBattleGroundQueue())
        {
            player->GetSession()->SendNotification("Please leave all battleground/arena queue's before spectating.");
            return false;
        }
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "2v2 Rated"              , ARENA_TYPE_2v2, 0); // start listing at arena 0
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "3v3 Rated"              , ARENA_TYPE_3v3, 0);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "5v5 Rated"              , ARENA_TYPE_5v5, 0);
        player->SEND_GOSSIP_MENU(130303,_Creature->GetGUID());
        return true;
    }
    player->GetSession()->SendNotification("You are currently not allowed to spectate arena's");
    return false;
}

void SendSubMenu_arenaspectate(Player *player, Creature *_Creature, uint32 arenaType, uint32 action)
{
    uint32 totalcount = sBattleGroundMgr.GetBattleGroundsCount();
    uint32 roomLeft = GOSSIP_MAX_MENU_ITEMS-3; // were gonna be cheap and always add a Back, Next and Refresh button, no matter if its needed or not.
   
    if(action < 0 || action >= totalcount) // reset to start of list if passed end or begin
        action = 0;

    BattleGroundSet::iterator itr = sBattleGroundMgr.GetBattleGroundsBegin();

    for(uint32 i = 0; i < action; i++) // is there any other way to increase a iterator by X amount?
        itr++;

    while(itr != sBattleGroundMgr.GetBattleGroundsEnd() && roomLeft > 0)
    {
        BattleGround * bg = itr->second;
        if (bg->GetArenaType() == arenaType && bg->isRated() && bg->GetStatus() == STATUS_IN_PROGRESS && bg->GetPlayersCountByTeam(ALLIANCE) + bg->GetPlayersCountByTeam(HORDE) > 0)
        {
            ArenaTeam *goldTeam = objmgr.GetArenaTeamById(bg->GetArenaTeamIdForTeam(ALLIANCE));
            ArenaTeam *greenTeam = objmgr.GetArenaTeamById(bg->GetArenaTeamIdForTeam(HORDE));
            
            if(!greenTeam || !goldTeam)
                continue;

            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT,goldTeam->GetName() + " (" + StrToInt(goldTeam->GetRating()) + ") VS " + 
                greenTeam->GetName() + " (" + StrToInt(greenTeam->GetRating()) + ")",
                GOSSIP_SENDER, itr->first);
            // Looks like: GoldTeamName (rating) VS GreenTeamName (rating)
            roomLeft--;
        }
        itr++;
    }
    if(totalcount > 0)
    {
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT,"Next page" ,arenaType, action - (GOSSIP_MAX_MENU_ITEMS-3));
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT,"Previous page" ,arenaType, action + (GOSSIP_MAX_MENU_ITEMS-3));
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT,"Refresh" ,arenaType, action);
    }
    player->SEND_GOSSIP_MENU(totalcount > 0 ? DEFAULT_GOSSIP_MESSAGE : 130304 ,_Creature->GetGUID());
}

void SendMenu_arenaspectate(Player *player, Creature *_Creature, uint32 action)
{
    if(player->InBattleGroundQueue())
    {
        player->GetSession()->SendNotification("Please leave all battleground/arena queue's before spectating.");
        return;
    }
    if(player->IsMounted())
    {
        player->GetSession()->SendNotification("Impossible while mounted.");
        return;
    }
    player->CLOSE_GOSSIP_MENU();
    BattleGround *bg = sBattleGroundMgr.GetBattleGround(action);
    if(bg && bg->isArena() && bg->isRated() && bg->GetStatus() == STATUS_IN_PROGRESS && bg->GetPlayersCountByTeam(ALLIANCE) + bg->GetPlayersCountByTeam(HORDE) > 0)
    {
        player->SetBattleGroundId(action);
        player->SetBattleGroundEntryPoint();
        player->m_isArenaSpectator = true;
        player->SetSpeed(MOVE_RUN,5,true);
        player->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SILENCED);
        player->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
        player->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        player->RemovePet(NULL,PET_SAVE_NOT_IN_SLOT, true);
        if (player->GetGroup())
            player->RemoveFromGroup();
        bg->HandlePlayerUnderMap(player); // very cheap but awesome working way to teleport the player to the middle of the bg

        WorldPacket data;
        sBattleGroundMgr.BuildBattleGroundStatusPacket(&data, bg, 0, 0, STATUS_IN_PROGRESS, 0, 0, 0, 0);
        player->GetSession()->SendPacket(&data); // make the client generate a PvP icon on the minimap, allowing the player to leave.
    }
    else
    {
        ChatHandler(player).PSendSysMessage("An error occured while joining the selected match, please try again.");
    }
}

bool GossipSelect_arenaspectate(Player *player, Creature *_Creature, uint32 sender, uint32 action )
{
    switch (sender)
    {
        case ARENA_TYPE_2v2:            SendSubMenu_arenaspectate(player, _Creature, sender, action); break;
        case ARENA_TYPE_3v3:            SendSubMenu_arenaspectate(player, _Creature, sender, action); break;
        case ARENA_TYPE_5v5:            SendSubMenu_arenaspectate(player, _Creature, sender, action); break;
        case GOSSIP_SENDER:             SendMenu_arenaspectate(player, _Creature, action); break;
    }
    return true;
}

void AddSC_npc_arenaspectate()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name="npc_arenaspectate";
    newscript->pGossipHello = &GossipHello_arenaspectate;
    newscript->pGossipSelect = &GossipSelect_arenaspectate;
    newscript->RegisterSelf();
}
