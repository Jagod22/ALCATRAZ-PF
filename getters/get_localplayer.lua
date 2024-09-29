local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

if not localPlayer then
    error("Failed to find LocalPlayer")
end

getgenv().localplayer = localPlayer
