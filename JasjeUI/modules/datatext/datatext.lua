local T, C, L = unpack(Tukui)

-- datatext panel position
local DataTextPosition = function(f, t, o)
	local left = TukuiInfoLeft
	local right = TukuiInfoRight

	if o == 1 then
	    t:ClearAllPoints()
		t:SetParent(left)
		t:SetHeight(left:GetHeight())
		t:SetPoint("LEFT", left, 30, 2)
	elseif o == 2 then
	    t:ClearAllPoints()
		t:SetParent(left)
		t:SetHeight(left:GetHeight())
		t:SetPoint("CENTER", 0, 2)			
	elseif o == 3 then
	    t:ClearAllPoints()
		t:SetParent(left)
		t:SetHeight(left:GetHeight())
		t:SetPoint("RIGHT", left, -30, 2)
	elseif o == 4 then
	    t:ClearAllPoints()
		t:SetParent(right)
		t:SetHeight(right:GetHeight())
		t:SetPoint("LEFT", right, 30, 2)
	elseif o == 5 then
        t:ClearAllPoints()
		t:SetParent(right)
		t:SetHeight(right:GetHeight())
		t:SetPoint("CENTER", 0, 2)		
	elseif o == 6 then
	    t:ClearAllPoints()
		t:SetParent(right)
		t:SetHeight(right:GetHeight())
		t:SetPoint("RIGHT", right, -30, 2)
else
		f:Hide()
		t:Hide()	
	end
end	

-- Tukui DataText List
local datatext = {
	"Guild",
	"Friends",
	"Gold",
	"FPS",
	"System",
	"Bags",
	"Gold",
	"Time",
	"Durability",
	"Heal",
	"Damage",
	"Power",
	"Haste",
	"Crit",
	"Avoidance",
	"Armor",
	"Currency",
	"Hit",
	"Mastery",
	"MicroMenu",
	"Regen",
	"Talent",
	"CallToArms",
}

-- Overwrite & Update Show/Hide/Position of all Datatext
for _, data in pairs(datatext) do
	local t = "TukuiStat"
	local frame = _G[t..data]
	local text = _G[t..data.."Text"]

	if frame and frame.Option then
		DataTextPosition(frame, text, frame.Option)
		text:SetFont(T.SetDatatextFont())
		text:SetShadowOffset(0,0)
	end
end
--work-a-around
if C.datatext.battleground then
	TukuiStatBattleGroundText1:SetFont(T.SetDatatextFont())
	TukuiStatBattleGroundText1:SetPoint("LEFT", 30, 2)
	TukuiStatBattleGroundText2:SetFont(T.SetDatatextFont())
	TukuiStatBattleGroundText2:SetPoint("CENTER", 0, 2)
	TukuiStatBattleGroundText3:SetFont(T.SetDatatextFont())
	TukuiStatBattleGroundText3:SetPoint("RIGHT", -30, 2)
end
