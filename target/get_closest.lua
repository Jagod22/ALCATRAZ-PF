
getgenv().get_closest = function()
    local closest_player = nil
    local closest_bodyparts = nil
    local closest_distance = math.huge

    for _, target_player in pairs(players:GetPlayers()) do
        if target_player == player then continue end

        local character = target_player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local torso = character:FindFirstChild("HumanoidRootPart")
            if not torso then continue end

            local screen_pos, onscreen = camera:WorldToViewportPoint(torso.Position)
            if onscreen then
                local mouse_pos = user_input_service:GetMouseLocation()
                local distance = (Vector2.new(screen_pos.X, screen_pos.Y) - mouse_pos).Magnitude
                local fov = config.aimbot.field_of_view or 2000
                if distance <= fov and distance < closest_distance then
                    closest_player = target_player
                    closest_bodyparts = character
                    closest_distance = distance
                end
            end
        end
    end

    return closest_player, closest_bodyparts
end
