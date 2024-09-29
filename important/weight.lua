
getgenv().weighted_random = function(weights)
    if type(weights) ~= "table" or #weights == 0 then
        error("Invalid input: weights must be a non-empty table.")
    end

    local totalWeight = 0

    for _, weight in pairs(weights) do
        if type(weight) ~= "number" or weight < 0 then
            error("Invalid weight: weights must be non-negative numbers.")
        end
        totalWeight = totalWeight + weight
    end

    if totalWeight == 0 then return end

    local randomValue = math.random() * totalWeight
    local cumulativeWeight = 0

    for index, weight in pairs(weights) do
        cumulativeWeight = cumulativeWeight + weight
        if randomValue <= cumulativeWeight then
            return index, weight
        end
    end
end
