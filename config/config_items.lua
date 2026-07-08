--[[
    
    ZOBYETEAM_CARCUSTOMS
    Version : 2.0.4
    Written By : ZOBYETEAM
    This system is copyrighted.
    ( ระบบนี้ได้ทำการจดทะเบียนลิขสิทธิ์เรียบร้อย )

]]

Config = Config or {}

Config.RaiseVehicleProp = 'prop_carjack_l2'                 -- Prop model that will raises the vehicle

Config.Items = {                                            -- List of items that can be used
    {
        ItemName = 'bread',                                 -- Name of the item
        Label = 'Primary color',                                     -- Label of the item
        ModType = 'colorPrimary',                           -- Mod Type of the item
        ModData = 1,                                        -- ModIndex of the item
        Prop = {                                            -- Prop config
            Model = 'prop_paint_spray01a',                  -- Prop model
            Rotation = vector3(0.0, 0.0, 0.0),              -- Prop rotation
            Coords = vector3(0.02, 0.05, -0.1),             -- Prop offset
        }
    },         
    {
        ItemName = 'cement_0',
        Label = 'Sport wheel',
        ModType = 23,
        WheelType = 'Sport',                                  -- only for wheel (modType = 23) (Sync with WheelType in Config.Menus) 
        ModData = 6,
        Prop = {
            Model = 'prop_tornado_wheel',
            Rotation = vector3(0.0, 0.0, 0.0),
            Coords = vector3(0.125, 0.0, -0.25),
        }                             
    },
    {
        ItemName = 'cement_1',
        Label = 'Spoiler 2',
        ModType = 0,
        ModData = 3,
        Prop = {
            Model = 'imp_prop_impexp_spoiler_03a',
            Rotation = vector3(0.0, 80.0, 0.0),
            Coords = vector3(0.0, 0.0, 0.0),
        }
    },
    {
        ItemName = 'buzz',
        Label = 'Engine LV2',
        ModType = 11,
        ModData = 1,
        Prop = {
            Model = 'prop_car_engine_01',
            Rotation = vector3(0.0, 0.0, 0.0),
            Coords = vector3(0.25, 0.0, -0.5),
        }
    },
    -- {
    --     ItemName = 'bread',
    --     Label = 'สีหลัก',
    --     ModType = 'colorSecondary',
    --     ModData = 1,
    --     Prop = {
    --         Model = 'prop_paint_spray01a',
    --         Rotation = vector3(0.0, 0.0, 0.0),
    --         Coords = vector3(0.02, 0.05, -0.1),
    --     }
    -- },
    -- {
    --     ItemName = 'bread',
    --     Label = 'สีล้อ',
    --     ModType = 'wheelColor',
    --     ModData = 1,
    --     Prop = {
    --         Model = 'prop_paint_spray01a',
    --         Rotation = vector3(0.0, 0.0, 0.0),
    --         Coords = vector3(0.02, 0.05, -0.1),
    --     }
    -- },
}