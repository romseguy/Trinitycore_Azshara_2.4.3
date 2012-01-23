#include "ScriptPCH.h"

#define ALCHEMY          171
#define BLACKSMITHING    164
#define ENCHANTING       333
#define ENGINEERING      202
#define HERBALISM        182
#define JEWELCRAFTING    755
#define LEATHERWORKING   165
#define MINING           186
#define TAILORING        197
#define SKINNING         393

#define ALCHEMY_SPELL          28596
#define BLACKSMITHING_SPELL    29844
#define ENCHANTING_SPELL       28029
#define ENGINEERING_SPELL      30350
#define HERBALISM_SPELL        28695
#define JEWELCRAFTING_SPELL    28897
#define LEATHERWORKING_SPELL   32549
#define MINING_SPELL           29354
#define TAILORING_SPELL        26790
#define SKINNING_SPELL         32678

#define WARN_RESET "Attention, vous ne pourrez pas oublier plus d'un metier par semaine !"

bool PlayerAlreadyHasTwoProfessions(Player* _plr)
{
    int profession_count = 0;

    for (uint32 i = 0; i < sSkillLineStore.GetNumRows(); i++)
    {
        SkillLineEntry const *skill = sSkillLineStore.LookupEntry(i);

        if (!skill)
            continue;

        if (skill->categoryId == SKILL_CATEGORY_PROFESSION && _plr->HasSkill(i))
            profession_count++;
    }

    if (profession_count >= 2)
    {
        _plr->GetSession()->SendNotification("You already have 2 professions!");
        return true;
    }

    return false;
}

bool GossipSelect_npc_profession(Player *player, Creature *_Creature, uint32 sender, uint32 action)
{
    uint32 ProfessionId;
    uint32 SpellId;

    switch (action - GOSSIP_ACTION_INFO_DEF)
    {
        case 1:
            ProfessionId = ALCHEMY;
            SpellId = ALCHEMY_SPELL;
            break;
        case 2:
            ProfessionId = BLACKSMITHING;
            SpellId = BLACKSMITHING_SPELL;
            break;
        case 3:
            ProfessionId = ENCHANTING;
            SpellId = ENCHANTING_SPELL;
            break;
        case 4:
            ProfessionId = ENGINEERING;
            SpellId = ENGINEERING_SPELL;
            break;
        case 5:
            ProfessionId = HERBALISM;
            SpellId = HERBALISM_SPELL;
            break;
        case 6:
            ProfessionId = JEWELCRAFTING;
            SpellId = JEWELCRAFTING_SPELL;
            break;
        case 7:
            ProfessionId = LEATHERWORKING;
            SpellId = LEATHERWORKING_SPELL;
            break;
        case 8:
            ProfessionId = MINING;
            SpellId = MINING_SPELL;
            break;
        case 9:
            ProfessionId = TAILORING;
            SpellId = TAILORING_SPELL;
            break;
        case 10:
            ProfessionId = SKINNING;
            SpellId = SKINNING_SPELL;
            break;
        case 11:
            player->SEND_VENDORLIST(_Creature->GetGUID());
            player->PlayerTalkClass->CloseGossip();
            return true;
            break;
    }

    if (PlayerAlreadyHasTwoProfessions(player))
    {
        player->PlayerTalkClass->CloseGossip();
        return true;
    }

    if(!player->HasSpell(SpellId))
        player->learnSpell(SpellId);

    SkillLineEntry const *skillInfo = sSkillLineStore.LookupEntry(ProfessionId);

    uint16 maxLevel = player->GetPureMaxSkillValue(skillInfo->id);
    player->SetSkill(skillInfo->id, maxLevel, maxLevel);

    player->PlayerTalkClass->CloseGossip();
    return true;
}

bool GossipHello_global_npc_profession(Player *player, Creature *_Creature)
{
    if (player->isInCombat())
        return false;

    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Alchemy",           GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1, WARN_RESET, 0, false);
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Blacksmithing",     GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2, WARN_RESET, 0, false);
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Enchanting",      	 GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+3, WARN_RESET, 0, false);
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Engeneering",       GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+4, WARN_RESET, 0, false);
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Herbalism",         GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5, WARN_RESET, 0, false);
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Jewelcrafting",     GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+6, WARN_RESET, 0, false);
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Leatherwork",       GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7, WARN_RESET, 0, false);
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Mining",            GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+8, WARN_RESET, 0, false);
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Tailoring",           GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+9, WARN_RESET, 0, false);
    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Skining",          GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+10, WARN_RESET, 0, false);
    player->PlayerTalkClass->SendGossipMenu(2, _Creature->GetGUID());

    return true;
}

