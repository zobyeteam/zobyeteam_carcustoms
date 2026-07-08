--[[
    
    ZOBYETEAM_CARCUSTOMS
    Version : 2.0.4
    Written By : ZOBYETEAM
    This system is copyrighted.
    ( ระบบนี้ได้ทำการจดทะเบียนลิขสิทธิ์เรียบร้อย )

]]

fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'ZOBYETEAM'
description 'Most complate car customs By ZOBYETEAM'
version '2.0.4'

shared_scripts {
	'config/config.lua',
	'config/config_items.lua',
	'config/config_color_custom.lua',
	'config/config_stancer.lua',
}

client_scripts {
	'config/config_label.lua',
	'config/config_shop.lua',
	'config/config_colors.lua',
	'config/functions/config_callback_client.lua',

	'client/lib.lua',
	'client/main.lua',
	'client/stancer.lua',
	'client/color_custom.lua',
}

server_script {
	'@oxmysql/lib/MySQL.lua',
	'config/config_auth.lua',
	'config/functions/config_callback_server.lua',
    	'server/main.lua',
}

dependencies {
	'zobyeteam_wrapper',
	'oxmysql',
}

ui_page 'interface/index.html'

files {
	'interface/**'
}

escrow_ignore {
	'client/lib.lua',
	'config/**',
}
