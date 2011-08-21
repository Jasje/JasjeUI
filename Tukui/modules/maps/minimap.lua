local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
--------------------------------------------------------------------
-- Tukui Minimap Script
--------------------------------------------------------------------

local TukuiMinimap = CreateFrame("Frame", "TukuiMinimap", UIParent)
TukuiMinimap:CreatePanel("Default", 1, 1, "CENTER", UIParent, "CENTER", 0, 0)
TukuiMinimap:RegisterEvent("ADDON_LOADED")
TukuiMinimap:RegisterEvent("CALENDAR_UPDATE_PENDING_INVITES")
TukuiMinimap:RegisterEvent("UPDATE_PENDING_MAIL")
TukuiMinimap:RegisterEvent("PLAYER_ENTERING_WORLD")
TukuiMinimap:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", T.Scale(-10), T.Scale(-15))
TukuiMinimap:Size(144)
TukuiMinimap:SetClampedToScreen(true)
TukuiMinimap:SetMovable(true)
TukuiMinimap.text = T.SetFontString(TukuiMinimap, C.media.pixelfont2, 14, "MONOCHROMEOUTLINE")
TukuiMinimap.text:SetPoint("CENTER")
TukuiMinimap.text:SetText(hexa..L.move_minimap..hexb)

-- kill the minimap cluster
MinimapCluster:Kill()

-- Parent Minimap into our Map frame.
Minimap:SetParent(TukuiMinimap)
Minimap:ClearAllPoints()
Minimap:Point("TOPLEFT", 2, -2)
Minimap:Point("BOTTOMRIGHT", -2, 2)

-- Hide Border
MinimapBorder:Hide()
MinimapBorderTop:Hide()

-- Hide Zoom Buttons
MinimapZoomIn:Hide()
MinimapZoomOut:Hide()

-- Hide Voice Chat Frame
MiniMapVoiceChatFrame:Hide()

-- Hide North texture at top
MinimapNorthTag:SetTexture(nil)

-- Hide Zone Frame
MinimapZoneTextButton:Hide()

-- Hide Tracking Button
MiniMapTracking:Hide()

-- Hide Calendar Button
GameTimeFrame:Hide()

-- Hide Mail Button
MiniMapMailFrame:ClearAllPoints()
MiniMapMailFrame:Point("TOPRIGHT", Minimap, 3, 3)
MiniMapMailBorder:Hide()
MiniMapMailIcon:SetTexture("Interface\\AddOns\\Tukui\\medias\\textures\\Jmail") -- made my own mail icon 

-- Move battleground icon
MiniMapBattlefieldFrame:ClearAllPoints()
MiniMapBattlefieldFrame:Point("BOTTOMRIGHT", Minimap, 3, 15)
MiniMapBattlefieldBorder:Hide()

-- Ticket Frame
local TukuiTicket = CreateFrame("Frame", "TukuiTicket", TukuiMinimap)
TukuiTicket:CreatePanel("Default", 1, 1, "CENTER", TukuiMinimap, "CENTER", 0, 0)
TukuiTicket:Size(TukuiMinimap:GetWidth() - 4, 24)
TukuiTicket:SetFrameStrata("MEDIUM")
TukuiTicket:SetFrameLevel(20)
TukuiTicket:Point("TOP", 0, -2)
TukuiTicket:FontString("Text", C.media.pixelfont2, 14, "MONOCHROMEOUTLINE")
TukuiTicket.Text:SetPoint("CENTER")
TukuiTicket.Text:SetText(HELP_TICKET_EDIT)
TukuiTicket:SetBackdropBorderColor(255/255, 243/255,  82/255)
TukuiTicket.Text:SetTextColor(255/255, 243/255,  82/255)
TukuiTicket:SetAlpha(0)

HelpOpenTicketButton:SetParent(TukuiTicket)
HelpOpenTicketButton:SetFrameLevel(TukuiTicket:GetFrameLevel() + 1)
HelpOpenTicketButton:SetFrameStrata(TukuiTicket:GetFrameStrata())
HelpOpenTicketButton:ClearAllPoints()
HelpOpenTicketButton:SetAllPoints()
HelpOpenTicketButton:SetHighlightTexture(nil)
HelpOpenTicketButton:SetAlpha(0)
HelpOpenTicketButton:HookScript("OnShow", function(self) TukuiTicket:SetAlpha(1) end)
HelpOpenTicketButton:HookScript("OnHide", function(self) TukuiTicket:SetAlpha(0) end)

-- Hide world map button
MiniMapWorldMapButton:Hide()

-- shitty 3.3 flag to move
MiniMapInstanceDifficulty:ClearAllPoints()
MiniMapInstanceDifficulty:SetParent(Minimap)
MiniMapInstanceDifficulty:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 0, 0)

-- 4.0.6 Guild instance difficulty
GuildInstanceDifficulty:ClearAllPoints()
GuildInstanceDifficulty:SetParent(Minimap)
GuildInstanceDifficulty:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 0, 0)

