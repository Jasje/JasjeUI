local T, C, L, G = unpack(Tukui)

T.InfoLeftRightWidth = 370

TukuiInfoRight:ClearAllPoints()
TukuiInfoRight:Point("BOTTOMRIGHT", UIParent, -10, 7)
TukuiInfoRight:Width(T.InfoLeftRightWidth)
TukuiInfoRight:Height(20)

TukuiInfoLeft:ClearAllPoints()
TukuiInfoLeft:Point("BOTTOMLEFT", UIParent, 10, 7)
TukuiInfoLeft:Width(T.InfoLeftRightWidth)
TukuiInfoLeft:Height(20)

TukuiBar1:ClearAllPoints()
TukuiBar1:SetPoint("BOTTOM", 0, 7)
TukuiBar4:ClearAllPoints()
TukuiBar4:SetPoint("BOTTOMLEFT", TukuiBar1, 0, 0)
TukuiBar5:ClearAllPoints()
TukuiBar5:Point("RIGHT", UIParent, "RIGHT", -10, -50)

if C.actionbar.jasje then
    TukuiBar2:Height((T.buttonsize * 1) + (T.buttonspacing * 2))
    TukuiBar3:Height((T.buttonsize * 1) + (T.buttonspacing * 2))
	
    TukuiBar4Button:Kill() 

	TukuiBar2Button:Height((T.buttonsize * 1) + (T.buttonspacing * 2))
	TukuiBar3Button:Height((T.buttonsize * 1) + (T.buttonspacing * 2))
	
	TukuiExitVehicleButtonLeft:Height((T.buttonsize * 1) + (T.buttonspacing * 2))
	TukuiExitVehicleButtonRight:Height((T.buttonsize * 1) + (T.buttonspacing * 2))
end 

-- bottombar
local tbottombar = CreateFrame("Frame", "TukuiBottomBar", UIParent)
tbottombar:Point("BOTTOM", UIParent, "BOTTOM", 0, -2)
tbottombar:Size(T.screenwidth+6, 20)
tbottombar:SetTemplate()
tbottombar:SetFrameStrata("BACKGROUND")
tbottombar:SetFrameLevel(0)
tbottombar:SetAlpha(.9)
tbottombar:CreateShadow("Hydra")

-- killing time
TukuiMinimapStatsLeft:Kill()
TukuiMinimapStatsRight:Kill()

if not C.chat.background then
    TukuiInfoLeftLineVertical:Kill()
    TukuiInfoRightLineVertical:Kill()
    TukuiLineToABLeft:Kill()
    TukuiLineToABRight:Kill()
    TukuiCubeLeft:Kill()
    TukuiCubeRight:Kill()
end	

-- switch layout
local swl = CreateFrame("Button", "TukuiSwitchLayoutButton", UIParent, "SecureActionButtonTemplate")
	swl:Size(20, 20)
	swl:Point("LEFT", TukuiInfoLeft, "RIGHT", 3, 0)
	swl:SetFrameStrata("BACKGROUND")
	swl:SetFrameLevel(2)
	swl:RegisterForClicks("AnyUp") swl:SetScript("OnClick", function()
		if IsAddOnLoaded("Tukui_Raid") then
			DisableAddOn("Tukui_Raid")
			EnableAddOn("Tukui_Raid_Healing")
			ReloadUI()
		elseif IsAddOnLoaded("Tukui_Raid_Healing") then
			DisableAddOn("Tukui_Raid_Healing")
			EnableAddOn("Tukui_Raid")
			ReloadUI()
		elseif not IsAddOnLoaded("Tukui_Raid_Healing") and not IsAddOnLoaded("Tukui_Raid") then
			EnableAddOn("Tukui_Raid")
			ReloadUI()
		end
end)

-- Version check
local v = CreateFrame("Button", "JasjeUIVersionFrame", TukuiInstallFrame)
v:SetSize(430, 25)
v:Point("BOTTOM", TukuiInstallFrame, "TOP", 0, 5)
v:SetTemplate("Transparent")
v:FontString("Text", C.media.pixelfont2, 14, "MONOCHROMEOUTLINE")
v.Text:SetPoint("CENTER")
v.Text:SetText("|cffD38D01Jasje UI|r v"..T.release..T.StatColor.." by "..T.StatColorEnd.."|cffD38D01Jasje@tukui.org|r"..T.StatColor..", thanks to "..T.StatColorEnd.."|cffC495DDTukz|r "..T.StatColor.."at "..T.StatColorEnd.."|cffC495DDwww.tukui.org|r")

TukuiInstallFrame:Size(T.screenwidth-100,T.screenheight-100)
TukuiInstallFrame:SetTemplate("Transparent")

if not (IsAddOnLoaded("Tukui_ConfigUI")) then
-- create esc button
	local loaded = CreateFrame("Frame")
	loaded:RegisterEvent("PLAYER_LOGIN")
	loaded:SetScript("OnEvent", function(self, event, addon)
		T, C, L, G = unpack(Tukui)

		local menu = GameMenuFrame
		local menuy = menu:GetHeight()
		local quit = GameMenuButtonQuit
		local continue = GameMenuButtonContinue
		local continuex = continue:GetWidth()
		local continuey = continue:GetHeight()
		local interface = GameMenuButtonUIOptions
		local keybinds = GameMenuButtonKeybindings

		menu:SetHeight(menuy + continuey)

		local button = CreateFrame("BUTTON", "GameMenuTukuiButtonOptions", menu, "GameMenuButtonTemplate")
		button:SetSize(continuex, continuey)
		button:Point("TOP", interface, "BOTTOM", 0, -1)
		button:SetText(T.StatColor.."Jasje Edit:|r "..T.release)

		if C.general.blizzardreskin then
			T.SkinButton(button)
		end

		keybinds:ClearAllPoints()
		keybinds:Point("TOP", button, "BOTTOM", 0, -1)
	end)
end
