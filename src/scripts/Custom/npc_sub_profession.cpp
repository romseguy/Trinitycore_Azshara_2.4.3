#include "ScriptPCH.h"

#define ENGINEERING_SPELL      30350
#define GOBLIN   20222
#define GNOMISH  20219

#define BLACKSMITHING_SPELL    29844
#define SWORD    17039
#define HAMMER   17040
#define AXE      17041

#define WEAPONS  9787
#define ARMORS   9788

#define WARN_RESET "Are you sure ?"

bool GossipSelect_npc_sub_profession(Player *player, Creature *_Creature, uint32 sender, uint32 action)
{
    uint32 SpellId, SpellIdx, SpellIdxx;
    uint32 opt = action - GOSSIP_ACTION_INFO_DEF;

    if ((opt == 1 || opt == 2) && !player->HasSpell(ENGINEERING_SPELL))
    {
        player->GetSession()->SendNotification("You have to learn engineering first.");
        player->PlayerTalkClass->CloseGossip();
        return true;
    }

    if ((opt == 3 || opt == 4 || opt == 5) && !player->HasSpell(BLACKSMITHING_SPELL))
    {
        player->GetSession()->SendNotification("You have to learn blacksmithing first.");
        player->PlayerTalkClass->CloseGossip();
        return true;
    }

    switch (opt)
    {
        case 1:
            SpellId = 20222;
            SpellIdx = 20219;
            SpellIdxx = 0;
            break;
        case 2:
            SpellId = 20219;
            SpellIdx = 20222;
            SpellIdxx = 0;
            break;
        case 3:
            SpellId = 17039;
            SpellIdx = 17040;
            SpellIdxx = 17041;
            break;
        case 4:
            SpellId = 17040;
            SpellIdx = 17039;
            SpellIdxx = 17041;
            break;
        case 5:
            SpellId = 17041;
            SpellIdx = 17039;
            SpellIdxx = 17040;
            break;
    }

    // si le joueur n'a pas le sous metier
    if (!player->HasSpell(SpellId))
    {
        // si le joueur a deja un autre sous metier
        if (player->HasSpell(SpellIdx))
            player->removeSpell(SpellIdx);

        // forge uniquement
        if (SpellIdxx > 0 && player->HasSpell(SpellIdxx))
            player->removeSpell(SpellIdxx);

        player->learnSpell(SpellId);
    }

    player->PlayerTalkClass->CloseGossip();
    return true;
}

bool GossipHello_npc_sub_profession(Player *player, Creature *_Creature)
{
    if (player->isInCombat())
        return false;

    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Goblin engineering",        GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1, WARN_RESET, 0, false);
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Gnomish engineering",       GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2, WARN_RESET, 0, false);
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Master swordsmith",         GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+3, WARN_RESET, 0, false);
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Master hammersmith",        GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+4, WARN_RESET, 0, false);
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Master axesmith",           GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5, WARN_RESET, 0, false);
    player->PlayerTalkClass->SendGossipMenu(2, _Creature->GetGUID());

    return true;
}

void AddSC_npc_sub_profession()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_sub_profession";
    newscript->pGossipHello = &GossipHello_npc_sub_profession;
    newscript->pGossipSelect = &GossipSelect_npc_sub_profession;
    newscript->RegisterSelf();
}

