-----------------------------------
-- Area: Castle Oztroja
--  NPC: _m73 (Torch Stand)
-- Notes: Opens door _477 when _m72 to _m75 are lit
-- !pos -140.146 -72.058 -137.145 151
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja/IDs")
require("scripts/globals/settings")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local brassDoor = GetNPCByID(npc:getID() - 3)

    if
        npc:getAnimation() == xi.anim.CLOSE_DOOR and
        brassDoor:getAnimation() == xi.anim.CLOSE_DOOR
    then
        player:startEvent(10)
    else
        player:messageSpecial(ID.text.TORCH_LIT)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if option == 1 then
        local brassDoor = GetNPCByID(ID.npc.BRASS_DOOR_FLOOR_4_H7)
        if brassDoor:getAnimation() == xi.anim.CLOSE_DOOR then
            brassDoor:openDoor(35)
            for i = 2, 5 do
                local torch = GetNPCByID(ID.npc.BRASS_DOOR_FLOOR_4_H7 + i)
                torch:setAnimation(xi.anim.CLOSE_DOOR)
                torch:openDoor(39)
            end
        else
            GetNPCByID(ID.npc.BRASS_DOOR_FLOOR_4_H7 + 3):openDoor()
        end
    end
end

return entity
