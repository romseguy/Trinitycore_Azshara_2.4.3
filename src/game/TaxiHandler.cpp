/*
 * Copyright (C) 2005-2008 MaNGOS <http://www.mangosproject.org/>
 *
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

#include "Common.h"
#include "Database/DatabaseEnv.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Opcodes.h"
#include "Log.h"
#include "World.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "UpdateMask.h"
#include "Path.h"
#include "WaypointMovementGenerator.h"
#include "DestinationHolderImp.h"

void WorldSession::HandleTaxiNodeStatusQueryOpcode(WorldPacket & recv_data)
{
    DEBUG_LOG("WORLD: Received CMSG_TAXINODE_STATUS_QUERY");

    uint64 guid;

    recv_data >> guid;
    SendTaxiStatus(guid);
}

void WorldSession::SendTaxiStatus(uint64 guid)
{
    // cheating checks
    Creature *unit = GetPlayer()->GetMap()->GetCreature(guid);
    if (!unit)
    {
        sLog.outDebug("WorldSession::SendTaxiStatus - Unit (GUID: %u) not found.", uint32(GUID_LOPART(guid)));
        return;
    }

    uint32 curloc = objmgr.GetNearestTaxiNode(unit->GetPositionX(),unit->GetPositionY(),unit->GetPositionZ(),unit->GetMapId());

    // not found nearest
    if (curloc == 0)
        return;

    DEBUG_LOG("WORLD: current location %u ",curloc);

    WorldPacket data(SMSG_TAXINODE_STATUS, 9);
    data << guid;
    data << uint8(GetPlayer()->m_taxi.IsTaximaskNodeKnown(curloc) ? 1 : 0);
    SendPacket(&data);
    DEBUG_LOG("WORLD: Sent SMSG_TAXINODE_STATUS");
}

void WorldSession::HandleTaxiQueryAvailableNodesOpcode(WorldPacket & recv_data)
{
    DEBUG_LOG("WORLD: Received CMSG_TAXIQUERYAVAILABLENODES");

    uint64 guid;
    recv_data >> guid;

    // cheating checks
    Creature *unit = GetPlayer()->GetNPCIfCanInteractWith(guid, UNIT_NPC_FLAG_FLIGHTMASTER);
    if (!unit)
    {
        sLog.outDebug("WORLD: HandleTaxiQueryAvailableNodes - Unit (GUID: %u) not found or you can't interact with him.", uint32(GUID_LOPART(guid)));
        return;
    }

    // remove fake death
    if (GetPlayer()->hasUnitState(UNIT_STAT_DIED))
        GetPlayer()->RemoveSpellsCausingAura(SPELL_AURA_FEIGN_DEATH);

    // unknown taxi node case
    if (SendLearnNewTaxiNode(unit))
        return;

    // known taxi node case
    SendTaxiMenu(unit);
}

void WorldSession::SendTaxiMenu(Creature* unit)
{
    // find current node
    uint32 curloc = objmgr.GetNearestTaxiNode(unit->GetPositionX(),unit->GetPositionY(),unit->GetPositionZ(),unit->GetMapId());

    if (curloc == 0)
        return;

    DEBUG_LOG("WORLD: CMSG_TAXINODE_STATUS_QUERY %u ",curloc);

    WorldPacket data(SMSG_SHOWTAXINODES, (4+8+4+8*4));
    data << uint32(1);
    data << uint64(unit->GetGUID());
    data << uint32(curloc);
    GetPlayer()->m_taxi.AppendTaximaskTo(data,GetPlayer()->isTaxiCheater());
    SendPacket(&data);

    DEBUG_LOG("WORLD: Sent SMSG_SHOWTAXINODES");
}

void WorldSession::SendDoFlight(uint16 MountId, uint32 path, uint32 pathNode)
{
    // remove fake death
    if (GetPlayer()->hasUnitState(UNIT_STAT_DIED))
        GetPlayer()->RemoveSpellsCausingAura(SPELL_AURA_FEIGN_DEATH);

    // anti-cheat
    GetPlayer()->m_anti_ontaxipath = true;

    while (GetPlayer()->GetMotionMaster()->GetCurrentMovementGeneratorType() == FLIGHT_MOTION_TYPE)
        GetPlayer()->GetMotionMaster()->MovementExpired(false);

    GetPlayer()->Mount(MountId);
    GetPlayer()->GetMotionMaster()->MoveTaxiFlight(path,pathNode);
}

bool WorldSession::SendLearnNewTaxiNode(Creature* unit)
{
    // find current node
    uint32 curloc = objmgr.GetNearestTaxiNode(unit->GetPositionX(),unit->GetPositionY(),unit->GetPositionZ(),unit->GetMapId());

    if (curloc == 0)
        return true;                                        // `true` send to avoid WorldSession::SendTaxiMenu call with one more curlock seartch with same false result.

    if (GetPlayer()->m_taxi.SetTaximaskNode(curloc))
    {
        WorldPacket msg(SMSG_NEW_TAXI_PATH, 0);
        SendPacket(&msg);

        WorldPacket update(SMSG_TAXINODE_STATUS, 9);
        update << uint64(unit->GetGUID());
        update << uint8(1);
        SendPacket(&update);

        return true;
    }
    else
        return false;
}

void WorldSession::HandleActivateTaxiFarOpcode (WorldPacket & recv_data)
{
    DEBUG_LOG("WORLD: Received CMSG_ACTIVATETAXIEXPRESS");

    uint64 guid;
    uint32 node_count, _totalcost;

    recv_data >> guid >> _totalcost >> node_count;

    Creature *npc = GetPlayer()->GetNPCIfCanInteractWith(guid, UNIT_NPC_FLAG_FLIGHTMASTER);
    if (!npc)
    {
        sLog.outDebug("WORLD: HandleActivateTaxiFarOpcode - Unit (GUID: %u) not found or you can't interact with it.", uint32(GUID_LOPART(guid)));
        return;
    }
    std::vector<uint32> nodes;

    for (uint32 i = 0; i < node_count; ++i)
    {
        uint32 node;
        recv_data >> node;
        nodes.push_back(node);
    }

    if (nodes.empty())
        return;

    DEBUG_LOG("WORLD: Received CMSG_ACTIVATETAXIEXPRESS from %d to %d" ,nodes.front(),nodes.back());

    GetPlayer()->ActivateTaxiPathTo(nodes, 0, npc);
}

void WorldSession::HandleTaxiNextDestinationOpcode(WorldPacket& recv_data)
{
    DEBUG_LOG("WORLD: Received CMSG_MOVE_SPLINE_DONE");

    MovementInfo movementInfo;                              // used only for proper packet read

    recv_data >> movementInfo;
    recv_data >> Unused<uint32>();                          // unk

    // in taxi flight packet received in 2 case:
    // 1) end taxi path in far (multi-node) flight
    // 2) switch from one map to other in case multim-map taxi path
    // we need process only (1)
    uint32 curDest = GetPlayer()->m_taxi.GetTaxiDestination();
    if (!curDest)
    {
        // movement anticheat code
        GetPlayer()->Relocate(movementInfo.GetPos());
        GetPlayer()->m_movementInfo = movementInfo;
        GetPlayer()->m_anti_lastmovetime = movementInfo.time;
        GetPlayer()->m_anti_justteleported = true;
        //<<< end movement anticheat
        return;
    }

    TaxiNodesEntry const* curDestNode = sTaxiNodesStore.LookupEntry(curDest);

    if (curDestNode && curDestNode->map_id == GetPlayer()->GetMapId())
    {
        while(GetPlayer()->GetMotionMaster()->GetCurrentMovementGeneratorType() == FLIGHT_MOTION_TYPE)
            GetPlayer()->GetMotionMaster()->MovementExpired(false);
    }

    //movement anticheat code
    GetPlayer()->SetPosition(movementInfo.GetPos()->GetPositionX(), movementInfo.GetPos()->GetPositionY(), movementInfo.GetPos()->GetPositionZ(), movementInfo.GetPos()->GetOrientation());
    GetPlayer()->m_movementInfo = movementInfo;
    GetPlayer()->m_anti_lastmovetime = movementInfo.time;
    //<<< end movement anticheat

    // far teleport case
    if (curDestNode && curDestNode->map_id != GetPlayer()->GetMapId())
    {
        if (GetPlayer()->GetMotionMaster()->GetCurrentMovementGeneratorType() == FLIGHT_MOTION_TYPE)
        {
            // short preparations to continue flight
            FlightPathMovementGenerator* flight = (FlightPathMovementGenerator*)(GetPlayer()->GetMotionMaster()->top());

            flight->SetCurrentNodeAfterTeleport();
            TaxiPathNodeEntry const& node = flight->GetPath()[flight->GetCurrentNode()];
            flight->SkipCurrentNode();

            GetPlayer()->TeleportTo(curDestNode->map_id,node.x,node.y,node.z,GetPlayer()->GetOrientation());
        }
        return;
    }

    uint32 destinationnode = GetPlayer()->m_taxi.NextTaxiDestination();
    if (destinationnode > 0)                              // if more destinations to go
    {
        // current source node for next destination
        uint32 sourcenode = GetPlayer()->m_taxi.GetTaxiSource();

        // Add to taximask middle hubs in taxicheat mode (to prevent having player with disabled taxicheat and not having back flight path)
        if (GetPlayer()->isTaxiCheater())
        {
            if (GetPlayer()->m_taxi.SetTaximaskNode(sourcenode))
            {
                WorldPacket data(SMSG_NEW_TAXI_PATH, 0);
                _player->GetSession()->SendPacket(&data);
            }
        }

        DEBUG_LOG("WORLD: Taxi has to go from %u to %u", sourcenode, destinationnode);

        uint16 MountId = objmgr.GetTaxiMount(sourcenode, GetPlayer()->GetTeam());

        uint32 path, cost;
        objmgr.GetTaxiPath(sourcenode, destinationnode, path, cost);

        if (path && MountId)
            SendDoFlight(MountId, path, 1);               // skip start fly node
        else
            GetPlayer()->CleanupAfterTaxiFlight();    // clear problematic path and next
    }
    else
        GetPlayer()->CleanupAfterTaxiFlight();        // not destinations, clear source node
}

void WorldSession::HandleActivateTaxiOpcode(WorldPacket & recv_data)
{
    DEBUG_LOG("WORLD: Received CMSG_ACTIVATETAXI");

    uint64 guid;
    std::vector<uint32> nodes;
    nodes.resize(2);

    recv_data >> guid >> nodes[0] >> nodes[1];
    DEBUG_LOG("WORLD: Received CMSG_ACTIVATETAXI from %d to %d" ,nodes[0],nodes[1]);
    Creature *npc = GetPlayer()->GetNPCIfCanInteractWith(guid, UNIT_NPC_FLAG_FLIGHTMASTER);
    if (!npc)
    {
        sLog.outDebug("WORLD: HandleActivateTaxiOpcode - Unit (GUID: %u) not found or you can't interact with it.", uint32(GUID_LOPART(guid)));
        return;
    }

    GetPlayer()->ActivateTaxiPathTo(nodes, 0, npc);
}

