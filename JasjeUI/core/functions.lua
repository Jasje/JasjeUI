local T, C, L = unpack(Tukui)

T.StatColor = T.RGBToHex(unpack(C.media.datatextcolor1))
T.StatColorEnd = "|r"

T.SetPixelFont = function()
	return C.media.pixelfont2, C.datatext.fontsize, "MONOCHROMEOUTLINE"
end

if T.client == "ruRU" then
	C.media.pixelfont = C.media.ruRUpixel
	C.media.pixelfont2 = C.media.ruRUpixel2	
end

T.SetTooltipFont = function()
	if T.client == "ruRU" then
		return C.media.pixelfont2, C.media.ruRUfontsize, "MONOCHROMEOUTLINE"
	else
		return C.media.pixelfont2, C.tooltip.fontsize, "MONOCHROMEOUTLINE"
	end
end

T.SetDatatextFont = function()
	if T.client == "ruRU" then
		return C.media.pixelfont2, C.media.ruRUfontsize, "MONOCHROMEOUTLINE"
	else
		return C.media.pixelfont2, C.datatext.fontsize, "MONOCHROMEOUTLINE"
	end
end

T.SkinAura = function (self, button)
	button.count:SetFont(T.SetPixelFont())
	button.remaining:SetFont(T.SetPixelFont())
end

local oUF = oUFTukui
-- color castbar
T.PostCastStart = function(self, unit, name, rank, castid)
	if unit == "vehicle" then unit = "player" end
	--Fix blank castbar with opening text
	if name == "Opening" then
		self.Text:SetText("Opening")
	end

	if self.interrupt and unit ~= "player" then
		if UnitCanAttack("player", unit) then
			self:SetStatusBarColor(unpack(C["castbar"].nointerruptcolor))
		else
			self:SetStatusBarColor(unpack(C["castbar"].nointerruptcolor))	
		end
	else
        if C["castbar"].classcolor then
            self:SetStatusBarColor(unpack(oUF.colors.class[select(2, UnitClass(unit))]))
        else
            self:SetStatusBarColor(unpack(C["castbar"].castbarcolor))
        end
	end	
end	

-- AuraTracker Function
function updateAuraTrackerTime(self, elapsed)
	if (self.active) then
		self.timeleft = self.timeleft - elapsed

		if (self.timeleft <= 5) then
			self.text:SetTextColor(1, 0, 0)
		else
			self.text:SetTextColor(1, 1, 1)
		end
		
		if (self.timeleft <= 0) then
			self.icon:SetTexture("")
			self.text:SetText("")
		end	
		self.text:SetFormattedText("%.1f", self.timeleft)
	end
end