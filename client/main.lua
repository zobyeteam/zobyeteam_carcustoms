--[[
    
    ZOBYETEAM_CARCUSTOMS
    Version : 2.0.4
    Written By : ZOBYETEAM

]]

VehicleProperties = {}
TempModIndex = nil

Camera = nil
ZRotation = 0
YRotation = 20
Radius = 3.0
RaiseCarProp = nil

IsInShop = false
OnApplyCustom = false

CurrentItemData = {}
Customizing = {}

local colorsData <const> = {
    {13, 17, 22}, {28, 29, 33}, {50, 56, 61}, {69, 75, 79}, {153, 157, 160}, {194, 196, 198}, {151, 154, 151}, {99, 115, 128}, {99, 98, 92}, {60, 63, 71}, {68, 78, 84}, {29, 33, 41}, {19, 24, 31}, {38, 40, 42}, {81, 85, 84}, {21, 25, 33},
    {30, 36, 41}, {51, 58, 60}, {140, 144, 149}, {57, 67, 77}, {80, 98, 114}, {30, 35, 47}, {54, 58, 63}, {160, 161, 153}, {211, 211, 211}, {183, 191, 202}, {119, 135, 148}, {192, 14, 26}, {218, 25, 24}, {182, 17, 27}, {165, 30, 35}, {123, 26, 34},
    {142, 27, 31}, {111, 24, 24}, {73, 17, 29}, {182, 15, 37}, {212, 74, 23}, {194, 148, 79}, {247, 134, 22}, {207, 31, 33}, {115, 32, 33}, {242, 125, 32}, {255, 201, 31}, {156, 16, 22}, {222, 15, 24}, {143, 30, 23}, {169, 71, 68}, {177, 108, 81},
    {55, 28, 37}, {19, 36, 40}, {18, 46, 43}, {18, 56, 60}, {49, 66, 63}, {21, 92, 45}, {27, 103, 112}, {102, 184, 31}, {34, 56, 62}, {29, 90, 63}, {45, 66, 63}, {69, 89, 75}, {101, 134, 127}, {34, 46, 70}, {35, 49, 85}, {48, 76, 126},
    {71, 87, 143}, {99, 123, 167}, {57, 71, 98}, {214, 231, 241}, {118, 175, 190}, {52, 94, 114}, {11, 156, 241}, {47, 45, 82}, {40, 44, 77}, {35, 84, 161}, {110, 163, 198}, {17, 37, 82}, {27, 32, 62}, {39, 81, 144}, {96, 133, 146}, {36, 70, 168},
    {66, 113, 225}, {59, 57, 224}, {31, 40, 82}, {37, 58, 167}, {28, 53, 81}, {76, 95, 129}, {88, 104, 142}, {116, 181, 216}, {255, 207, 32}, {251, 226, 18}, {145, 101, 50}, {224, 225, 61}, {152, 210, 35}, {155, 140, 120}, {80, 50, 24}, {71, 63, 43},
    {34, 27, 25}, {101, 63, 35}, {119, 92, 62}, {172, 153, 117}, {108, 107, 75}, {64, 46, 43}, {164, 150, 95}, {70, 35, 26}, {117, 43, 25}, {191, 174, 123}, {223, 213, 178}, {247, 237, 213}, {58, 42, 27}, {120, 95, 51}, {181, 160, 121}, {255, 255, 246},
    {234, 234, 234}, {176, 171, 148}, {69, 56, 49}, {42, 40, 43}, {114, 108, 87}, {106, 116, 124}, {53, 65, 88}, {155, 160, 168}, {88, 112, 161}, {234, 230, 222}, {223, 221, 208}, {242, 173, 46}, {249, 164, 88}, {131, 197, 102}, {241, 204, 64}, {76, 195, 218},
    {78, 100, 67}, {188, 172, 143}, {248, 182, 88}, {252, 249, 241}, {255, 255, 251}, {129, 132, 76}, {255, 255, 255}, {242, 31, 153}, {253, 214, 205}, {223, 88, 145}, {246, 174, 32}, {176, 238, 110}, {8, 233, 250}, {10, 12, 23}, {12, 13, 24}, {14, 13, 20},
    {159, 158, 138}, {98, 18, 118}, {11, 20, 33}, {17, 20, 26}, {107, 31, 123}, {30, 29, 34}, {188, 25, 23}, {45, 54, 42}, {105, 103, 72}, {122, 108, 85}, {195, 180, 146}, {90, 99, 82}, {129, 130, 127}, {175, 214, 228}, {122, 100, 64}, {127, 106, 72}
};

PedList = {}

