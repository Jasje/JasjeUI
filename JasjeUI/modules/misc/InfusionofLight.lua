--[[

http://www.wowinterface.com/downloads/info19542-InfusionofLight.html#info
]]
local IoL_ButtonPrefix = IsAddOnLoaded("Bartender4") and "BT4Button" or "ActionButton"
local IoL = CreateFrame("Frame", "ShockingFrame", UIParent)
IoL:SetScript("OnUpdate", function(self, elapsed)
	if ( IoL_HasFullHolyPower() ) then
		IoL_Glow('Word of Glory')
		IoL_Glow('Light of Dawn')
		IoL_Glow('Shield of the Righteous')
		IoL_Glow("Templar's Verdict")
	else
		IoL_Dim('Word of Glory')
		IoL_Dim('Light of Dawn')
		IoL_Dim('Shield of the Righteous')
		IoL_Dim("Templar's Verdict")
	end
end)
function IoL_HasFullHolyPower()
	return UnitPower("player", SPELL_POWER_HOLY_POWER) == 3
end
function IoL_HasAura(aura)
	if aura ~= nil then
		local _, _, _, _, _, _, _, _, _, _, id = UnitAura("player", aura)
		return id ~= nil and id > 0
	end
	return false
end
function IoL_Triggers(id, ability)
	local button = _G[IoL_ButtonPrefix .. id];
	local a_type, a_id, a_subtype, a_spell = GetActionInfo(id)
	if ( a_type == 'macro' ) then
		local m_name, _ = GetMacroSpell(a_id)
		return ( m_name == ability )
	elseif ( a_type == 'spell' ) then
		local s_name, _, _, _, _, _, _, _, _ = GetSpellInfo(a_id)
		return ( s_name == ability )
	end
	return false
end
function IoL_Glow(spell)
	for i = 1, 120 do
		local btn = _G[IoL_ButtonPrefix .. i];
		if ( btn ~= nil ) then if ( IoL_Triggers(i, spell) ) then ActionButton_ShowOverlayGlow(btn) end end
	end
end
function IoL_Dim(spell)
	for i = 1, 120 do
		local btn = _G[IoL_ButtonPrefix .. i];
		if ( btn ~= nil ) then if ( IoL_Triggers(i, spell) ) then ActionButton_HideOverlayGlow(btn) end end
	end
end
