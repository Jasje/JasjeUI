local T, C, L = unpack(Tukui)

-- datatext panel position
T.PP = function(p, obj)
	local left = TukuiInfoLeft
	local right = TukuiInfoRight

	if p == 1 then
		obj:SetParent(left)
		obj:SetHeight(left:GetHeight())
		obj:SetPoint("LEFT", left, 30, 0)
		obj:SetPoint('TOP', left, 0, 2)
		obj:SetPoint('BOTTOM', left)
	elseif p == 2 then
		obj:SetParent(left)
		obj:SetHeight(left:GetHeight())
		obj:SetPoint('TOP', left, 0, 2)
		obj:SetPoint('BOTTOM', left)
	elseif p == 3 then
		obj:SetParent(left)
		obj:SetHeight(left:GetHeight())
		obj:SetPoint("RIGHT", left, -30, 0)
		obj:SetPoint('TOP', left, 0, 2)
		obj:SetPoint('BOTTOM', left)
	elseif p == 4 then
		obj:SetParent(right)
		obj:SetHeight(right:GetHeight())
		obj:SetPoint("LEFT", right, 30, 0)
		obj:SetPoint('TOP', right, 0, 2)
		obj:SetPoint('BOTTOM', right)
	elseif p == 5 then
		obj:SetParent(right)
		obj:SetHeight(right:GetHeight())
		obj:SetPoint('TOP', right, 0, 2)
		obj:SetPoint('BOTTOM', right)
	elseif p == 6 then
		obj:SetParent(right)
		obj:SetHeight(right:GetHeight())
		obj:SetPoint("RIGHT", right, -30, 0)
		obj:SetPoint('TOP', right, 0, 2)
		obj:SetPoint('BOTTOM', right)
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

local font, fontsize, fontflag = C.media.pixelfont2, 14, "MONOCHROMEOUTLINE"

-- Setting the fonts for all Datatexts
if C.datatext.armor > 0 then
   TukuiStatArmorText:SetFont(font, fontsize, fontflag)
end

if C.datatext.avd > 0 then
    TukuiStatAvoidanceText:SetFont(font, fontsize, fontflag)
end

if C.datatext.bags > 0 then
    TukuiStatBagsText:SetFont(font, fontsize, fontflag)
end

if C.datatext.battleground then
    TukuiStatBattleGroundText1:SetFont(font, fontsize, fontflag)
	TukuiStatBattleGroundText2:SetFont(font, fontsize, fontflag)
	TukuiStatBattleGroundText3:SetFont(font, fontsize, fontflag)
end

if C.datatext.calltoarms > 0 then
   TukuiStatCallToArmsText:SetFont(font, fontsize, fontflag)
end

if C.datatext.crit > 0 then
   TukuiStatCritText:SetFont(font, fontsize, fontflag)
end

if C.datatext.currency > 0 then
    TukuiStatCurrencyText:SetFont(font, fontsize, fontflag)
end

if C.datatext.dps_text > 0 then
   TukuiStatDPSText:SetFont(font, fontsize, fontflag)
end

if C.datatext.dur > 0 then
TukuiStatDurabilityText:SetFont(font, fontsize, fontflag)
end

if C.datatext.fps_ms > 0 then
   TukuiStatFPSText:SetFont(font, fontsize, fontflag)
end

if C.datatext.friends > 0 then
    TukuiStatFriendsText:SetFont(font, fontsize, fontflag)
end

if C.datatext.gold > 0 then
   TukuiStatGoldText:SetFont(font, fontsize, fontflag)
end

if C.datatext.guild > 0 then
   TukuiStatGuildText:SetFont(font, fontsize, fontflag)
end

if C.datatext.haste > 0 then
   TukuiStatHasteText:SetFont(font, fontsize, fontflag)
end

if C.datatext.hit > 0 then
   TukuiStatHitText:SetFont(font, fontsize, fontflag)
end

if C.datatext.hps_text > 0 then
   TukuiStatHealText:SetFont(font, fontsize, fontflag)
end

if C.datatext.mastery > 0 then
   TukuiStatMasteryText:SetFont(font, fontsize, fontflag)
end

if C.datatext.micromenu > 0 then
   TukuiStatMicroMenuText:SetFont(font, fontsize, fontflag)
end

if C.datatext.power > 0 then
   TukuiStatPowerText:SetFont(font, fontsize, fontflag)
end

if C.datatext.regen > 0 then
   TukuiStatRegenText:SetFont(font, fontsize, fontflag)
end

if C.datatext.system > 0 then
   TukuiStatSystemText:SetFont(font, fontsize, fontflag)
end

if C.datatext.talent > 0 then
   TukuiStatTalentText:SetFont(font, fontsize, fontflag)
end

if C.datatext.wowtime > 0 then
    TukuiStatTimeText:SetFont(font, fontsize, fontflag)
end