CreateThread(function()
    for _, v in ipairs(Config.Locations) do
        if v.Blip then
            local blip = AddBlipForCoord(v.Coords)
            SetBlipSprite(blip, v.Blip.Sprite)
            SetBlipScale(blip, v.Blip.Scale)
            SetBlipAsShortRange(blip, true)
            SetBlipColour(blip, v.Blip.Color)
    
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(v.Blip.Text)
            EndTextCommandSetBlipName(blip)
        end
    end

    for _, v in ipairs(Config.CustomShopLocations) do
        if v.Blip then
            local blip = AddBlipForCoord(v.Coords)
            SetBlipSprite(blip, v.Blip.Sprite)
            SetBlipScale(blip, v.Blip.Scale)
            SetBlipAsShortRange(blip, true)
            SetBlipColour(blip, v.Blip.Color)
    
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(v.Blip.Text)
            EndTextCommandSetBlipName(blip)
        end
    end

    for _, v in ipairs(Config.StancerLocations) do
        if v.Blip then
            local blip = AddBlipForCoord(v.Coords)
            SetBlipSprite(blip, v.Blip.Sprite)
            SetBlipScale(blip, v.Blip.Scale)
            SetBlipAsShortRange(blip, true)
            SetBlipColour(blip, v.Blip.Color)
    
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(v.Blip.Text)
            EndTextCommandSetBlipName(blip)
        end
    end

    for _, v in ipairs(Config.ColorCustomLocations) do
        if v.Blip then
            local blip = AddBlipForCoord(v.Coords)
            SetBlipSprite(blip, v.Blip.Sprite)
            SetBlipScale(blip, v.Blip.Scale)
            SetBlipAsShortRange(blip, true)
            SetBlipColour(blip, v.Blip.Color)
    
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(v.Blip.Text)
            EndTextCommandSetBlipName(blip)
        end
    end

    for _, v in ipairs(Config.CustomShopLocations) do
        if v.PedModel then
            local modelHash = GetHashKey(v.PedModel)
            LoadModel(modelHash)
    
            local ped = CreatePed(4, modelHash, v.Coords, false, false)
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
    
            PedList[#PedList + 1] = ped
        end
    end

    Wait(200)
    local parentName, ownName, children = FindOption(Config.Menus, 'Extras')
    if not children then return end

    children.Options = {}
    for i = 0, 25, 1 do
        children.Options[i + 1] = {
            Name = 'Extra' .. i,
            ModType = 'extraMod_' .. i,
            PriceMultiplier = children.PriceMultiplier
        }
    end
end)

function IsOwnedVehicle(plate)
    return ZBT.Callback.Await('zobyeteam_carcustoms:isOwnedVehicle', false, plate)
end

function OpenCarCustom(isForceOpen)
    if Camera then return end

    local playerPed = PlayerPedId()

    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if not vehicle or vehicle == 0 then return end

    -- TZB COMMENT 1 : Why == true, need check and return 

    if isForceOpen then
        OpenMenu()
        return
    end


    local plate = Trim(GetVehicleNumberPlateText(vehicle))

    if Config.OwnedVehiclesOnly then
        if Config.UseIsOwnedVehicleCallback then
            if not Config.Callback.IsOwnedVehicle(plate) then
                return Config.Callback.Notify('not_owned_vehicle')
            end
        else
            if not IsOwnedVehicle(plate) then
                return Config.Callback.Notify('not_owned_vehicle')
            end
        end
    end

    local vehicleModel = GetEntityModel(vehicle)
    local playerCoords = GetEntityCoords(playerPed)

    for _, vehicleData in ipairs(Config.Vehicles) do
        if Config.CanCustomAllVehicle or vehicleModel == GetHashKey(vehicleData.Name) then
            for _, v in ipairs(Config.Locations) do
                local distance = #(playerCoords - v.Coords)
    
                if distance < v.Radius then
                    local playerJob = exports['zobyeteam_wrapper']:GetPlayerJob().name

                    if v.Job and playerJob ~= v.Job then 
                        return Config.Callback.Notify('your_job_not_validated')
                    end

                    OpenMenu()

                    break
                end
            end
            
            break
        end
    end
end
exports('OpenCarCustom', OpenCarCustom)

function ToggleNuiFocus()
    if not Camera then return end

    local isFocus = not IsNuiFocused()

    SetCamActive(Camera, isFocus)
    RenderScriptCams(isFocus, true, 500, true, true)
    SetNuiFocus(isFocus, isFocus)
end
exports('ToggleNuiFocus', ToggleNuiFocus)

function OpenShop()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    for _, v in ipairs(Config.CustomShopLocations) do
        local distance = #(playerCoords - v.Coords.xyz)

        if distance <= v.Radius then
            FreezeEntityPosition(playerPed, true)
            LoadShopData()
            OpenDisplay('customShop')
            IsInShop = true

            break
        end
    end
end
exports('OpenShop', OpenShop)

function ApplyCustom()
    if OnApplyCustom then return end

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    local vehicle = GetClosestVehicle(playerCoords, 2.0, 0, 71)
    if not vehicle or vehicle == 0 then return end

    local plate = Trim(GetVehicleNumberPlateText(vehicle))

    if Config.OwnedVehiclesOnly then
        if Config.UseIsOwnedVehicleCallback then
            if not Config.Callback.IsOwnedVehicle(plate) then
                return Config.Callback.Notify('not_owned_vehicle')
            end
        else
            if not IsOwnedVehicle(plate) then
                return Config.Callback.Notify('not_owned_vehicle')
            end
        end
    end

    SetVehicleModKit(vehicle, 0)
    if CurrentItemData.ItemName then
        if Config.HelpText.Show then
            Config.Callback.HideHelpText()
        end

        TriggerServerEvent('zobyeteam_carcustoms:applyItemCustoms', CurrentItemData.ItemName)

        FreezeEntityPosition(vehicle, true)
        DeleteObject(CurrentItemData.Entity)

        ClearPedTasks(playerPed)
        
        playerCoords = GetEntityCoords(playerPed)

        if CurrentItemData.ModType == 'colorPrimary' or CurrentItemData.ModType == 'colorSecondary' or CurrentItemData.ModType == 'wheelColor' or CurrentItemData.ModType == 'interiorColor' or CurrentItemData.ModType == 'PearlescentColor' or CurrentItemData.ModType == 'modXenon' or CurrentItemData.ModType == 'neonColor' or CurrentItemData.ModType == 'tyreSmokeColor' then
            local currentColor = GetCurrentCustomColor(vehicle, CurrentItemData.ModType)
            if not currentColor then
                return Config.Callback.Notify('script_error')
            end

            SendNUIMessage({
                action = 'loadData',
                type = 'customColor',
                color = currentColor,
                modType = CurrentItemData.ModType
            })
            OpenDisplay('customColor')
        else
            OnApplyCustom = true
            local animDict = 'anim@amb@business@coc@coc_unpack_cut_left@'
            local animName = 'cut_cough_coccutter'

            if CurrentItemData.ModType == 11 or CurrentItemData.ModType == 12 or CurrentItemData.ModType == 13 or CurrentItemData.ModType == 15 or CurrentItemData.ModType == 16 or CurrentItemData.ModType == 18 or CurrentItemData.ModType == 23 then
                RaiseCar(vehicle, playerPed)

                local offset = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, -2.0, 0.0)
                TaskPedSlideToCoord(playerPed, offset, GetEntityHeading(playerPed), 1000)

                RequestAnimDict("move_crawl")
                while not HasAnimDictLoaded("move_crawl") do
                    Wait(0)
                end

                local vehicleCoords = GetEntityCoords(vehicle)
                local diff = playerCoords - vehicleCoords
                local heading = GetHeadingFromVector_2d(diff.xy)
        
                playerCoords = GetEntityCoords(playerPed)
        
                TaskPlayAnimAdvanced(playerPed, "move_crawl", "onback_bwd", playerCoords, 0.0, 0.0, heading, 1.0, 0.5, 3000, 1, 0.0, 1, 1)

                Wait(3000)

                animDict = 'amb@world_human_vehicle_mechanic@male@base'
                animName = 'base'
            end

            FreezeEntityPosition(playerPed, true)

            if Config.Callback.UseCustomProgbar then
                CreateThread(function()
                    Config.Callback.Progbar('carcustoms', 'กำลังแต่ง', Config.CustomizeDuration)
                end)
            end

            local isFinished = exports['zobyeteam_progbar']:play({
                disableInterface = Config.Callback.UseCustomProgbar,
                name = 'carcustoms',
                label = 'กำลังแต่ง',
                duration = Config.CustomizeDuration or 10000,
                useWhileDead = false,
                cancelable = false,
                controlDisables = {
                    movement = true,
                    vehicle = true,
                    mouse = false,
                    combat = true,
                },
                animation = {
                    dict = animDict,
                    anim = animName,
                    flags = 1,
                },
            })

            if not isFinished then return end

            FreezeEntityPosition(playerPed, false)

            if CurrentItemData.ModType == 11 or CurrentItemData.ModType == 12 or CurrentItemData.ModType == 13 or CurrentItemData.ModType == 15 or CurrentItemData.ModType == 16 or CurrentItemData.ModType == 18 or CurrentItemData.ModType == 23 then
                local offset = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 2.0, 0.0)
                TaskPedSlideToCoord(playerPed, offset, GetEntityHeading(playerPed), 1000)
        
                RequestAnimDict("move_crawl")
                while not HasAnimDictLoaded("move_crawl") do
                    Wait(0)
                end

                local vehicleCoords = GetEntityCoords(vehicle)
                local diff = playerCoords - vehicleCoords
                local heading = GetHeadingFromVector_2d(diff.xy)

                playerCoords = GetEntityCoords(playerPed)
                TaskPlayAnimAdvanced(playerPed, "move_crawl", "onback_fwd", playerCoords, 0.0, 0.0, heading, 1.0, 0.5, 2000, 1, 0.0, 1, 1)
            end

            SetMod(vehicle, CurrentItemData.ModType, CurrentItemData.ModData, { wheelType = CurrentItemData.WheelType })
            CurrentItemData = {}

            OnApplyCustom = false
        end

        FreezeEntityPosition(playerPed, false)

        Wait(3000)
        FreezeEntityPosition(vehicle, false)
        DeleteObject(RaiseCarProp)
        
        RaiseCarProp = nil

        if not Config.AutoSaveProps then return end
        SaveProps(vehicle)
    end
end

function CancelUsedItem()
    if OnApplyCustom then return end
    if not CurrentItemData.ItemName then return end

    local playerPed = PlayerPedId()

    DeleteObject(CurrentItemData.Entity)
    ClearPedTasks(playerPed)

    CurrentItemData = {}

    if Config.HelpText.Show then
        Config.Callback.HideHelpText()
    end
end
exports('CancelUsedItem', CancelUsedItem)

function ResetCamera()
    SendNUIMessage({
        action = 'resetCamera'
    })
end
exports('ResetCamera', ResetCamera)

function OpenStancer()
    if Camera then return end

    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if not vehicle or vehicle == 0 then return end

    local playerCoords = GetEntityCoords(playerPed)

    for _, location in ipairs(Config.StancerLocations) do
        local distance = #(playerCoords - location.Coords)

        if distance < location.Radius then
            LoadStancerData(vehicle)
            OpenDisplay('stancer')

            FreezeEntityPosition(vehicle, true)
            TriggerServerEvent('zobyeteam_carcustoms:openCarCustoms', ObjToNet(vehicle))

            StartCameraView(vehicle)
            
            Wait(150)
            Config.Callback.HideHelpText()
            IsInStancerCustom = true

            break
        end
    end
end
exports('OpenStancer', OpenStancer)

function OpenColorCustoms()
    if Camera then return end

    local playerPed = PlayerPedId()

    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if not vehicle or vehicle == 0 then return end

    local playerCoords = GetEntityCoords(playerPed)
    local vehicleCoords = GetEntityCoords(vehicle)

    for _, location in ipairs(Config.ColorCustomLocations) do
        local distance = #(playerCoords - vehicleCoords)
        local vehicleDistance = #(vehicleCoords - location.Coords)

        if distance < 5 and vehicleDistance < location.Radius then
            IsInColorCustom = true
            
            FreezeEntityPosition(vehicle, true)
            VehicleProperties = GetVehicleProperties(vehicle)
            LoadData()
            OpenDisplay('custom')
            TriggerServerEvent('zobyeteam_carcustoms:openCarCustoms', ObjToNet(vehicle))

            Config.Callback.HideHelpText()

            StartCameraView(vehicle)

            break
        end
    end
end
exports('OpenColorCustoms', OpenColorCustoms)

if Config.UseIsControlJustPressed then
    StartIsControlJustPressed()
else
    RegisterCommand('openCarCustom', function() OpenCarCustom() end, false)
    RegisterKeyMapping('openCarCustom', 'Open Car Custom', 'keyboard', Config.Keys.OpenCustom)

    RegisterCommand('toggleNuiFocus', ToggleNuiFocus, false)
    RegisterKeyMapping('toggleNuiFocus', 'Toggle Nui Focus', 'keyboard', Config.Keys.ToggleNuiFocus)

    RegisterCommand('openShop', OpenShop, false)
    RegisterKeyMapping('openShop', 'Open Shop', 'keyboard', Config.Keys.OpenShop)

    RegisterCommand('applyCustom', ApplyCustom, false)
    RegisterKeyMapping('applyCustom', 'Apply Custom', 'keyboard', Config.Keys.ApplyCustom)    

    RegisterCommand('cancelUsedItem', CancelUsedItem, false)
    RegisterKeyMapping('cancelUsedItem', 'Cancel Used Item', 'keyboard', Config.Keys.CancelUsedItem)

    RegisterCommand('resetCamera', ResetCamera, false)
    RegisterKeyMapping('resetCamera', 'Cancel Used Item', 'keyboard', Config.Keys.ResetCamera)

    RegisterCommand('openStancer', OpenStancer, false)
    RegisterKeyMapping('openStancer', 'Open Stancer', 'keyboard', Config.Keys.OpenStancer)
    
    RegisterCommand('openColorCustoms', OpenColorCustoms, false)
    RegisterKeyMapping('openColorCustoms', 'Open Color Custom', 'keyboard', Config.Keys.OpenColorCustoms)
end

