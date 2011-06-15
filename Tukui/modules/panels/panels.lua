local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

local sbWidth = C.actionbar.sidebarWidth
local mbWidth = C.actionbar.mainbarWidth

local TukuiBar1 = CreateFrame("Frame", "TukuiBar1", UIParent, "SecureHandlerStateTemplate")
TukuiBar1:CreatePanel("Invisible", 1, 1, "BOTTOM", UIParent, "BOTTOM", 0, 7)
TukuiBar1:SetWidth((T.buttonsize * mbWidth) + (T.buttonspacing * (mbWidth-1)))
TukuiBar1:SetHeight((T.buttonsize * 2) + (T.buttonspacing))
TukuiBar1:SetFrameStrata("BACKGROUND")
TukuiBar1:SetFrameLevel(1)

local TukuiBar2 = CreateFrame("Frame", "TukuiBar2", UIParent)
TukuiBar2:CreatePanel("Invisible", 1, 1, "BOTTOMRIGHT", TukuiBar1, "BOTTOMLEFT", -5, 0)
TukuiBar2:SetWidth((T.buttonsize * sbWidth) + (T.buttonspacing * (sbWidth-1)))
TukuiBar2:SetHeight((T.buttonsize * 2) + (T.buttonspacing))
TukuiBar2:SetFrameStrata("BACKGROUND")
TukuiBar2:SetFrameLevel(2)
TukuiBar2:SetAlpha(1)

local TukuiBar3 = CreateFrame("Frame", "TukuiBar3", UIParent)
TukuiBar3:CreatePanel("Invisible", 1, 1, "BOTTOMLEFT", TukuiBar1, "BOTTOMRIGHT", 5, 0)
TukuiBar3:SetWidth((T.buttonsize * sbWidth) + (T.buttonspacing * (sbWidth-1)))
TukuiBar3:SetHeight((T.buttonsize * 2) + (T.buttonspacing))
TukuiBar3:SetFrameStrata("BACKGROUND")
TukuiBar3:SetFrameLevel(2)
TukuiBar3:SetAlpha(1)

local TukuiBar4 = CreateFrame("Frame", "TukuiBar4", UIParent)
TukuiBar4:CreatePanel("Invisible", 1, 1, "BOTTOM", UIParent, "BOTTOM", 0, 7)
TukuiBar4:SetWidth((T.buttonsize * mbWidth) + (T.buttonspacing * (mbWidth-1)))
TukuiBar4:SetHeight((T.buttonsize * 2) + (T.buttonspacing))
TukuiBar4:SetFrameStrata("BACKGROUND")
TukuiBar4:SetFrameLevel(2)
TukuiBar4:SetAlpha(0)

local TukuiBar5 = CreateFrame("Frame", "TukuiBar5", UIParent)
TukuiBar5:CreatePanel("Invisible", 1, (T.buttonsize * 12) + (T.buttonspacing * 13), "RIGHT", UIParent, "RIGHT", -10, -40)
TukuiBar5:SetWidth((T.buttonsize * 1) + (T.buttonspacing * 2))
TukuiBar5:SetFrameStrata("BACKGROUND")
TukuiBar5:SetFrameLevel(2)
TukuiBar5:SetAlpha(0)

local TukuiBar6 = CreateFrame("Frame", "TukuiBar6", UIParent)
TukuiBar6:SetWidth((T.buttonsize * 1) + (T.buttonspacing * 2))
TukuiBar6:SetHeight((T.buttonsize * 12) + (T.buttonspacing * 13))
TukuiBar6:SetPoint("LEFT", TukuiBar5, "LEFT", 0, 0)
TukuiBar6:SetFrameStrata("BACKGROUND")
TukuiBar6:SetFrameLevel(2)
TukuiBar6:SetAlpha(0)

local TukuiBar7 = CreateFrame("Frame", "TukuiBar7", UIParent)
TukuiBar7:SetWidth((T.buttonsize * 1) + (T.buttonspacing * 2))
TukuiBar7:SetHeight((T.buttonsize * 12) + (T.buttonspacing * 13))
TukuiBar7:SetPoint("TOP", TukuiBar5, "TOP", 0 , 0)
TukuiBar7:SetFrameStrata("BACKGROUND")
TukuiBar7:SetFrameLevel(2)
TukuiBar7:SetAlpha(0)

