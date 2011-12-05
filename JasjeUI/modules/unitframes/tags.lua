local oUF = oUFTukui

local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales


oUF.TagEvents['Tukui:perchp'] = 'UNIT_HEALTH'
oUF.Tags['Tukui:perchp'] = function(unit)
	local reaction = UnitReaction(unit, 'player')
	local maxHealth = UnitHealthMax(unit)

	local unitPercHP = 0
	if maxHealth > 0 then
		unitPercHP = UnitHealth(unit)/maxHealth*100
	end

	if UnitIsPlayer(unit) then
		return string.format("%s%.1f%%", _TAGS['raidcolor'](unit), unitPercHP)
	elseif reaction then
		local c = T.oUF_colors.reaction[reaction]
		return string.format('|cff%02x%02x%02x%.1f%%', c[1] * 255, c[2] * 255, c[3] * 255, unitPercHP)
	else
		r, g, b = .84,.75,.65
		return string.format('|cff%02x%02x%02x%.1f%%', r * 255, g * 255, b * 255, unitPercHP)
	end
end

-- Testui Command
local testui = TestUI or function() end
TestUI = function(msg)
	if msg == "a" or msg == "arena" then
		TukuiArena1:Show(); TukuiArena1.Hide = function() end; TukuiArena1.unit = "player"
		TukuiArena2:Show(); TukuiArena2.Hide = function() end; TukuiArena2.unit = "player"
		TukuiArena3:Show(); TukuiArena3.Hide = function() end; TukuiArena3.unit = "player"
		TukuiArena4:Show(); TukuiArena4.Hide = function() end; TukuiArena4.unit = "player"
		TukuiArena5:Show(); TukuiArena5.Hide = function() end; TukuiArena5.unit = "player"
	elseif msg == "boss" or msg == "b" then
		TukuiBoss1:Show(); TukuiBoss1.Hide = function() end; TukuiBoss1.unit = "player"
		TukuiBoss2:Show(); TukuiBoss2.Hide = function() end; TukuiBoss2.unit = "player"
		TukuiBoss3:Show(); TukuiBoss3.Hide = function() end; TukuiBoss3.unit = "player"
	elseif msg == "buffs" then -- better dont test it ^^
		UnitAura = function()
			-- name, rank, texture, count, dtype, duration, timeLeft, caster
			return 139, 'Rank 1', 'Interface\\Icons\\Spell_Holy_Penance', 1, 'Magic', 0, 0, "player"
		end
		if(oUF) then
			for i, v in pairs(oUF.units) do
				if(v.UNIT_AURA) then
					v:UNIT_AURA("UNIT_AURA", v.unit)
				end
			end
		end
	end
end
SlashCmdList.TestUI = TestUI
SLASH_TestUI1 = "/testui"