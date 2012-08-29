local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales
if C.unitframes.enable ~= true then return end

local self = _G["TukuiPlayer"]
local color = RAID_CLASS_COLORS[T.myclass]
	
	do
		if( C["unitframes"].classbar == true ) then
		
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

			if( T.myclass == "WARLOCK" or T.myclass == "PALADIN" ) then
				local classbar = CreateFrame( "Frame", "Classbar", UIParent )
				classbar:Width(224)
				classbar:Height(7)
				classbar:Point( "BOTTOM", TukuiPlayer, "TOP", 0, 5 )
				classbar:SetBackdropBorderColor( 0, 0, 0, 0 )
				classbar:SetTemplate( "Default" )

				if( T.myclass == "WARLOCK" ) then
					self.SoulShards:SetWidth( classbar:GetWidth() - 4 )
					self.SoulShards:SetHeight(3)
					self.SoulShards:ClearAllPoints()
					self.SoulShards:SetPoint( "TOPLEFT", classbar, "TOPLEFT", 2, -2 )

					TukuiPlayer_Shard1:SetStatusBarColor( .58, .5, .78)
					TukuiPlayer_Shard2:SetStatusBarColor( .58, .5, .78)
					TukuiPlayer_Shard3:SetStatusBarColor( .58, .5, .78)
				elseif( T.myclass == "PALADIN" ) then
					self.HolyPower:SetWidth( classbar:GetWidth() - 4 )
					self.HolyPower:SetHeight(3)
					self.HolyPower:ClearAllPoints()
					self.HolyPower:SetPoint( "TOPLEFT", classbar, "TOPLEFT", 2, -2 )
				end

				TukuiPlayer_Shard1:SetHeight(3)
				TukuiPlayer_Shard1:SetWidth((classbar:GetWidth() - 6) / 3)

				TukuiPlayer_Shard2:SetHeight(3)
				TukuiPlayer_Shard2:SetWidth((classbar:GetWidth() - 6) / 3)

				TukuiPlayer_Shard3:SetHeight(3)
				TukuiPlayer_Shard3:SetWidth((classbar:GetWidth() - 6) / 3)
			end

			if( T.myclass == "DEATHKNIGHT" ) then
				local classbar = CreateFrame( "Frame", "Classbar", UIParent )
				classbar:Width(224)
				classbar:Height(10)
				classbar:Point( "BOTTOM", TukuiPlayer, "TOP", 0, 5 )
				classbar:SetBackdropBorderColor( 0, 0, 0, 0 )
				classbar:SetTemplate( "Default" )

				self.Runes:SetWidth(classbar:GetWidth() - 4)
				self.Runes:SetHeight(6)
				self.Runes:ClearAllPoints()
				self.Runes:SetPoint( "TOPLEFT", classbar, "TOPLEFT", 2, -2 )

				for i = 1, 6 do
					self.Runes[i]:SetHeight(6)
					self.Runes[i]:SetWidth( ( classbar:GetWidth() - 9 ) / 6 )
					self.Runes[i]:SetStatusBarTexture(C["media"].Glamour)

					if( i == 1 ) then
						self.Runes[i]:Point( "BOTTOMLEFT", classbar, "BOTTOMLEFT", 2, 2 )
					else
						self.Runes[i]:Point( "TOPLEFT", self.Runes[i - 1], "TOPRIGHT", 1, 0 )
					end
				end
			end

	if( T.myclass == "SHAMAN" ) then
				local classbar = CreateFrame( "Frame", "Classbar", UIParent )
				classbar:Width(224)
				classbar:Height(7)
				classbar:Point("BOTTOM", self.Health, "TOP", 0,4)					
				classbar:SetBackdropBorderColor(0, 0, 0, 0)
				classbar:SetTemplate("Default")

				for i = 1, 4 do
					self.TotemBar[i]:SetWidth((classbar:GetWidth() - 7 ) / 4)
					self.TotemBar[i]:SetHeight(3)
					self.TotemBar[i]:ClearAllPoints()
					self.TotemBar[i]:SetStatusBarTexture(C["media"].Glamour)

					if( i == 1 ) then
						self.TotemBar[i]:Point( "TOPLEFT", classbar, "TOPLEFT", 2, -2 )
					else
						self.TotemBar[i]:Point( "TOPLEFT", self.TotemBar[i - 1], "TOPRIGHT", 1, 0 )
					end
				end
			end

			if( T.myclass == "PRIEST" ) then
				local classbar = CreateFrame( "Frame", "Classbar", UIParent )
				classbar:Width(224)
				classbar:Height(7)
				classbar:Point( "BOTTOM", TukuiPlayer, "TOP", 0, 5 )
				classbar:SetBackdropBorderColor( 0, 0, 0, 0 )
				classbar:SetTemplate( "Default" )

				local Orbs = {}

				for i = 1, 3 do
					Orbs[i] = CreateFrame("StatusBar", "Classbar_Power" .. i, classbar)
					Orbs[i]:SetWidth((classbar:GetWidth() - 6 ) / 3 )
					Orbs[i]:SetHeight(3)
					Orbs[i].tex = Orbs[i]:CreateTexture( nil, "OVERLAY")
					Orbs[i].tex:SetTexture(C["media"].Glamour)
					Orbs[i].tex:SetVertexColor(color.r, color.g, color.b)
					Orbs[i].tex:SetAllPoints( Orbs[i] )
					Orbs[i]:SetOrientation("VERTICAL")

					if( i == 1 ) then
						Orbs[i]:SetPoint( "LEFT", classbar, "LEFT", 2, 0 )
					else
						Orbs[i]:SetPoint( "LEFT", Orbs[i - 1], "RIGHT", 1, 0 )
					end
				end

				local change = CreateFrame("Frame")
				change:RegisterEvent("PLAYER_ENTERING_WORLD")
				change:RegisterEvent("UNIT_AURA")
				change:RegisterEvent("PLAYER_TARGET_CHANGED")
				change:SetScript("OnEvent", function()
					count = select( 4, UnitAura( "player", GetSpellInfo(77487)))
					if(count and count > 0) then
						for i = 1, count do Orbs[i]:SetAlpha(1)end
					else
						for i = 1, 3 do Orbs[i]:SetAlpha(0.2) end
					end
				end)
			end
		end
	end