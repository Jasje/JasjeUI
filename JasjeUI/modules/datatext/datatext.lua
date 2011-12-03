local T, C, L = unpack(Tukui)

local ccolor = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
hexa, hexb = C["datatext"].color, "|r"

if C["datatext"].classcolor then
	hexa = string.format("|c%02x%02x%02x%02x", 255, ccolor.r * 255, ccolor.g * 255, ccolor.b * 255)
end
-- might be a cleaner way of doing this but it works.
L.datatext_fps = hexa.." fps & "..hexb
L.datatext_ms = hexa.." ms"..hexb
L.datatext_armor = hexa.."Armor"..hexb
L.datatext_friends = hexa.."Friends"..hexb
L.datatext_guild = hexa.."Guild"..hexb
L.datatext_noguild = hexa.."No Guild"..hexb
L.datatext_bags =  hexa.."Bags: "..hexb
L.datatext_playersp = hexa.."sp"..hexb
L.datatext_playerap =  hexa.."ap"..hexb
L.datatext_playerhaste =  hexa.."haste"..hexb
L.datatext_dps =  hexa.."dps"..hexb
L.datatext_hps =  hexa.."hps"..hexb
L.datatext_playerarp =  hexa.."arp"..hexb
L.datatext_playercrit =  hexa.." crit"..hexb
L.datatext_playerheal =  hexa.." heal"..hexb
L.datatext_healing =  hexa.."HEALING"..hexb
L.datatext_damage = hexa.."DAMAGE"..hexb
L.datatext_honor = hexa.."HONOR"..hexb
L.datatext_playeravd = hexa.."avd: "..hexb
L.datatext_tthonorgain = hexa.."Honor Gained:"..hexb
L.datatext_ttdmgdone = hexa.."Damage Done:"..hexb
L.datatext_tthealdone = hexa.."Healing Done:"..hexb

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
	end
end

local font, fontsize, fontflag = C["media"].pixelfont2, 14, "MONOCHROMEOUTLINE"

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
