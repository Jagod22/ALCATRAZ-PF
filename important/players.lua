local players = game:GetService("Players")
local player = players.LocalPlayer
local user_input_service = game:GetService("UserInputService")
getgenv().players = players
getgenv().player = player
getgenv().get_mouse_pos = function()
    local mouse_pos = user_input_service:GetMouseLocation()
    return Vector2.new(mouse_pos.X, mouse_pos.Y)
end
