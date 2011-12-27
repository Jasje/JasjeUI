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
	uf_ruRupixel =  [[Interface\AddOns\JasjeUI\media\fonts\uf_ruRupixel.TTF]], 
	ruRUpixel =  [[Interface\AddOns\JasjeUI\media\fonts\visitor_rus.TTF]], 
	
	Glamour =  [[Interface\AddOns\JasjeUI\media\textures\Glamour4.tga]],

	switchlayoutheal = [[Interface\AddOns\JasjeUI\media\textures\switch_layout_heal]], 
	switchlayoutdd = [[Interface\AddOns\JasjeUI\media\textures\switch_layout_dd]], 
	
	warningsound = [[Interface\AddOns\JasjeUI\media\sound\warning.mp3]], 
	
	bordercolor = {.2,.2,.2,1}, 
	datatextcolor1 = {.5,.5,.5,1},	
}

C.chat = {
	classcolortab = true,                          
	tabcolor = {0,0.7,1},                           -- color of chat tabs, disabled if classcolor is true
	tabmouseover = {1,1,1,1},                -- color of tabs on mouse-over
	-- chat tab font
	font = C.media.pixelfont,
	fontsize = 8, 
	fontflag = "OUTLINEMONOCHROME", 
}

C.unitframes = {
    unicolor = true,
	cbicons = true,
	classbar = true,
	combatfeedback = true,
	showplayerinparty = true,
	gridonly = true,
	targetpowerpvponly = true,   
	showfocustarget = false,   
    classiccombo = false,                           -- display classic combo points (from Tukui 13 or less)
	movecombobar = false,                            -- display the new combo bar (t14+) from target to player (ROGUE ONLY)
}

C.castbar = { 
	classcolor = true,
	castbarcolor = {.2, .2, .2,1}, -- color if classcolor = false
	nointerruptcolor = {1,.2,.2,1}, -- color of casts which can't be interrupted
}


C.auras = {
    consolidate = false,
}

C.nameplate = {
	enable = true,      
    enhancethreat = true,            

	font = [[Interface\AddOns\JasjeUI\media\fonts\visitor2.ttf]], -- font used nameplates
	fontsize = 10, -- size used for nameplates
	fontflag = "OUTLINEMONOCHROME", -- outline used nameplates	
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
