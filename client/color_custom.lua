--[[
    
    ZOBYETEAM_CARCUSTOMS
    Version : 2.0.4
    Written By : ZOBYETEAM
    This system is copyrighted.
    ( ระบบนี้ได้ทำการจดทะเบียนลิขสิทธิ์เรียบร้อย )

]]

Particles = {}
local chameleonList = {}

OnSpray = false
IsInColorCustom = false

function SprayEffect(vehicle, locationIndex, colors)
    CreateThread(function()
        if OnSpray and next(Particles) then
            for _, particle in ipairs(Particles) do
                StopParticleFxLooped(particle, 0)
            end

            Particles = {}
        end

        OnSpray = true

        local location = Config.ColorCustomLocations[locationIndex]

        local vehicleCoords = GetEntityCoords(vehicle)

        RequestNamedPtfxAsset('core')
        while not HasNamedPtfxAssetLoaded('core') do
            Wait(1)
        end

        RequestNamedPtfxAsset('scr_paintnspray')
        while not HasNamedPtfxAssetLoaded('scr_paintnspray') do
            Wait(1)
        end

        local colorList = {}

        local length = #location.SprayCoords

        for i = 1, length + 5 do
            colorList[i] = colors or {math.random(1, 255), math.random(1, 255), math.random(1, 255)}
        end

        TriggerServerEvent('zobyeteam_carcustoms:startSprayFx', vehicleCoords, locationIndex, colorList)

        for index, coords in ipairs(location.SprayCoords) do
            local color = colorList[index]

            local diffVector = vehicleCoords - coords
            local zRotate = math.atan2(-diffVector.x, diffVector.y) * 57.297
            local xRotate = math.atan2(diffVector.z, #diffVector.xy) * 57.297

            UseParticleFxAssetNextCall('core')
            local particleHandle = StartParticleFxLoopedAtCoord('ent_amb_steam', coords, xRotate - 90, 0.0, zRotate, 3.0, false, false, false)
            SetParticleFxLoopedColour(particleHandle, color[1] / 255, color[2] / 255, color[3] / 255) -- Red color

            Particles[#Particles + 1] = particleHandle
        end

        for i = 1, 5 do
            local color = colorList[i + length]

            UseParticleFxAssetNextCall('scr_paintnspray')
            local particleHandle = StartParticleFxLoopedAtCoord('scr_respray_smoke', vehicleCoords, 0.0, 0.0, 0.0, math.random(1, 5) / 10, false, false, false)
            SetParticleFxLoopedColour(particleHandle, color[1] / 255, color[2] / 255, color[3] / 255) -- Red color

            Particles[#Particles + 1] = particleHandle
        end

        Wait(5000)

        for _, particle in ipairs(Particles) do
            StopParticleFxLooped(particle, 0)
        end

        OnSpray = false
        Particles = {}
    end)
end

RegisterNetEvent('zobyeteam_carcustoms:startSprayFx', function(sourceId, vehicleCoords, locationIndex, colorList)
    if sourceId == GetPlayerServerId(PlayerId()) then return end

    local location = Config.ColorCustomLocations[locationIndex]

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    local distance = #(playerCoords - location.Coords)
    if distance > 30 then return end

    local length = #location.SprayCoords

    local otherParticles = {}

    RequestNamedPtfxAsset('core')
    while not HasNamedPtfxAssetLoaded('core') do
        Wait(1)
    end

    RequestNamedPtfxAsset('scr_paintnspray')
    while not HasNamedPtfxAssetLoaded('scr_paintnspray') do
        Wait(1)
    end

    for index, coords in ipairs(location.SprayCoords) do
        local color = colorList[index]

        local diffVector = vehicleCoords - coords
        local zRotate = math.atan2(-diffVector.x, diffVector.y) * 57.297
        local xRotate = math.atan2(diffVector.z, #diffVector.xy) * 57.297

        UseParticleFxAssetNextCall('core')
        local particleHandle = StartParticleFxLoopedAtCoord('ent_amb_steam', coords, xRotate - 90, 0.0, zRotate, 3.0, false, false, false)
        SetParticleFxLoopedColour(particleHandle, color[1] / 255, color[2] / 255, color[3] / 255) -- Red color

        otherParticles[#otherParticles + 1] = particleHandle
    end

    for i = 1, 5 do
        local color = colorList[i + length]

        UseParticleFxAssetNextCall('scr_paintnspray')
        local particleHandle = StartParticleFxLoopedAtCoord('scr_respray_smoke', vehicleCoords, 0.0, 0.0, 0.0, math.random(1, 5) / 10, false, false, false)
        SetParticleFxLoopedColour(particleHandle, color[1] / 255, color[2] / 255, color[3] / 255) -- Red color

        otherParticles[#otherParticles + 1] = particleHandle
    end

    Wait(5000)

    for _, particle in ipairs(otherParticles) do
        StopParticleFxLooped(particle, 0)
    end
end)

function FadeColor(vehicle, colors, SetColorFn)
    SetColorFn(vehicle, 255, 255, 255)
    Wait(1000)
    
    local r, g, b = table.unpack(colors)
    local divisor = 4000 / 10

    local rIncrease = (r - 255) / divisor
    local gIncrease = (g - 255) / divisor
    local bIncrease = (b - 255) / divisor

    local currentR = 255
    local currentG = 255
    local currentB = 255

    for i = 1, divisor do
        currentR = currentR + rIncrease
        currentG = currentG + gIncrease
        currentB = currentB + bIncrease

        SetColorFn(vehicle, math.floor(currentR), math.floor(currentG), math.floor(currentB))
        Wait(10)
    end
    
    SetColorFn(vehicle, r, g, b)
end