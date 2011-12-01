local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales
if C.classbar.comboPoints[1] ~= true then return end

-- Taken from Smelly_Combo :P
local colors = { 
	{.69, .31, .31, 1},
	{.65, .42, .31, 1},
	{.65, .63, .35, 1},
	{.46, .63, .35, 1},
	{.33, .63, .33, 1},
}

local tbWidth, tbHeight = C.classbar.comboPoints[2], C.classbar.comboPoints[3]

local cpoints = CreateFrame("Frame", "TukuiComboPoints", UIParent)
cpoints:Width(tbWidth)
cpoints:Height(tbHeight)
cpoints:Point("BOTTOM", TukuiPlayer, "TOP", 0, -3)
cpoints:CreateBorder(false, true)
cpoints:SetFrameLevel(10)

local points = {}

for i=1,MAX_COMBO_POINTS do
	points[i] = CreateFrame("Frame", "TukuiComboPoints_Point"..i, cpoints)
	points[i]:SetWidth((tbWidth-(MAX_COMBO_POINTS-1)) / MAX_COMBO_POINTS)
	points[i]:SetHeight(tbHeight)
	points[i]:CreateBorder(false, true)
	points[i].tex = points[i]:CreateTexture(nil, "OVERLAY")
	points[i].tex:SetTexture(C.media.normTex)
	points[i].tex:SetVertexColor(unpack(colors[i]))
	points[i].tex:AllPoints(points[i])
	points[i].BG = points[i]:CreateTexture(nil, 'BORDER')
	points[i].BG:SetAllPoints()
	points[i].BG:SetTexture(.1, .1, .1)
	if i==1 then
		points[i]:SetPoint("LEFT", cpoints, "LEFT", 0, 0)
	else
		points[i]:SetPoint("LEFT", points[i-1], "RIGHT", 1, 0)
	end
end

local function UpdatePoints()
	local numPoints = GetComboPoints("player", "target")
	if numPoints <= 0 then
		cpoints:Hide()
	else
		cpoints:Show()
		for i = 1, 5 do
			if (i <= numPoints) then
				points[i].tex:Show()
			else
				points[i].tex:Hide()
			end
		end
	end
end


cpoints:RegisterEvent("UNIT_COMBO_POINTS")
cpoints:RegisterEvent("PLAYER_TARGET_CHANGED")
cpoints:RegisterEvent("PLAYER_ENTERING_WORLD")
cpoints:SetScript("OnEvent", UpdatePoints)