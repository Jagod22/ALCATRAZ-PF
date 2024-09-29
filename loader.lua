local script_details = {
    debug = false,
    version = "1.0.2",
}

local url = script_details.debug and "http://localhost:6845" or "https://raw.githubusercontent.com/Jagod22/ALCATRAZ-PF/main"

local out = script_details.debug and function(formatString, ...)
    return warn("[ALCATRAZ - DEBUG]: " .. formatString:format(...))
end or function() end

local function import(file)
    out("Importing File \"%s\"", file)
    local success, err = pcall(function()
        local code = game:HttpGet(url .. file)
        if code then
            loadstring(code)()
        else
            warn("Failed to load content from URL: " .. url .. file)
        end
    end)

    if not success then
        warn("Failed to import '%s': %s", file, err)
    end
end

getgenv().import = import
getgenv().details = script_details
import('/main.lua')
