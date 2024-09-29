
local function is_gunsight(t)
    local sightparts = gun_system.currentgun and gun_system.currentgun.aimsightdata
    if sightparts then
        for _, sightdata in next, sightparts do
            if sightdata.sightpart == t then
                return true
            end
        end
    end
    return false
end

local old_index
old_index = hookmetamethod(game, "__index", function(t, k)
    if k == "CFrame" and config.aimbot.silent_aim and gun_system.currentgun and (is_gunsight(t) or t == gun_system.currentgun.barrel) then
        local r = weighted_random({hit = config.aimbot.hit_chance, miss = 100 - config.aimbot.hit_chance})
        local cf = old_index(t, k)
        local closest_player, closest_bodyparts = get_closest()
        if closest_player and closest_bodyparts and closest_player.Team ~= player.Team and r == "hit" then
            return CFrame.new(
                cf.Position,
                closest_bodyparts[config.aimbot.target_part].Position
            )
        end
    end
    return old_index(t, k)
end)
