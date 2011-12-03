local T, C, L = unpack(Tukui)
--[[
local children

local GetActiveLayout = function()
	local players = (GetNumPartyMembers() + 1)
	
	if UnitInRaid("player") then
		players = GetNumRaidMembers()
	end

	if IsAddOnLoaded("Tukui_Raid_Healing") then
		if C["unitframes"].gridonly then
			return TukuiRaidHealerGrid
		else
			return TukuiRaidHealer15
		end
	elseif IsAddOnLoaded("Tukui_Raid") then
		if players <= 25 then
			return TukuiRaid25
		elseif players > 25 then
			return TukuiRaid40
		end
	end
end

local StyleRaidFrames = function()
	local layout = GetActiveLayout()
	children = {layout:GetChildren()}

	for _, frame in pairs(children) do
		if (frame and frame.unit) then
			local name = frame.Name
			local health = frame.Health
			local power = frame.Power
			local Glamour = C["media"].Glamour
			local font, fontsize, fontflag = C.media.pixelfont, 8, "OUTLINEMONOCHROME"

			frame:SetBackdropColor(.0,.0,.0,.0)
			
		    local dbh = health:CreateTexture(nil, "OVERLAY", Healthbg)
		    dbh:SetAllPoints(health)
		    dbh:SetTexture(Glamour)
		    dbh:SetBlendMode("ADD")
		    dbh:SetVertexColor(0,0,0,0)
		    health.DebuffHighlight = dbh
		    health.DebuffHighlightFilter = true
		    health.DebuffHighlightAlpha = 0.2

			-- for layout-specifics
			if layout == TukuiRaidHealerGrid or layout ==TukuiRaidHealer15 then

			    frame.panel:Kill()
				
			-- layout starts here
	    		health:Height(30*C["unitframes"].gridscale*T.raidscale)
	    		health:CreateBorder(true)
			
	    		health:SetOrientation('VERTICAL')

	    		health.bg:SetTexture(.150, .150, .150)

    			health.value:Point("CENTER", health, 1, -5)
	    		health.value:SetFont(font, fontsize, fontflag)

	     		health.colorDisconnected = false
	        	health.colorClass = false
	         	health:SetStatusBarColor(.2, .2, .2, 1)
	          	health.bg:SetTexture(.6, .6, .6)
	        	health.bg:SetVertexColor(0, 0, 0)
			
	    		power:ClearAllPoints()
	            power:Height(1)
	            power:Point("BOTTOMLEFT", health, "BOTTOMLEFT", 4, 2)
	            power:Point("BOTTOMRIGHT", health, "BOTTOMRIGHT", -4, 2)
	            power:SetStatusBarTexture(C["media"].blank)
	            power:SetFrameLevel(health:GetFrameLevel() + 1)
	            power:CreateBorder(false, true)	
			
	    		power.bg:SetAllPoints(power)
	            power.bg:SetTexture(C["media"].Glamour)
    	        power.bg:SetAlpha(1)
	            power.bg.multiplier = 0.4

                power.colorClass = true
	         	power.bg.multiplier = 0.1
				
		        name:ClearAllPoints()
				name:SetParent(health)
                name:SetPoint("CENTER", health, "CENTER", 1, 8)
			    name:SetFont(font, fontsize, fontflag)
			
			    local RaidIcon = frame.RaidIcon
				RaidIcon:SetParent(power)
				RaidIcon:Height(18*T.raidscale)
				RaidIcon:Width(18*T.raidscale)
				RaidIcon:SetPoint('CENTER', health, 'TOP')
				
                local RaidDebuffs = frame.RaidDebuffs
                RaidDebuffs:Height(25*C["unitframes"].gridscale)
				RaidDebuffs:Width(25*C["unitframes"].gridscale)
		        RaidDebuffs:Point('CENTER', health, 0,-0)
	            RaidDebuffs:SetFrameStrata(health:GetFrameStrata())
				
				RaidDebuffs.count:SetFont(font, fontsize, fontflag)
				
				health.Smooth = true
		        power.Smooth = true

             	local swlicon = CreateFrame("Frame", "TukuiSwitchLayoutIcon", UIParent)
	            swlicon:CreatePanel("Default", 20, 20, "LEFT", TukuiInfoLeft, "RIGHT", 3, 0)
	            swlicon:SetFrameStrata("BACKGROUND")
	            swlicon:SetFrameLevel(2)

	            local tex = swlicon:CreateTexture(nil, "OVERLAY")
	            tex:SetTexture(C.media.switchlayoutheal)
	            tex:SetPoint("TOPLEFT", swlicon, "TOPLEFT", 2, -2)
	            tex:SetPoint("BOTTOMRIGHT", swlicon, "BOTTOMRIGHT", -2, 2)
		
				frame.width = 68
				frame.height = 30
				frame.xoffset = 7
				frame.yoffset = -7
				frame.point = "LEFT"
				frame.maxColumns = 8
				frame.unitsPerColumn = 5
				frame.columnSpacing = 7
				frame.columnAnchorPoint = "TOP"

				frame:SetPoint("TOP", UIParent, "CENTER", 0, -233)
				
			elseif layout == TukuiRaid25 or layout == TukuiRaid40 then -- note to self, this needs work!
		
			-- layout starts here
	            health:Height(30*C["unitframes"].gridscale*T.raidscale)
	            health:SetStatusBarTexture(Glamour)
	    		health:CreateBorder(true)
			
	    		health:SetOrientation('HORIZONTAL')

	    		health.bg:SetTexture(.150, .150, .150)

	        	health.colorDisconnected = false
         		health.colorClass = false
                health:SetStatusBarColor(.2, .2, .2, 1)
        		health.bg:SetTexture(.6, .6, .6)
	        	health.bg:SetVertexColor(0, 0, 0)	
			
	    		power:ClearAllPoints()
	            power:Height(1)
	            power:Point("BOTTOMLEFT", health, "BOTTOMLEFT", 4, 2)
	            power:Point("BOTTOMRIGHT", health, "BOTTOMRIGHT", -4, 2)
	            power:SetStatusBarTexture(C["media"].blank)
	            power:SetFrameLevel(health:GetFrameLevel() + 1)
	            power:CreateBorder(false, true)	
			
	    		power.bg:SetAllPoints(power)
	            power.bg:SetTexture(C["media"].Glamour)
    	        power.bg:SetAlpha(1)
	            power.bg.multiplier = 0.4

                power.colorClass = true
	         	power.bg.multiplier = 0.1
				
		        name:ClearAllPoints()
				name:SetParent(health)
                name:SetPoint("CENTER", health, "CENTER", 1, 4)
			    name:SetFont(font, fontsize, fontflag)
			
				RaidIcon:SetParent(power)
				RaidIcon:Height(10*T.raidscale)
				RaidIcon:Width(10*T.raidscale)
				RaidIcon:SetPoint('CENTER', health, 'TOP')

				local RaidDebuffs = CreateFrame('Frame', nil, self)
		        RaidDebuffs:Height(21)
		        RaidDebuffs:Width(21)
		        RaidDebuffs:Point('CENTER', health, 0,0)
	        	RaidDebuffs:SetFrameStrata(health:GetFrameStrata())
		        RaidDebuffs:SetFrameLevel(health:GetFrameLevel() + 2)

		        RaidDebuffs.icon = RaidDebuffs:CreateTexture(nil, 'OVERLAY')
                RaidDebuffs:Height(21)
				RaidDebuffs:Width(21)
		        RaidDebuffs:Point('CENTER', health, 0,-0)
	            RaidDebuffs:SetFrameStrata(health:GetFrameStrata())
		        RaidDebuffs:SetFrameLevel(health:GetFrameLevel() + 2)
		
		        RaidDebuffs.count = RaidDebuffs:CreateFontString(nil, 'OVERLAY')
	        	RaidDebuffs.count:SetFont(font, fontsize, fontflag)
	         	RaidDebuffs.count:SetPoint('BOTTOMRIGHT', RaidDebuffs, 'BOTTOMRIGHT', 0, 2)
		        RaidDebuffs.count:SetTextColor(1, .9, 0)

		        frame.RaidDebuffs = RaidDebuffs
				
				health.Smooth = true
		        power.Smooth = true

	            local swlicon = CreateFrame("Frame", "TukuiSwitchLayoutIcon", UIParent)
               	swlicon:CreatePanel("Default", 20, 20, "LEFT", TukuiInfoLeft, "RIGHT", 3, 0)
	            swlicon:SetFrameStrata("BACKGROUND")
               	swlicon:SetFrameLevel(2)

               	local tex = swlicon:CreateTexture(nil, "OVERLAY")
            	tex:SetTexture(C.media.switchlayoutdd)
                tex:SetPoint("TOPLEFT", swlicon, "TOPLEFT",  2, -2)
               	tex:SetPoint("BOTTOMRIGHT", swlicon, "BOTTOMRIGHT", -2, 2)
				
				frame.width = 30
				frame.height = 21
				frame.xoffset = 5
				frame.yoffset = -5
				frame.point = "LEFT"
				frame.maxColumns = 8
				frame.unitsPerColumn = 5
				frame.columnSpacing = 5
				frame.columnAnchorPoint = "TOP"

				frame:SetPoint('BOTTOMLEFT', ChatFrame1, "TOPLEFT", 0, 60)
			end
		end
	end
end

local style = CreateFrame("Frame")
style:RegisterEvent("PLAYER_ENTERING_WORLD")
style:RegisterEvent("PARTY_MEMBERS_CHANGED")
style:RegisterEvent("RAID_ROSTER_UPDATE")
style:SetScript("OnEvent", StyleRaidFrames)

]]--