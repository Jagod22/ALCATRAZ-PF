local characters
for _, v in pairs(getgc(true)) do
    if type(v) == "table" and rawget(v, "getbodyparts") then
        characters = debug.getupvalue(v.getbodyparts, 1)
        if characters then
            break
        end
    end
end

if not characters then
    error("Failed to find characters")
end

getgenv().characters = characters
