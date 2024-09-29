local menu
for _, v in next, getgc(true) do
    if type(v) == "table" and rawget(v, "loadmenu") then
        menu = v
        break
    end
end

if not menu then
    error("Failed to find menu")
end

getgenv().menu = menu
