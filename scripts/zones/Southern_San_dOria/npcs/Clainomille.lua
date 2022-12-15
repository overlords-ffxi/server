-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Clainomille
-- Type: Standard NPC
-- !pos -72.771 0.999 -6.112 230
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/settings")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local menu =
    {
      title = "Which Soul Will You Grasp?",
              options =
      {
          {
            "Commander",
            function(playerArg)
                playerArg:PrintToPlayer("Commander Selected", xi.msg.channel.NS_SAY)
                playerArg:setCharVar("WarAdv", 1)
            end,
        },
        {
            "Berserker",
            function(playerArg)
                playerArg:PrintToPlayer("Berserker Selected", xi.msg.channel.NS_SAY)
                playerArg:setCharVar("WarAdv", 2)
            end,
        },
        {
            "Gladiator",
            function(playerArg)
                playerArg:PrintToPlayer("Gladiator Selected", xi.msg.channel.NS_SAY)
                playerArg:setCharVar("WarAdv", 3)
            end,
        },
      },
        onCancelled = function(playerArg)
            playerArg:PrintToPlayer("Return to me when you have made up your mind", xi.msg.channel.NS_SAY)
        end,
        onEnd = function(playerArg)
            -- NOTE: This could be used to release a locked player,
            -- playerArg:PrintToPlayer("Stop wasting my time", xi.msg.channel.NS_SAY)
        end,
    }
    if (player:getMainJob() == xi.job.WAR) and (player:getMainLvl() >= 30) then
        player:customMenu(menu)
    else
        player:startEvent(613)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
