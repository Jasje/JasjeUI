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
	button.count:ClearAllPoints()
	button.count:Point("TOPLEFT", button,1, 5)
	button.count:SetFont(T.SetPixelFont())
	
	button.remaining:ClearAllPoints()
	button.remaining:Point("CENTER", button,2, -2)
	button.remaining:SetFont(T.SetPixelFont())
end

local oUF = oUFTukui

local ticks = {}
function T.HideTicks()
	for _, tick in pairs(ticks) do
		tick:Hide()
	end		
end

function T.SetCastTicks(frame, numTicks)
	T.HideTicks()
	if(numTicks and numTicks > 0 ) then
		local d = frame:GetWidth() / numTicks
		for i = 1, numTicks do
			if not ticks[i] then
				ticks[i] = frame:CreateTexture(nil, "OVERLAY")
				ticks[i]:SetTexture(C["media"].Glamour)
				ticks[i]:SetVertexColor(0, 0, 0)
				ticks[i]:SetWidth(2)
				ticks[i]:SetHeight(frame:GetHeight())
			end
			ticks[i]:ClearAllPoints()
			ticks[i]:SetPoint("CENTER", frame, "LEFT", d * i, 0)
			ticks[i]:Show()
		end
	end
end

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

		if(C["castbar"].ticks == true and unit == "player") then
			local baseTicks = T.ChannelTicks[name]
			if(baseTicks and T.HastedChannelTicks[name] ) then
				local tickIncRate = 1 / baseTicks
				local curHaste = UnitSpellHaste("player") * 0.01
				local firstTickInc = tickIncRate / 2
				local bonusTicks = 0
				if(curHaste >= firstTickInc) then
					bonusTicks = bonusTicks + 1
				end

				local x = tonumber(T.Round(firstTickInc + tickIncRate, 2))
				while curHaste >= x do
					x = tonumber(T.Round(firstTickInc + (tickIncRate * bonusTicks), 2))
					if(curHaste >= x) then
						bonusTicks = bonusTicks + 1
					end
				end

				T.SetCastTicks(self, baseTicks + bonusTicks)
			elseif(baseTicks) then
				T.SetCastTicks(self, baseTicks)
			else
				T.HideTicks()
			end
		elseif(unit == "player") then
			T.HideTicks()
		end
	end	
end	

hooksecurefunc(T, "UpdateThreat", function(self, event, unit)
	local threat = UnitThreatSituation(self.unit)
	if (threat == 3) then
		if self.Health.backdrop and self.Power.backdrop then
			self.Health.backdrop:SetBackdropBorderColor(1,0,0,1)
			self.Power.backdrop:SetBackdropBorderColor(1,0,0,1)
		else
			self.Name:SetTextColor(1,0.1,0.1)
		end
	else
		if self.Health.backdrop and self.Power.backdrop then
			self.Health.backdrop:SetBackdropBorderColor(unpack(C["media"].bordercolor))
			self.Power.backdrop:SetBackdropBorderColor(unpack(C["media"].bordercolor))
		else
			self.Name:SetTextColor(1,1,1)
		end
	end
end)

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