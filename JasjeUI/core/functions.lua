local T, C, L = unpack(Tukui)

T.DataTextTooltipAnchor = function(self)
	local panel = self:GetParent()
	local anchor = "ANCHOR_TOP"
	local xoff = 0
	local yoff = T.Scale(2)

	if panel == TukuiInfoLeft then
		anchor = "ANCHOR_TOPLEFT"
	elseif panel == TukuiInfoRight then
		anchor = "ANCHOR_TOPRIGHT"
	elseif panel == TukuiMinimapStatsLeft or panel == TukuiMinimapStatsRight then
		local position = TukuiMinimap:GetPoint()
		if position:match("LEFT") then
			anchor = "ANCHOR_BOTTOMRIGHT"
			yoff = T.Scale(-6)
			xoff = 0 - TukuiMinimapStatsRight:GetWidth()
		elseif position:match("RIGHT") then
			anchor = "ANCHOR_BOTTOMLEFT"
			yoff = T.Scale(-6)
			xoff = TukuiMinimapStatsRight:GetWidth()
		else
			anchor = "ANCHOR_BOTTOM"
			yoff = T.Scale(-6)
		end
	end

	return anchor, panel, xoff, yoff
end