local petbg = CreateFrame("Frame", "TukuiPetBar", UIParent, "SecureHandlerStateTemplate")
petbg:CreatePanel("Invisible", T.petbuttonsize + (T.petbuttonspacing * 2), (T.petbuttonsize * 10) + (T.petbuttonspacing * 11), "RIGHT", TukuiBar5, "LEFT", -6, 0)

local ltpetbg1 = CreateFrame("Frame", "TukuiLineToPetActionBarBackground", petbg)
ltpetbg1:CreatePanel("Invisible", 24, 265, "LEFT", petbg, "RIGHT", 0, 0)
ltpetbg1:SetParent(petbg)
ltpetbg1:SetFrameStrata("BACKGROUND")
ltpetbg1:SetFrameLevel(2)
ltpetbg1:SetAlpha(0)

if C.actionbar.bgPanel then
	for i = 1, 5 do
		_G["TukuiBar"..i]:SetTemplate("Transparent")
		_G["TukuiBar"..i]:CreateShadow()
	end
	
	petbg:SetTemplate("Transparent")
	petbg:CreateShadow()
	petbg:SetWidth(T.petbuttonsize + (T.petbuttonspacing * 2))
	petbg:SetHeight((T.petbuttonsize * 10) + (T.petbuttonspacing * 11))
	
	TukuiBar1:SetWidth((T.buttonsize * mbWidth) + (T.buttonspacing * (mbWidth+1)))
	TukuiBar1:SetHeight((T.buttonsize * 2) + (T.buttonspacing*3))
	
	TukuiBar2:SetWidth((T.buttonsize * sbWidth) + (T.buttonspacing * (sbWidth+1)))
	TukuiBar2:SetHeight((T.buttonsize * 2) + (T.buttonspacing*3))
	
	TukuiBar3:SetWidth((T.buttonsize * sbWidth) + (T.buttonspacing * (sbWidth+1)))
	TukuiBar3:SetHeight((T.buttonsize * 2) + (T.buttonspacing*3))
	
	TukuiBar4:SetWidth((T.buttonsize * mbWidth) + (T.buttonspacing * (mbWidth+1)))
	TukuiBar4:SetHeight((T.buttonsize * 2) + (T.buttonspacing*3))
	TukuiBar4.shadow:Hide()
	
	TukuiBar5:SetWidth((T.buttonsize) + (T.buttonspacing * 2))
	TukuiBar5:SetHeight((T.buttonsize * 12) + (T.buttonspacing * 13))
	
	TukuiBar6:SetWidth((T.buttonsize) + (T.buttonspacing * 2))
	TukuiBar6:SetHeight((T.buttonsize * 12) + (T.buttonspacing * 13))
	
	TukuiBar7:SetWidth((T.buttonsize * 12) + (T.buttonspacing * 13))
	TukuiBar7:SetHeight((T.buttonsize) + (T.buttonspacing * 2))
end

-- Default FRAME COVERING BOTTOM ACTIONBARS JUST TO PARENT UF CORRECTLY
local invbarbg = CreateFrame("Frame", "InvTukuiActionBarBackground", UIParent)
	invbarbg:SetPoint("TOPLEFT", TukuiBar2)
	invbarbg:SetPoint("BOTTOMRIGHT", TukuiBar3)

-- INFO LEFT (FOR STATS)
local ileft = CreateFrame("Frame", "TukuiInfoLeft", TukuiBar1)
ileft:CreatePanel("Hydra", T.InfoLeftRightWidth, 20, "BOTTOMLEFT", UIParent, "BOTTOMLEFT", T.Scale(10), T.Scale(7))
ileft:SetFrameLevel(2)
ileft:SetFrameStrata("BACKGROUND")
ileft:CreateShadow("Hydra")

