--[[
    
    ZOBYETEAM_CARCUSTOMS
    Version : 2.0.4
    Written By : ZOBYETEAM
    This system is copyrighted.
    ( ระบบนี้ได้ทำการจดทะเบียนลิขสิทธิ์เรียบร้อย )

]]

Config = Config or {}

Config.StancerPrice = 1000                                              -- Price of stancer customs
Config.SyncToEveryone = true                                            -- If true will sync stancer to everyone but will run harder

Config.AutoApplyStancer = true                                         -- Auto apply stancer to vehicle that just spawned if set to false you can use exports function 'LoadVehicleStancer' to load it

Config.ShowStancerMarker = true                                         -- Show stancer marker ?
Config.StancerLocations = {                                             -- List of stancer locations
    {
        Coords = vector3(-221.9935, -1329.4708, 29.9904),               -- Position of stancer custom
        Radius = 2.5,                                                   -- Radius to open stancer custom
        Blip = {                                                        -- Blip config
            Text = 'Stancer custom',
            Sprite = 72,
            Scale = 0.8,
            Color = 1,
        },
        Marker = {
            Show = true,                                            -- Show marker ?
            Type = 27,                                              -- Marker type https://docs.fivem.net/docs/game-references/markers/
            Color = vector3(0, 255, 0),                             -- Marker color (R, G, B)
            Alpha = 100,                                            -- Marker alpha 0 - 255
        }
    },
    {
        Coords = vector3(-359.7253, -916.8883, 29.0806),
        Radius = 2.5,
        Blip = {                                                             
            Text = 'Stancer custom',
            Sprite = 72,
            Scale = 0.8,
            Color = 1,
        },
        Marker = {
            Show = true,                                            -- Show marker ?
            Type = 27,                                              -- Marker type https://docs.fivem.net/docs/game-references/markers/
            Color = vector3(0, 255, 0),                             -- Marker color (R, G, B)
            Alpha = 100,                                            -- Marker alpha 0 - 255
        }
    },
}

Config.DefaultStancerRanges = {                 -- Default ranges of stancer
    SuspensionHeight = { -0.3, 0.3 },           -- {min, max}
    WheelsOffset = { 0.6, 1.05 },               -- {min, max}
    WheelsYRotation = { -0.3, 0.3 },            -- {min, max}
    WheelWidth = { 0.25, 0.9 },                 -- {min, max}
    WheelSize = { 0.5, 0.9 },                   -- {min, max}
}
Config.StancerRanges = {                       -- Config ranges of stancer for specific vehicle model
    {
        Model = 'elegy',                       -- Model to set the ranges 
        Ranges = {
            SuspensionHeight = { -0.3, 0.3 },  -- {min, max}
            WheelsOffset = { 0.6, 1.05 },      -- {min, max}
            WheelsYRotation = { -0.3, 0.3 },   -- {min, max}
            WheelWidth = { 0.25, 0.9 },        -- {min, max}
            WheelSize = { 0.5, 0.9 },          -- {min, max}
        }
    },
}