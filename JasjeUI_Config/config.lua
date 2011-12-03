local C = {}

--config
C.general = {
	bordercolor = {.2,.2,.2,1},             
	backdropcolor = {.075,.075,.075,1},       
	altbackdropcolor = { .075,.075,.075,.7 },
}

C.media = {
    font = [[Interface\AddOns\JasjeUI\media\fonts\normal_font.ttf]], -- general font of tukui
	
    dmgfont = [[Fonts\skurri.TTF]], -- general font of dmg / sct 
	pixelfont = [[Interface\AddOns\JasjeUI\media\fonts\HOOG0555.ttf]], -- extra pixelfont
	pixelfont2 = [[Interface\AddOns\JasjeUI\media\fonts\visitor2.ttf]], -- another pixelfont
	pixelfont3 = [[Interface\AddOns\JasjeUI\media\fonts\visitor1.ttf]], -- another pixelfont
	pixelfont4 =  [[Interface\AddOns\JasjeUI\media\fonts\Pixelway_Baseline.TTF]], -- another pixelfont
	
	Glamour =  [[Interface\AddOns\JasjeUI\media\textures\Glamour4.tga]],

	switchlayoutheal = [[Interface\AddOns\JasjeUI\media\textures\switch_layout_heal]], -- switch layout texture
	switchlayoutdd = [[Interface\AddOns\JasjeUI\media\textures\switch_layout_dd]], -- switch layout texture
	
	warningsound = [[Interface\AddOns\JasjeUI\media\sound\warning.mp3]], -- used for Selfbuffs
}

C.unitframes = {
    unicolor = true,
	cbicons = true,
	classbar = false,
	combatfeedback = true,
	showplayerinparty = true,
	gridonly = true,
	targetpowerpvponly = true,   
	showfocustarget = false,   
}

C.castbar = { 
	classcolor = true, -- classcolor
	castbarcolor = { .2, .2, .2,1 }, -- color if classcolor = false
	nointerruptcolor = { 1,.2,.2,1 }, -- color of casts which can't be interrupted
}


C.bags = {
	enable = true,
}

C.auras = {
    consolidate = false,
}

C.nameplate = {
    enhancethreat = true,
}

C.actionbar = {
	hotkey = true,
	showgrid = true,
}

C.cooldown = {
	treshold = 2,
}

C.datatext = {
	fps_ms = 5,                                   -- show fps and ms on panels
	system = 0,                                   -- show total memory and others systems infos on panels
	bags = 0,                                     -- show space used in bags on panels
	gold = 6,                                     -- show your current gold on panels
	wowtime = 1,                                  -- show time on panels
	guild = 3,                                    -- show number on guildmate connected on panels
	dur = 4,                                      -- show your equipment durability on panels.
	friends = 2,                                  -- show number of friends connected.
	dps_text = 0,                                 -- show a dps meter on panels
	hps_text = 0,                                 -- show a heal meter on panels
	power = 0,                                    -- show your attackpower/spellpower/healpower/rangedattackpower whatever stat is higher gets displayed
	haste = 0,                                    -- show your haste rating on panels.
	crit = 0,                                     -- show your crit rating on panels.
	avd = 0,                                      -- show your current avoidance against the level of the mob your targeting
	armor = 0,                                    -- show your armor value against the level mob you are currently targeting
	currency = 0,                                 -- show your tracked currency on panels
	hit = 0,                                      -- show hit rating
	mastery = 0,                                  -- show mastery rating
	micromenu = 0,                                -- add a micro menu thought datatext
	regen = 0,                                    -- show mana regeneration
	talent = 0,                                   -- show talent
	calltoarms = 0,                               -- show dungeon and call to arms
	
	time24 = false,                               -- set time to 24h format.
	localtime = true,                             -- set time to local time instead of server time.
	battleground = true,
	
	-- Color Datatext
	classcolor = true,                -- classcolored datatexts 
	color = "|cff00AAFF",              -- datatext color if classcolor = false
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
