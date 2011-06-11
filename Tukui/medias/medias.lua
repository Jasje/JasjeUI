local T, C, L = unpack(select(2, ...))

C["media"] = {
	-- fonts (ENGLISH, SPANISH)
	["font"] = [=[Interface\Addons\Tukui\medias\fonts\normal_font.ttf]=], -- general font of tukui
	["uffont"] = [[Interface\AddOns\Tukui\medias\fonts\uf_font.ttf]], -- general font of unitframes
	["dmgfont"] = [[Fonts\skurri.TTF]], -- general font of dmg / sct 
		["pixelfont"] = [[Interface\AddOns\Tukui\medias\fonts\HOOG0555.ttf]], -- extra pixelfont
		["CBpixelfont"] = [[Interface\AddOns\Tukui\medias\fonts\HOOG0555.ttf]], -- CASTBAR FONT
		
		["pixelfont2"] = [[Interface\AddOns\Tukui\medias\fonts\visitor2.ttf]], -- another pixelfont
		["pixelfont3"] = [[Interface\AddOns\Tukui\medias\fonts\visitor1.ttf]], -- another pixelfont
		["pixelfont4"] =  [[Interface\AddOns\Tukui\medias\fonts\Pixelway_Baseline.TTF]], -- another pixelfont
	
	-- fonts (DEUTSCH)
	["de_font"] = [=[Interface\Addons\Tukui\medias\fonts\normal_font.ttf]=], -- general font of tukui
	["de_uffont"] = [[Interface\AddOns\Tukui\medias\fonts\uf_font.ttf]], -- general font of unitframes
	["de_dmgfont"] = [[Interface\AddOns\Tukui\medias\fonts\combat_font.ttf]], -- general font of dmg / sct
	
	-- fonts (FRENCH)
	["fr_font"] = [=[Interface\Addons\Tukui\medias\fonts\normal_font.ttf]=], -- general font of tukui
	["fr_uffont"] = [[Interface\AddOns\Tukui\medias\fonts\uf_font.ttf]], -- general font of unitframes
	["fr_dmgfont"] = [=[Interface\AddOns\Tukui\medias\fonts\combat_font.ttf]=], -- general font of dmg / sct
	
	-- fonts (RUSSIAN)
	["ru_font"] = [=[Interface\Addons\Tukui\medias\fonts\normal_font.ttf]=], -- general font of tukui
	["ru_uffont"] = [[Fonts\ARIALN.TTF]], -- general font of unitframes
	["ru_dmgfont"] = [[Fonts\ARIALN.TTF]], -- general font of dmg / sct
	
	-- fonts (TAIWAN ONLY)
	["tw_font"] = [=[Fonts\bLEI00D.ttf]=], -- general font of tukui
	["tw_uffont"] = [[Fonts\bLEI00D.ttf]], -- general font of unitframes
	["tw_dmgfont"] = [[Fonts\bLEI00D.ttf]], -- general font of dmg / sct
	
	-- fonts (KOREAN ONLY)
	["kr_font"] = [=[Fonts\2002.TTF]=], -- general font of tukui
	["kr_uffont"] = [[Fonts\2002.TTF]], -- general font of unitframes
	["kr_dmgfont"] = [[Fonts\2002.TTF]], -- general font of dmg / sct
	
	-- textures
	["normTex"] = [[Interface\AddOns\Tukui\medias\textures\normTex]], -- texture used for tukui healthbar/powerbar/etc
	["glowTex"] = [[Interface\AddOns\Tukui\medias\textures\glowTex]], -- the glow text around some frame.
	["bubbleTex"] = [[Interface\AddOns\Tukui\medias\textures\bubbleTex]], -- unitframes combo points
	["flat"] = [[Interface\AddOns\Tukui\medias\textures\Flat]], -- used for xp/rep bar
	["copyicon"] = [[Interface\AddOns\Tukui\medias\textures\copy]], -- copy icon
	["blank"] = [[Interface\AddOns\Tukui\medias\textures\blank]], -- the main texture for all borders/panels
	["bordercolor"] = { .2,.2,.2,1 }, -- border color of tukui panels
	["altbordercolor"] = { .2,.2,.2,1 }, -- alternative border color, mainly for unitframes text panels.
	["backdropcolor"] = { .075,.075,.075,1 }, -- background color of tukui panels
	["altbackdropcolor"] = { .075,.075,.075,.7 }, -- this is the color to be used in HydraDB.SetBorder()
	["buttonhover"] = [[Interface\AddOns\Tukui\medias\textures\button_hover]],
	-- taken from Asphyxia
	["switchlayoutheal"] = [[Interface\AddOns\Tukui\medias\textures\switch_layout_heal]], -- switch layout texture
	["switchlayoutdd"] = [[Interface\AddOns\Tukui\medias\textures\switch_layout_dd]], -- switch layout texture
	
	-- sound
	["whisper"] = [[Interface\AddOns\Tukui\medias\sounds\whisper.mp3]],
	["warning"] = [[Interface\AddOns\Tukui\medias\sounds\warning.mp3]],
	["namealert"] = [[Interface\AddOns\Tukui\medias\sounds\neobeep.mp3]], -- sound taken from DXE
}
    -- pet action icons
    PET_DEFENSIVE_TEXTURE = [[Interface\AddOns\Tukui\medias\textures\icon_defensive]]
    PET_AGGRESSIVE_TEXTURE = [[Interface\AddOns\Tukui\medias\textures\icon_aggressive]]
    PET_PASSIVE_TEXTURE = [[Interface\AddOns\Tukui\medias\textures\icon_passive]]
    PET_ATTACK_TEXTURE = [[Interface\AddOns\Tukui\medias\textures\icon_attack]]
    PET_FOLLOW_TEXTURE = [[Interface\AddOns\Tukui\medias\textures\icon_follow]]
    PET_WAIT_TEXTURE = [[Interface\AddOns\Tukui\medias\textures\icon_wait]]
    PET_MOVE_TO_TEXTURE = [[Interface\AddOns\Tukui\medias\textures\icon_moveto]]