-- INFO RIGHT (FOR STATS)
local iright = CreateFrame("Frame", "TukuiInfoRight", TukuiBar1)
iright:CreatePanel("Hydra", T.InfoLeftRightWidth, 20, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", T.Scale(-10), T.Scale(7))
iright:SetFrameLevel(2)
iright:SetFrameStrata("BACKGROUND")
iright:CreateShadow("Hydra")

if C.chat.background then
	-- CHAT BG LEFT
	local chatleftbg = CreateFrame("Frame", "TukuiChatBackgroundLeft", TukuiInfoLeft)
	chatleftbg:CreatePanel("Transparent", T.InfoLeftRightWidth, 107, "BOTTOM", TukuiInfoLeft, "BOTTOM", 0, T.Scale(22))
	chatleftbg:CreateShadow("Hydra")
	chatleftbg:SetBorder()

	-- CHAT BG RIGHT
	local chatrightbg = CreateFrame("Frame", "TukuiChatBackgroundRight", TukuiInfoRight)
	chatrightbg:CreatePanel("Transparent", T.InfoLeftRightWidth, 107, "BOTTOM", TukuiInfoRight, "BOTTOM", 0, T.Scale(22))
	chatrightbg:CreateShadow("Hydra")
	chatrightbg:SetBorder()

	-- LEFT TAB PANEL
	local tabsbgleft = CreateFrame("Frame", "TukuiTabsLeftBackground", TukuiBar1)
	tabsbgleft:CreatePanel("Transparent", T.InfoLeftRightWidth, 16, "BOTTOMLEFT", chatleftbg, "TOPLEFT", 0, T.Scale(2))
	tabsbgleft:CreateShadow("Hydra")
	tabsbgleft:SetBorder()

	-- RIGHT TAB PANEL
	local tabsbgright = CreateFrame("Frame", "TukuiTabsRightBackground", TukuiBar1)
	tabsbgright:CreatePanel("Transparent", T.InfoLeftRightWidth, 16, "BOTTOMLEFT", chatrightbg, "TOPLEFT", 0, T.Scale(2))
	tabsbgright:CreateShadow("Hydra")
	tabsbgright:SetBorder()
end

-- BOTTOM BAR
local tbottombar = CreateFrame("Frame", "TukuiBottomBar", UIParent)
tbottombar:CreatePanel("Hydra", 1, 22, "TOP", UIParent, "TOP", 0, 0)
tbottombar:ClearAllPoints()
tbottombar:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", T.Scale(-6), T.Scale(-6))
tbottombar:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", T.Scale(6), T.Scale(-6))
tbottombar:SetFrameStrata("BACKGROUND")
tbottombar:SetFrameLevel(0)
tbottombar:CreateShadow("Hydra")

--BATTLEGROUND STATS FRAME
if C["datatext"].battleground == true then
	local bgframe = CreateFrame("Frame", "TukuiInfoLeftBattleGround", UIParent)
	bgframe:CreatePanel("Default", 1, 1, "TOPLEFT", UIParent, "BOTTOMLEFT", 0, 0)
	bgframe:SetAllPoints(ileft)
	bgframe:SetFrameStrata("LOW")
	bgframe:SetFrameLevel(0)
	bgframe:EnableMouse(true)
end

--Pve/Pvp datatext yo
local pvedl = CreateFrame("Frame", "PveDatatextl", TukuiBar2)
pvedl:CreatePanel("Transparent", 97, 15, "TOPRIGHT", TukuiBar2, "TOPRIGHT", T.Scale(0), T.Scale(17))
pvedl:SetFrameLevel(2)
pvedl:SetFrameStrata("BACKGROUND")
pvedl:SetBorder()

--Pve/Pvp datatext yo
local pvedr= CreateFrame("Frame", "PveDatatextr", TukuiBar3)
pvedr:CreatePanel("Transparent", 97, 15, "TOPLEFT", TukuiBar3, "TOPLEFT", T.Scale(0), T.Scale(17))
pvedr:SetFrameLevel(2)
pvedr:SetFrameStrata("BACKGROUND")
pvedr:SetBorder()

--show hide datatext 8 and 9 on entering instance/pvp -- thanks Hydra!
local function OnEvent(self, event)
	if event == "PLAYER_ENTERING_WORLD" then
		local inInstance, instanceType = IsInInstance()
		if (inInstance and instanceType == "party") or (inInstance and  instanceType == "raid") or (inInstance and  instanceType == "pvp")  then
			PveDatatextr:Show()
			PveDatatextl:Show()
		else
			PveDatatextr:Hide()
			PveDatatextl:Hide()
		end
	end
end
local dataFrame = CreateFrame("Frame")
dataFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
dataFrame:SetScript("OnEvent", OnEvent)

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
		
		GameTooltip:SetOwner(self, "ANCHOR_NONE", 0, 0)
		GameTooltip:ClearLines()
		
		if spec == 1 then
			GameTooltip:AddDoubleLine(format(hexa.."%s: %s/%s/%s - [%s]"..hexb, name, p1, p2, p3, PRIMARY))
		else
			GameTooltip:AddDoubleLine(format(hexa.."%s: %s/%s/%s - [%s]"..hexb, name, p1, p2, p3, SECONDARY))
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
frame:SetScript("OnLeave", OnLeave)