RegisterNetEvent('zobyeteam_carcustoms:usedItem', function(itemIndex)
    if OnApplyCustom then return end

    local item = Config.Items[itemIndex]
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    if IsPedInAnyVehicle(playerPed, true) then return end

    if not item then return end

    if Config.HelpText.Show then
        Config.Callback.ShowHelpText(Config.HelpText.CancelUsedItem.key, Config.HelpText.CancelUsedItem.description)
    end
    
    if CurrentItemData.ItemName and CurrentItemData.ItemName == item.ItemName then return end

    if CurrentItemData.ItemName then -- use item that not the same as CurrentItemData.ItemName
        DeleteObject(CurrentItemData.Entity)
        ClearPedTasks(playerPed)
    end

    if item.ModType == 'colorPrimary' or item.ModType == 'colorSecondary' or item.ModType == 'wheelColor' or item.ModType == 'interiorColor' or item.ModType == 'pearlescentColor' or item.ModType == 'modXenon' or item.ModType == 'neonColor' or item.ModType == 'tyreSmokeColor' then
        CurrentItemData = item
        if item.Prop and item.Prop.Model then
            local boneIndex = GetPedBoneIndex(playerPed, 58868)
            LoadModel(item.Prop.Model)
            local prop = CreateObject(GetHashKey(item.Prop.Model), playerCoords, true, true, true)
        
            AttachEntityToEntity(prop, playerPed, boneIndex, item.Prop.Coords or vector3(0.0, 0.0, 0.0), item.Prop.Rotation or vector3(0.0, 0.0, 0.0), true, true, false, true, 1, true)

            CurrentItemData.Entity = prop
        end
    else
        CurrentItemData = item
        if item.Prop and item.Prop.Model then
            local boneIndex = GetPedBoneIndex(playerPed, 6286)
            LoadModel(item.Prop.Model)
            local prop = CreateObject(GetHashKey(item.Prop.Model), playerCoords, true, true, true)
        
            AttachEntityToEntity(prop, playerPed, boneIndex, item.Prop.Coords or vector3(0.0, 0.0, 0.0), item.Prop.Rotation or vector3(0.0, 0.0, 0.0), true, true, false, true, 1, true)
            
            CurrentItemData.Entity = prop
        end

        RequestAnimDict("anim@heists@box_carry@")
        while not HasAnimDictLoaded("anim@heists@box_carry@") do
            Wait(0)
        end
    
        TaskPlayAnim(playerPed, "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 49, 0, 0, 0, 0)
    end
end)

RegisterNUICallback('applyCustomModColor', function(data)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    local vehicle = GetClosestVehicle(playerCoords, 4.0, 0, 71)
    if vehicle == 0 then return end
    
    local r, g, b = table.unpack(data.color)

    OnApplyCustom = true

    if data.modType == 'colorPrimary' or data.modType == 'colorSecondary' or data.modType == 'wheelColor' or data.modType == 'interiorColor' or data.modType == 'pearlescentColor' then
        CreateThread(function()
            local vehicleCoords = GetEntityCoords(vehicle)
            local diff = vehicleCoords - playerCoords
            local heading = GetHeadingFromVector_2d(diff.xy)

            if CurrentItemData.Prop then
                local boneIndex = GetPedBoneIndex(playerPed, 58868)
                LoadModel(CurrentItemData.Prop.Model)
                local prop = CreateObject(GetHashKey(CurrentItemData.Prop.Model), playerCoords, true, true, true)
    
                AttachEntityToEntity(prop, playerPed, boneIndex, CurrentItemData.Prop.Coords or vector3(0.0, 0.0, 0.0), CurrentItemData.Prop.Rotation or vector3(0.0, 0.0, 0.0), true, true, false, true, 1, true)
    
                CurrentItemData.Entity = prop

                RequestAnimDict('switch@franklin@lamar_tagging_wall')
                while not HasAnimDictLoaded('switch@franklin@lamar_tagging_wall') do
                    Wait(0)
                end

                TaskPlayAnimAdvanced(playerPed, "switch@franklin@lamar_tagging_wall", "lamar_tagging_wall_loop_lamar", playerCoords, 0.0, 0.0, heading, 1.0, 0.5, 3000, 1, 0.0, 1, 1)

                Wait(2000)

                ClearPedTasks(playerPed)
                FreezeEntityPosition(playerPed, true)

                RequestNamedPtfxAsset('core')
                while not HasNamedPtfxAssetLoaded('core') do
                    Wait(1)
                end

                UseParticleFxAssetNextCall('core')
                local particleEffect = StartParticleFxLoopedOnEntity('ent_amb_steam', prop, 0.1, 0.002, 0.2, 0.0, -95.0, 180.0, 0.2, false, false, false)
                SetParticleFxLoopedColour(particleEffect, r / 255, g / 255, b / 255)
            end

            CreateThread(function()
                while OnApplyCustom do
                    DisableControlAction(0, 73, true)
                    Wait(0)
                end
            end)

            if Config.Callback.UseCustomProgbar then
                CreateThread(function()
                    Config.Callback.Progbar('carcustoms', 'กำลังแต่ง', Config.SprayDuration)
                end)
            end

            local isFinished = exports['zobyeteam_progbar']:play({
                disableInterface = Config.Callback.UseCustomProgbar,
                name = 'carcustoms',
                label = 'กำลังแต่ง',
                duration = Config.SprayDuration or 10000,
                useWhileDead = false,
                cancelable = false,
                controlDisables = {
                    movement = true,
                    vehicle = true,
                    mouse = false,
                    combat = true,
                },
                animation = {
                    dict = 'switch@franklin@lamar_tagging_wall',
                    anim = 'lamar_tagging_exit_loop_lamar',
                    flags = 1,
                },
            })
            if not isFinished then return end

            OnApplyCustom = false
            RemoveParticleFxFromEntity(CurrentItemData.Entity)
            DeleteObject(CurrentItemData.Entity)
            FreezeEntityPosition(playerPed, false)
        end)
    end

    if data.modType == 'colorPrimary' then
        local primary, secondary = GetVehicleColours(vehicle)

        if primary == secondary and primary > 159 then
            SetVehicleColours(vehicle, 0, 0)
        end

        SetVehicleCustomPrimaryColour(vehicle, 255, 255, 255)

        local divisor = Config.SprayDuration / 10

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

            SetVehicleCustomPrimaryColour(vehicle, math.floor(currentR), math.floor(currentG), math.floor(currentB))
            
            Wait(10)
        end
        
        SetVehicleCustomPrimaryColour(vehicle, r, g, b)
    elseif data.modType == 'colorSecondary' then
        local primary, secondary = GetVehicleColours(vehicle)

        if primary == secondary and primary > 159 then
            SetVehicleColours(vehicle, 0, 0)
        end

        SetVehicleCustomSecondaryColour(vehicle, 255, 255, 255)

        local divisor = Config.SprayDuration / 10

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

            SetVehicleCustomSecondaryColour(vehicle, math.floor(currentR), math.floor(currentG), math.floor(currentB))
            Wait(10)
        end
        
        SetVehicleCustomSecondaryColour(vehicle, r, g, b)
    elseif data.modType == 'modXenon' then
        ToggleVehicleMod(vehicle, 22, true)
        SetVehicleXenonLightsCustomColor(vehicle, r, g, b)
    elseif data.modType == 'neonColor' then
        SetVehicleNeonLightEnabled(vehicle, 0, true)
        SetVehicleNeonLightEnabled(vehicle, 1, true)
        SetVehicleNeonLightEnabled(vehicle, 2, true)
        SetVehicleNeonLightEnabled(vehicle, 3, true)

        SetVehicleNeonLightsColour(vehicle, r, g, b)
    elseif data.modType == 'tyreSmokeColor' then
        ToggleVehicleMod(vehicle, 20, true)
        SetVehicleTyreSmokeColor(vehicle, r, g, b)
    elseif data.modType == 'wheelColor' then
        local wheelColorIndex = GetExtraColorIndex(data.color)

        Wait(Config.SprayDuration + 2500)

        local pearlescentColor, _ = GetVehicleExtraColours(vehicle)
        SetVehicleExtraColours(vehicle, pearlescentColor, wheelColorIndex)
    elseif data.modType == 'pearlescentColor' then
        local pearlescentColor = GetExtraColorIndex(data.color)

        Wait(Config.SprayDuration + 2500)

        local _, wheelColorIndex = GetVehicleExtraColours(vehicle)
        SetVehicleExtraColours(vehicle, pearlescentColor, wheelColorIndex)
    elseif data.modType == 'interiorColor' then
        local interiorColorIndex = GetExtraColorIndex(data.color)

        Wait(Config.SprayDuration + 2500)

        SetVehicleInteriorColor(vehicle, interiorColorIndex)
    end

    OnApplyCustom = false
    CurrentItemData = {}

    if not Config.AutoSaveProps then return end
    SaveProps(vehicle)
end)

function GetCurrentCustomColor(vehicle, modType)
    local color = nil

    if modType == 'colorPrimary' then 
        local pR, pG, pB = GetVehicleCustomPrimaryColour(vehicle)
        color = { pR, pG, pB }
    elseif modType == 'colorSecondary' then
        local sR, sG, sB = GetVehicleCustomSecondaryColour(vehicle)
        color = { sR, sG, sB }
    elseif modType == 'modXenon' then
        local _, xR, xG, xB = GetVehicleXenonLightsCustomColor(vehicle)
        color = { xR, xG, xB }
    elseif modType == 'neonColor' then
        local nR, nG, nB = GetVehicleNeonLightsColour(vehicle)
        color = { nR, nG, nB }
    elseif modType == 'tyreSmokeColor' then
        local tR, tG, tB = GetVehicleTyreSmokeColor(vehicle)
        color = { tR, tG, tB }
    elseif modType == 'wheelColor' then
        local pearlescentColor, wheelColorIndex = GetVehicleExtraColours(vehicle)
        color = colorsData[wheelColorIndex + 1]
    elseif modType == 'pearlescentColor' then
        local pearlescentColor, wheelColorIndex = GetVehicleExtraColours(vehicle)
        color = colorsData[pearlescentColor + 1]
    elseif modType == 'interiorColor' then
        local interiorColorIndex = GetVehicleInteriorColor(vehicle)
        color = colorsData[interiorColorIndex + 1]
    end

    return color
end

function RaiseCar(vehicle, playerPed)
    local playerCoords = GetEntityCoords(playerPed)
    local vehicleCoords = GetEntityCoords(vehicle)
    
    local vehicleProp = CreateObject(GetHashKey(Config.RaiseVehicleProp), vehicleCoords.x, vehicleCoords.y, vehicleCoords.z - 0.5, true, true, true)
    RaiseCarProp = vehicleProp

    AttachEntityToEntity(vehicleProp, vehicle, 0, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)

    CreateThread(function()
        local raiseVehicleCoordsZ = vehicleCoords.z

        for i = 1, 100 do
            raiseVehicleCoordsZ = raiseVehicleCoordsZ + 0.005

            SetEntityCoordsNoOffset(vehicle, vehicleCoords.x, vehicleCoords.y, raiseVehicleCoordsZ, true, true, true)

            Wait(10)
        end

        Wait(13000)

        for i = 1, 100 do
            raiseVehicleCoordsZ = raiseVehicleCoordsZ - 0.005

            SetEntityCoordsNoOffset(vehicle, vehicleCoords.x, vehicleCoords.y, raiseVehicleCoordsZ, true, true, true)

            Wait(10)
        end
    end)
end

function OpenMenu()
    local playerPed = PlayerPedId()
    if IsEntityDead(playerPed) then return end
    
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    
    local driverPed = GetPedInVehicleSeat(vehicle, -1)
    if driverPed ~= playerPed then return end

    if Config.HideMinimap then
        DisplayRadar(false)
    end

    Config.Callback.HideHelpText()
    DisplayRadar(false)
    VehicleProperties = GetVehicleProperties(vehicle)

    FreezeEntityPosition(vehicle, true)

    LoadData()
    OpenDisplay()

    TriggerServerEvent('zobyeteam_carcustoms:openCarCustoms', ObjToNet(vehicle))

    StartCameraView(vehicle)
end
RegisterNetEvent('zobyeteam_carcustoms:openMenu', OpenMenu)

local isHorning = false

function StartCameraView(vehicle)
    CreateThread(function()
        local playerPed = PlayerPedId()
        local vehicleCoords = GetEntityCoords(vehicle)
        Camera = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", vehicleCoords, 0.0, 0.0, 0.0, 95.0, true)
        PointCamAtCoord(Camera, vehicleCoords)

        ZRotation = GetEntityHeading(vehicle)

        CreateThread(function()
            while Camera do
                Wait(3000)
    
                if IsEntityDead(playerPed) or not (IsPedInAnyVehicle(playerPed) or isHorning) then
                    CloseDisplay()
                end
            end
        end)

        SetCamActive(Camera, true)
        RenderScriptCams(true, true, 500, true, true)

        SetNuiFocusKeepInput(true)
        while Camera do
            DisableAllControlActions(0)
            EnableControlAction(0, 0, true)
            EnableControlAction(0, 1, true)
            EnableControlAction(0, 2, true)
            EnableControlAction(0, 249, true)

            local isShiftPressed = IsDisabledControlPressed(0, 21)

            if IsDisabledControlPressed(0, 34) then -- A
                ZRotation = ZRotation - (0.5 * (isShiftPressed and 2 or 1))

                if ZRotation <= 0 then
                    ZRotation = 360
                end
            end
            if IsDisabledControlPressed(0, 35) then -- D
                ZRotation = ZRotation + (0.5 * (isShiftPressed and 2 or 1))

                if ZRotation >= 360 then
                    ZRotation = 0
                end
            end

            if IsDisabledControlPressed(0, 32) then -- W
                YRotation = YRotation + (0.5 * (isShiftPressed and 2 or 1))

                if YRotation >= 89.9 then
                    YRotation = 89.9
                end
            end
            if IsDisabledControlPressed(0, 33) then -- S
                YRotation = YRotation - (0.5 * (isShiftPressed and 2 or 1))

                if YRotation <= -10 then
                    YRotation = -10
                end
            end

            if IsDisabledControlPressed(0, 14) then -- WHEEL DOWN
                Radius = Radius + (0.05 * (isShiftPressed and 2 or 1))

                if Radius > 6 then
                    Radius = 6
                end
            elseif IsDisabledControlPressed(0, 15) then -- WHEEL UP
                Radius = Radius - (0.05 * (isShiftPressed and 2 or 1))

                if Radius < 0.5 then
                    Radius = 0.5
                end
            end

            if not IsNuiFocused() and IsDisabledControlJustPressed(0, 202) then
                CloseDisplay()
            end

            local cosYRotation = math.cos(YRotation * 0.01745)
            local camZ = vehicleCoords.z + (math.sin(YRotation * 0.01745) * Radius)

            local camX = vehicleCoords.x + (math.cos(ZRotation * 0.01745) * Radius * cosYRotation)
            local camY = vehicleCoords.y + (math.sin(ZRotation * 0.01745) * Radius * cosYRotation)

            SetCamCoord(Camera, camX, camY, camZ)
            PointCamAtCoord(Camera, vehicleCoords)

            if Config.UseDebugMode then
                print(ZRotation - GetEntityHeading(vehicle), YRotation, Radius)
            end
            Wait(0)
        end
    end)
end

RegisterNUICallback('enterMenu', function(data)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if not vehicle or vehicle == 0 then return end
    
    if data.modIndex then
        local mainMenus = IsInColorCustom and Config.ColorCustomMenus or Config.Menus
        local parentName, ownName, children = FindOption(mainMenus, data.ownName)
        local modItems, currentModIndex = GetModItemsMenu(children, false)
        local price = GetModPrice(modItems, data.modIndex)

        SetMod(vehicle, children.ModType, data.modIndex, { parentName = data.parentName, ownName = data.ownName, price = price, label = children.Label, newCustomize = true })
    elseif data.parentName ~= data.targetMenuName then
        LoadData(data.targetMenuName, false, true)
    elseif data.parentName == data.targetMenuName then -- back
        if data.isModMenu then
            local mainMenus = IsInColorCustom and Config.ColorCustomMenus or Config.Menus
            local parentName, ownName, children = FindOption(mainMenus, data.targetMenuName)

            LoadData(parentName, false, true)
        else
            LoadData(data.targetMenuName, false, true)
        end

        SetVehicleDoorShut(vehicle, 4, false)
    end
end)

function GetModPrice(modItems, modIndex)
    for _, modData in ipairs(modItems) do
        if modData.index == modIndex then
            return Config.Callback.ReplacePrice(modData.price) or modData.price
        end
    end


    if not price and #modItems == 1 then
        return Config.Callback.ReplacePrice(modItems[1].price) or modItems[1].price
    end

    return nil
end

function GetTotalCustomizingPrice()
    local totalPrice = 0

    for _, v in ipairs(Customizing) do
        if v.price then
            totalPrice = totalPrice + v.price
        end
    end

    return totalPrice
end

function GetLocationIndex(playerCoords, vehicleCoords)
    for index, location in ipairs(Config.ColorCustomLocations) do
        local distance = #(playerCoords - vehicleCoords)
        local vehicleDistance = #(vehicleCoords - location.Coords)

        if distance < 5 and vehicleDistance < location.Radius then

            return index
        end
    end

    return nil
end

RegisterNUICallback('purchase', function(data)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if not vehicle or vehicle == 0 then return end

    local mainMenus = IsInColorCustom and Config.ColorCustomMenus or Config.Menus
    local parentName, ownName, children = FindOption(mainMenus, data.ownName)

    if not next(Customizing) then
        return Config.Callback.Notify('have_not_customized_yet')
    end

    local price = GetTotalCustomizingPrice()

    if not price then
        return Config.Callback.Notify('script_error') 
    end

    local playerJob = exports['zobyeteam_wrapper']:GetPlayerJob().name

    local basePrice = price

    local discount = Config.JobDiscounts[playerJob]
    if discount then
        price = basePrice * ((100 - discount) / 100)
    end

    if data.payType == 'bank' then
        price = price + (basePrice * Config.BankCharge / 100)
    end

    price = Round(price)

    if exports['zobyeteam_wrapper']:GetPlayerAccount(data.payType) < price then
        return Config.Callback.Notify('not_enough_money')
    end

    if IsInColorCustom then
        local playerCoords = GetEntityCoords(playerPed)
        local vehicleCoords = GetEntityCoords(vehicle)
        local locationIndex = GetLocationIndex(playerCoords, vehicleCoords)
        if not locationIndex then return print('Something wrong.') end

        for _, v in ipairs(Customizing) do
            if v.modType == 'colorPrimary' and v.colors then
                SprayEffect(vehicle, locationIndex, v.colors)
                FadeColor(vehicle, v.colors, SetVehicleCustomPrimaryColour)
            elseif v.modType == 'colorSecondary' and v.colors then
                SprayEffect(vehicle, locationIndex, v.colors)
                FadeColor(vehicle, v.colors, SetVehicleCustomSecondaryColour)
            elseif v.modType == 'colorChameleon' then
                SprayEffect(vehicle, locationIndex, nil)
                Wait(5500)
            end
        end
    end

    local vehicleProps = GetVehicleProperties(vehicle)
    TriggerServerEvent('zobyeteam_carcustoms:purchaseMod', basePrice, data.payType, vehicleProps and vehicleProps.plate, Customizing, IsInColorCustom)

    VehicleProperties = vehicleProps
    SetVehicleProperties(vehicle, vehicleProps)

    Customizing = {}
    LoadData(data.ownName, true, true)

    Config.Callback.CustomsSuccess(vehicle, price, data.payType, plate, Customizing)
    if not Config.AutoSaveProps then return end
    SaveProps(vehicle, vehicleProps)
end)

RegisterNUICallback('removeMod', function(data)
    if not (data.modType) then return end

    if not next(Customizing) then return end

    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if not vehicle or vehicle == 0 then return end

    for index, v in ipairs(Customizing) do
        if v.modType == data.modType then
            ResetSingleMod(vehicle, data.ownName, v.modType, v.modIndex)
            table.remove(Customizing, index)
            LoadCustomizing()

            break
        end
    end
end)

function ResetSingleMod(vehicle, ownName, modType, modIndex)
    if modType == 'modXenon' then
        if VehicleProperties.customXenonColor then
            SetVehicleXenonLightsCustomColor(vehicle, VehicleProperties.customXenonColor[1], VehicleProperties.customXenonColor[2], VehicleProperties.customXenonColor[3])
        end
    elseif modType == 'colorPrimary' then
        if VehicleProperties.customPrimaryColor then
            SetVehicleCustomPrimaryColour(vehicle, VehicleProperties.customPrimaryColor[1], VehicleProperties.customPrimaryColor[2], VehicleProperties.customPrimaryColor[3])
        else
            ClearVehicleCustomPrimaryColour(vehicle)

            local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
            SetVehicleColours(vehicle, VehicleProperties.color1, colorSecondary)
        end
    elseif modType == 'colorSecondary' then
        if VehicleProperties.customSecondaryColor then
            SetVehicleCustomSecondaryColour(vehicle, VehicleProperties.customSecondaryColor[1], VehicleProperties.customSecondaryColor[2], VehicleProperties.customSecondaryColor[3])
        else
            ClearVehicleCustomSecondaryColour(vehicle)

            local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
            SetVehicleColours(vehicle, colorPrimary, VehicleProperties.color2)
        end
    elseif modType == 'neonColor' then
        if VehicleProperties.neonColor then
            SetVehicleNeonLightEnabled(vehicle, 0, true)
            SetVehicleNeonLightEnabled(vehicle, 1, true)
            SetVehicleNeonLightEnabled(vehicle, 2, true)
            SetVehicleNeonLightEnabled(vehicle, 3, true)

            SetVehicleNeonLightsColour(vehicle, VehicleProperties.neonColor[1], VehicleProperties.neonColor[2], VehicleProperties.neonColor[3])
        end
    elseif modType == 'tyreSmokeColor' then
        if VehicleProperties.tyreSmokeColor ~= nil then
            ToggleVehicleMod(vehicle, 20, true)
            SetVehicleTyreSmokeColor(vehicle, VehicleProperties.tyreSmokeColor[1], VehicleProperties.tyreSmokeColor[2], VehicleProperties.tyreSmokeColor[3])
        end
    elseif modType == 'wheelColor' then
        if VehicleProperties.pearlescentColor ~= nil then
            local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
            SetVehicleExtraColours(vehicle, VehicleProperties.pearlescentColor or pearlescentColor, VehicleProperties.wheelColor)
        end
    elseif modType == 'pearlescentColor' then
        if VehicleProperties.pearlescentColor ~= nil then
            local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
            SetVehicleExtraColours(vehicle, VehicleProperties.pearlescentColor, wheelColor)
        end
    elseif modType == 'interiorColor' then
        local interiorColor = VehicleProperties.interiorColor or VehicleProperties.modColor
        if interiorColor ~= nil then
            SetVehicleInteriorColor(vehicle, interiorColor)
        end
    else
        local mainMenus = IsInColorCustom and Config.ColorCustomMenus or Config.Menus
        local parentName, ownName, children = FindOption(mainMenus, ownName)

        SetMod(vehicle, modType, modIndex, { parentName = parentName, ownName = ownName })
    end
end

function SaveProps(vehicle, vehicleProps)
    if not vehicle or vehicle == 0 then return end

    vehicleProps = vehicleProps or GetVehicleProperties(vehicle)
    TriggerServerEvent('zobyeteam_carcustoms:saveProps', vehicleProps)
end
exports('SaveProps', SaveProps)

function LoadData(targetMenuName, justUpdate, firstEnter)
    local menus = {}
    local currentModIndex = nil
    local vehicleColor = nil

    local vehicle = GetVehiclePedIsIn(PlayerPedId())

    local mainMenus = IsInColorCustom and Config.ColorCustomMenus or Config.Menus
    local parentName, ownName, children

    if targetMenuName then
        parentName, ownName, children = FindOption(mainMenus, targetMenuName)
    end

    if not justUpdate then
        local pR, pG, pB = GetVehicleCustomPrimaryColour(vehicle)
        local sR, sG, sB = GetVehicleCustomSecondaryColour(vehicle)
        local tR, tG, tB = GetVehicleTyreSmokeColor(vehicle)
        local nR, nG, nB = GetVehicleNeonLightsColour(vehicle)
        local _, xR, xG, xB = GetVehicleXenonLightsCustomColor(vehicle)
        local pearlescentColorIndex, wheelColorIndex = GetVehicleExtraColours(vehicle)
        local interiorColorIndex = GetVehicleInteriorColor(vehicle)

        vehicleColor = {
            primary = { pR, pG, pB },
            secondary = { sR, sG, sB },
            tyreColor = { tR, tG, tB },
            wheelColor = colorsData[wheelColorIndex + 1],
            pearlescentColor = colorsData[pearlescentColorIndex + 1],
            interiorColor = colorsData[interiorColorIndex + 1],
            neonColor = { nR, nG, nB },
            xenonColor = { xR, xG, xB },
        }

        if parentName == 'WheelsType' then
            local targetWheelType = GetWheelTypeIndexFromConfig(targetMenuName)
            local wheelType = GetVehicleWheelType(vehicle)
            
            if targetWheelType ~= wheelType then
                SetVehicleWheelType(vehicle, targetWheelType)
                SetVehicleMod(vehicle, 23, -1, false)
            end
        end
    end

    if not children then
        menus = GetMainMenu()
    elseif children.Options then
        menus = GetSubMenu(children)
    elseif children.ModType then
        menus, currentModIndex = GetModItemsMenu(children, firstEnter)
    end

    local playerJob = exports['zobyeteam_wrapper']:GetPlayerJob().name

    local vehicleModel = GetEntityModel(vehicle)
    
    local vehicleDisplayName = GetDisplayNameFromVehicleModel(vehicleModel)
    local vehicleLabelText = GetLabelText(vehicleDisplayName)
    local vehicleName = vehicleLabelText == 'NULL' and vehicleDisplayName or vehicleLabelText
    
    local acceleration = Round((GetVehicleAcceleration(vehicle) or 0.0) * 1000) / 100
    local maxSpeed = Round((GetVehicleEstimatedMaxSpeed(vehicle) or 0.0) * 10) / 100
    local breaks = Round((GetVehicleMaxBraking(vehicle) or 0.0) * 100) / 100
    local power = Round((acceleration + maxSpeed) / 2 * 100) / 100

    if firstEnter then 
        TempModIndex = currentModIndex
    end

    menus = Config.Callback.ReplaceMenuData(menus)

    SendNUIMessage({
        action = 'loadData',
        type = 'custom',
        menus = menus,
        isMod = (children and children.ModType) and true or false,
        menuLabel = children and children.Label,
        parentName = parentName,
        ownName = ownName,
        currentModIndex = currentModIndex,
        ownedModIndex = TempModIndex,
        vehicleColor = vehicleColor,
        vehicleName = vehicleName,
        vehiclePlate = Trim(GetVehicleNumberPlateText(vehicle)),
        vehicleStatus = {
            acceleration = acceleration,
            maxSpeed = maxSpeed,
            breaks = breaks,
            power = power,
        },
        jobDiscount = Config.JobDiscounts[playerJob],
        playerName = exports['zobyeteam_wrapper']:GetPlayerName(),
        bankCharge = Config.BankCharge,
        sellerName = Config.SellerName,
        keys = Config.Keys,
        accounts = {
            money = exports['zobyeteam_wrapper']:GetPlayerAccount('money'),
            bank = exports['zobyeteam_wrapper']:GetPlayerAccount('bank')
        }
    })

    LoadCustomizing()
end

function LoadCustomizing()
    SendNUIMessage({
        action = 'loadData',
        type = 'customizingList',
        customizing = Customizing,
    })
end

function LoadShopData()
    local shopMenus = {}

    for menuIndex, v in ipairs(Config.ShopMenu) do
        shopMenus[menuIndex] = {
            name = v.Name,
            items = {}
        }

        for itemIndex, item in ipairs(v.Items) do
            shopMenus[menuIndex].items[itemIndex] = {
                name = item.Name,
                label = item.Label or exports['zobyeteam_wrapper']:GetItemLabel(item.Name),
                price = item.Price,
            }
        end
    end

    SendNUIMessage({
        action = 'loadData',
        type = 'shop',
        shopMenus = shopMenus,
        itemImagePath = Config.ItemImagePath,
        accounts = {
            money = exports['zobyeteam_wrapper']:GetPlayerAccount('money'),
            bank = exports['zobyeteam_wrapper']:GetPlayerAccount('bank')
        }
    })
end

function GetWheelTypeIndexFromConfig(targetWheelType)
    local _, _, children = FindOption(Config.Menus, 'WheelsType')

    for index, wheelOption in ipairs(children.Options) do
        if wheelOption.Name == targetWheelType then
            return wheelOption.WheelIndex or index - 1
        end
    end

    return 0
end

function SetVehicleWheelsType(vehicle, subMenuName)
    for _, menu in ipairs(Config.Menus) do
        if menu.Name == 'WheelsType' then
            for index, wheelOption in ipairs(menu.Options) do
                if wheelOption.Name == subMenuName then
                    local wheelType = GetVehicleWheelType(vehicle)

                    SetVehicleWheelType(vehicle, index - 1)
                    if wheelType == index - 1 then return end
                    
                    break
                end
            end

            break
        end
    end
end

function GetMainMenu()
    local menus = {}

    local mainMenus = IsInColorCustom and Config.ColorCustomMenus or Config.Menus
    for _, v in ipairs(mainMenus) do
        local nextMenu = v.Options and GetSubMenu(v) or GetModItemsMenu(v, false) 
        if next(nextMenu) then
            menus[#menus + 1] = {
                name = v.Name,
                label = v.Label,
                modType = v.ModType,
                image = v.Image
            }
        end
    end

    return menus
end

function GetSubMenu(children)
    local menus = {}

    if children.ModType == 'extras' then
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        local tempCount = 0
        for i = 0, 25, 1 do
            if DoesExtraExist(vehicle, i) then
                menus[#menus + 1] = {
                    name = 'Extra' .. i,
                    label = 'Extra ' .. tempCount + 1,
                    modType = 'extraMod_' .. i,
                    image = children.Image,
                }
                tempCount = tempCount + 1
            end
        end
    else
        for _, v in ipairs(children.Options) do
            local nextMenu = v.Options and GetSubMenu(v) or GetModItemsMenu(v, false)
            if next(nextMenu) then
                menus[#menus + 1] = {
                    name = v.Name,
                    label = v.Label,
                    modType = v.ModType,
                    image = v.Image
                }
            end
        end
    end

    return menus
end

function GetModItemsMenu(children, firstEnter)
    local menus = {}
    local currentModIndex = nil
    local menuLabel = nil

    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local vehicleModel = GetEntityModel(vehicle)

    local basePrice = GetVehicleBasePrice(vehicleModel)

    local modsNum = GetVehicleModsNum(vehicle, children.ModType)

    menuLabel = children.Label

    local startIndex = -1
    if (children.ModType == 'windowTint' or string.find(children.ModType, 'extraMod') or children.ModType == 'livery') then
        startIndex = 0
    elseif children.ModType == 'colorChameleon' then
        startIndex = 161
    end

    currentModIndex = GetVehicleCurrentMod(vehicle, children.ModType, modsNum)

    if modsNum == 'toggle' then
        local prices = GetVehicleModFixedPrice(vehicleModel, children.Name)
        menus[1] = {
            index = -1,
            label = GetModLabel(vehicle, children.ModType, -1),
            price = prices and (type(prices) == 'table' and (prices[1] or Config.DefaultPrice) or prices) or (Round(type(children.PriceMultiplier) == 'table' and basePrice * (children.PriceMultiplier[1] or 1) or basePrice * children.PriceMultiplier)),
            image = children.Image
        }

        menus[2] = {
            index = 0,
            label = GetModLabel(vehicle, children.ModType, 0),
            price = prices and (type(prices) == 'table' and (prices[2] or Config.DefaultPrice) or prices) or (Round(type(children.PriceMultiplier) == 'table' and basePrice * (children.PriceMultiplier[2] or 1) or basePrice * children.PriceMultiplier)),
            image = children.Image
        }
    elseif modsNum then
        if children.Name == 'ColorPrimaryType' or children.Name == 'ColorSecondaryType' then 
            local prices = GetVehicleModFixedPrice(vehicleModel, children.Name)
            for i, v in ipairs(Config.ColorTypes) do
                menus[#menus + 1] = {
                    index = v.ColorIndex,
                    name = v.Name,
                    label = v.Label,
                    price = prices and (type(prices) == 'table' and (prices[i] or prices[#prices]) or prices) or (Round(type(children.PriceMultiplier) == 'table' and basePrice * (children.PriceMultiplier[i] or 1) or basePrice * children.PriceMultiplier)),
                    image = children.Image
                }
            end
        elseif children.Name == 'ColorPrimary' or children.Name == 'ColorSecondary' or children.Name == 'Xenon' or children.Name == 'Neon' or children.Name == 'WheelColor' or children.Name == 'InteriorColor' or children.Name == 'PearlescentColor' or children.Name == 'TyreSmokeColor' then
            local prices = GetVehicleModFixedPrice(vehicleModel, children.Name)
            menus[#menus + 1] = {
                name = children.Name,
                label = children.Label,
                price = prices and (type(prices) == 'table' and (prices[1] or Config.DefaultPrice) or prices) or (Round(type(children.PriceMultiplier) == 'table' and basePrice * (children.PriceMultiplier[1] or 1) or basePrice * children.PriceMultiplier)),
                image = children.Image
            }
        elseif modsNum >= 0 then
            local prices = GetVehicleModFixedPrice(vehicleModel, children.Name)
            if children.ModType == 'colorChameleon' then
                for i = startIndex, modsNum do
                    local realIndex = i - 160
                    menus[#menus + 1] = {
                        name = children.Name .. tostring(i),
                        index = i,
                        label = GetModLabel(vehicle, children.ModType, i),
                        price = prices and (type(prices) == 'table' and (prices[realIndex] or prices[#prices]) or prices) or (Round(type(children.PriceMultiplier) == 'table' and basePrice * (children.PriceMultiplier[realIndex] or 1) or basePrice * children.PriceMultiplier)),
                        colors = Config.ChameleonColors[realIndex],
                    }
                end
            elseif string.find(children.ModType, 'extraMod') then
                local prices = GetVehicleModFixedPrice(vehicleModel, 'Extras')

                menus[1] = {
                    index = 1,
                    label = 'OFF',
                    price = prices and (type(prices) == 'table' and (prices[1] or Config.DefaultPrice) or prices) or (Round(type(children.PriceMultiplier) == 'table' and basePrice * (children.PriceMultiplier[1] or 1) or basePrice * children.PriceMultiplier)),
                    image = children.Image
                }
        
                menus[2] = {
                    index = 0,
                    label = 'ON',
                    price = prices and (type(prices) == 'table' and (prices[2] or Config.DefaultPrice) or prices) or (Round(type(children.PriceMultiplier) == 'table' and basePrice * (children.PriceMultiplier[2] or 1) or basePrice * children.PriceMultiplier)),
                    image = children.Image
                }
            else
                for i = startIndex, modsNum do
                    local realIndex = i - (startIndex - 1)
                    menus[#menus + 1] = {
                        index = i,
                        label = GetModLabel(vehicle, children.ModType, i),
                        price = prices and (type(prices) == 'table' and (prices[realIndex] or prices[#prices]) or prices) or Round(type(children.PriceMultiplier) == 'table' and basePrice * (children.PriceMultiplier[realIndex] or 1) or basePrice * children.PriceMultiplier),
                        image = children.Image
                    }
                end
            end
        end
    end

    if firstEnter and children.Camera then
        SetCameraView(vehicle, children.Camera)
    end

    return menus, currentModIndex, menuLabel
end

function GetVehicleModFixedPrice(vehicleModel, modName)
    for _, v in ipairs(Config.FixedPrice) do
        for _, vehicleName in ipairs(v.Vehicles) do
            if vehicleModel == GetHashKey(vehicleName) then
                local prices = v.Prices[modName]
                if prices then
                    return prices
                end
            end
        end
    end

    return nil
end

function GetVehicleBasePrice(vehicleModel)
    for _, vehicleData in ipairs(Config.Vehicles) do
        if vehicleModel == GetHashKey(vehicleData.Name) then
            return vehicleData.Price or Config.DefaultPrice
        end
    end

    return Config.DefaultPrice
end

function SetCameraView(vehicle, CameraOption)
    local zRotationDiff = 0
    local yRotationDiff = CameraOption.YRotation and CameraOption.YRotation - YRotation or 0
    local radiusDiff = CameraOption.Radius and CameraOption.Radius - Radius or 0

    if CameraOption.ZRotation then
        local targetZRotation = GetEntityHeading(vehicle) + CameraOption.ZRotation

        if targetZRotation > 360 then
            targetZRotation = targetZRotation - 360
        elseif targetZRotation < 0 then
            targetZRotation = targetZRotation + 360
        end

        zRotationDiff = targetZRotation - ZRotation
    end

    CreateThread(function()
        local z = zRotationDiff / 50
        local y = yRotationDiff / 50
        local r = radiusDiff / 50

        for i = 1, 50 do
            ZRotation = ZRotation + z
            YRotation = YRotation + y
            Radius = Radius + r
            Wait(0)
        end
    end)
end

RegisterNUICallback('resetCamera', function(data)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    local mainMenus = IsInColorCustom and Config.ColorCustomMenus or Config.Menus
    local parentName, ownName, children = FindOption(mainMenus, data.ownName)

    SetCameraView(vehicle, (children.Camera and children.Camera.ZRotation) and children.Camera or {
        ZRotation = GetEntityHeading(vehicle),
        YRotation = 20,
        Radius = 3.0
    })
end)

function OpenDisplay(route)
    SendNUIMessage({
        action = 'openDisplay',
        route = route or 'custom'
    })
    SetNuiFocus(true, true)

    Config.Callback.OpenedUI()
end

function CloseDisplay(data)
    SendNUIMessage({
        action = 'closeDisplay'
    })
    SetNuiFocus(false, false)
    Config.Callback.ClosedUI()

    SetNuiFocusKeepInput(false)
    DisplayRadar(true)
    
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    FreezeEntityPosition(playerPed, false)

    if vehicle and vehicle ~= 0 then
        SetVehicleLights(vehicle, 0)
        FreezeEntityPosition(vehicle, false)
        if next(VehicleProperties) then
            SetVehicleProperties(vehicle, VehicleProperties)
        end
    end

    if data then
        if data.route == 'stancer' then
            UpdateStancerData(CacheStancerData)
            CacheStancerData = {}
        -- elseif data.route == 'colorCustom' then
        --     vehicle = GetVehiclePedIsIn(playerPed, false)
        --     if vehicle and vehicle ~= 0 then
        --         FreezeEntityPosition(vehicle, false)

        --         if next(VehicleProperties) then
        --             SetVehicleProperties(vehicle, VehicleProperties)
        --         end
        --     end
        end
    end

    TriggerServerEvent('zobyeteam_carcustoms:closeCarCustoms')

    IsInColorCustom = false
    IsInShop = false
    IsInStancerCustom = false
    TempModIndex = nil
    VehicleProperties = {}
    Customizing = {}

    if Camera then
        SetCamActive(Camera, false)
        RenderScriptCams(false, true, 500, true, true)
    
        ZRotation = 0
        YRotation = 20
        Radius = 3.0

        Wait(500)
        Camera = nil
    end
end
RegisterNUICallback('closeDisplay', CloseDisplay)

function GetVehicleModsNum(vehicle, modType)
    SetVehicleModKit(vehicle, 0)

    if modType == 'colorPrimary' then
        return 0
    elseif modType == 'colorSecondary' then
        return 0
    elseif modType == 'colorChameleon' then
        return 242 -- 82
    elseif modType == 'paintType1' then
        return 5
    elseif modType == 'paintType2' then
        return 5
    elseif modType == 'pearlescentColor' then
        return 0
    elseif modType == 'wheelColor' then
        return 0
    elseif modType == 'interiorColor' then
        return 0
    elseif modType == 'tyreSmokeColor' then
        return 0
    elseif modType == 'plateIndex' then
        return 5
    elseif modType == 'modXenon' then
        return 0 -- 12
    elseif modType == 'neonColor' then
        return 0
    elseif modType == 'livery' then
        return GetVehicleLiveryCount(vehicle) - 1
    elseif string.find(modType, 'extraMod') then
        local tempCount = 0
		for id = 0, 25 do
			if (DoesExtraExist(vehicle, id)) then
				tempCount = tempCount + 1
			end
		end
		return tempCount
    elseif modType == 'windowTint' then
        return GetNumVehicleWindowTints() - 1
    elseif (type(modType) == 'number' and modType >= 17 and modType <= 22) then
		return 'toggle'
	elseif (type(modType) == 'number') then
		return GetNumVehicleMods(vehicle, modType) - 1
	end

	return -1
end

function GetModLabel(vehicle, modType, data)
	SetVehicleModKit(vehicle, 0)

	if (data == -1 and modType == 'livery') then 
		return 'NOT_ADD_TO_OPTIONS_BY_TAKZOBYE'
	end

	if (data == -1) then
		if (not (type(modType) == 'number' and modType >= 17 and modType <= 22)) then
			return 'Default'
		end
	end

	if (modType == 'plateIndex') then
		return Config.PlateIndexLabel[data + 1] or nil
    elseif (modType == 'colorChameleon') then
		return Config.ChameleonLabel[data - 160] -- because Chameleon ModIndex start at 161
	elseif (modType == 'paintType1' or modType == 'paintType2') then
		return Config.PaintTypeLabel[data + 1] or nil
	elseif (modType == 'windowTint') then
		return Config.WindowTintLabel[data + 1] or nil
	elseif (modType == 'livery') then
        local name = GetLiveryName(vehicle, data)
        local label = nil

        if name then
            label = GetLabelText(name)
        end

        if not label or label == 'NULL' then
            label = ('Livery %s'):format(data + 1)
        end

		return label
	elseif (type(modType) == 'number' and modType >= 11 and modType <= 16 and modType ~= 14) then
		return 'Level ' .. (data + 1)
	elseif (string.find(modType, 'extraMod')) then
		return 'Extra ' .. (data + 1)
	elseif (modType == 'modXenon') then
		return Config.ModXenonLabel[data + 1] or nil
	elseif (type(modType) == 'number' and modType >= 17 and modType <= 22) then
        local tempData = {'OFF', 'ON'}
		return tempData[data + 2]
	elseif (type(modType) == 'number') then
        local name = GetModTextLabel(vehicle, modType, data)
        local label = nil

        if name then
            label = GetLabelText(name)
        end

        if not label or label == 'NULL' then
            label = ('Type %s'):format(data + 1)
        end

		return label
	end

	return nil
end

function GetVehicleCurrentMod(vehicle, modType, data)
	SetVehicleModKit(vehicle, 0)
	SetVehicleAutoRepairDisabled(vehicle, false)

	if (modType == 'plateIndex') then
		return GetVehicleNumberPlateTextIndex(vehicle)
	elseif (modType == 'colorPrimaryType') then
        local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
        return colorPrimary
    elseif (modType == 'colorPrimary') then
		return {GetVehicleCustomPrimaryColour(vehicle)}
	elseif (modType == 'colorSecondaryType') then
        local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
        return colorSecondary
    elseif (modType == 'colorSecondary') then
		return {GetVehicleCustomSecondaryColour(vehicle)}
    elseif (modType == 'colorChameleon') then
        local p, s = GetVehicleColours(vehicle)
		return p == s and p or 0
	elseif (modType == 'wheelColor') then
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
		return wheelColor
	elseif (modType == 'pearlescentColor') then
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
		return pearlescentColor
    elseif (modType == 'interiorColor') then
        return GetVehicleInteriorColor(vehicle)
	elseif (modType == 'tyreSmokeColor') then
		return {GetVehicleTyreSmokeColor(vehicle)}
	elseif (modType == 'modXenon') then
        return {GetVehicleXenonLightsCustomColor(vehicle)}
	elseif (modType == 'neonColor') then
		return {GetVehicleNeonLightsColour(vehicle)}
	elseif (modType == 'paintType1') then
		return GetVehicleModColor_1(vehicle)
	elseif (modType == 'paintType2') then
		return GetVehicleModColor_2(vehicle)
	elseif (modType == 'windowTint') then
		return GetVehicleWindowTint(vehicle)
	elseif (modType == 'livery') then
		return GetVehicleLivery(vehicle)
	elseif (string.find(modType, 'extraMod')) then
        local id = tonumber(Split(modType, '_')[2])
		return IsVehicleExtraTurnedOn(vehicle, id) and 0 or 1
	elseif (type(modType) == 'number' and modType >= 17 and modType <= 22) then
		if (IsToggleModOn(vehicle, modType)) then
			return 0
		end
	elseif (type(modType) == 'number') then
		return GetVehicleMod(vehicle, modType)
	end

	return -1
end

function SetMod(vehicle, modType, modIndex, metadata) 
    SetVehicleModKit(vehicle, 0)
    SetVehicleAutoRepairDisabled(vehicle, false)

    local modsNum = GetVehicleModsNum(vehicle, modType)
    local currentModIndex = GetVehicleCurrentMod(vehicle, modType, modsNum)

    if currentModIndex == modIndex then return end

    if metadata and metadata.newCustomize then
        local isFound = false
        for index, v in ipairs(Customizing) do
            if v.modType == modType then
                isFound = true

                if v.modIndex == modIndex then
                    table.remove(Customizing, index)
                else
                    v.newModIndex = modIndex
                    v.price = metadata.price
                end
            end
        end

        if not isFound then
            Customizing[#Customizing + 1] = {
                modType = modType,
                newModIndex = modIndex,
                modIndex = currentModIndex,
                price = metadata.price,
                label = metadata.label,
            }
        end
    end

    if modsNum == 'toggle' then
        local toggle = modIndex == 0
        ToggleVehicleMod(vehicle, modType, toggle)
    elseif modsNum then
        if modType == 'modXenon' then
            local _, r, g, b = GetVehicleXenonLightsCustomColor(vehicle)

            SetVehicleXenonLightsCustomColor(vehicle, r, g, b)
        elseif modType == 'windowTint' then
            SetVehicleWindowTint(vehicle, modIndex)
        elseif modType == 'livery' then
            SetVehicleLivery(vehicle, modIndex)
        elseif modType == 'plateIndex' then
            SetVehicleNumberPlateTextIndex(vehicle, modIndex)
        elseif modType == 23 then
            local targetWheelType = GetWheelTypeIndexFromConfig((metadata and metadata.wheelType) and metadata.wheelType or metadata.ownName) -- metadata

            SetVehicleWheelType(vehicle, targetWheelType)
            SetVehicleMod(vehicle, 23, modIndex, false)

            if (IsThisModelABike(GetEntityModel(vehicle))) then
                SetVehicleMod(vehicle, 24, modIndex, false)
            end
        elseif modType == 'colorPrimaryType' then
            local _, secondary = GetVehicleColours(vehicle)

            SetVehicleColours(vehicle, modIndex, secondary)
        elseif modType == 'colorPrimary' then
            local r, g, b = GetVehicleCustomPrimaryColour(vehicle)

            SetVehicleCustomPrimaryColour(vehicle, r, g, b)
        elseif modType == 'colorChameleon' then
            SetVehicleColours(vehicle, modIndex, modIndex)
        elseif modType == 'colorSecondaryType' then
            local primary, _ = GetVehicleColours(vehicle)

            SetVehicleColours(vehicle, primary, modIndex)
        elseif modType == 'colorSecondary' then
            local r, g, b = GetVehicleCustomSecondaryColour(vehicle)

            SetVehicleCustomSecondaryColour(vehicle, r, g, b)
        elseif modType == 'neonColor' then
            SetVehicleNeonLightEnabled(vehicle, 0, true)
            SetVehicleNeonLightEnabled(vehicle, 1, true)
            SetVehicleNeonLightEnabled(vehicle, 2, true)
            SetVehicleNeonLightEnabled(vehicle, 3, true)

            local r, g, b = GetVehicleNeonLightsColour(vehicle)

            SetVehicleNeonLightsColour(vehicle, r, g, b)
        elseif modType == 'tyreSmokeColor' then
            local r, g, b = GetVehicleTyreSmokeColor(vehicle)

            ToggleVehicleMod(vehicle, 20, true)
            SetVehicleTyreSmokeColor(vehicle, r, g, b)
        elseif string.find(modType, 'extraMod') then
            local extraId = tonumber(Split(modType, '_')[2])
            SetVehicleExtra(vehicle, extraId, modIndex)
        elseif modsNum >= 0 then
            SetVehicleMod(vehicle, modType, modIndex, false)            
        end

        if modType == 14 then
            if metadata and metadata.ownName then
                LoadData(metadata.ownName, modType == 'colorChameleon')
            end

            isHorning = true
            local playerPed = PlayerPedId()
            TaskLeaveVehicle(playerPed, vehicle, 16)
            local vehicleCoords = GetEntityCoords(vehicle)
            SetEntityCoords(playerPed, vehicleCoords.xy, vehicleCoords.z - 3.0)
            Wait(100)
            StartVehicleHorn(vehicle, 1500, GetHashKey('HELDDOWN'), false)
            Wait(1500)
            SetEntityCoords(playerPed, vehicleCoords.xy, vehicleCoords.z - 0.5)
            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
            isHorning = false
        elseif modType == 39 then
            SetVehicleDoorOpen(vehicle, 4, false, true)
        elseif modType == 40 then
            SetVehicleDoorOpen(vehicle, 4, false, true)
        elseif modType == 41 then
            SetVehicleDoorOpen(vehicle, 4, false, true)
        end
    end

    if modType ~= 14 and metadata and metadata.ownName then
        LoadData(metadata.ownName, modType == 'colorChameleon')
    end
end

function UpdateCustomsColor(data)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle == 0 then return end

    local modType = nil
    local colors = nil
    
    if data.primary then
        modType = 'colorPrimary'

        local r, g, b = table.unpack(data.primary)
        local pR, pG, pB = GetVehicleCustomPrimaryColour(vehicle)

        if r == pR and g == pG and b == pB then return end

        local primary, secondary = GetVehicleColours(vehicle)

        if primary > 160 then
            SetVehicleColours(vehicle, 0, secondary)
        end
        
        SetVehicleCustomPrimaryColour(vehicle, r, g, b)
        colors = {r, g, b}
    elseif data.secondary then
        modType = 'colorSecondary'

        local r, g, b = table.unpack(data.secondary)
        local sR, sG, sB = GetVehicleCustomSecondaryColour(vehicle)

        if r == sR and g == sG and b == sB then return end

        local primary, secondary = GetVehicleColours(vehicle)

        if secondary > 160 then
            SetVehicleColours(vehicle, primary, 0)
        end

        SetVehicleCustomSecondaryColour(vehicle, r, g, b)
        colors = {r, g, b}
    elseif data.xenonColor then
        modType = 'modXenon'
        local r, g, b = table.unpack(data.xenonColor)
        local _, xR, xG, xB = GetVehicleXenonLightsCustomColor(vehicle)

        if r == xR and g == xG and b == xB then return end

        ToggleVehicleMod(vehicle, 22, true)
        
        SetVehicleXenonLightsCustomColor(vehicle, r, g, b)
        SetVehicleLights(vehicle, 2)
    elseif data.neonColor then
        modType = 'neonColor'
        local r, g, b = table.unpack(data.neonColor)
        local nR, nG, nB = GetVehicleNeonLightsColour(vehicle)

        if r == nR and g == nG and b == nB then return end

        SetVehicleNeonLightEnabled(vehicle, 0, true)
        SetVehicleNeonLightEnabled(vehicle, 1, true)
        SetVehicleNeonLightEnabled(vehicle, 2, true)
        SetVehicleNeonLightEnabled(vehicle, 3, true)
        
        SetVehicleNeonLightsColour(vehicle, r, g, b)
    elseif data.tyreColor then
        modType = 'tyreSmokeColor'
        local r, g, b = table.unpack(data.tyreColor)
        local tR, tG, tB = GetVehicleTyreSmokeColor(vehicle)

        if r == tR and g == tG and b == tB then return end
        
        ToggleVehicleMod(vehicle, 20, true)
        SetVehicleTyreSmokeColor(vehicle, r, g, b)
    elseif data.wheelColor then
        modType = 'wheelColor'
        local wheelColorIndex = GetExtraColorIndex(data.wheelColor)
        local pearlescentColor, currentWheelColorIndex = GetVehicleExtraColours(vehicle)

        if currentWheelColorIndex == wheelColorIndex then return end

        SetVehicleExtraColours(vehicle, pearlescentColor, wheelColorIndex)
    elseif data.pearlescentColor then
        modType = 'pearlescentColor'
        local pearlescentColor = GetExtraColorIndex(data.pearlescentColor)
        local currentPearlescentColor, wheelColorIndex = GetVehicleExtraColours(vehicle)

        if currentPearlescentColor == pearlescentColor then return end

        SetVehicleExtraColours(vehicle, pearlescentColor, wheelColorIndex) 
    elseif data.interiorColor then
        modType = 'interiorColor'
        local interiorColorIndex = GetExtraColorIndex(data.interiorColor)
        local currentInteriorColorIndex = GetVehicleInteriorColor(vehicle)

        if currentInteriorColorIndex == interiorColorIndex then return end

        SetVehicleInteriorColor(vehicle, interiorColorIndex)
    end

    if not modType then return end

    local isFound = false
    for index, v in ipairs(Customizing) do
        if v.modType == modType then
            isFound = true
            v.colors = colors
            break
        end
    end

    if not isFound then
        local mainMenus = IsInColorCustom and Config.ColorCustomMenus or Config.Menus
        local parentName, ownName, children = FindOption(mainMenus, data.ownName)
        if not children then return end
        
        local modItems = GetModItemsMenu(children, false)
        local price = Config.Callback.ReplacePrice(modItems[1] and modItems[1].price or 0)

        Customizing[#Customizing + 1] = {
            modType = modType,
            price = price,
            label = children.Label,
            colors = colors
        }

        LoadCustomizing()
    end
end
RegisterNUICallback('updateCustomsColor', UpdateCustomsColor)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end

    Config.Callback.HideHelpText()
    DeleteObject(CurrentItemData.Entity)

    for _, v in ipairs(PedList) do
        DeletePed(v)
    end
end)

RegisterNUICallback('purchaseItem', function(data)
    if not (data.shopMenu and data.itemName) then return end

    local itemData = nil

    for _, shop in ipairs(Config.ShopMenu) do
        if shop.Name == data.shopMenu then
            for _, item in ipairs(shop.Items) do
                if item.Name == data.itemName then
                    itemData = item

                    break
                end
            end
            break
        end
    end

    if not itemData then 
        return Config.Callback.Notify('script_error')
    end

    if exports['zobyeteam_wrapper']:GetPlayerAccount('money') < itemData.Price then
        return Config.Callback.Notify('not_enough_money')
    end

    TriggerServerEvent('zobyeteam_carcustoms:purchaseItem', itemData.Name, itemData.Price)
end)

function GetExtraColorIndex(color)
    local closestIndex = 0
    local closestNum = nil

    for index, v in ipairs(colorsData) do
        local diff = #(vector3(color[1], color[2], color[3]) - vector3(v[1], v[2], v[3]))

        if not closestNum or diff < closestNum then
            closestNum = diff
            closestIndex = index
        end
    end

    return closestIndex - 1
end

function FindOption(options, targetName, parentName)
    for _, option in ipairs(options) do
        if option.Name == targetName then
            return parentName, targetName, option
        elseif option.Options then
            local parentName, ownName, children = FindOption(option.Options, targetName, option.Name)
            if children then
                return parentName, ownName, children
            end
        end
    end
end