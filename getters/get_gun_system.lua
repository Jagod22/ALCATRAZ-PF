local gun_system
for _, v in pairs(getgc(true)) do
    if type(v) == "table" and v.setsprintdisable then
        gun_system = v
        break
    end
end

if not gun_system then
    error("Failed to find gun_system")
end
getgenv().gun_system = gun_system
