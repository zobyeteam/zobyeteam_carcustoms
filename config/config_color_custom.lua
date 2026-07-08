--[[
    
    ZOBYETEAM_CARCUSTOMS
    Version : 2.0.4
    Written By : ZOBYETEAM
    This system is copyrighted.
    ( ระบบนี้ได้ทำการจดทะเบียนลิขสิทธิ์เรียบร้อย )

]]

Config = Config or {}

Config.ColorCustomPrice = 1000                                  -- Price of the color custom

Config.ColorCustomLocations = {                                 -- List of color custom locations
    {
        Coords = vector3(-232.2205, -1335.1777, 29.8894),       -- Position of the color custom
        Radius = 4.0,                                           -- Radius of the color custom
        SprayCoords = {                                         -- Position of the spray (automatically face the vehicle)
            vector3(-234.1909, -1332.0620, 32.5),
            vector3(-234.1286, -1338.3987, 32.5),
            vector3(-229.9341, -1338.4122, 32.5),
            vector3(-229.6891, -1332.0302, 32.5),
            vector3(-234.5832, -1335.2815, 30.8894),
            vector3(-229.8439, -1335.2799, 30.8894)
        },
        Blip = {                                                -- Blip config                           
            Text = 'Color custom',                                   -- Blip text
            Sprite = 72,                                        -- Blip sprite https://docs.fivem.net/docs/game-references/blips/
            Scale = 0.8,                                        -- Blip scale
            Color = 1,                                          -- Blip color https://docs.fivem.net/docs/game-references/blips/
        },
        Marker = {
            Show = true,                                            -- Show marker ?
            Type = 27,                                              -- Marker type https://docs.fivem.net/docs/game-references/markers/
            Color = vector3(0, 255, 0),                             -- Marker color (R, G, B)
            Alpha = 100,                                            -- Marker alpha 0 - 255
        }
    },
    {
        Coords = vector3(-196.2369, -1304.4513, 30.3005),       -- Position of the color custom
        Radius = 4.0,                                           -- Radius of the color custom
        SprayCoords = {                                         -- Position of the spray (automatically face the vehicle)
            vector3(-196.5798, -1306.9152, 31.2705),
        },
        Blip = {                                                -- Blip config                           
            Text = 'Color custom',                                   -- Blip text
            Sprite = 72,                                        -- Blip sprite https://docs.fivem.net/docs/game-references/blips/
            Scale = 0.8,                                        -- Blip scale
            Color = 1,                                          -- Blip color https://docs.fivem.net/docs/game-references/blips/
        },
        Marker = {
            Show = true,                                            -- Show marker ?
            Type = 27,                                              -- Marker type https://docs.fivem.net/docs/game-references/markers/
            Color = vector3(0, 255, 0),                             -- Marker color (R, G, B)
            Alpha = 100,                                            -- Marker alpha 0 - 255
        }
    },
}

