-----------------------------------
-- Ability: Defender
-- Job: Warrior
--Class Id's
--Shout is 1
--Zerk is 2
--Glad is 3
-----------------------------------
require("scripts/globals/job_utils/warrior")
-----------------------------------
local abilityObject = {}

ability_object.onAbilityCheck = function(player, target, ability)
local WarAdv = player:getCharVar("WarAdv")
if (WarAdv == xi.WarAdv.SHOUTER) and (player:getMainJob() == xi.job.WAR) then
    ability:setRecast(60)
  end
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.warrior.useDefender(player, target, ability)
end

return abilityObject
