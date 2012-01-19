local T, C, L = unpack(Tukui)

TukuiBar1:ClearAllPoints()
TukuiBar1:Point("BOTTOM", UIParent, "BOTTOM", 0, 7)

TukuiBar4:ClearAllPoints()
TukuiBar4:Point("BOTTOM", UIParent, "BOTTOM", 0, 7)

TukuiBar5:ClearAllPoints()
TukuiBar5:Point("RIGHT", UIParent, "RIGHT", -10, -50)

T.InfoLeftRightWidth = 370

TukuiInfoRight:ClearAllPoints()
TukuiInfoRight:Point("BOTTOMRIGHT", UIParent, -10, 7)
TukuiInfoRight:Width(T.InfoLeftRightWidth)
TukuiInfoRight:Height(20)

TukuiInfoLeft:ClearAllPoints()
TukuiInfoLeft:Point("BOTTOMLEFT", UIParent, 10, 7)
TukuiInfoLeft:Width(T.InfoLeftRightWidth)
TukuiInfoLeft:Height(20)

-- bottombar
local tbottombar = CreateFrame("Frame", "TukuiBottomBar", UIParent)
tbottombar:CreatePanel("Default", T.screenwidth+6, 20, "BOTTOM", UIParent, "BOTTOM", 0, -2)
tbottombar:SetFrameStrata("BACKGROUND")
tbottombar:SetFrameLevel(0)
tbottombar:SetAlpha(.9)
tbottombar:CreateShadow("Hydra")
	
TukuiTooltipAnchor:ClearAllPoints()
TukuiTooltipAnchor:SetPoint("BOTTOMRIGHT", TukuiInfoRight, 0,-6)


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

-- Hydra Spec Button!
if UnitLevel("player") <= 10 then return end

local frame = CreateFrame("Frame", "CorinnaTalent", UIParent)
    frame:CreatePanel(nil, 20, 20, "RIGHT", TukuiInfoRight, "LEFT", -3, 0)
    frame:EnableMouse(true)

    frame.tex = frame:CreateTexture(nil, "ARTWORK")
    frame.tex:Point("TOPLEFT", 2, -2)
    frame.tex:Point("BOTTOMRIGHT", -2, 2)
    frame.tex:SetTexCoord(0.08, 0.92, 0.08, 0.92)

    frame.highlight = frame:CreateTexture(nil, "ARTWORK")
    frame.highlight:Point("TOPLEFT", 2, -2)
    frame.highlight:Point("BOTTOMRIGHT", -2, 2)
    frame.highlight:SetTexture(1,1,1,.3)
    frame.highlight:Hide()

local UpdateTexture = function(self)
	local primary = GetPrimaryTalentTree()
	local tex = select(4, GetTalentTabInfo(primary))
	
	self.tex:SetTexture(tex)
end

local ChangeSpec = function()
	local spec = GetActiveTalentGroup()
	
	if spec == 1 then
		SetActiveTalentGroup(2)
	else
		SetActiveTalentGroup(1)
	end
end

local color = RAID_CLASS_COLORS[T.myclass]

local StyleTooltip = function(self)
	if not InCombatLockdown() then
		local p1 = select(5, GetTalentTabInfo(1))
		local p2 = select(5, GetTalentTabInfo(2))
		local p3 = select(5, GetTalentTabInfo(3))
		local name = select(2, GetTalentTabInfo(GetPrimaryTalentTree()))
		local spec = GetActiveTalentGroup()
		
		GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT", 0, 2)
		GameTooltip:ClearLines()
		
		if spec == 1 then
			GameTooltip:AddDoubleLine(format(T.StatColor.."%s: %s/%s/%s - [%s]"..T.StatColorEnd, name, p1, p2, p3, PRIMARY))
		else
			GameTooltip:AddDoubleLine(format(T.StatColor.."%s: %s/%s/%s - [%s]"..T.StatColorEnd, name, p1, p2, p3, SECONDARY))
		end
		
		self.highlight:Show()
		self:SetBackdropBorderColor(color.r, color.g, color.b)
		GameTooltip:Show()
	end
end

local OnLeave = function(self)
	GameTooltip:Hide()
	self.highlight:Hide()
	self:SetBackdropBorderColor(unpack(C.media.bordercolor))
end

frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
frame:RegisterEvent("PLAYER_TALENT_UPDATE")
frame:SetScript("OnEvent", UpdateTexture)
frame:SetScript("OnMouseDown", ChangeSpec)
frame:SetScript("OnEnter", StyleTooltip)

-- Version check
local v = CreateFrame("Button", "JasjeUIVersionFrame", TukuiInstallFrame)
v:SetSize(430, 25)
v:SetPoint("BOTTOM", TukuiInstallFrame, "TOP", 0, 5)
v:SetTemplate("Transparent")
v:FontString("Text", C.media.pixelfont2, 14, "MONOCHROMEOUTLINE")
v.Text:SetPoint("CENTER")
v.Text:SetText("|cffD38D01Jasje UI|r v"..T.release..T.StatColor.." by "..T.StatColorEnd.."|cffD38D01Jasje@tukui.org|r"..T.StatColor..", thanks to "..T.StatColorEnd.."|cffC495DDTukz|r "..T.StatColor.."at "..T.StatColorEnd.."|cffC495DDwww.tukui.org|r")

TukuiInstallFrame:SetSize(T.screenwidth-100,T.screenheight-100)
TukuiInstallFrame:SetTemplate("Transparent")

-- create esc button
	local loaded = CreateFrame("Frame")
	loaded:RegisterEvent("PLAYER_LOGIN")
	loaded:SetScript("OnEvent", function(self, event, addon)
		T, C, L = unpack(Tukui)

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

