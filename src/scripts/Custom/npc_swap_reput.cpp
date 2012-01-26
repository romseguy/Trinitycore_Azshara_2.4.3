#include "ScriptPCH.h"

#define WARN_RESET "Are you sure ?"
#define ALDOR_FACTION_ID   1743
#define SCRYERS_FACTION_ID 1744

bool GossipSelect_npc_swap_reput(Player *player, Creature *_Creature, uint32 sender, uint32 action)
{
    switch (action - GOSSIP_ACTION_INFO_DEF)
    {
        case 1:
            player->SetFactionReputation(ALDOR_FACTION_ID, Player::Reputation_Cap);
            player->SetFactionReputation(SCRYERS_FACTION_ID, Player::Reputation_Bottom);
            break;
        case 2:
            player->SetFactionReputation(SCRYERS_FACTION_ID, Player::Reputation_Cap);
            player->SetFactionReputation(ALDOR_FACTION_ID, Player::Reputation_Bottom);
            break;
    }

    player->PlayerTalkClass->CloseGossip();
    return true;
}

bool GossipHello_npc_swap_reput(Player *player, Creature *_Creature)
{
    if (player->isInCombat())
        return false;

    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Aldor",    GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1, WARN_RESET, 0, false);
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Scryers",  GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2, WARN_RESET, 0, false);
    player->PlayerTalkClass->SendGossipMenu(2, _Creature->GetGUID());

    return true;
}

void AddSC_npc_swap_reput()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name="npc_swap_reput";
    newscript->pGossipHello = &GossipHello_npc_swap_reput;
    newscript->pGossipSelect = &GossipSelect_npc_swap_reput;
    newscript->RegisterSelf();
}
