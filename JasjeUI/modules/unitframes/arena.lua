local T, C, L, G = unpack(Tukui) 
if C.unitframes.enable ~= true then return end

    for i = 1, 5 do
		local self = _G["TukuiArena" .. i]

		-- we dont need too see this
		    self:SetBackdrop(nil)
	        self:SetBackdropColor(0, 0, 0)																																													  
        -- health
			self.Health:Size(205, 30)
			self.Health:CreateBorder(true)
			self.Health:SetStatusBarTexture(C["media"].Glamour)
			self.Health:SetStatusBarColor(.2, .2, .2, 1)
			self.Health.value:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		-- killing stuff		
		    self.shadow:Kill()
			self.Debuffs:Hide()
        -- name
			self.Name:SetFont(C.media.pixelfont, 8, "MONOCHROMEOUTLINE")
		-- power
		    self.Power:ClearAllPoints()
		    self.Power:Size(205, 2)
		    self.Power:Point("TOP", self.Health, "BOTTOM", 0, -5)
			self.Power:SetFrameLevel(4)
			self.Power:CreateBorder(true)

			self.Power.colorTapping = true
			self.Power.colorClass = false
			self.Power.bg.multiplier = 0.1				
			self.Power.colorPower = true
			self.Power.value:SetFont(C.media.pixelfont, 8, "MONOCHROMEOUTLINE")
        -- castbar
			self.Castbar:ClearAllPoints()
			self.Castbar:SetHeight(20)
			self.Castbar:Point("RIGHT", self, "RIGHT", -265, 3)
			self.Castbar:CreateBackdrop("Default")

			self.Castbar.bg:Kill()

			self.Castbar.bg = self.Castbar:CreateTexture(nil, "BORDER")
			self.Castbar.bg:SetAllPoints(self.Castbar)
			self.Castbar.bg:SetTexture(C["media"].Glamour)
			self.Castbar.bg:SetVertexColor(0.05, 0.05, 0.05)

			self.Castbar.Time:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
			self.Castbar.Time:Point("RIGHT", self.Castbar, "RIGHT", -4, 1)

			self.Castbar.Text:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
			self.Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 1)

			self.Castbar.PostCastStart = T.PostCastStart
			self.Castbar.PostChannelStart = T.PostCastStart

			if(C["unitframes"].cbicons == true) then
     			self.Castbar:Width(173)

				self.Castbar.button:ClearAllPoints()
				self.Castbar.button:SetPoint("RIGHT", self.Castbar, "LEFT", -5, 0)
				self.Castbar.button:Size(24)
			else
				self.Castbar:Width(200)

				self.Castbar.button:Kill()
			end
			
	    -- Trinket
		    self.Trinket:ClearAllPoints()
		    self.Trinket:Size(37)
		    self.Trinket:Point("LEFT", self.PVPSpecIcon, "RIGHT", 6, 0)
    		--self.Trinket.trinketUseAnnounce = false	
			
			self.PVPSpecIcon:ClearAllPoints()
            self.PVPSpecIcon:SetTemplate("Default")
	 		self.PVPSpecIcon:Size(37)
			self.PVPSpecIcon:Point("TOPLEFT", self, "TOPRIGHT", 5, 0)

			for i = 1, 5 do
		        local Frame = _G["TukuiPrepArena"..i]
		        local Spec = Frame.SpecClass
				local SpecH = Frame.Health

		       Spec:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME") 
			   SpecH:SetStatusBarTexture(C["media"].Glamour)
	        end
			
		-- Auratracker Frame
		    local AuraTracker = CreateFrame("Frame", nil, self)
		    AuraTracker:Size(41)
	        AuraTracker:Point("TOPRIGHT", self, "TOPLEFT", -5, 2)
	        AuraTracker:SetTemplate("Default")

	        AuraTracker.icon = AuraTracker:CreateTexture(nil, "OVERLAY")
	        AuraTracker.icon:SetAllPoints(AuraTracker)
		    AuraTracker.icon:Point("TOPLEFT", AuraTracker, 2, -2)
		    AuraTracker.icon:Point("BOTTOMRIGHT", AuraTracker, -2, 2)
		    AuraTracker.icon:SetTexCoord(0.07,0.93,0.07,0.93)

		    AuraTracker.text = T.SetFontString(AuraTracker, C.media.pixelfont, 14, "OUTLINEMONOCHROME")
		    AuraTracker.text:SetPoint("CENTER", AuraTracker, 0, -1)
		    AuraTracker:SetScript("OnUpdate", T.AuraTrackerTime)
		    self.AuraTracker = AuraTracker
		-- ClassIcon			
		    local class = AuraTracker:CreateTexture(nil, "ARTWORK")
		    class:SetAllPoints(AuraTracker.icon)
		    self.ClassIcon = class

		    self:EnableElement('ClassIcon')
		    self:EnableElement('AuraTracker')
		-- size
			self:Size(205, 41)
			self:ClearAllPoints()

    	if( i == 1 ) then
		    self:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -200, -300)
	    else
		    self:SetPoint("TOP", _G["TukuiArena"..i-1], "BOTTOM", 0, -25)
		end	
	end