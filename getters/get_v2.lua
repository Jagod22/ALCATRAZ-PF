local camera = workspace.CurrentCamera

getgenv().get_v2 = function(v3)
    if typeof(v3) ~= "Vector3" then
        error("Expected a Vector3 value as input.")
    end
    
    local point, onscreen = camera:WorldToViewportPoint(v3)
    
    return Vector2.new(point.X, point.Y), onscreen
end