Config.ColorCustomMenus = {
    {
        Name = 'ColorChameleon',
        Label = 'Color Chameleon',
        Image = '',
        ModType = 'colorChameleon',
        PriceMultiplier = 1.5
    },
    {
        Name = 'ColorPrimaryType',
        Label = 'Color Primary Type',
        Image = 'https://cdn.discordapp.com/attachments/1079080782804549642/1196475606771175454/image.png?ex=65b7c3be&is=65a54ebe&hm=906eafb177edeb8bf647998ca66fd8bfd9dc924ea3cf31aa3dcf5e836e8b1e18&',
        ModType = 'colorPrimaryType',
        PriceMultiplier = 1.5
    },
    {
        Name = 'ColorSecondaryType',
        Label = 'Color Secondary Type',
        Image = 'https://cdn.discordapp.com/attachments/1079080782804549642/1196475606771175454/image.png?ex=65b7c3be&is=65a54ebe&hm=906eafb177edeb8bf647998ca66fd8bfd9dc924ea3cf31aa3dcf5e836e8b1e18&',
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

-- Just to show on ui
Config.ChameleonColors = {
    {
        '#421a16',
        '#603327'
    },
    {
        '#32141a',
        '#6b4d56'
    },
    {
        '#531448',
        '#44385f'
    },
    {
        '#15226a',
        '#506ab2'
    },
    {
        '#155d3f',
        '#3c7a48'
    },
    {
        '#64884e',
        '#627b55'
    },
    {
        '#d9be87',
        '#b47c48'
    },
    {
        '#9a8d57',
        '#726549'
    },
    {
        '#c9c1a1',
        '#8e8062'
    },
    {
        '#dbcd93',
        '#bea257'
    },
    {
        '#d6ce58',
        '#7cae60'
    },
    {
        '#a2a61a',
        '#73635e'
    },
    {
        '#af983c',
        '#4e333b'
    },
    {
        '#56934a',
        '#343b46'
    },
    {
        '#8da75e',
        '#482f47'
    },
    {
        '#578d5b',
        '#423242'
    },
    {
        '#588554',
        '#612c31'
    },
    {
        '#5f8553',
        '#483135'
    },
    {
        '#466865',
        '#a15f6b'
    },
    {
        '#524865',
        '#a35853'
    },
    {
        '#412e57',
        '#234040'
    },
    {
        '#8b2780',
        '#733e4b'
    },
    {
        '#ba257e',
        '#2f3432'
    },
    {
        '#966425',
        '#923a43'
    },
    {
        '#b46f30',
        '#83415e'
    },
    {
        '#8f2a37',
        '#858744'
    },
    {
        '#5a786f',
        '#9d3c5d'
    },
    {
        '#7b2553',
        '#7e554b'
    },
    {
        '#9b2b2f',
        '#663856'
    },
    {
        '#c06322',
        '#6c3738'
    },
    {
        '#ed8f1d',
        '#593b60'
    },
    {
        '#9f6425',
        '#312b48'
    },
    {
        '#a58f78',
        '#4d2c4d'
    },
    {
        '#3a1231',
        '#182925'
    },
    {
        '#280f2a',
        '#19373a'
    },
    {
        '#0f271f',
        '#26241c'
    },
    {
        '#101e30',
        '#1c1d23'
    },
    {
        '#081f37',
        '#17151b'
    },
    {
        '#2c0f25',
        '#26404f'
    },
    {
        '#270d10',
        '#08212e'
    },
    {
        '#678275',
        '#70788a'
    },
    {
        '#527d7f',
        '#bdd0d3'
    },
    {
        '#9178a1',
        '#788e89'
    },
    {
        '#7e8f82',
        '#ab8798'
    },
    {
        '#949c90',
        '#804d78'
    },
    {
        '#8c7892',
        '#883e71'
    },
    {
        '#969070',
        '#81475d'
    },
    {
        '#689b8a',
        '#68545e'
    },
    {
        '#708694',
        '#634280'
    },
    {
        '#92906e',
        '#844759'
    },
    {
        '#999a9e',
        '#a54c48'
    },
    {
        '#66676c',
        '#45a056'
    },
    {
        '#0c233c',
        '#b15a4f'
    },
    {
        '#210c3a',
        '#38858b'
    },
    {
        '#8e0a6c',
        '#af5b4c'
    },
    {
        '#70090a',
        '#939243'
    },
    {
        '#0b4209',
        '#3da05b'
    },
    {
        '#09090c',
        '#b05450'
    },
    {
        '#1b1516',
        '#36512e'
    },
    {
        '#171916',
        '#46135c'
    },
    {
        '#41374d',
        '#459175'
    },
    {
        '#8d7172',
        '#438e6f'
    },
    {
        '#b6b7b8',
        '#2f2f30'
    },
    {
        '#b9b908',
        '#160f94'
    },
    {
        '#0d1e6c',
        '#740b72'
    },
    {
        '#8c9b24',
        '#256327'
    },
    {
        '#78b8ba',
        '#8f286c'
    },
    {
        '#a94158',
        '#46396e'
    },
    {
        '#809c96',
        '#8b9434'
    },
    {
        '#28809e',
        '#9a5258'
    },
    {
        '#80606d',
        '#2e87a1'
    },
    {
        '#546b13',
        '#701515'
    },
    {
        '#200f42',
        '#8d4d0b'
    },
    {
        '#8a9d9c',
        '#b09324'
    },
    {
        '#226e68',
        '#7816a4'
    },
    {
        '#0fabad',
        '#b62f2f'
    },
    {
        '#910f0f',
        '#113311'
    },
    {
        '#b79b06',
        '#05278f'
    },
    {
        '#abaa2d',
        '#8f0918'
    },
    {
        '#9e8cab',
        '#463650'
    },
    {
        '#89a54c',
        '#32615c'
    },
    {
        '#7ea3b2',
        '#37515f'
    },
}
