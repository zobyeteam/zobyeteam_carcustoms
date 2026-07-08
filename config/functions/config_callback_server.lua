Config = Config or {}

Config.Callback = {}

Config.Callback.PurchasedMod = function(playerId, price, payType, plate, customizedList)
    -- local xPlayer = ESX.GetPlayerFromId(playerId)

    -- local sendToDiscord = ('%s ได้แต่งรถประเภท %s ทะเบียน %s ในราคา %s ชำระโดย %s'):format(xPlayer.name, modName, plate, price, payType)
    -- TriggerEvent('azael_discordlogs:sendToDiscord', 'carcustoms', sendToDiscord, playerId)

    -- exports['azael_dc-serverlogs']:insertData({
    --     event = 'carcustoms',
    --     content = ('%s ได้แต่งรถประเภท %s ทะเบียน %s ในราคา %s ชำระโดย %s'):format(xPlayer.name, modName, plate, price, payType),
    --     source = playerId,
    --     coords = GetEntityCoords(GetPlayerPed(playerId)),
    --     color = 7,
    --     options = {
    --         public = false,
    --         important = false,
    --         codeblock = true
    --     }
    -- })
end

Config.Callback.PurchasedColorCustoms = function(playerId, price, payType, plate, customizedList)
    
end

Config.Callback.PurchasedStancer = function(playerId, price, plate, stancer)

end

Config.Callback.PurchasedItem = function(playerId, itemName, price)

end

Config.Callback.AppliedItemCustoms = function(playerId, itemName)

end

Config.Callback.LoadPlayerStancer = function(playerId)
    local Player = exports['zobyeteam_wrapper']:GetPlayer(playerId)
    local identifier = Player.GetIdentifier()

    local response = MySQL.query.await('SELECT stancer, plate FROM owned_vehicles WHERE owner = ? AND stancer IS NOT NULL', { identifier })
    if not response or not next(response) then return end

    local stancer = {}
    for _, row in ipairs(response) do
        stancer[row.plate] = json.decode(row.stancer)
    end

    Stancers = Stancers or {}
    Stancers[identifier] = stancer

    TriggerClientEvent('zobyeteam_carcustoms:sendPlayerStancer', playerId, stancer)
end

Config.Callback.QueryVehicle = function(playerId, plate)
    local Player = exports['zobyeteam_wrapper']:GetPlayer(playerId)
    local identifier = Player.GetIdentifier()

    local row = MySQL.single.await('SELECT `vehicle` FROM `owned_vehicles` WHERE `owner` = ? AND `plate` = ? LIMIT 1', { identifier, plate })
    return row
end

-- This function will call when use event : zobyeteam_carcustoms:saveProps
Config.Callback.SavedProps = function(playerId, vehicleProps)
    pcall(function() exports.nc_garage:UpdateProperties(vehicleProps.plate, vehicleProps, true) print('SAVED') end)
end

--[[
    List Type
    - not_enough_money
]]

Config.Callback.ErrorNotify = function(playerId, type)

end

RegisterNetEvent('esx:playerLoaded', function(playerId)
    PlayerLoaded(playerId)
end)
