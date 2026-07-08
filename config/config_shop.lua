--[[
    
    ZOBYETEAM_CARCUSTOMS
    Version : 2.0.4
    Written By : ZOBYETEAM

]]

Config = Config or {}

Config.CustomShopLocations = {                                      -- List of custom shop locations
    {
        Coords = vector4(-214.8523, -1297.5662, 31.2960, 150.7525), -- Position of custom shop
        Radius = 2,                                                 -- Radius to open custom shop
        Job = nil,                                                  -- Config job that can use if Job = nil mean all player can use
        PedModel = 's_m_y_prisoner_01',                                
        Blip = {                                                    -- Blip config
            Text = 'Custom shop',
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
    }    
}

Config.ShopMenu = {                                                 -- Menu of shop
    {
        Name = 'Performance',                                       -- Name of menu
        Items = {                                                   -- Items in shop menu
            {
                Name = 'fixkit',                                     -- Item that receive after buy item
                Label = 'Engine Level 1',                           -- Label to show on UI
                Price = 1000                                        -- Price of item
            },
            {
                Name = 'fixkit_newbie',
                Label = 'Engine Level 2',                           -- if Label = nil will auto get from item data
                Price = 1500
            },
        }
    },
    {
        Name = 'Body',
        Items = {
            {
                Name = 'buzz',
                Label = 'Cruise Spoiler Carbon',
                Price = 2000
            },
        }
    },
    {
        Name = 'Inside',
        Items = {
            {
                Name = 'reskin_card',
                Label = 'Seat 2',   
                Price = 1
            },
        }
    },
    {
        Name = 'Respray',
        Items = {
            {
                Name = 'scuba_gear',
                Label = 'Primary color',      
                Price = 1
            },
        }
    },
    {
        Name = 'WheelsType',
        Items = {
            {
                Name = 'fixkit_newbie',
                Label = 'Sport',    
                Price = 1
            },
        }
    },
    {
        Name = 'WheelColor',
        Items = {
            {
                Name = 'fixkit_newbie',
                Label = 'Wheel color',      
                Price = 1
            },
        }
    },
}