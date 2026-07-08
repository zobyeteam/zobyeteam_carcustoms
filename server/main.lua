--[[
    
    ZOBYETEAM_CARCUSTOMS
    Version : 2.0.4
    Written By : ZOBYETEAM

]]

function PlayerLoaded(playerId)
    Config.Callback.LoadPlayerStancer(playerId)
end

Stancers = {}
OpeningCarCustoms = {}

ZBT = exports['zobyeteam_wrapper']:GetLib()

RegisterCommand('carcustoms', function(playerId)
    if not playerId then return end
    TriggerClientEvent('zobyeteam_carcustoms:openMenu', playerId)
end, true)

CreateThread(function()
    Wait(500)

    for index, item in ipairs(Config.Items) do
        exports['zobyeteam_wrapper']:RegisterUsableItem(item.ItemName, function(playerId)
            TriggerClientEvent('zobyeteam_carcustoms:usedItem', playerId, index)
        end)
    end

    local playersId = exports['zobyeteam_wrapper']:GetPlayers()
    for _, playerId in ipairs(playersId) do
        Config.Callback.LoadPlayerStancer(playerId)
    end
end)

RegisterNetEvent('zobyeteam_carcustoms:openCarCustoms', function(vehicle)
    if not vehicle or vehicle == 0 then return Debug('Can not get vehicle') end

    OpeningCarCustoms[source] = vehicle
end)

RegisterNetEvent('zobyeteam_carcustoms:closeCarCustoms', function()
    OpeningCarCustoms[source] = nil
end)

RegisterNetEvent('playerDropped', function()
    local playerId = source

    if not OpeningCarCustoms[playerId] then return end

    DeleteEntity(NetworkGetEntityFromNetworkId(OpeningCarCustoms[playerId]))
    OpeningCarCustoms[playerId] = nil
end)

RegisterNetEvent('zobyeteam_carcustoms:purchaseMod', function(price, payType, plate, customizing, isInColorCustom)
    if not price or price < 0 then return end

    local playerId = source
    local Player = exports['zobyeteam_wrapper']:GetPlayer(playerId)
    if not Player then return end

    if Player.GetAccount(payType or 'money') < price then 
        return Config.Callback.ErrorNotify(playerId, 'not_enough_money')
    end

    local playerJob = Player.GetJob().name
        
    local basePrice = price
    local discount = Config.JobDiscounts[playerJob]

    price = discount and Round(basePrice * ((100 - discount) / 100)) or price
    price = payType == 'bank' and price + Round((basePrice * Config.BankCharge / 100)) or price

    if price > 0 then 
        Player.RemoveMoney(payType, price)
    end

    if isInColorCustom then
        Config.Callback.PurchasedColorCustoms(playerId, price, payType, plate, customizing)
    else
        Config.Callback.PurchasedMod(playerId, price, payType, plate, customizing)
    end
end)

RegisterNetEvent('zobyeteam_carcustoms:purchaseItem', function(itemName, price)
    if not (itemName and price) then return end

    local playerId = source
    local Player = exports['zobyeteam_wrapper']:GetPlayer(playerId)
    if not Player then return end

    if Player.GetAccount('money') < price then
        return Config.Callback.ErrorNotify(playerId, 'not_enough_money')
    end

    Player.AddItem(itemName, 1)

    if price > 0 then 
        Player.RemoveMoney('money', price)
    end

    Config.Callback.PurchasedItem(playerId, itemName, price)
end)

RegisterNetEvent('zobyeteam_carcustoms:applyItemCustoms', function(itemName)
    if not itemName then return end

    local playerId = source

    local Player = exports['zobyeteam_wrapper']:GetPlayer(playerId)
    if not Player then return end

    Player.RemoveItem(itemName, 1)

    Config.Callback.AppliedItemCustoms(playerId, itemName)
end)

RegisterNetEvent('zobyeteam_carcustoms:purchaseStancer', function(plate, stancer)
    local playerId = source
    local Player = exports['zobyeteam_wrapper']:GetPlayer(playerId)
    if not Player then return end

    if Player.GetAccount('money') < Config.StancerPrice then
        return Config.Callback.ErrorNotify(playerId, 'not_enough_money')
    end

    local affectedRows = MySQL.update.await('UPDATE owned_vehicles SET stancer = ? WHERE plate = ?', { json.encode(stancer), plate })
    if not affectedRows then return end

    if Config.StancerPrice > 0 then
        Player.RemoveMoney('money', Config.StancerPrice)
    end

    local identifier = Player.GetIdentifier()
    Stancers[identifier] = Stancers[identifier] or {}
    Stancers[identifier][#Stancers[identifier] + 1] = stancer

    Config.Callback.PurchasedStancer(playerId, Config.StancerPrice, plate, stancer)
end)

RegisterNetEvent('zobyeteam_carcustoms:purchaseColorCustom', function()
    local playerId = source
    local Player = exports['zobyeteam_wrapper']:GetPlayer(playerId)
    if not Player then return end

    if Player.GetAccount('money') < Config.ColorCustomPrice then
        return Config.Callback.ErrorNotify(playerId, 'not_enough_money')
    end

    if Config.ColorCustomPrice > 0 then
        Player.RemoveMoney('money', Config.ColorCustomPrice)
    end

    Config.Callback.PurchasedColorCustoms(playerId, Config.ColorCustomPrice)
end)

RegisterNetEvent('zobyeteam_carcustoms:startSprayFx', function(vehicleCoords, locationIndex, colorList)
    local playerId = source

    TriggerClientEvent('zobyeteam_carcustoms:startSprayFx', -1, playerId, vehicleCoords, locationIndex, colorList)
end)

RegisterNetEvent('zobyeteam_carcustoms:isOwnedVehicle', function(plate)
    local playerId = source
    local isOwnedVehicle = Config.Callback.QueryVehicle(playerId, plate) and true or false

    TriggerClientEvent('zobyeteam_carcustoms:sendIsOwnedVehicle', playerId, isOwnedVehicle)
end)

ZBT.Callback.Register('zobyeteam_carcustoms:isOwnedVehicle', function(playerId, plate)
    local isOwnedVehicle = Config.Callback.QueryVehicle(playerId, plate) and true or false

    return isOwnedVehicle 
end)

RegisterNetEvent('zobyeteam_carcustoms:saveProps', function(vehicleProps)
    local playerId = source
    local Player = exports['zobyeteam_wrapper']:GetPlayer(playerId)
    if not Player then return end

    local affectedRows = MySQL.update.await('UPDATE owned_vehicles SET vehicle = ? WHERE plate = ?', { json.encode(vehicleProps), vehicleProps.plate })
    if not affectedRows then return end

    Config.Callback.SavedProps(playerId, vehicleProps)
end)

function Round(x)
    return math.floor(x + 0.5)
end

function Debug(text, color, ...)
    color = color or '^2'
    print(string.format("%s[ZBT:CARCUSTOMS] %s ^0", color, text), ...)
end

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