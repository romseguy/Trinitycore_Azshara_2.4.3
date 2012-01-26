#include "ScriptPCH.h"

#define ENGINEERING_SPELL      30350
#define GOBLIN   20222
#define GNOMISH  20219

#define BLACKSMITHING_SPELL    29844
#define SWORD    17039
#define HAMMER   17040
#define AXE      17041

#define LEATHERWORKING_SPELL   32549
#define DRAGON 10656
#define ELEM   10658
#define TRIBAL 10660

#define TAILORING_SPELL        26790
#define SPELLFIRE  26797
#define MOONCLOTH  26798
#define SHADOWEAVE 26801

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

    if ((opt == 6 || opt == 7 || opt == 8) && !player->HasSpell(LEATHERWORKING_SPELL))
    {
        player->GetSession()->SendNotification("You have to learn leatherworking first.");
        player->PlayerTalkClass->CloseGossip();
        return true;
    }

    if ((opt == 9 || opt == 10 || opt == 11) && !player->HasSpell(LEATHERWORKING_SPELL))
    {
        player->GetSession()->SendNotification("You have to learn tailoring first.");
        player->PlayerTalkClass->CloseGossip();
        return true;
    }

    switch (opt)
    {
        case 1:
            SpellId = GOBLIN;
            SpellIdx = GNOMISH;
            SpellIdxx = 0;
            break;
        case 2:
            SpellId = GNOMISH;
            SpellIdx = GOBLIN;
            SpellIdxx = 0;
            break;
        case 3:
            SpellId = SWORD;
            SpellIdx = HAMMER;
            SpellIdxx = AXE;
            break;
        case 4:
            SpellId = HAMMER;
            SpellIdx = SWORD;
            SpellIdxx = 17041;
            break;
        case 5:
            SpellId = AXE;
            SpellIdx = SWORD;
            SpellIdxx = HAMMER;
            break;
        case 6:
            SpellId = DRAGON;
            SpellIdx = ELEM;
            SpellIdxx = TRIBAL;
            break;
        case 7:
            SpellId = ELEM;
            SpellIdx = DRAGON;
            SpellIdxx = TRIBAL;
            break;
        case 8:
            SpellId = TRIBAL;
            SpellIdx = ELEM;
            SpellIdxx = DRAGON;
            break;
        case 9:
            SpellId = SPELLFIRE;
            SpellIdx = MOONCLOTH;
            SpellIdxx = SHADOWEAVE;
            break;
        case 10:
            SpellId = MOONCLOTH;
            SpellIdx = SPELLFIRE;
            SpellIdxx = SHADOWEAVE;
            break;
        case 11:
            SpellId = SHADOWEAVE;
            SpellIdx = SPELLFIRE;
            SpellIdxx = MOONCLOTH;
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
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Dragonscale leatherworking",GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+6, WARN_RESET, 0, false);
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Elemental leatherworking",  GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7, WARN_RESET, 0, false);
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Tribal leatherworking",     GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+8, WARN_RESET, 0, false);
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Spellfire tailoring",       GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+9, WARN_RESET, 0, false);
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Mooncloth tailoring",       GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+10, WARN_RESET, 0, false);
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Shadoweave tailoring",      GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+11, WARN_RESET, 0, false);
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

