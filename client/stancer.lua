--[[
    
    ZOBYETEAM_CARCUSTOMS
    Version : 2.0.4
    Written By : ZOBYETEAM
    This system is copyrighted.
    ( ระบบนี้ได้ทำการจดทะเบียนลิขสิทธิ์เรียบร้อย )

]]

Stancer = {}
StancerVehicles = {}
CacheStancerData = {}
IsInStancerCustom = false

RegisterNetEvent('zobyeteam_carcustoms:sendPlayerStancer', function(stancer)
    Stancer = stancer
end)

CreateThread(function()
    if not Config.AutoApplyStancer then return end

    while true do
        if not IsInStancerCustom and next(Stancer) then
            LoadVehicleStancer()
        end
        Wait(1500)
    end
end)

function LoadVehicleStancer()
    local vehicles = GetGamePool('CVehicle')
    for _, vehicle in ipairs(vehicles) do
        local plate = Trim(GetVehicleNumberPlateText(vehicle))

        local data = Stancer[plate]
        if data then
            DecorSetFloat(vehicle, 'suspensionHeight', data.suspensionHeight + 0.0)
            DecorSetFloat(vehicle, 'wheelsOffset', data.wheelsOffset + 0.0)
            DecorSetFloat(vehicle, 'wheelsYRotation', data.wheelsYRotation + 0.0)
            DecorSetFloat(vehicle, 'wheelWidth', data.wheelWidth + 0.0)
            DecorSetFloat(vehicle, 'wheelSize', data.wheelSize + 0.0)
        end
    end
end
exports('LoadVehicleStancer', LoadVehicleStancer)

CreateThread(function()
    Wait(500)

    if not Config.SyncToEveryone then return end

    while true do
        local vehicles = GetGamePool('CVehicle')
        StancerVehicles = {}
        for _, vehicle in ipairs(vehicles) do
            if DecorExistOn(vehicle, 'wheelsOffset') then
                StancerVehicles[#StancerVehicles + 1] = vehicle
            end
        end
        Wait(1500)
    end
end)

function GetVehicleStancerRange(vehicle)
    local vehicleModel = GetEntityModel(vehicle)

    for _, v in ipairs(Config.StancerRanges) do
        if vehicleModel == GetHashKey(v.Model) then
            return v.Ranges
        end
    end

    return Config.DefaultStancerRanges
end

function LoadStancerData(vehicle)
    local stancerRange = GetVehicleStancerRange(vehicle)

    local suspensionHeight = Round(GetVehicleSuspensionHeight(vehicle), 2)
    local wheelWidth = Round(GetVehicleWheelWidth(vehicle), 2)
    local wheelSize = Round(GetVehicleWheelSize(vehicle), 2)
    local wheelsOffset = Round(GetVehicleWheelXOffset(vehicle, 1), 2)
    local wheelsYRotation = Round(GetVehicleWheelYRotation(vehicle, 1), 2)

    if GetVehicleMod(vehicle, 23) == -1 then
        wheelSize = Config.DefaultStancerRanges.WheelSize[1] or 0
        wheelWidth = Config.DefaultStancerRanges.WheelWidth[1] or 0
    end

    CacheStancerData = {
        suspensionHeight = -suspensionHeight,
        wheelWidth = wheelWidth,
        wheelSize = wheelSize,
        wheelsOffset = wheelsOffset,
        wheelsYRotation = wheelsYRotation,
    }

    SendNUIMessage({
        action = 'loadData',
        type = 'stancer',
        stancer = CacheStancerData,
        stancerRange = stancerRange,
        price = Config.StancerPrice,
        accounts = {
            money = exports['zobyeteam_wrapper']:GetPlayerAccount('money'),
            bank = exports['zobyeteam_wrapper']:GetPlayerAccount('bank')
        }
    })
end

function SetVehicleStancer(vehicle)
    local suspensionHeight = DecorGetFloat(vehicle, 'suspensionHeight')
    local wheelWidth = DecorGetFloat(vehicle, 'wheelWidth')
    local wheelSize = DecorGetFloat(vehicle, 'wheelSize')
    local wheelsOffset = DecorGetFloat(vehicle, 'wheelsOffset')
    local wheelsYRotation = DecorGetFloat(vehicle, 'wheelsYRotation')

    for wheelIndex = 0, 3 do
        local isLeft = (wheelIndex == 0 or wheelIndex == 2)
        SetVehicleWheelXOffset(vehicle, wheelIndex, (isLeft and -wheelsOffset or wheelsOffset) + 0.0)
        SetVehicleWheelYRotation(vehicle, wheelIndex, (isLeft and -wheelsYRotation or wheelsYRotation) + 0.0)
    end

    SetVehicleSuspensionHeight(vehicle, -suspensionHeight + 0.0)
    SetVehicleWheelWidth(vehicle, wheelWidth + 0.0)
    SetVehicleWheelSize(vehicle, wheelSize + 0.0)
end

RegisterNUICallback('purchaseStancer', function(data)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if not vehicle or vehicle == 0 then return end

    if exports['zobyeteam_wrapper']:GetPlayerAccount('money') < Config.StancerPrice then
        return Config.Callback.Notify('not_enough_money')
    end

    local plate = Trim(GetVehicleNumberPlateText(vehicle))
    if not plate then return end
    TriggerServerEvent('zobyeteam_carcustoms:purchaseStancer', plate, data)
    UpdateStancerData(data, vehicle)
    LoadStancerData(vehicle)

    CloseDisplay({route = 'stancer'})

    Stancer[plate] = data
end)

function ResetStancer()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if not vehicle or vehicle == 0 then return end

    if not next(CacheStancerData) then return end

    UpdateStancerData(CacheStancerData, vehicle)
    CacheStancerData = {}

    LoadStancerData(vehicle)
end
RegisterNUICallback('resetStancer', ResetStancer)

function UpdateStancerData(data, vehicle)
    local playerPed = PlayerPedId()

    local vehicle = vehicle or GetVehiclePedIsIn(playerPed, false)
    if not vehicle or vehicle == 0 then return end

    if data.suspensionHeight then
        SetVehicleSuspensionHeight(vehicle, -data.suspensionHeight + 0.0)

        DecorSetFloat(vehicle, 'suspensionHeight', data.suspensionHeight)
    end

    if data.wheelsOffset then
        for wheelIndex = 0, 3 do
            SetVehicleWheelXOffset(vehicle, wheelIndex, ((wheelIndex == 0 or wheelIndex == 2) and -data.wheelsOffset or data.wheelsOffset) + 0.0)
        end

        DecorSetFloat(vehicle, 'wheelsOffset', data.wheelsOffset)
    end

    if data.wheelsYRotation then
        for wheelIndex = 0, 3 do
            SetVehicleWheelYRotation(vehicle, wheelIndex, ((wheelIndex == 0 or wheelIndex == 2) and -data.wheelsYRotation or data.wheelsYRotation) + 0.0)
        end

        DecorSetFloat(vehicle, 'wheelsYRotation', data.wheelsYRotation)
    end

    if GetVehicleMod(vehicle, 23) == -1 then return end
    if data.wheelWidth then
        SetVehicleWheelWidth(vehicle, data.wheelWidth + 0.0)

        DecorSetFloat(vehicle, 'wheelWidth', data.wheelWidth)
    end

    if data.wheelSize then
        SetVehicleWheelSize(vehicle, data.wheelSize + 0.0)

        DecorSetFloat(vehicle, 'wheelSize', data.wheelSize)
    end
end
RegisterNUICallback('updateStancerData', function(data)
    UpdateStancerData(data)
end)