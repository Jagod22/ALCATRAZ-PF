local camera = nil
for _, v in next, getgc(true) do
    if type(v) == "table" and rawget(v, "setswayspeed") then
        camera = v
        break
    end
end

if not camera then
    error("Failed to find camera")
end

getgenv().camera = camera
