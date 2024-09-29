
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

getgenv().Players = Players
getgenv().LocalPlayer = LocalPlayer

getgenv().get_mouse_pos = function()
    local mousePos = UserInputService:GetMouseLocation()
    return Vector2.new(mousePos.X, mousePos.Y)
end
