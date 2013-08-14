local T, C, L, G = unpack(Tukui) 
if C.unitframes.enable ~= true then return end

local self = _G["TukuiPlayer"]
local color = RAID_CLASS_COLORS[T.myclass]
	
do
	if(C["unitframes"].classbar == true) then
	
		if T.myclass == "MONK" then
			G.UnitFrames.Player.HarmonyBar:ClearAllPoints()
			G.UnitFrames.Player.HarmonyBar:SetPoint("BOTTOM", G.UnitFrames.Player, "TOP", 0, 5)
			G.UnitFrames.Player.HarmonyBar:Size(220,11)
			G.UnitFrames.Player.HarmonyBar:CreateBackdrop("Default")

			for i = 1, 5 do
				G.UnitFrames.Player.HarmonyBar[i]:SetSize((216/5),11)
				G.UnitFrames.Player.HarmonyBar[i]:SetStatusBarTexture(C["media"].Glamour)
				G.UnitFrames.Player.HarmonyBar[i]:SetStatusBarColor(color.r, color.g, color.b)
				G.UnitFrames.Player.HarmonyBar[i]:ClearAllPoints()
				
				if(i == 1) then
					G.UnitFrames.Player.HarmonyBar[i]:Point("BOTTOMLEFT", G.UnitFrames.Player.HarmonyBar, "BOTTOMLEFT", 0, 0)
				else
					G.UnitFrames.Player.HarmonyBar[i]:Point("LEFT", G.UnitFrames.Player.HarmonyBar[i-1], "RIGHT", 1, 0)
				end
			end

			if(C["unitframes"]["showstatuebar"] == true) then
				G.UnitFrames.Player.Statue:ClearAllPoints()
				G.UnitFrames.Player.Statue:Size(115, 23)
				G.UnitFrames.Player.Statue:SetTemplate()
				G.UnitFrames.Player.Statue:Point("TOPRIGHT", G.UnitFrames.Player, "BOTTOMRIGHT", 2, -5)
			end
		end

		
		    if T.myclass == "DRUID" then
			    local DruidManaBackground = self.DruidManaBackground
				local DruidManaBarStatus = self.DruidMana
				local DruidManaText = self.DruidManaText
				local eclipseBar = self.EclipseBar
				local eclipseBarText = self.EclipseBar.Text
				local solarBar = eclipseBar.SolarBar
				local lunarBar = eclipseBar.LunarBar

				DruidManaBackground:ClearAllPoints()
				DruidManaBackground:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, 7)
				DruidManaBackground:Size(218, 2)

				DruidManaBarStatus:SetSize(DruidManaBackground:GetWidth(), DruidManaBackground:GetHeight())
				DruidManaText:SetFont(T.SetPixelFont())

				DruidManaBackground:CreateBackdrop("Default")
				DruidManaBackground.backdrop:CreateShadow("Default")

				eclipseBar:ClearAllPoints()
				eclipseBar:Point("BOTTOM", self, "TOP", 0, 7)
				eclipseBar:Size(218, 2)
				solarBar:SetSize(eclipseBar:GetWidth(), eclipseBar:GetHeight())
				lunarBar:SetSize(eclipseBar:GetWidth(), eclipseBar:GetHeight())

				eclipseBarText:ClearAllPoints()
				eclipseBarText:Point('TOP', eclipseBar, 0, 20)
				eclipseBarText:SetFont(T.SetPixelFont())

				eclipseBar:CreateBackdrop("Default")
				eclipseBar.backdrop:CreateShadow("Default")
			end
			
        -- combo bar
        local parent = TukuiTarget
        local stick

        if T.myclass == "ROGUE" and C.unitframes.movecombobar then
	        parent = TukuiPlayer
        	stick = true
        end

        if not parent or C.unitframes.classiccombo then return end

		    local Colors = { 
	            [1] = { 225, 0, 0 }, -- red 
	            [2] = { 225, 0, 0 }, -- red
	            [3] = { 225, 225, 0 }, -- yellow
	            [4] = { 225, 225, 0 }, -- yellow
	            [5] = { 0, 225, 0 }, -- green
            }
		
            TukuiCombo:Point("BOTTOMLEFT", parent, "TOPLEFT", 0, 5)
            TukuiCombo:SetWidth(220)
            TukuiCombo:SetHeight(4)
            TukuiCombo:CreateBorder(true)

            for i = 1, 5 do
			        TukuiCombo[i]:SetHeight(4)
			        TukuiCombo[i]:ClearAllPoints()
			        TukuiCombo[i]:SetStatusBarTexture(C["media"].Glamour)
			        TukuiCombo[i]:SetStatusBarColor(unpack(Colors[i]))

              	if i == 1 then
	              	TukuiCombo[i]:Point("RIGHT", TukuiCombo, "LEFT", 43, 0)
		            TukuiCombo[i]:SetWidth(217 / 5)
	            else
		            TukuiCombo[i]:Point("LEFT", TukuiCombo[i-1], "RIGHT", 0.5, 0)
		            TukuiCombo[i]:SetWidth(217 / 5)
	            end
			end

		    if(T.myclass == "WARLOCK") then
				G.UnitFrames.Player.WarlockSpecBars:ClearAllPoints()
				G.UnitFrames.Player.WarlockSpecBars:SetPoint("BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 5)
				G.UnitFrames.Player.WarlockSpecBars:Size(220, 7)
				G.UnitFrames.Player.WarlockSpecBars:CreateBackdrop( "Default" )

				for i = 1, 4 do
				    G.UnitFrames.Player.WarlockSpecBars[i]:SetStatusBarTexture(C["media"].Glamour)
					G.UnitFrames.Player.WarlockSpecBars[i]:Size(T.Scale(220/ 4),7)
					if(i == 1) then
						G.UnitFrames.Player.WarlockSpecBars[i]:SetPoint("LEFT", G.UnitFrames.Player.WarlockSpecBars, "LEFT", 0, 0)
					else
						G.UnitFrames.Player.WarlockSpecBars[i]:Point("LEFT", G.UnitFrames.Player.WarlockSpecBars[i -1], "RIGHT", 1, 0)
					end
				end
			end
			
	    	if(T.myclass == "PALADIN") then
				G.UnitFrames.Player.HolyPower:ClearAllPoints()
				G.UnitFrames.Player.HolyPower:SetPoint("BOTTOM", G.UnitFrames.Player, "TOP", 0, 5)
				G.UnitFrames.Player.HolyPower:Size(220, 7)
				G.UnitFrames.Player.HolyPower:CreateBackdrop("Default")
				
				local maxHolyPower
				if(T.level == MAX_PLAYER_LEVEL) then
					maxHolyPower = 5
				else
					maxHolyPower = 3
				end

				for i = 1, 5 do
				    G.UnitFrames.Player.HolyPower[i]:SetStatusBarTexture(C["media"].Glamour)
					if(i == 5) then
						G.UnitFrames.Player.HolyPower[i]:SetSize((216/5), 7)
					else
						G.UnitFrames.Player.HolyPower[i]:SetSize((216/5), 7)
					end

					if(i == 1) then
						G.UnitFrames.Player.HolyPower[i]:SetPoint("LEFT", G.UnitFrames.Player.HolyPower, "LEFT", 0, 0)
					else
						G.UnitFrames.Player.HolyPower[i]:Point("LEFT", G.UnitFrames.Player.HolyPower[i -1], "RIGHT", 1, 0)
					end
				end
			end
			if(T.myclass == "WARRIOR") then
				if(C["unitframes"]["showstatuebar"] == true) then
				    G.UnitFrames.Player.Statue:ClearAllPoints()
				    G.UnitFrames.Player.Statue:Size(115, 23)
				    G.UnitFrames.Player.Statue:SetTemplate()
				    G.UnitFrames.Player.Statue:Point("TOPRIGHT", G.UnitFrames.Player, "BOTTOMRIGHT", 2, -25)
			    end
	 		end
			
			
			if(T.myclass == "DEATHKNIGHT") then
				local classbar = CreateFrame("Frame", "Classbar", UIParent)
				classbar:Width(224)
				classbar:Height(15)
				classbar:Point("BOTTOM", TukuiPlayer, "TOP", 0, 5)
				classbar:SetBackdropBorderColor(0, 0, 0, 0)
				classbar:SetTemplate("Default")

				self.Runes:SetWidth(classbar:GetWidth() - 4)
				self.Runes:SetHeight(11)
				self.Runes:ClearAllPoints()
				self.Runes:SetPoint( "TOPLEFT", classbar, "TOPLEFT", 2, -2)

				for i = 1, 6 do
					self.Runes[i]:SetHeight(11)
					self.Runes[i]:SetWidth((classbar:GetWidth() -9) / 6)
					self.Runes[i]:SetStatusBarTexture(C["media"].Glamour)

					if(i == 1) then
						self.Runes[i]:Point("BOTTOMLEFT", classbar, "BOTTOMLEFT", 2, 2)
					else
						self.Runes[i]:Point("TOPLEFT", self.Runes[i-1], "TOPRIGHT", 1, 0)
					end
				end
				
			if(C["unitframes"]["showstatuebar"] == true) then
				G.UnitFrames.Player.Statue:ClearAllPoints()
				G.UnitFrames.Player.Statue:Size(115, 23)
				G.UnitFrames.Player.Statue:SetTemplate()
				G.UnitFrames.Player.Statue:Point("TOPRIGHT", G.UnitFrames.Player, "BOTTOMRIGHT", 2, -25)
			end
		end
			
		    if(T.myclass == "SHAMAN") then
				for i = 1, 4 do
					G.UnitFrames.Player.TotemBar[i]:ClearAllPoints()
					G.UnitFrames.Player.TotemBar[i]:Width(60)
					G.UnitFrames.Player.TotemBar[i]:Height(20)
					G.UnitFrames.Player.TotemBar[i]:SetStatusBarTexture(C["media"].Glamour)

					if(i == 1) then
						G.UnitFrames.Player.TotemBar[i]:SetPoint("LEFT", G.UnitFrames.Player, "RIGHT", 8.5, 15)
					else
						G.UnitFrames.Player.TotemBar[i]:Point( "LEFT", G.UnitFrames.Player.TotemBar[i -1], "RIGHT", 8, 0)
					end
					G.UnitFrames.Player.TotemBar[i]:CreateBackdrop("Default")
				end
			end

		    if(T.myclass == "PRIEST") then
				G.UnitFrames.Player.ShadowOrbsBar:ClearAllPoints()
				G.UnitFrames.Player.ShadowOrbsBar:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 5)
				G.UnitFrames.Player.ShadowOrbsBar:Size(220, 7)
				G.UnitFrames.Player.ShadowOrbsBar:CreateBackdrop("Default")

				for i = 1, 3 do
					G.UnitFrames.Player.ShadowOrbsBar[i]:SetSize((220/3), 7)
					if(i == 1) then
						G.UnitFrames.Player.ShadowOrbsBar[i]:SetPoint("LEFT", G.UnitFrames.Player.ShadowOrbsBar, "LEFT", 0, 0)
					else
						G.UnitFrames.Player.ShadowOrbsBar[i]:Point("LEFT", G.UnitFrames.Player.ShadowOrbsBar[i -1], "RIGHT", 1, 0)
					end
				end
			end
		end	
	end