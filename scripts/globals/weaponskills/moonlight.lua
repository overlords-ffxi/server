-----------------------------------
-- Moonlight
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------
local weaponskill_object = {}

weaponskill_object.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local lvl = player:getSkillLevel(11) -- get club skill
    local damage = (lvl/9) - 1
    local damagemod = damage * ((50+(tp*0.05))/100)
    damagemod = damagemod * xi.settings.main.WEAPON_SKILL_POWER
    if player:getMainJob() == xi.job.WAR and (player:getCharVar("WarAdv") == xi.WarAdv.GLADIATOR) then
    target:setHP(target:getHP() + math.floor(target:getMaxHP() * 0.25))
    end
    return 1, 0, false, damagemod
end

return weaponskill_object
