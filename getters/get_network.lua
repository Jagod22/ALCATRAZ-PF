local network
for _, v in next, getgc(true) do
    if type(v) == "table" and rawget(v, "send") and rawget(v, "add") then
        network = v
        break
    end
end

if not network then
    error("Failed to find localplayer's network object")
end
getgenv().network = network
