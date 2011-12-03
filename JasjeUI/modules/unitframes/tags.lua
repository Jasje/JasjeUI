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