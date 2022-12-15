-----------------------------------
-- Ability: Berserk
-- Job: Warrior
-----------------------------------
require("scripts/globals/job_utils/warrior")
-----------------------------------
local abilityObject = {}

ability_object.onAbilityCheck = function(player, target, ability)
  if (WarAdv == xi.WarAdv.SHOUTER) and (player:getMainJob() == xi.job.WAR) then
        ability:setRecast(60)
      end
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.warrior.useBerserk(player, target, ability)
end

return abilityObject