-- Reposition lfg icon at bottom-left
local function UpdateLFG()
	MiniMapLFGFrame:ClearAllPoints()
	MiniMapLFGFrame:Point("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 2, 15)
	MiniMapLFGFrameBorder:Hide()
end
hooksecurefunc("MiniMapLFG_UpdateIsShown", UpdateLFG)

-- reskin LFG dropdown
LFDSearchStatus:SetTemplate("Transparent")

-- for t13+, if we move map we need to point LFDSearchStatus according to our Minimap position.
local function UpdateLFGTooltip()
	local position = TukuiMinimap:GetPoint()
	LFDSearchStatus:ClearAllPoints()
	if position:match("BOTTOMRIGHT") then
		LFDSearchStatus:SetPoint("BOTTOMRIGHT", MiniMapLFGFrame, "BOTTOMLEFT", 0, 15)
	elseif position:match("BOTTOM") then
		LFDSearchStatus:SetPoint("BOTTOMLEFT", MiniMapLFGFrame, "BOTTOMRIGHT", 4, 15)
	elseif position:match("LEFT") then		
		LFDSearchStatus:SetPoint("TOPLEFT", MiniMapLFGFrame, "TOPRIGHT", 4, 15)
	else
		LFDSearchStatus:SetPoint("TOPRIGHT", MiniMapLFGFrame, "TOPLEFT", 0, 15)	
	end
end

LFDSearchStatus:HookScript("OnShow", UpdateLFGTooltip)

-- Enable mouse scrolling
Minimap:EnableMouseWheel(true)
Minimap:SetScript("OnMouseWheel", function(self, d)
	if d > 0 then
		_G.MinimapZoomIn:Click()
	elseif d < 0 then
		_G.MinimapZoomOut:Click()
	end
end)

-- Set Square Map Mask
Minimap:SetMaskTexture(C.media.blank)

-- For others mods with a minimap button, set minimap buttons position in square mode.
function GetMinimapShape() return "SQUARE" end

-- do some stuff on addon loaded or player login event
TukuiMinimap:SetScript("OnEvent", function(self, event, addon)
    if addon == "Blizzard_TimeManager" then
		-- Hide Game Time
		TimeManagerClockButton:Kill()
	end
end)

----------------------------------------------------------------------------------------
-- Right click menu, used to show micro menu
----------------------------------------------------------------------------------------

local menuFrame = CreateFrame("Frame", "TukuiMinimapMiddleClickMenu", TukuiMinimap, "UIDropDownMenuTemplate")
local menuList = {
	{text = hexa..CHARACTER_BUTTON..hexb,
	func = function() ToggleCharacter("PaperDollFrame") end},
	{text = hexa..SPELLBOOK_ABILITIES_BUTTON..hexb,
	func = function() ToggleFrame(SpellBookFrame) end},
	{text = hexa..TALENTS_BUTTON..hexb,
	func = function() 
		if not PlayerTalentFrame then 
			LoadAddOn("Blizzard_TalentUI") 
		end 

		if not GlyphFrame then 
			LoadAddOn("Blizzard_GlyphUI") 
		end 
		PlayerTalentFrame_Toggle() 
	end},
	{text = hexa..ACHIEVEMENT_BUTTON..hexb,
	func = function() ToggleAchievementFrame() end},
	{text = hexa..QUESTLOG_BUTTON..hexb,
	func = function() ToggleFrame(QuestLogFrame) end},
	{text = hexa..SOCIAL_BUTTON..hexb,
	func = function() ToggleFriendsFrame(1) end},
	{text = hexa..PLAYER_V_PLAYER..hexb,
	func = function() ToggleFrame(PVPFrame) end},
	{text = hexa..ACHIEVEMENTS_GUILD_TAB..hexb,
	func = function() 
		if IsInGuild() then 
			if not GuildFrame then LoadAddOn("Blizzard_GuildUI") end 
			GuildFrame_Toggle() 
		else 
			if not LookingForGuildFrame then LoadAddOn("Blizzard_LookingForGuildUI") end 
			LookingForGuildFrame_Toggle() 
		end
	end},
	{text = hexa..LFG_TITLE..hexb,
	func = function() ToggleFrame(LFDParentFrame) end},
	{text = hexa..LOOKING_FOR_RAID..hexb,
	func = function() ToggleFrame(LFRParentFrame) end},
	{text = hexa..HELP_BUTTON..hexb,
	func = function() ToggleHelpFrame() end},
	{text = hexa..CALENDAR_VIEW_EVENT..hexb,
	func = function()
	if(not CalendarFrame) then LoadAddOn("Blizzard_Calendar") end
		Calendar_Toggle()
	end},
	{text = hexa..ENCOUNTER_JOURNAL..hexb,
	func = function() ToggleFrame(EncounterJournal) end}, 
}

Minimap:SetScript("OnMouseUp", function(self, btn)
	local position = TukuiMinimap:GetPoint()
	if btn == "RightButton" then
		local xoff = 0

		if position:match("RIGHT") then xoff = T.Scale(-16) end
		ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown, TukuiMinimap, xoff, T.Scale(-2))
	elseif btn == "MiddleButton" then
		if position:match("LEFT") then
			EasyMenu(menuList, menuFrame, "cursor", 0, 0, "MENU", 2)
		else
			EasyMenu(menuList, menuFrame, "cursor", -160, 0, "MENU", 2)
		end
	else
		Minimap_OnClick(self)
	end
end)

