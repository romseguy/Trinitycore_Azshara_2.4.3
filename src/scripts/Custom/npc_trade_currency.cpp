#include "ScriptPCH.h"

#define WARN_RESET_GOLD_HONOR "Are you sure to trade gold for honor points ?"
#define WARN_RESET_HONOR_GOLD "Are you sure to trade honor points for gold ?"

bool GossipSelect_npc_trade_currency(Player *player, Creature *_Creature, uint32 sender, uint32 action)
{
    switch (action - GOSSIP_ACTION_INFO_DEF)
    {
        case 1:
            if (player->GetMoney() < 100*GOLD)
            {
                player->GetSession()->SendNotification("You need to have at least 100 gold.");
                player->PlayerTalkClass->CloseGossip();
                return true;
            }

            player->ModifyMoney(-100*GOLD);
            player->ModifyHonorPoints(2000);
            break;
        case 2:
            if (player->GetHonorPoints() < 2000)
            {
                player->GetSession()->SendNotification("You need to have at least 2000 honor points.");
                player->PlayerTalkClass->CloseGossip();
                return true;
            }

            player->ModifyHonorPoints(-2000);
            player->ModifyMoney(100*GOLD);
            break;
    }

    player->PlayerTalkClass->CloseGossip();
    return true;
}

bool GossipHello_npc_trade_currency(Player *player, Creature *_Creature)
{
    if (player->isInCombat())
        return false;

    player->ADD_GOSSIP_ITEM_EXTENDED(0, "100 gold to 2000 honor points",        GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1, WARN_RESET_GOLD_HONOR, 0, false);
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "2000 honor points to 100 gold",        GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2, WARN_RESET_HONOR_GOLD, 0, false);
    player->PlayerTalkClass->SendGossipMenu(2, _Creature->GetGUID());

    return true;
}

void AddSC_npc_trade_currency()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_trade_currency";
    newscript->pGossipHello = &GossipHello_npc_trade_currency;
    newscript->pGossipSelect = &GossipSelect_npc_trade_currency;
    newscript->RegisterSelf();
}

