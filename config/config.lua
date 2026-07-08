--[[
    
    ZOBYETEAM_CARCUSTOMS
    Version : 2.0.4
    Written By : ZOBYETEAM
    This system is copyrighted.
    ( ระบบนี้ได้ทำการจดทะเบียนลิขสิทธิ์เรียบร้อย )

]]

Config = Config or {}

Config.UseDebugMode = false         --  Use to set camera view data such as ZRotation, YRotation, Radius
Config.Font = 'Prompt'
Config.ItemImagePath = 'nui://zobyeteam_inventory/interface/image/items/'

Config.ControlKeys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Config.UseIsControlJustPressed = false -- true = IsControlJustPressed, false = RegisterKeyMapping
Config.Keys = {
    OpenCustom = 'E',                -- Key to open custom menu
    ApplyCustom = 'E',               -- Key to apply custom item
    OpenShop = 'E',                  -- Key to open custom shop
    CancelUsedItem = 'X',            -- Key to cancel custom item
    ResetCamera = 'R',               -- Key to reset camera view
    ToggleNuiFocus = 'G',            -- Key to toggle nui focus
    OpenStancer = 'E',               -- Key to open stancer menu
    OpenColorCustoms = 'E'           -- Key to open color custom menu
}

Config.ToolTip = {
    Show = true,                                  -- Show tool tip ?
    ApplyCustom = 'Press E to apply item custom', -- Apply custom item tooltip text
    OpenShop = 'Press E to open shop',            -- Open shop tooltip text
}

Config.HelpText = {                 
    Show = true,                                -- Show help text ?
    OpenCustom = {
        key = 'E',                              -- Key to open custom
        description = 'TO CUSTOM'               -- Description of key to open custom
    },
    CancelUsedItem = {
        key = 'X',
        description = 'TO CANCEL'
    },
    OpenStancer = {
        key = 'E',
        description = 'TO OPEN'
    },
    OpenColorCustoms = {
        key = 'E',
        description = 'TO OPEN'
    }
}

Config.SellerName = 'ZOBYETEAM'                 -- Seller name to show on UI 

Config.CustomizeDuration = 10000
Config.SprayDuration = 10000

Config.RadiusToDrawMarker = 50                  -- Distance to start drawing marker

Config.OwnedVehiclesOnly = false                -- Only owned vehicle can be customized
Config.UseIsOwnedVehicleCallback = false        -- If true will use "IsOwnedVehicle" function in config_callback_client to check but if false will use Server Callback to check on Database (true will have better performance)

Config.BankCharge = 5                           -- Bank charge (%)
Config.JobDiscounts = {                         -- Discount for job (%)
	['ambulance'] = 10,
	['police'] = 20,
}

