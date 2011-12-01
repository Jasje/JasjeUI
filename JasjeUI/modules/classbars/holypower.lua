local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales
if C.classbar.holyPower[1] ~= true or T.myclass ~= "PALADIN" then return end

local tbWidth, tbHeight = C.classbar.holyPower[2], C.classbar.holyPower[3]

local hPower = CreateFrame("Frame", "TukuiHolyPower", UIParent)
hPower:Width(tbWidth)
hPower:Height(tbHeight)
hPower:Point("BOTTOM", TukuiPlayer, "TOP", 0, -3)
hPower:CreateBorder(false, true)
hPower:SetFrameLevel(10)

local charges = {}

for i=1,3 do
	charges[i] = CreateFrame("Frame", "TukuiHolyPower_Charge"..i, hPower)
	charges[i]:SetWidth((tbWidth-2) / 3)
	charges[i]:SetHeight(tbHeight)
	charges[i]:CreateBorder(false, true)
	charges[i].tex = charges[i]:CreateTexture(nil, "OVERLAY")
	charges[i].tex:SetTexture(C.media.normTex)
	charges[i].tex:SetVertexColor(225/255,225/255,15/255)
	charges[i].tex:AllPoints(charges[i])
	charges[i].BG = charges[i]:CreateTexture(nil, 'BORDER')
	charges[i].BG:SetAllPoints()
	charges[i].BG:SetTexture(.1, .1, .1)
	if i==1 then
		charges[i]:SetPoint("LEFT", hPower, "LEFT", 0, 0)
	else
		charges[i]:SetPoint("LEFT", charges[i-1], "RIGHT", 1, 0)
	end
end

local function UpdateCharges()
	local numCharges = UnitPower("player", SPELL_POWER_HOLY_POWER)
	for i = 1, 3 do
		if (i <= numCharges) then
			charges[i].tex:Show()
		else
			charges[i].tex:Hide()
		end
	end
end

hPower:RegisterEvent("UNIT_POWER")
hPower:RegisterEvent("PLAYER_ENTERING_WORLD")
hPower:SetScript("OnEvent", UpdateCharges)

local vehicle = CreateFrame("Frame")
vehicle:RegisterEvent("VEHICLE_UPDATE")
vehicle:SetScript("OnEvent", function()
	if UnitHasVehicleUI("player") then
		hPower:Hide()
	else
		hPower:Show()
	end
end)