bool GossipHello_alchemy_npc_profession(Player *player, Creature *_Creature)
{
    if (player->isInCombat())
        return false;

    player->ADD_GOSSIP_ITEM_EXTENDED(0, "Learn alchemy.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1, WARN_RESET, 0, false);
    player->ADD_GOSSIP_ITEM(1, "Mats.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+11);
    player->PlayerTalkClass->SendGossipMenu(2, _Creature->GetGUID());
    return true;
}

bool GossipHello_blacksmithing_npc_profession(Player *player, Creature *_Creature)
{
    if (!player->isInCombat())
    {
        player->ADD_GOSSIP_ITEM_EXTENDED(0, "Learn blacksmithing.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2, WARN_RESET, 0, false);
        player->ADD_GOSSIP_ITEM(1, "mats.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+11);
        player->PlayerTalkClass->SendGossipMenu(2, _Creature->GetGUID());
        return true;
    }
    return false;
}

bool GossipHello_enchanting_npc_profession(Player *player, Creature *_Creature)
{
    if (!player->isInCombat())
    {
        player->ADD_GOSSIP_ITEM_EXTENDED(0, "Learn enchanting.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+3, WARN_RESET, 0, false);
        player->ADD_GOSSIP_ITEM(1, "mats.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+11);
        player->PlayerTalkClass->SendGossipMenu(2, _Creature->GetGUID());
        return true;
    }
    return false;
}

bool GossipHello_engineering_npc_profession(Player *player, Creature *_Creature)
{
    if (!player->isInCombat())
    {
        player->ADD_GOSSIP_ITEM_EXTENDED(0, "Learn engeneering.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+4, WARN_RESET, 0, false);
        player->ADD_GOSSIP_ITEM(1, "mats.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+11);
        player->PlayerTalkClass->SendGossipMenu(2, _Creature->GetGUID());
        return true;
    }
    return false;
}

bool GossipHello_herbalism_npc_profession(Player *player, Creature *_Creature)
{
    if (!player->isInCombat())
    {
        player->ADD_GOSSIP_ITEM_EXTENDED(0, "Learn herbalism.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5, WARN_RESET, 0, false);
        player->ADD_GOSSIP_ITEM(1, "mats.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+11);
        player->PlayerTalkClass->SendGossipMenu(2, _Creature->GetGUID());
        return true;
    }
    return false;
}

bool GossipHello_jewelcrafting_npc_profession(Player *player, Creature *_Creature)
{
    if (!player->isInCombat())
    {
        player->ADD_GOSSIP_ITEM_EXTENDED(0, "Learn jewelcrafting.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+6, WARN_RESET, 0, false);
        player->ADD_GOSSIP_ITEM(1, "mats.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+11);
        player->PlayerTalkClass->SendGossipMenu(2, _Creature->GetGUID());
        return true;
    }
    return false;
}

bool GossipHello_leatherworking_npc_profession(Player *player, Creature *_Creature)
{
    if (!player->isInCombat())
    {
        player->ADD_GOSSIP_ITEM_EXTENDED(0, "Learn leatherwork.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7, WARN_RESET, 0, false);
        player->ADD_GOSSIP_ITEM(1, "mats.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+11);
        player->PlayerTalkClass->SendGossipMenu(2, _Creature->GetGUID());
        return true;
    }
    return false;
}

bool GossipHello_mining_npc_profession(Player *player, Creature *_Creature)
{
    if (!player->isInCombat())
    {
        player->ADD_GOSSIP_ITEM_EXTENDED(0, "Learn mining.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+8, WARN_RESET, 0, false);
        player->ADD_GOSSIP_ITEM(1, "mats.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+11);
        player->PlayerTalkClass->SendGossipMenu(2, _Creature->GetGUID());
        return true;
    }
    return false;
}

bool GossipHello_tailoring_npc_profession(Player *player, Creature *_Creature)
{
    if (!player->isInCombat())
    {
        player->ADD_GOSSIP_ITEM_EXTENDED(0, "Learn tailoring.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+9, WARN_RESET, 0, false);
        player->ADD_GOSSIP_ITEM(1, "mats.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+11);
        player->PlayerTalkClass->SendGossipMenu(2, _Creature->GetGUID());
        return true;
    }
    return false;
}

bool GossipHello_skinning_npc_profession(Player *player, Creature *_Creature)
{
    if (!player->isInCombat())
    {
        player->ADD_GOSSIP_ITEM_EXTENDED(0, "Learn skining.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+10, WARN_RESET, 0, false);
        player->ADD_GOSSIP_ITEM(1, "mats.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+11);
        player->PlayerTalkClass->SendGossipMenu(2, _Creature->GetGUID());
        return true;
    }
    return false;
}

void AddSC_npc_profession()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "global_npc_profession";
    newscript->pGossipHello = &GossipHello_global_npc_profession;
    newscript->pGossipSelect = &GossipSelect_npc_profession;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "alchemy_npc_profession";
    newscript->pGossipHello = &GossipHello_alchemy_npc_profession;
    newscript->pGossipSelect = &GossipSelect_npc_profession;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "blacksmithing_npc_profession";
    newscript->pGossipHello = &GossipHello_blacksmithing_npc_profession;
    newscript->pGossipSelect = &GossipSelect_npc_profession;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "enchanting_npc_profession";
    newscript->pGossipHello = &GossipHello_enchanting_npc_profession;
    newscript->pGossipSelect = &GossipSelect_npc_profession;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "engineering_npc_profession";
    newscript->pGossipHello = &GossipHello_engineering_npc_profession;
    newscript->pGossipSelect = &GossipSelect_npc_profession;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "herbalism_npc_profession";
    newscript->pGossipHello = &GossipHello_herbalism_npc_profession;
    newscript->pGossipSelect = &GossipSelect_npc_profession;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "jewelcrafting_npc_profession";
    newscript->pGossipHello = &GossipHello_jewelcrafting_npc_profession;
    newscript->pGossipSelect = &GossipSelect_npc_profession;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "leatherworking_npc_profession";
    newscript->pGossipHello = &GossipHello_leatherworking_npc_profession;
    newscript->pGossipSelect = &GossipSelect_npc_profession;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mining_npc_profession";
    newscript->pGossipHello = &GossipHello_mining_npc_profession;
    newscript->pGossipSelect = &GossipSelect_npc_profession;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "skinning_npc_profession";
    newscript->pGossipHello = &GossipHello_skinning_npc_profession;
    newscript->pGossipSelect = &GossipSelect_npc_profession;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "tailoring_npc_profession";
    newscript->pGossipHello = &GossipHello_tailoring_npc_profession;
    newscript->pGossipSelect = &GossipSelect_npc_profession;
    newscript->RegisterSelf();
}