----------------------------------------------------------------------------------------
-- Mouseover map, displaying zone and coords
----------------------------------------------------------------------------------------

local m_zone = CreateFrame("Frame",nil,UIParent)
m_zone:CreatePanel("Transparent", 0, 18, "TOPLEFT", Minimap, "TOPLEFT", 2,-2)
m_zone:SetFrameLevel(5)
m_zone:SetFrameStrata("LOW")
m_zone:Point("TOPRIGHT",Minimap,-2,-2)
m_zone:Hide()

local m_zone_text = m_zone:CreateFontString(nil,"Overlay")
m_zone_text:SetFont(C.media.pixelfont, 8, "MONOCHROMEOUTLINE")
m_zone_text:Point("TOP", 0, -1)
m_zone_text:SetPoint("BOTTOM")
m_zone_text:Height(12)
m_zone_text:Width(m_zone:GetWidth()-6)
m_zone_text:Hide()

local m_coord = CreateFrame("Frame",nil,UIParent)
m_coord:CreatePanel("Transparent", 40, 18, "BOTTOMLEFT", Minimap, "BOTTOMLEFT", 2,2)
m_coord:SetFrameStrata("LOW")
m_coord:Hide()

local m_coord_text = m_coord:CreateFontString(nil,"Overlay")
m_coord_text:SetFont(C.media.pixelfont, 8, "MONOCHROMEOUTLINE")
m_coord_text:Point("Center",-1,0)
m_coord_text:Hide()
m_coord_text:SetText("00,00")

Minimap:SetScript("OnEnter",function()
	m_zone:Show()
    m_zone_text:Show()
	m_coord:Show()
    m_coord_text:Show()
end)

Minimap:SetScript("OnLeave",function()
	m_zone:Hide()
	m_zone_text:Hide()
	m_coord:Hide()
    m_coord_text:Hide()
end)

local ela = 0
local coord_Update = function(self,t)
	ela = ela - t
	if ela > 0 then return end
	local x,y = GetPlayerMapPosition("player")
	local xt,yt
	x = math.floor(100 * x)
	y = math.floor(100 * y)
	if x == 0 and y == 0 then
		m_coord_text:SetText(hexa.."(-_-)")
	else
		if x < 10 then
			xt = "0"..x
		else
			xt = x
		end
		if y < 10 then
			yt = "0"..y
		else
			yt = y
		end
		m_coord_text:SetText(hexa..xt..","..yt)
	end
	ela = .2
end
m_coord:SetScript("OnUpdate",coord_Update)

local color = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
local zone_Update = function()
	local pvp = GetZonePVPInfo()
	m_zone_text:SetText(GetMinimapZoneText())
	if pvp == "friendly" then
		m_zone_text:SetTextColor(color.r,color.g,color.b)
	elseif pvp == "sanctuary" then
		m_zone_text:SetTextColor(0.41, 0.8, 0.94)
	elseif pvp == "arena" or pvp == "hostile" then
		m_zone_text:SetTextColor(1.0, 0.1, 0.1)
	elseif pvp == "contested" then
		m_zone_text:SetTextColor(1.0, 0.7, 0.0)
	else
		m_zone_text:SetTextColor(1.0, 1.0, 1.0)
	end
end
 
m_zone:RegisterEvent("PLAYER_ENTERING_WORLD")
m_zone:RegisterEvent("ZONE_CHANGED_NEW_AREA")
m_zone:RegisterEvent("ZONE_CHANGED")
m_zone:RegisterEvent("ZONE_CHANGED_INDOORS")
m_zone:SetScript("OnEvent",zone_Update) 

-- reload button on mouseover in minimap
local reloadbutton = CreateFrame("Button", "TukuiReloadUIButton", UIParent, "SecureActionButtonTemplate")
reloadbutton:CreatePanel("Transparent", 90, 18, "BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", -2,2)
reloadbutton:SetFrameStrata("HIGH")
reloadbutton:SetAttribute("type", "macro")
reloadbutton:SetAttribute("macrotext", "/rl")

local reloadbutton_text = reloadbutton:CreateFontString(nil,"Overlay")
reloadbutton_text:SetFont(C.media.pixelfont, 8, "MONOCHROMEOUTLINE")
reloadbutton_text:Point("Center", TukuiReloadUIButton, -1,0)
reloadbutton_text:SetText(hexa.."Reload UI")

reloadbutton:SetScript("OnEnter", function()
	if InCombatLockdown() then return end
	reloadbutton:FadeIn()
end)

reloadbutton:SetScript("OnLeave", function()
	reloadbutton:FadeOut()
end)

reloadbutton:RegisterEvent("PLAYER_LOGIN")
reloadbutton:SetScript("OnEvent", function(self) end)