Config.Locations = {
    {
        Coords = vector3(-211.8160, -1323.5219, 29.9904),         -- Position of custom shop
        Radius = 3,                                              -- Radius to open car custom 
        Job = nil,                                               -- Config job that can use if Job = nil mean all player can use
        Blip = {                                                 -- Blip config
            Text = 'Car Custom',                                     -- Blip text
            Sprite = 72,                                         -- Blip sprite https://docs.fivem.net/docs/game-references/blips/
            Scale = 0.8,                                         -- Blip scale
            Color = 1,                                           -- Blip color https://docs.fivem.net/docs/game-references/blips/
        },
        Marker = {
            Show = true,                                            -- Show marker ?
            Type = 27,                                              -- Marker type https://docs.fivem.net/docs/game-references/markers/
            Color = vector3(0, 255, 0),                             -- Marker color (R, G, B)
            Alpha = 100,                                            -- Marker alpha 0 - 255
        }
    },
    {
        Coords = vector3(0, 0, 0),                                  
        Radius = 3,                                                 
        Job = 'police',                                                  
        Blip = {                                                             
            Text = 'Police\'s car custom',
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

Config.AutoSaveProps = true                                          -- Auto save vehicle properties after purchased
Config.CanCustomAllVehicle = true                                    -- Can custom all vehicle even though it's not in Config.Vehicles
Config.DefaultPrice = 1000                                           -- Default base price if not in Config.Vehicles
Config.Vehicles = {                                                  -- Config vehicle that can custom
    {
        Name = 'outlaw',                                             -- Model of vehicle that can custom
        Price = 1500,                                                -- Base price 
    },
    {
        Name = 'elegy',
        Price = 1500,
    },
    {
        Name = 'italigtb',
        Price = 2500,
    },
    {
        Name = 'IWAGEN',
        Price = 1500,
    },
    {
        Name = 't20',
        Price = 3000,
    },
}

-- This Config.FixedPrice priority is more than PriceMultiplier in Config.Menus
Config.FixedPrice = {
    {
        Vehicles = {
            'elegy',
            't20'
        },
        Prices = {
            ['Engine'] = 1100,                                      -- Set by Name of mod
        }
    }
}

Config.Menus = {
    {
        Name = 'Performance',                                        -- Name of custom type (If it's not necessary, don't change it.)
        Label = 'Performance',                                       -- Label to show on UI 
        Image = '',
        Options = {                                                  -- Submenu options
            {
                Name = 'Engine',                                     -- Name of custom type (If it's not necessary, don't change it.)
                Label = 'Engine',                                    -- Label to show on UI 
                Image = './images/engine.png',
                ModType = 11,                                        -- Mod type
                PriceMultiplier = {1, 2, 2.5, 3, 4, 4.5},             -- Value to multiple Price in Config.Vehicles
            },
            {
                Name = 'Brake',
                Label = 'Brake',
                Image = './images/brake.png',
                ModType = 12,
                PriceMultiplier = {1, 2, 2.5, 3, 4},
            },
            {
                Name = 'Gear',
                Label = 'Gear',
                Image = './images/gear.png',
                ModType = 13,
                PriceMultiplier = {1, 2, 2.5, 3, 4},
            },
            {
                Name = 'Suspension',
                Label = 'Suspension',
                Image = './images/suspension.png',
                ModType = 15,
                PriceMultiplier = {1, 2, 2.5, 3, 4, 4.5, 5},
            },
            {
                Name = 'Armor',
                Label = 'Armor',
                Image = './images/armor.png',
                ModType = 16,
                PriceMultiplier = {1, 2, 2.5, 3, 4, 4.5, 5, 6},
            },
            {
                Name = 'Turbo',
                Label = 'Turbo',
                Image = './images/turbo.png',
                ModType = 18,
                PriceMultiplier = {1, 2},
            },
        }
    },
    {
        Name = 'Body',
        Label = 'Body',
        Image = '',
        Options = {
            {
                Name = 'Spoiler',
                Label = 'Spoiler',
                Image = './images/spoiler.png',
                ModType = 0,
                PriceMultiplier = 2.65,
                Camera = {                                                -- Camera view settings
                    ZRotation = -70.0,                                    -- Rotation of Z axis
                    YRotation = 22.5,                                     -- Rotation of Y axis
                    Radius = 3.1,                                         -- Distance between vehicle and player view
                }
            },
            {
                Name = 'Bumper',
                Label = 'Bumper',
                Image = '',
                Options = {
                    {
                        Name = 'FrontBumper',
                        Label = 'Front Bumper',
                        Image = './images/front-bumper.png',
                        ModType = 1,
                        PriceMultiplier = 2.12,
                        Camera = {
                            ZRotation = 90.0,
                            YRotation = 5.5,
                            Radius = 3.35,
                        }
                    },
                    {
                        Name = 'RearBumper',
                        Label = 'Rear Bumper',
                        Image = './images/rear-bumper.png',
                        ModType = 2,
                        PriceMultiplier = 2.12,
                        Camera = {
                            ZRotation = -90.0,
                            YRotation = 12.0,
                            Radius = 3.5,
                        }
                    },
                }
            },
            {
                Name = 'Schafter',
                Label = 'Side Skirt',
                Image = './images/side-skirt.png',
                ModType = 3,
                PriceMultiplier = 2.65,
                Camera = {
                    ZRotation = -150.0,
                    YRotation = 13.0,
                    Radius = 2.3,
                }
            },
            {
                Name = 'Intake',
                Label = 'Exhaust',
                Image = './images/exhaust.png',
                ModType = 4,
                PriceMultiplier = 2.12,
                Camera = {
                    ZRotation = -90.0,
                    YRotation = 0.0,
                    Radius = 3.0,
                }
            },
            {
                Name = 'ExtraCage',
                Label = 'Extra Cage',
                Image = './images/extra-cage.png',
                ModType = 5,
                PriceMultiplier = 2.12,
                Camera = {
                    ZRotation = 67.8,
                    YRotation = 24.0,
                    Radius = 1.8,
                }
            },
            {
                Name = 'WireMesh',
                Label = 'Wire Mesh',
                Image = './images/wire-mesh.png',
                ModType = 6,
                PriceMultiplier = 2.72,
                Camera = {
                    ZRotation = 110.5,
                    YRotation = 6.5,
                    Radius = 3.35,
                }
            },
            {
                Name = 'Hood',
                Label = 'Hood',
                Image = './images/hood.png',
                ModType = 7,
                PriceMultiplier = 2.88,
                Camera = {
                    ZRotation = 110.0,
                    YRotation = 23.5,
                    Radius = 3.25,
                }
            },
            {
                Name = 'LeftFender',
                Label = 'Left Fender',
                Image = './images/fender.png',
                ModType = 8,
                PriceMultiplier = 2.12,
                Camera = {
                    ZRotation = -145.0,
                    YRotation = 17.5,
                    Radius = 3.25,
                }
            },
            {
                Name = 'RightFender',
                Label = 'Right Fender',
                Image = './images/fender.png',
                ModType = 9,
                PriceMultiplier = 2.12,
                Camera = {
                    ZRotation = -145.0,
                    YRotation = 17.5,
                    Radius = 3.25,
                }
            },
            {
                Name = 'Roof',
                Label = 'Roof',
                Image = './images/roof.png',
                ModType = 10,
                PriceMultiplier = 2.58,
                Camera = {
                    ZRotation = 206.5,
                    YRotation = 45,
                    Radius = 2.85,
                }
            },
            {
                Name = 'CurvedCover',
                Label = 'Curved Cover',
                Image = './images/curved-cover.png',
                ModType = 42,
                PriceMultiplier = 4.19,
                Camera = {
                    ZRotation = 90.0,
                    YRotation = 10.0,
                    Radius = 3.5,
                }
            },
            {
                Name = 'Antenna',
                Label = 'Antenna',
                Image = './images/antenna.png',
                ModType = 43,
                PriceMultiplier = 1.12,
                Camera = {
                    ZRotation =90.0,
                    YRotation = 22.0,
                    Radius = 2.95,
                }
            },
            {
                Name = 'Wing',
                Label = 'Wing',
                Image = './images/wing.png',
                ModType = 44,
                PriceMultiplier = 6.05,
                Camera = {
                    ZRotation = 50.0,
                    YRotation = 46.5,
                    Radius = 2.05,
                }
            },
            {
                Name = 'Window',
                Label = 'Window',
                Image = './images/window.png',
                ModType = 46,
                PriceMultiplier = 1.0,
                Camera = {
                    ZRotation = 145.0,
                    YRotation = 27.0,
                    Radius = 2.0,
                }
            },
        }
    },
    {
        Name = 'Inside',
        Label = 'Inside',
        Image = '',
        Options = {
            {
                Name = 'ControlPanel',
                Label = 'Control Panel',
                Image = './images/control-panel.png',
                ModType = 29,
                PriceMultiplier = 1.5,
                Camera = {
                    ZRotation = -90.0,
                    YRotation = 37.5,
                    Radius = 1.25,
                }
            },
            {
                Name = 'Console',
                Label = 'Console',
                Image = './images/console.png',
                ModType = 30,
                PriceMultiplier = 1.5,
                Camera = {
                    ZRotation = -90.0,
                    YRotation = 40.5,
                    Radius = 1.05,
                }
            },
            {
                Name = 'Speaker',
                Label = 'Speaker',
                Image = './images/speaker.png',
                ModType = 31,
                PriceMultiplier = 1.5,
                Camera = {
                    ZRotation = -90.0,
                    YRotation = 85.4,
                    Radius = 1.0,
                }
            },
            {
                Name = 'Seat',
                Label = 'Seat',
                Image = './images/seat.png',
                ModType = 32,
                PriceMultiplier = 1.5,
                Camera = {
                    ZRotation = 90.0,
                    YRotation = 51.9,
                    Radius = 1.0,
                }
            },
            {
                Name = 'InteriorColor',
                Label = 'Interior Color',
                Image = '',
                ModType = 'interiorColor',
                PriceMultiplier = 1.5,
                Camera = {
                    ZRotation = 90.0,
                    YRotation = 51.9,
                    Radius = 1.0,
                }
            },
            {
                Name = 'SteeringWheel',
                Label = 'Steering Wheel',
                Image = './images/steering-wheel.png',
                ModType = 33,
                PriceMultiplier = 1.5,
                Camera = {
                    ZRotation = -70.0,
                    YRotation = 40.5,
                    Radius = 1.05,
                }
            },
            {
                Name = 'GearLever',
                Label = 'Gear Lever',
                Image = './images/gear-lever.png',
                ModType = 34,
                PriceMultiplier = 1.5,
                Camera = {
                    ZRotation = -90.0,
                    YRotation = 49.9,
                    Radius = 1,
                }
            },
            {
                Name = 'Accessories',
                Label = 'Accessories',
                Image = './images/accessories.png',
                ModType = 28,
                PriceMultiplier = 1.5
            },
        }
    },
    {
        Name = 'Outside',
        Label = 'Outside',
        Image = '',
        Options = {
            {
                Name = 'Respray',
                Label = 'Respray',
                Image = '',
                Options = {
                    {
                        Name = 'ColorChameleon',
                        Label = 'Color Chameleon',
                        Image = '',
                        ModType = 'colorChameleon',
                        PriceMultiplier = 1.5
                    },
                    {
                        Name = 'PearlescentColor',
                        Label = 'Pearlescent Color',
                        Image = '',
                        ModType = 'pearlescentColor',
                        PriceMultiplier = 1.5
                    },
                    {
                        Name = 'ColorPrimaryType',
                        Label = 'Color Primary Type',
                        Image = './images/color.png',
                        ModType = 'colorPrimaryType',
                        PriceMultiplier = 1.5
                    },
                    {
                        Name = 'ColorSecondaryType',
                        Label = 'Color Secondary Type',
                        Image = './images/color.png',
                        ModType = 'colorSecondaryType',
                        PriceMultiplier = 1.5
                    },
                    {
                        Name = 'ColorPrimary',
                        Label = 'Color Primary',
                        Image = '',
                        ModType = 'colorPrimary',
                        PriceMultiplier = 1.5
                    },
                    {
                        Name = 'ColorSecondary',
                        Label = 'Color Secondary',
                        Image = '',
                        ModType = 'colorSecondary',
                        PriceMultiplier = 1.5
                    },
                }
            },
            {
                Name = 'Lights',
                Label = 'Lights',
                Image = '',
                Options = {
                    {
                        Name = 'Xenon',
                        Label = 'Xenon Light',
                        Image = '',
                        ModType = 'modXenon',
                        PriceMultiplier = 0.1
                    },
                    {
                        Name = 'Neon',
                        Label = 'Neon Light',
                        Image = '',
                        ModType = 'neonColor',
                        PriceMultiplier = 1.12
                    },
                }
            },
            {
                Name = 'TyreSmokeColor',
                Label = 'Tyre Smoke Color',
                Image = '',
                ModType = 'tyreSmokeColor',
                PriceMultiplier = 1.65
            },
        }
    },
    {
        Name = 'Customization',
        Label = 'Customization',
        Image = '',
        Options = {
            {
                Name = 'WindowTint',
                Label = 'Window Tint',
                Image = './images/window-tint.png',
                ModType = 'windowTint',
                PriceMultiplier = 1.5,
            },
            {
                Name = 'Horn',
                Label = 'Horn',
                Image = './images/horn.png',
                ModType = 14,
                PriceMultiplier = 1.12,
            },
            {
                Name = 'TrimDesign',
                Label = 'Trim Design',
                Image = './images/trim.png',
                ModType = 27,
                PriceMultiplier = 6.98,
            },
            {
                Name = 'Plaques',
                Label = 'Plaques',
                Image = './images/plaques.png',
                ModType = 35,
                PriceMultiplier = 4.19,
            },
            {
                Name = 'Speakers',
                Label = 'Speakers',
                Image = './images/speakers.png',
                ModType = 36,
                PriceMultiplier = 1.5,
            },
            {
                Name = 'Trunk',
                Label = 'Trunk',
                Image = './images/trunk.png',
                ModType = 37,
                PriceMultiplier = 1.5,
            },
            {
                Name = 'Hydraulics',
                Label = 'Hydraulics',
                Image = './images/hydraulics.png',
                ModType = 38,
                PriceMultiplier = 1.5,
            },
            {
                Name = 'EngineBlock',
                Label = 'Engine Block',
                Image = './images/engine-block.png',
                ModType = 39,
                PriceMultiplier = 1.5,
            },
            {
                Name = 'AirFilter',
                Label = 'Air Filter',
                Image = './images/air-filter.png',
                ModType = 40,
                PriceMultiplier = 1.5,
            },
            {
                Name = 'Struts',
                Label = 'Struts',
                Image = './images/struts.png',
                ModType = 41,
                PriceMultiplier = 1.5,
            },
            {
                Name = 'GasTank',
                Label = 'Gas Tank',
                Image = './images/gas-tank.png',
                ModType = 45,
                PriceMultiplier = 1.5,
            },
        }
    },
    {
        Name = 'Wheels',
        Label = 'Wheels',
        Image = '',
        Options = {
            {
                Name = 'WheelsType',
                Label = 'Wheels Type',
                Image = '',
                Options = {
                    {
                        Name = 'Sport',
                        Label = 'Sport',
                        Image = './images/wheels.png',
                        ModType = 23,
                        WheelIndex = 0,
                        PriceMultiplier = 1.65,
                        Camera = {
                            ZRotation = 145.0,
                            YRotation = 2.0,
                            Radius = 2.55,
                        },
                    },
                    {
                        Name = 'Muscle',
                        Label = 'Muscle',
                        Image = './images/wheels.png',
                        ModType = 23,
                        WheelIndex = 1,
                        PriceMultiplier = 1.65,
                        Camera = {
                            ZRotation = 145.0,
                            YRotation = 2.0,
                            Radius = 2.55,
                        },
                    },
                    {
                        Name = 'LowRider',
                        Label = 'Low Rider',
                        Image = './images/wheels.png',
                        ModType = 23,
                        WheelIndex = 2,
                        PriceMultiplier = 1.65,
                        Camera = {
                            ZRotation = 145.0,
                            YRotation = 2.0,
                            Radius = 2.55,
                        },
                    },
                    {
                        Name = 'SUV',
                        Label = 'SUV',
                        Image = './images/wheels.png',
                        ModType = 23,
                        WheelIndex = 3,
                        PriceMultiplier = 1.65,
                        Camera = {
                            ZRotation = 145.0,
                            YRotation = 2.0,
                            Radius = 2.55,
                        },
                    },
                    {
                        Name = 'OffRoad',
                        Label = 'OffRoad',
                        Image = './images/wheels.png',
                        ModType = 23,
                        WheelIndex = 4,
                        PriceMultiplier = 1.65,
                        Camera = {
                            ZRotation = 145.0,
                            YRotation = 2.0,
                            Radius = 2.55,
                        },
                    },
                    {
                        Name = 'Tuner',
                        Label = 'Tuner',
                        Image = './images/wheels.png',
                        ModType = 23,
                        WheelIndex = 5,
                        PriceMultiplier = 1.65,
                        Camera = {
                            ZRotation = 145.0,
                            YRotation = 2.0,
                            Radius = 2.55,
                        },
                    },
                    {
                        Name = 'Classic',
                        Label = 'Classic',
                        Image = './images/wheels.png',
                        ModType = 23,
                        WheelIndex = 6,
                        PriceMultiplier = 1.65,
                        Camera = {
                            ZRotation = 145.0,
                            YRotation = 2.0,
                            Radius = 2.55,
                        },
                    },
                    {
                        Name = 'HighEnd',
                        Label = 'High-End',
                        Image = './images/wheels.png',
                        ModType = 23,
                        WheelIndex = 7,
                        PriceMultiplier = 1.65,
                        Camera = {
                            ZRotation = 145.0,
                            YRotation = 2.0,
                            Radius = 2.55,
                        },
                    },
                    {
                        Name = 'BennysOriginal',
                        Label = 'Benny\'s Original',
                        Image = './images/wheels.png',
                        ModType = 23,
                        WheelIndex = 8,
                        PriceMultiplier = 1.65,
                        Camera = {
                            ZRotation = 145.0,
                            YRotation = 2.0,
                            Radius = 2.55,
                        },
                    },
                    {
                        Name = 'BennysBespoke',
                        Label = 'Benny\'s Bespoke',
                        Image = './images/wheels.png',
                        ModType = 23,
                        WheelIndex = 9,
                        PriceMultiplier = 1.65,
                        Camera = {
                            ZRotation = 145.0,
                            YRotation = 2.0,
                            Radius = 2.55,
                        },
                    },
                    {
                        Name = 'OpenWheel',
                        Label = 'Open Wheel',
                        Image = './images/wheels.png',
                        ModType = 23,
                        WheelIndex = 10,
                        PriceMultiplier = 1.65,
                        Camera = {
                            ZRotation = 145.0,
                            YRotation = 2.0,
                            Radius = 2.55,
                        },
                    },
                    {
                        Name = 'Street',
                        Label = 'Street',
                        Image = './images/wheels.png',
                        ModType = 23,
                        WheelIndex = 11,
                        PriceMultiplier = 1.65,
                        Camera = {
                            ZRotation = 145.0,
                            YRotation = 2.0,
                            Radius = 2.55,
                        },
                    },
                    {
                        Name = 'ExtraWheel',
                        Label = 'Extra Wheel',
                        Image = './images/wheels.png',
                        ModType = 23,
                        WheelIndex = 12,
                        PriceMultiplier = 1.65,
                        Camera = {
                            ZRotation = 145.0,
                            YRotation = 2.0,
                            Radius = 2.55,
                        },
                    },
                },
            },
            {
                Name = 'WheelColor',
                Label = 'Wheel Color',
                Image = '',
                ModType = 'wheelColor',
                PriceMultiplier = 1.65
            },
        }
    },
    {
        Name = 'Extras',
        Label = 'Extras',
        Image = './images/extras.png',
        ModType = 'extras',
        PriceMultiplier = 1.1
    },
    {
        Name = 'Plate',
        Label = 'Plate',
        Image = '',
        Options = {
            {
                Name = 'Type',
                Label = 'Type',
                Image = './images/plate.png',
                ModType = 25,
                PriceMultiplier = 1.1
            },
            {
                Name = 'Color',
                Label = 'Color',
                Image = './images/plate.png',
                ModType = 'plateIndex',
                PriceMultiplier = 1.1
            },
            {
                Name = 'Holder',
                Label = 'Holder',
                Image = './images/plate.png',
                ModType = 26,
                PriceMultiplier = 26
            },
        }
    },
    {
        Name = 'Stickers',
        Label = 'Stickers',
        Image = '',
        Options = {
            {
                Name = 'Sticker',
                Label = 'Sticker',
                Image = './images/sticker.png',
                ModType = 48,
                PriceMultiplier = 6.0
            },
            {
                Name = 'Pattern',
                Label = 'Livery',
                Image = './images/livery.png',
                ModType = 'livery',
                PriceMultiplier = 6.0
            },
        }
    },
    -- {
    --     Name = 'Extras',
    --     Label = 'Extras',
    --     ModType = 'extras',
    --     PriceMultiplier = 1.5,
    -- },
}