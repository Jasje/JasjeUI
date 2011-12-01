local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales
if C.classbar.eclipseBar[1] ~= true or T.myclass ~= "DRUID" then return end

local tbWidth, tbHeight = C.classbar.eclipseBar[2], C.classbar.eclipseBar[3]

local SPELL_POWER_ECLIPSE = SPELL_POWER_ECLIPSE

local eBar = CreateFrame("Frame", "TukuiEclipseBar", UIParent)
eBar:Width(tbWidth)
eBar:Height(tbHeight)
eBar:Point("BOTTOM", TukuiPlayer, "TOP", 0, -3)
eBar:CreateBorder(false, true)
eBar:SetFrameLevel(10)

eBar.lunar = CreateFrame("StatusBar", "TukuiEclipseBar_LunarBar", eBar)
eBar.lunar:SetPoint('LEFT', eBar, 'LEFT', 0, 0)
eBar.lunar:SetSize(eBar:GetWidth(), eBar:GetHeight())
eBar.lunar:SetStatusBarTexture(C.media.normTex)
eBar.lunar:SetStatusBarColor(.50, .52, .70)

eBar.solar = CreateFrame('StatusBar', "TukuiEclipseBar_SolarBar", eBar)
eBar.solar:SetPoint('LEFT', eBar.lunar:GetStatusBarTexture(), 'RIGHT', 0, 0)
eBar.solar:SetSize(eBar:GetWidth(), eBar:GetHeight())
eBar.solar:SetStatusBarTexture(C.media.normTex)
eBar.solar:SetStatusBarColor(.80, .82,  .60)

eBar.tframe = CreateFrame("Frame", nil, eBar)
eBar.tframe:SetAllPoints(eBar)
eBar.tframe:SetFrameLevel(eBar:GetFrameLevel()+2)

eBar.tframe:FontString("text", C.media.pixelfont, 8, "MONOCHROMEOUTLINE")
eBar.tframe.text:SetPoint("TOPLEFT", eBar.tframe, 0, 0)
eBar.tframe.text:SetPoint("BOTTOMRIGHT", eBar.tframe, 0, 2)
eBar.tframe.text:SetJustifyH("CENTER")
eBar.tframe.text:SetJustifyV("CENTER")

local updateBar = function(self, event, unit, powerType)
	if (event ~= "PLAYER_ENTERING_WORLD") and (unit ~= "player" or powerType ~= 'ECLIPSE') then return end
	
	local power = UnitPower('player', SPELL_POWER_ECLIPSE)
	local maxPower = UnitPowerMax('player', SPELL_POWER_ECLIPSE)
	self.lunar:SetMinMaxValues(-maxPower, maxPower)
	self.lunar:SetValue(power)
	self.solar:SetMinMaxValues(-maxPower, maxPower)
	self.solar:SetValue(-power)
	
	--taken from functions.lua
	local dir = GetEclipseDirection()
	if dir == "sun" then
		self.tframe.text:SetText("|cffE5994C"..L.unitframes_ouf_starfirespell.."|r")
	elseif dir == "moon" then
		self.tframe.text:SetText("|cff4478BC"..L.unitframes_ouf_wrathspell.."|r")
	else
		self.tframe.text:SetText("")
	end
end

local function toggleBar(self, event)
	local tree = GetPrimaryTalentTree()
	if tree and (tree == 1) then
		self:Show()
	else
		self:Hide()
	end
	if event == "PLAYER_ENTERING_WORLD" then
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	end
end

local function OnEvent(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" then
		toggleBar(self, event)
		updateBar(self, event, ...)
	elseif event == "PLAYER_TALENT_UPDATE" then
		toggleBar(self, event)
	elseif event == "UNIT_POWER" then
		updateBar(self, event, ...)
	end
end

eBar:RegisterEvent('ECLIPSE_DIRECTION_CHANGE', ECLIPSE_DIRECTION_CHANGE)
eBar:RegisterEvent('UNIT_AURA', UNIT_AURA)
eBar:RegisterEvent('UNIT_POWER')
eBar:RegisterEvent('PLAYER_TALENT_UPDATE')
eBar:RegisterEvent('PLAYER_ENTERING_WORLD')
eBar:SetScript("OnEvent", OnEvent)

local vehicle = CreateFrame("Frame")
vehicle:RegisterEvent("VEHICLE_UPDATE")
vehicle:SetScript("OnEvent", function()
	if UnitHasVehicleUI("player") then
		eBar:Hide()
	else
		eBar:Show()
	end
end)
