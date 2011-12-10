local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales
if C.unitframes.enable ~= true then return end

for i = 1, 5 do
		local self = _G["TukuiArena" .. i]
		
		self.shadow:Kill()
	
		self:SetBackdrop(nil)
	    self:SetBackdropColor(0, 0, 0)
		
		do
			self.Health:Size(220, 15)
			self.Health:CreateBorder(true)
			self.Health:SetStatusBarTexture(C["media"].Glamour)
			
			self.Health.value:Hide()
			self.Power.value:Hide()
			self.Debuffs:Hide()

	        self.Name:ClearAllPoints()
	        self.Name:Point("RIGHT", self.Health, "RIGHT", -5, 0)
	        self.Name:SetFont(C.media.pixelfont, 8, "MONOCHROMEOUTLINE")
			self.Name:SetJustifyH("LEFT")
			
			local percHP = T.SetFontString(self.Health, C.media.pixelfont, 8, "OUTLINEMONOCHROME")
	        percHP:SetPoint("LEFT", self.Health, "LEFT", 5, -0)
	    	self:Tag(percHP, "[Tukui:perchp]")
		    self.percHP = percHP
		end
		
		do
		    self.Power:ClearAllPoints()
		    self.Power:Size(220, 15)
            self.Power:Point("LEFT", self.Health, "BOTTOMLEFT", 0, -14)
			self.Power:SetFrameLevel(4)
			self.Power:CreateBorder(true)

			self.Power.colorTapping = true
			self.Power.colorClass = false
			self.Power.bg.multiplier = 0.1				
			self.Power.colorPower = true
		end

		do
			self.Castbar:ClearAllPoints()
		    self.Castbar:Point("TOP", self, "BOTTOM", 17, 8)
			
			self.Castbar:SetHeight(27)
			self.Castbar:SetWidth(268)
			self.Castbar:SetStatusBarTexture(C["media"].Glamour)

			self.Castbar.bg:SetTemplate("Transparent")
		    self.Castbar.bg:SetBorder()
			
			self.Castbar.button:ClearAllPoints()
			self.Castbar.button:Height(self.Castbar:GetHeight()+5)
		    self.Castbar.button:Width(self.Castbar:GetHeight()+5)
		    self.Castbar.button:Point("RIGHT", self.Castbar, "LEFT",-4, 0)
		    self.Castbar.button:SetTemplate("Hydra")

			self.Castbar.Text:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
			self.Castbar.Text:SetParent(self.Castbar)
			self.Castbar.Text:ClearAllPoints()
			self.Castbar.Text:SetPoint( "LEFT", self.Castbar, "LEFT", 5, 0 )
			self.Castbar.Text.ClearAllPoints = T.dummy
			self.Castbar.Text.SetPoint = T.dummy

		    self.Castbar.CustomTimeText = T.CustomCastTimeText
	        self.Castbar.CustomDelayText = T.CustomCastDelayText
            self.Castbar.PostCastStart = T.PostCastStart
            self.Castbar.PostChannelStart = T.PostCastStart
			
			self.Castbar.time:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
			self.Castbar.time:SetParent(self.Castbar)
			self.Castbar.time:ClearAllPoints()
			self.Castbar.time:SetPoint( "RIGHT", self.Castbar, "RIGHT", -5, 0 )
			self.Castbar.time.ClearAllPoints = T.dummy
			self.Castbar.time.SetPoint = T.dummy
		end

		do
		   self.Trinketbg:ClearAllPoints()
		   self.Trinketbg:Size(40)
		   self.Trinketbg:SetPoint("LEFT", self.Health, "RIGHT", 4, -11)				
        end
		
	    do
		-- Auratracker Frame
		local AuraTracker = CreateFrame("Frame", nil, self)
		AuraTracker:Size(40)
		AuraTracker:Point("RIGHT", self.Health, "LEFT", -4, -11)
		AuraTracker:SetTemplate("Default")
		
		AuraTracker.icon = AuraTracker:CreateTexture(nil, "OVERLAY")
		AuraTracker.icon:SetAllPoints(AuraTracker)
		AuraTracker.icon:Point("TOPLEFT", AuraTracker, 2, -2)
		AuraTracker.icon:Point("BOTTOMRIGHT", AuraTracker, -2, 2)
		AuraTracker.icon:SetTexCoord(0.07,0.93,0.07,0.93)
		
		AuraTracker.text = T.SetFontString(AuraTracker,  C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		AuraTracker.text:SetPoint("CENTER", AuraTracker, 0, 0)
		AuraTracker:SetScript("OnUpdate", updateAuraTrackerTime)
		self.AuraTracker = AuraTracker
		
		-- ClassIcon			
		local class = AuraTracker:CreateTexture(nil, "ARTWORK")
		class:SetAllPoints(AuraTracker.icon)
		self.ClassIcon = class
	end	
		
		do
			self:Size(220, 50)
			self:ClearAllPoints()
			if( i == 1 ) then
			    self:Point("BOTTOM", TukuiTarget, "TOP", 150, 150)
		    else
			    self:SetPoint("BOTTOM", _G["TukuiArena"..i-1], "TOP", 0, 25)
		    end
		end
	end