local T, C, L = unpack(Tukui)

local buffs = TukuiAurasPlayerBuffs
local debuffs = TukuiAurasPlayerDebuffs

buffs:ClearAllPoints()
buffs:SetPoint("TOPRIGHT", Minimap,"TOPLEFT" ,-8, 2)
buffs:SetAttribute("wrapAfter", 14)
buffs:SetAttribute("xOffset", -33)
buffs:SetAttribute("wrapYOffset", -39)

debuffs:ClearAllPoints()
debuffs:SetPoint("TOPRIGHT", Minimap, "BOTTOMLEFT",-8, -15)
debuffs:SetAttribute("wrapAfter", 14)
debuffs:SetAttribute("xOffset", -33)

local hooks = {
	TukuiAurasPlayerBuffs,
	TukuiAurasPlayerDebuffs,
	TukuiAurasPlayerConsolidate,
}

local OnAttributeChanged = function(self)
	for i = 1, self:GetNumChildren() do
		local child = select(i, self:GetChildren())
		
		if child.Duration then
			child.Duration:SetFont(C["media"].pixelfont, 8, "MONOCHROMEOUTLINE")
			child.Duration:ClearAllPoints()
			child.Duration:SetPoint("BOTTOM", 0, -12)
		end
		
		if child.Count then
			child.Count:SetFont(C["media"].pixelfont, 16, "MONOCHROMEOUTLINE")
			child.Count:ClearAllPoints()
			child.Count:SetPoint("BOTTOMRIGHT", -1, 1)
		end
	end
end

for _, frame in pairs(hooks) do
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	frame:HookScript("OnAttributeChanged", OnAttributeChanged)
	frame:HookScript("OnEvent", OnAttributeChanged)
end