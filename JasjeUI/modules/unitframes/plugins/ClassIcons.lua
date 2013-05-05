local T, C, L, G = unpack(Tukui)
local oUF = oUFTukui

if not oUF then return end

local Coords = CLASS_ICON_TCOORDS

local Update = function(self, event)
	local _, class = UnitClass(self.unit)
	local icon = self.ClassIcon

	if (class) then
		icon:SetTexCoord(unpack(Coords[class]))
		icon:Show()
	else
		icon:Hide()
	end
end

local Enable = function(self)
	local cicon = self.ClassIcon

	if(cicon) then
		self:RegisterEvent("PARTY_MEMBERS_CHANGED", Update)
		self:RegisterEvent("PLAYER_TARGET_CHANGED", Update)

		cicon:SetTexture[[Interface\WorldStateFrame\Icons-Classes]]
		
		return true
	end
end

local Disable = function(self)
	local ricon = self.ClassIcon
	if(ricon) then
		self:UnregisterEvent("PARTY_MEMBERS_CHANGED", Update)
		self:UnregisterEvent("PLAYER_TARGET_CHANGED", Update)
	end
end

oUF:AddElement('ClassIcon', Update, Enable, Disable)