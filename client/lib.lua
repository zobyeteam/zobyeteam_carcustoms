--[[
    
    ZOBYETEAM_CARCUSTOMS
    Version : 2.0.4
    Written By : ZOBYETEAM
    This system is copyrighted.
    ( ระบบนี้ได้ทำการจดทะเบียนลิขสิทธิ์เรียบร้อย )

]]

ZBT = exports['zobyeteam_wrapper']:GetLib()

function DumpTable(table, nb)
	if nb == nil then
		nb = 0
	end

	if type(table) == 'table' then
		local s = ''
		for _ = 1, nb + 1, 1 do
			s = s .. "    "
		end

		s = '{\n'
		for k, v in pairs(table) do
			if type(k) ~= 'number' then k = '"' .. k .. '"' end
			for _ = 1, nb, 1 do
				s = s .. "    "
			end
			s = s .. '[' .. k .. '] = ' .. DumpTable(v, nb + 1) .. ',\n'
		end

		for _ = 1, nb, 1 do
			s = s .. "    "
		end

		return s .. '}'
	else
		return tostring(table)
	end
end

function Split(inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end

function Round(value, numDecimalPlaces)
	if numDecimalPlaces then
		local power = 10 ^ numDecimalPlaces
		return math.floor((value * power) + 0.5) / (power)
	else
		return math.floor(value + 0.5)
	end
end

function Trim(value)
	if not value then return nil end
    return (string.gsub(value, '^%s*(.-)%s*$', '%1'))
end

function FindTable(t, cb)
	for i = 1, #t, 1 do
		if cb(t[i]) then
			return t[i]
		end
	end

	return nil
end

function LoadModel(model)
    RequestModel(model)

    while not HasModelLoaded(model) do
        RequestModel(model)

        Wait(5)
    end
end

function GetVehicleProperties(vehicle)
    if not DoesEntityExist(vehicle) then
        return
    end

    local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
    local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
    local hasCustomPrimaryColor = GetIsVehiclePrimaryColourCustom(vehicle)
    local customPrimaryColor = nil
    if hasCustomPrimaryColor then
        customPrimaryColor = {GetVehicleCustomPrimaryColour(vehicle)}
    end

    local hasCustomXenonColor, customXenonColorR, customXenonColorG, customXenonColorB = GetVehicleXenonLightsCustomColor(vehicle)
    local customXenonColor = nil
    if hasCustomXenonColor then 
        customXenonColor = {customXenonColorR, customXenonColorG, customXenonColorB}
    end
    
    local hasCustomSecondaryColor = GetIsVehicleSecondaryColourCustom(vehicle)
    local customSecondaryColor = nil
    if hasCustomSecondaryColor then
        customSecondaryColor = {GetVehicleCustomSecondaryColour(vehicle)}
    end

    local extras = {}
    for extraId = 0, 12 do
        if DoesExtraExist(vehicle, extraId) then
            extras[tostring(extraId)] = IsVehicleExtraTurnedOn(vehicle, extraId)
        end
    end

    local doorsBroken, windowsBroken, tyreBurst = {}, {}, {}
    local numWheels = tostring(GetVehicleNumberOfWheels(vehicle))

    local TyresIndex = { -- Wheel index list according to the number of vehicle wheels.
        ['2'] = {0, 4}, -- Bike and cycle.
        ['3'] = {0, 1, 4, 5}, -- Vehicle with 3 wheels (get for wheels because some 3 wheels vehicles have 2 wheels on front and one rear or the reverse).
        ['4'] = {0, 1, 4, 5}, -- Vehicle with 4 wheels.
        ['6'] = {0, 1, 2, 3, 4, 5} -- Vehicle with 6 wheels.
    }

    if TyresIndex[numWheels] then
        for tyre, idx in pairs(TyresIndex[numWheels]) do
            tyreBurst[tostring(idx)] = IsVehicleTyreBurst(vehicle, idx, false)
        end
    end

    for windowId = 0, 7 do -- 13
        windowsBroken[tostring(windowId)] = not IsVehicleWindowIntact(vehicle, windowId)
    end

    local numDoors = GetNumberOfVehicleDoors(vehicle)
    if numDoors and numDoors > 0 then
        for doorsId = 0, numDoors do
            doorsBroken[tostring(doorsId)] = IsVehicleDoorDamaged(vehicle, doorsId)
        end
    end
    
    return {
        model = GetEntityModel(vehicle),
        doorsBroken = doorsBroken,
        windowsBroken = windowsBroken,
        tyreBurst = tyreBurst,
        plate = Trim(GetVehicleNumberPlateText(vehicle)),
        plateIndex = GetVehicleNumberPlateTextIndex(vehicle),

        bodyHealth = Round(GetVehicleBodyHealth(vehicle)),
        engineHealth = Round(GetVehicleEngineHealth(vehicle)),
        tankHealth = Round(GetVehiclePetrolTankHealth(vehicle)),

        fuelLevel = Round(GetVehicleFuelLevel(vehicle)),
        dirtLevel = Round(GetVehicleDirtLevel(vehicle)),
        color1 = colorPrimary,
        color2 = colorSecondary,
        customPrimaryColor = customPrimaryColor,
        customSecondaryColor = customSecondaryColor,

        pearlescentColor = pearlescentColor,
        wheelColor = wheelColor,

        interiorColor = GetVehicleInteriorColor(vehicle),

        wheels = GetVehicleWheelType(vehicle),
        windowTint = GetVehicleWindowTint(vehicle),
        xenonColor = GetVehicleXenonLightsColor(vehicle),
        customXenonColor = customXenonColor,

        neonEnabled = {IsVehicleNeonLightEnabled(vehicle, 0), IsVehicleNeonLightEnabled(vehicle, 1),
                        IsVehicleNeonLightEnabled(vehicle, 2), IsVehicleNeonLightEnabled(vehicle, 3)},

        neonColor = table.pack(GetVehicleNeonLightsColour(vehicle)),
        extras = extras,
        tyreSmokeColor = table.pack(GetVehicleTyreSmokeColor(vehicle)),

        modSpoilers = GetVehicleMod(vehicle, 0),
        modFrontBumper = GetVehicleMod(vehicle, 1),
        modRearBumper = GetVehicleMod(vehicle, 2),
        modSideSkirt = GetVehicleMod(vehicle, 3),
        modExhaust = GetVehicleMod(vehicle, 4),
        modFrame = GetVehicleMod(vehicle, 5),
        modGrille = GetVehicleMod(vehicle, 6),
        modHood = GetVehicleMod(vehicle, 7),
        modFender = GetVehicleMod(vehicle, 8),
        modRightFender = GetVehicleMod(vehicle, 9),
        modRoof = GetVehicleMod(vehicle, 10),

        modEngine = GetVehicleMod(vehicle, 11),
        modBrakes = GetVehicleMod(vehicle, 12),
        modTransmission = GetVehicleMod(vehicle, 13),
        modHorns = GetVehicleMod(vehicle, 14),
        modSuspension = GetVehicleMod(vehicle, 15),
        modArmor = GetVehicleMod(vehicle, 16),

        modTurbo = IsToggleModOn(vehicle, 18),
        modSmokeEnabled = IsToggleModOn(vehicle, 20),
        modXenon = IsToggleModOn(vehicle, 22),

        modFrontWheels = GetVehicleMod(vehicle, 23),
        modBackWheels = GetVehicleMod(vehicle, 24),

        modPlateHolder = GetVehicleMod(vehicle, 25),
        modVanityPlate = GetVehicleMod(vehicle, 26),
        modTrimA = GetVehicleMod(vehicle, 27),
        modOrnaments = GetVehicleMod(vehicle, 28),
        modDashboard = GetVehicleMod(vehicle, 29),
        modDial = GetVehicleMod(vehicle, 30),
        modDoorSpeaker = GetVehicleMod(vehicle, 31),
        modColor = GetVehicleInteriorColor(vehicle),
        modSeats = GetVehicleMod(vehicle, 32),
        modSteeringWheel = GetVehicleMod(vehicle, 33),
        modShifterLeavers = GetVehicleMod(vehicle, 34),
        modAPlate = GetVehicleMod(vehicle, 35),
        modSpeakers = GetVehicleMod(vehicle, 36),
        modTrunk = GetVehicleMod(vehicle, 37),
        modHydrolic = GetVehicleMod(vehicle, 38),
        modEngineBlock = GetVehicleMod(vehicle, 39),
        modAirFilter = GetVehicleMod(vehicle, 40),
        modStruts = GetVehicleMod(vehicle, 41),
        modArchCover = GetVehicleMod(vehicle, 42),
        modAerials = GetVehicleMod(vehicle, 43),
        modTrimB = GetVehicleMod(vehicle, 44),
        modTank = GetVehicleMod(vehicle, 45),
        modWindows = GetVehicleMod(vehicle, 46),
        modDoorR = GetVehicleMod(vehicle, 47),
        modLivery = GetVehicleMod(vehicle, 48),
        modLightbar = GetVehicleMod(vehicle, 49),
        livery = GetVehicleLivery(vehicle),
    }
end
exports('GetVehicleProperties', GetVehicleProperties)

function SetVehicleProperties(vehicle, props)
    if not DoesEntityExist(vehicle) then
        return
    end
    local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
    local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
    SetVehicleModKit(vehicle, 0)

    if props.plate ~= nil then
        SetVehicleNumberPlateText(vehicle, props.plate)
    end
    if props.plateIndex ~= nil then
        SetVehicleNumberPlateTextIndex(vehicle, props.plateIndex)
    end
    if props.bodyHealth ~= nil then
        SetVehicleBodyHealth(vehicle, props.bodyHealth + 0.0)
    end
    if props.engineHealth ~= nil then
        SetVehicleEngineHealth(vehicle, props.engineHealth + 0.0)
    end
    if props.tankHealth ~= nil then
        SetVehiclePetrolTankHealth(vehicle, props.tankHealth + 0.0)
    end
    if props.fuelLevel ~= nil then
        SetVehicleFuelLevel(vehicle, props.fuelLevel + 0.0)
    end
    if props.dirtLevel ~= nil then
        SetVehicleDirtLevel(vehicle, props.dirtLevel + 0.0)
    end
    if props.customPrimaryColor ~= nil then
        SetVehicleCustomPrimaryColour(vehicle, props.customPrimaryColor[1], props.customPrimaryColor[2], props.customPrimaryColor[3])
    else
        ClearVehicleCustomPrimaryColour(vehicle)
    end
    if props.customSecondaryColor ~= nil then
        SetVehicleCustomSecondaryColour(vehicle, props.customSecondaryColor[1], props.customSecondaryColor[2], props.customSecondaryColor[3])
    else
        ClearVehicleCustomSecondaryColour(vehicle)
    end
    if props.color1 ~= nil then
        SetVehicleColours(vehicle, props.color1, colorSecondary)
    end
    if props.color2 ~= nil then
        SetVehicleColours(vehicle, props.color1 or colorPrimary, props.color2)
    end
    if props.pearlescentColor ~= nil then
        SetVehicleExtraColours(vehicle, props.pearlescentColor, wheelColor)
    end
    if props.wheelColor ~= nil then
        SetVehicleExtraColours(vehicle, props.pearlescentColor or pearlescentColor, props.wheelColor)
    end
    if props.wheels ~= nil then
        SetVehicleWheelType(vehicle, props.wheels)
    end
    if props.windowTint ~= nil then
        SetVehicleWindowTint(vehicle, props.windowTint)
    end

    local interiorColor = props.interiorColor or props.modColor
    if interiorColor ~= nil then
        SetVehicleInteriorColor(vehicle, interiorColor)
    end

    if props.neonEnabled ~= nil then
        SetVehicleNeonLightEnabled(vehicle, 0, props.neonEnabled[1])
        SetVehicleNeonLightEnabled(vehicle, 1, props.neonEnabled[2])
        SetVehicleNeonLightEnabled(vehicle, 2, props.neonEnabled[3])
        SetVehicleNeonLightEnabled(vehicle, 3, props.neonEnabled[4])
    end

    if props.extras ~= nil then
        for extraId, enabled in pairs(props.extras) do
            SetVehicleExtra(vehicle, tonumber(extraId), enabled and 0 or 1)
        end
    end

    if props.neonColor ~= nil then
        SetVehicleNeonLightsColour(vehicle, props.neonColor[1], props.neonColor[2], props.neonColor[3])
    end
    if props.xenonColor ~= nil then
        SetVehicleXenonLightsColor(vehicle, props.xenonColor)
    end
    if props.customXenonColor ~= nil then
        SetVehicleXenonLightsCustomColor(vehicle, props.customXenonColor[1], props.customXenonColor[2],
            props.customXenonColor[3])
    end
    if props.modSmokeEnabled ~= nil then
        ToggleVehicleMod(vehicle, 20, true)
    end
    if props.tyreSmokeColor ~= nil then
        SetVehicleTyreSmokeColor(vehicle, props.tyreSmokeColor[1], props.tyreSmokeColor[2], props.tyreSmokeColor[3])
    end
    if props.modSpoilers ~= nil then
        SetVehicleMod(vehicle, 0, props.modSpoilers, false)
    end
    if props.modFrontBumper ~= nil then
        SetVehicleMod(vehicle, 1, props.modFrontBumper, false)
    end
    if props.modRearBumper ~= nil then
        SetVehicleMod(vehicle, 2, props.modRearBumper, false)
    end
    if props.modSideSkirt ~= nil then
        SetVehicleMod(vehicle, 3, props.modSideSkirt, false)
    end
    if props.modExhaust ~= nil then
        SetVehicleMod(vehicle, 4, props.modExhaust, false)
    end
    if props.modFrame ~= nil then
        SetVehicleMod(vehicle, 5, props.modFrame, false)
    end
    if props.modGrille ~= nil then
        SetVehicleMod(vehicle, 6, props.modGrille, false)
    end
    if props.modHood ~= nil then
        SetVehicleMod(vehicle, 7, props.modHood, false)
    end
    if props.modFender ~= nil then
        SetVehicleMod(vehicle, 8, props.modFender, false)
    end
    if props.modRightFender ~= nil then
        SetVehicleMod(vehicle, 9, props.modRightFender, false)
    end
    if props.modRoof ~= nil then
        SetVehicleMod(vehicle, 10, props.modRoof, false)
    end
    if props.modEngine ~= nil then
        SetVehicleMod(vehicle, 11, props.modEngine, false)
    end
    if props.modBrakes ~= nil then
        SetVehicleMod(vehicle, 12, props.modBrakes, false)
    end
    if props.modTransmission ~= nil then
        SetVehicleMod(vehicle, 13, props.modTransmission, false)
    end
    if props.modHorns ~= nil then
        SetVehicleMod(vehicle, 14, props.modHorns, false)
    end
    if props.modSuspension ~= nil then
        SetVehicleMod(vehicle, 15, props.modSuspension, false)
    end
    if props.modArmor ~= nil then
        SetVehicleMod(vehicle, 16, props.modArmor, false)
    end
    if props.modTurbo ~= nil then
        ToggleVehicleMod(vehicle, 18, props.modTurbo)
    end
    if props.modXenon ~= nil then
        ToggleVehicleMod(vehicle, 22, props.modXenon)
    end
    if props.modFrontWheels ~= nil then
        SetVehicleMod(vehicle, 23, props.modFrontWheels, false)
    end
    if props.modBackWheels ~= nil then
        SetVehicleMod(vehicle, 24, props.modBackWheels, false)
    end
    if props.modPlateHolder ~= nil then
        SetVehicleMod(vehicle, 25, props.modPlateHolder, false)
    end
    if props.modVanityPlate ~= nil then
        SetVehicleMod(vehicle, 26, props.modVanityPlate, false)
    end
    if props.modTrimA ~= nil then
        SetVehicleMod(vehicle, 27, props.modTrimA, false)
    end
    if props.modOrnaments ~= nil then
        SetVehicleMod(vehicle, 28, props.modOrnaments, false)
    end
    if props.modDashboard ~= nil then
        SetVehicleMod(vehicle, 29, props.modDashboard, false)
    end
    if props.modDial ~= nil then
        SetVehicleMod(vehicle, 30, props.modDial, false)
    end
    if props.modDoorSpeaker ~= nil then
        SetVehicleMod(vehicle, 31, props.modDoorSpeaker, false)
    end
    if props.modSeats ~= nil then
        SetVehicleMod(vehicle, 32, props.modSeats, false)
    end
    if props.modSteeringWheel ~= nil then
        SetVehicleMod(vehicle, 33, props.modSteeringWheel, false)
    end
    if props.modShifterLeavers ~= nil then
        SetVehicleMod(vehicle, 34, props.modShifterLeavers, false)
    end
    if props.modAPlate ~= nil then
        SetVehicleMod(vehicle, 35, props.modAPlate, false)
    end
    if props.modSpeakers ~= nil then
        SetVehicleMod(vehicle, 36, props.modSpeakers, false)
    end
    if props.modTrunk ~= nil then
        SetVehicleMod(vehicle, 37, props.modTrunk, false)
    end
    if props.modHydrolic ~= nil then
        SetVehicleMod(vehicle, 38, props.modHydrolic, false)
    end
    if props.modEngineBlock ~= nil then
        SetVehicleMod(vehicle, 39, props.modEngineBlock, false)
    end
    if props.modAirFilter ~= nil then
        SetVehicleMod(vehicle, 40, props.modAirFilter, false)
    end
    if props.modStruts ~= nil then
        SetVehicleMod(vehicle, 41, props.modStruts, false)
    end
    if props.modArchCover ~= nil then
        SetVehicleMod(vehicle, 42, props.modArchCover, false)
    end
    if props.modAerials ~= nil then
        SetVehicleMod(vehicle, 43, props.modAerials, false)
    end
    if props.modTrimB ~= nil then
        SetVehicleMod(vehicle, 44, props.modTrimB, false)
    end
    if props.modTank ~= nil then
        SetVehicleMod(vehicle, 45, props.modTank, false)
    end
    if props.modWindows ~= nil then
        SetVehicleMod(vehicle, 46, props.modWindows, false)
    end

    if props.modLivery ~= nil then
        SetVehicleMod(vehicle, 48, props.modLivery, false)
    end
    if props.livery then SetVehicleLivery(vehicle, props.livery) end

    if props.windowsBroken ~= nil then
        for k, v in pairs(props.windowsBroken) do
            if v then
                SmashVehicleWindow(vehicle, tonumber(k))
            end
        end
    end

    if props.doorsBroken ~= nil then
        for k, v in pairs(props.doorsBroken) do
            if v then
                SetVehicleDoorBroken(vehicle, tonumber(k), true)
            end
        end
    end

    if props.tyreBurst ~= nil then
        for k, v in pairs(props.tyreBurst) do
            if v then
                SetVehicleTyreBurst(vehicle, tonumber(k), true, 1000.0)
            end
        end
    end
end
exports('SetVehicleProperties', SetVehicleProperties)

function ShowToolTip(msg, x, y, z, key)
    key = key or 'customshop'
    AddTextEntry(key, msg)
    SetFloatingHelpTextWorldPosition(1, x, y, z)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp(key)
    EndTextCommandDisplayHelp(2, false, false, -1)
end

CreateThread(function()
    local isShowTextUi = false

    while true do
        local sleep = 1500
        local isFound = false
        local playerPed = PlayerPedId()
        
        if IsPedInAnyVehicle(playerPed, false) then
            if Camera then
                sleep = 250
            else
                local playerCoords = GetEntityCoords(playerPed)

                for _, v in ipairs(Config.Locations) do
                    local distance = #(playerCoords - v.Coords)
    
                    if distance < Config.RadiusToDrawMarker then
                        local marker = v.Marker
                        if marker and marker.Show then
                            local radius = v.Radius * 2.0
                            DrawMarker(marker.Type, v.Coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, radius, radius, 2.0, marker.Color, marker.Alpha, false, true, 2, nil, nil, false)
                            sleep = 1
                        elseif distance > v.Radius then
                            sleep = 500
                        end
    
                        if distance < v.Radius then
                            isFound = true
    
                            if not marker or not marker.Show then
                                sleep = 250
                            end
                        end
                    end
                end
            end
        end

        if Config.HelpText.Show then
            if isFound and not isShowTextUi then
                Config.Callback.ShowHelpText(Config.HelpText.OpenCustom.key, Config.HelpText.OpenCustom.description)
                isShowTextUi = true
            elseif not isFound and isShowTextUi then
                Config.Callback.HideHelpText()
                isShowTextUi = false
            end
        end

        Wait(sleep)
    end
end)

CreateThread(function()
    if not Config.ToolTip.Show then return end

    while true do
        local sleep = 1000

        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        local vehicle = GetClosestVehicle(playerCoords, 2.0, 0, 71)

        if vehicle and vehicle ~= 0 then
            local vehicleCoords = GetEntityCoords(vehicle)

            if not Config.OwnedVehiclesOnly or IsOwnedVehicle(Trim(GetVehicleNumberPlateText(vehicle))) then 
                local distance = #(playerCoords - vehicleCoords)
    
                if CurrentItemData.ItemName then
                    if distance < 4 then
                        sleep = 1
        
                        ShowToolTip(('<font face="%s" size="10">%s</font>'):format(Config.Font, Config.ToolTip.ApplyCustom), vehicleCoords.xy, vehicleCoords.z + 1.0, 'carcustoms')
                    end
                end
            end
        else
            for _, shop in ipairs(Config.CustomShopLocations) do
                local distance = #(playerCoords - shop.Coords.xyz)
    
                if distance < 4 then
                    if IsInShop then
                        sleep = 250
                    else
                        sleep = 1
                        ShowToolTip(('<font face="%s" size="10">%s</font>'):format(Config.Font, Config.ToolTip.OpenShop), shop.Coords.xy, shop.Coords.z + 2.0, 'customshop')
                    end
                    
                    break
                end
            end
        end

        Wait(sleep)
    end
end)

CreateThread(function()
    local isShowTextUi = false

    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        local isFound = false

        if vehicle and vehicle ~= 0 then
            sleep = 500
            local playerCoords = GetEntityCoords(playerPed)

            for _, location in ipairs(Config.ColorCustomLocations) do
                local distance = #(playerCoords - location.Coords)
                if distance < Config.RadiusToDrawMarker then
                    local marker = location.Marker
                    if not IsInColorCustom and marker and marker.Show then
                        sleep = 1
                        DrawMarker(marker.Type, location.Coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, location.Radius * 2.0, location.Radius * 2.0, 2.0, marker.Color, marker.Alpha, false, true, 2, nil, nil, false)
                    elseif Config.HelpText.Show then
                        sleep = 250
                    end

                    if distance < location.Radius then
                        isFound = true
                    end
                end
            end
        end

        if Config.HelpText.Show then
            if isShowTextUi and not isFound then
                isShowTextUi = false
                Config.Callback.HideHelpText()
            elseif (not isShowTextUi or not IsInColorCustom) and isFound then
                isShowTextUi = true
                Config.Callback.ShowHelpText(Config.HelpText.OpenColorCustoms.key, Config.HelpText.OpenColorCustoms.description)
            end
        end

        Wait(sleep)
    end
end)

CreateThread(function()
    while true do
        local sleep = 1500

        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        for _, v in ipairs(Config.CustomShopLocations) do
            local marker = v.Marker
            if marker and marker.Show then
                sleep = 500
                local distance = #(playerCoords - v.Coords.xyz)

                if distance <= Config.RadiusToDrawMarker then
                    DrawMarker(marker.Type, v.Coords.xyz, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Radius * 2.0, v.Radius * 2.0, 2.0, marker.Color, marker.Alpha, false, true, 2, nil, nil, false)
                    sleep = 1
                end
            end
        end

        Wait(sleep)
    end
end)

function StartIsControlJustPressed()
    CreateThread(function()
        while true do
            local sleep = 1000
            local playerPed = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(playerPed, false)

            if vehicle and vehicle ~= 0 and not Camera then
                sleep = 1

                if IsControlJustPressed(0, Config.ControlKeys[Config.Keys.OpenCustom]) then
                    OpenCarCustom()
                end

                if IsControlJustPressed(0, Config.ControlKeys[Config.Keys.OpenStancer]) then
                    OpenStancer()
                end

                if IsControlJustPressed(0, Config.ControlKeys[Config.Keys.OpenColorCustoms]) then
                    OpenColorCustoms()
                end
                
            end

            Wait(sleep)
        end
    end)

    CreateThread(function()
        while true do
            local sleep = 1000
            local playerPed = PlayerPedId()

            if CurrentItemData.ItemName then
                sleep = 500
                local vehicle = GetClosestVehicle(GetEntityCoords(playerPed), 2.0, 0, 71)

                if vehicle and vehicle ~= 0 then
                    sleep = 1
    
                    if IsControlJustPressed(0, Config.ControlKeys[Config.Keys.ApplyCustom]) then
                        ApplyCustom()
                    end
                end
            end

            Wait(sleep)
        end
    end)

    CreateThread(function()
        while true do
            local sleep = 1000

            if Camera then
                sleep = 1

                if IsDisabledControlJustPressed(2, Config.ControlKeys[Config.Keys.ToggleNuiFocus]) then
                    ToggleNuiFocus()
                elseif IsDisabledControlJustPressed(2, Config.ControlKeys[Config.Keys.ResetCamera]) then
                    ResetCamera()
                end
            end

            Wait(sleep)
        end
    end)

    CreateThread(function()
        while true do
            local sleep = 1000

            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
        
            for _, v in ipairs(Config.CustomShopLocations) do
                local distance = #(playerCoords - v.Coords.xyz)
        
                if distance <= v.Radius + 1.0 then
                    sleep = 1

                    if IsControlJustPressed(0, Config.ControlKeys[Config.Keys.OpenShop]) then
                        OpenShop()
                    end
        
                    break
                end
            end

            Wait(sleep)
        end
    end)

    CreateThread(function()
        while true do
            local sleep = 1000

            local playerPed = PlayerPedId()
        
            if CurrentItemData.ItemName and not OnApplyCustom then
                sleep = 1
    
                if IsControlJustPressed(0, Config.ControlKeys[Config.Keys.CancelUsedItem]) then
                    CancelUsedItem()
                end
            end

            Wait(sleep)
        end
    end)
end

CreateThread(function()
    Wait(250)

    DecorRegister('suspensionHeight', 1)
    DecorRegister('wheelWidth', 1)
    DecorRegister('wheelSize', 1)
    DecorRegister('wheelsOffset', 1)
    DecorRegister('wheelsYRotation', 1)

    local isShowTextUi = false

    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()
        local isFound = false

        local vehicle = GetVehiclePedIsIn(playerPed, false)

        if vehicle and vehicle ~= 0 then
            sleep = 500
            local playerCoords = GetEntityCoords(playerPed)

            for _, location in ipairs(Config.StancerLocations) do
                local distance = #(playerCoords - location.Coords)
                if distance < Config.RadiusToDrawMarker then
                    local marker = location.Marker
                    if not IsInStancerCustom and marker and marker.Show then
                        sleep = 1
                        DrawMarker(marker.Type, location.Coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, location.Radius * 2.0, location.Radius * 2.0, 2.0, marker.Color, marker.Alpha, false, true, 2, nil, nil, false)
                    elseif Config.HelpText.Show then
                        sleep = 250
                    end

                    if distance < location.Radius then
                        isFound = true
                    end
                end
            end
        end

        if Config.HelpText.Show then
            if isShowTextUi and not isFound then
                isShowTextUi = false
                Config.Callback.HideHelpText()
            elseif (not isShowTextUi or not IsInStancerCustom) and isFound then
                isShowTextUi = true
                Config.Callback.ShowHelpText(Config.HelpText.OpenStancer.key, Config.HelpText.OpenStancer.description)
            end
        end

        Wait(sleep)
    end
end)

CreateThread(function()
    Wait(1000)

    while true do
        local sleep = 1000

        if not IsInStancerCustom then
            if Config.SyncToEveryone then
                local vehicles = GetGamePool('CVehicle')
            
                for _, vehicle in ipairs(StancerVehicles) do
                    if DecorExistOn(vehicle, 'wheelsOffset') then
                        sleep = 30
    
                        SetVehicleStancer(vehicle)
                    end
                end
            else
                local playerPed = PlayerPedId()
                local vehicle = GetVehiclePedIsIn(playerPed, false)
    
                if vehicle and vehicle ~= 0 then
                    sleep = 500

                    if DecorExistOn(vehicle, 'wheelsOffset') then
                        sleep = 10
    
                        SetVehicleStancer(vehicle)
                    end
                end
            end
        end

        Wait(sleep)
    end
end)