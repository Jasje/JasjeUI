local T, C, L = unpack(Tukui)

local buffs = TukuiAurasPlayerBuffs
local debuffs = TukuiAurasPlayerDebuffs

buffs:ClearAllPoints()
buffs:SetPoint("TOPRIGHT", Minimap,"TOPLEFT" ,-8, 2)

debuffs:ClearAllPoints()
debuffs:SetPoint("TOPRIGHT", Minimap, "BOTTOMLEFT",-8, -5)