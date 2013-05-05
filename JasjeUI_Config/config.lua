local C = {}

C.general = {
	bordercolor = {.2,.2,.2,1},             
	backdropcolor = {.075,.075,.075,1},       
	altbackdropcolor = {.075,.075,.075,.7},
}

C.media = {
    font = [[Interface\AddOns\JasjeUI\media\fonts\normal_font.ttf]],
	
    dmgfont = [[Fonts\skurri.TTF]],
	pixelfont = [[Interface\AddOns\JasjeUI\media\fonts\HOOG0555.ttf]], 
	pixelfont2 = [[Interface\AddOns\JasjeUI\media\fonts\visitor2.ttf]], 
	pixelfont3 = [[Interface\AddOns\JasjeUI\media\fonts\visitor1.ttf]], 
	pixelfont4 =  [[Interface\AddOns\JasjeUI\media\fonts\Pixelway_Baseline.TTF]], 
	
	ruRUpixel =  [[Interface\AddOns\JasjeUI\media\fonts\ruRU_Pixel.TTF]],
	ruRUpixel2 =  [[Interface\AddOns\JasjeUI\media\fonts\visitor_rus.TTF]], 
	ruRUfontsize = 11,
	
	Glamour =  [[Interface\AddOns\JasjeUI\media\textures\Glamour4.tga]],
	highlight =  [[Interface\AddOns\JasjeUI\media\textures\Highlight.tga]],

	switchlayoutheal = [[Interface\AddOns\JasjeUI\media\textures\switch_layout_heal]], 
	switchlayoutdd = [[Interface\AddOns\JasjeUI\media\textures\switch_layout_dd]], 
	
	warningsound = [[Interface\AddOns\JasjeUI\media\sound\warning.mp3]], 
	
	bordercolor = {.2,.2,.2,1}, 
	datatextcolor1 = {.5,.5,.5,1},
}

C.unitframes = {
    unicolor = true,
	cbicons = true,
	classbar = true,
	combatfeedback = true,
	showplayerinparty = true,
	gridonly = true,
	gridvertical = true,                           
	targetpowerpvponly = true,  
	enemyhcolor = true,                            
	showfocustarget = false,   
    classiccombo = false,                           -- display classic combo points (from Tukui 13 or less)
	movecombobar = false,                            -- display the new combo bar (t14+) from target to player (ROGUE ONLY)
    gradienthealth = true,                          -- change raid health color based on health percent.
	    gradient = {                                    -- health gradient color if unicolor is true.
		    1.0, 0.3, 0.3, -- R, G, B (low HP)
		    0.6, 0.3, 0.3, -- R, G, B (medium HP)
		    0.3, 0.3, 0.3, -- R, G, B (high HP)
	    },
}

C.castbar = { 
	classcolor = true,
	castbarcolor = {.2, .2, .2,1}, -- color if classcolor = false
	nointerruptcolor = {1,.2,.2,1}, -- color of casts which can't be interrupted
	ticks = true,
}

C.auras = {
    consolidate = false,
}

C.tooltip = {   -- added to correct healthtext's size with cyrillic fonts
	fontsize = 14,
}

C.Filger = {   -- if you disable filger Blizzards loseofcontrol will be enabled
	enable = true,
	show_tooltip = true,
}

C.chat = {
	names = { 
	    UnitName("player"), 
	}, 
}

C.nameplate = {
	enable = true,      
    enhancethreat = true,            

	font = [[Interface\AddOns\JasjeUI\media\fonts\visitor2.ttf]], -- font used nameplates
	fontsize = 10, -- size used for nameplates
	fontflag = "OUTLINEMONOCHROME", -- outline used nameplates	
}

C.actionbar = {
    jasje = true,                                  -- enable jasje action bars
    buttonsize = 29,                                -- normal buttons size
}
	
C.cooldown = {
	treshold = 2,
}

C.datatext = {
	wowtime = 1,                                  
	friends = 2,                              
	guild = 3,                                 
	dur = 4,                                 
	fps_ms = 5,                             
	gold = 6,                                  

	power = 0,                             
	system = 0,                            

	localtime = true,               

    fontsize = 14,
}

C.merchant = {
	autorepair = false,                              
}

C.highlight = {
    Enable = true,
	OriginalStyle = true,          -- Set to true for Blizzards original Proc highlight.
	FlashEntireButton = false,           -- Set to true to make the entire button to flash.
	FlashButtonBorder = false,           -- Set to true to make the button border flash.
	FlashBorderSize = 3,           -- Set the size of the border to flash, if FlashBorder is enabled.
	FlashBorderColor  = {1, 1, 0},  -- Color of flash border                     
}

    -- pet action icons
    PET_DEFENSIVE_TEXTURE = [[Interface\AddOns\JasjeUI\media\textures\icon_defensive]]
    PET_PASSIVE_TEXTURE = [[Interface\AddOns\JasjeUI\media\textures\icon_passive]]
    PET_ATTACK_TEXTURE = [[Interface\AddOns\JasjeUI\media\textures\icon_attack]]
    PET_FOLLOW_TEXTURE = [[Interface\AddOns\JasjeUI\media\textures\icon_follow]]
    PET_WAIT_TEXTURE = [[Interface\AddOns\JasjeUI\media\textures\icon_wait]]
    PET_MOVE_TO_TEXTURE = [[Interface\AddOns\JasjeUI\media\textures\icon_moveto]]
    PET_ASSIST_TEXTURE = [[Interface\AddOns\JasjeUI\media\textures\icon_assist]]

-- make it public
TukuiEditedDefaultConfig = C
