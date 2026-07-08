--[[
    
    ZOBYETEAM_CARCUSTOMS
    Version : 2.0.4
    Written By : ZOBYETEAM

]]

Config = Config or {}

Config.Callback = {}

Config.Callback.Notify = function(type)  -- client side   

end

Config.Callback.OpenedUI = function()

end

Config.Callback.ClosedUI = function()
    
end

Config.Callback.ShowHelpText = function(text, description)  -- client side
    -- exports['zobyeteam_helptext']:visible(text, description, 'carcustoms')
end

Config.Callback.HideHelpText = function()   -- client side
    -- exports['zobyeteam_helptext']:hidden('carcustoms')
end

Config.Callback.UseCustomProgbar = false

Config.Callback.Progbar = function(name, label, duration)   -- client side 
    exports['zobyeteam_progbar']:play(name, label, duration)
end

Config.Callback.IsOwnedVehicle = function(plate) -- client side    
    local vehicleList = exports['zobyeteam_garage']:getVehicleList()

    for _, vehicle in ipairs(vehicleList) do
        if vehicle.plate == plate then
            return true
        end
    end
    
    return false
end

-- If you don't know about it, Should not touch this config
Config.Callback.ReplaceMenuData = function(table)
    -- If edit please clone table for sure

    -- for _, v in ipairs(table) do
    --     if v.price then
    --         v.price = v.price
    --     end
    -- end

    return table
end

Config.Callback.ReplacePrice = function(price)  -- client side Should be returned price to replace normal price such as price discount
    return price
end

Config.Callback.CustomsSuccess = function(vehicle, price, payType, plate, customizedList)

end