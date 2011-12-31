local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales
if C.unitframes.enable ~= true then return end

local self = _G["TukuiPlayer"]
local color = RAID_CLASS_COLORS[T.myclass]
	
	do
		if( C["unitframes"].classbar == true ) then
	        if T.myclass == "DRUID" then	
				local eclipseBar = CreateFrame('Frame', nil, self)
				eclipseBar:Point("LEFT", health, "TOPLEFT", 0, 8)
				eclipseBar:Size(224, 3)
				eclipseBar:SetFrameStrata("MEDIUM")
				eclipseBar:SetFrameLevel(8)

                eclipseBar:SetScript("OnShow", function() T.DruidBarDisplay(self, false) end)
				eclipseBar:SetScript("OnHide", function() T.DruidBarDisplay(self, false) end)
				
				local lunarBar = CreateFrame('StatusBar', nil, eclipseBar)
				lunarBar:SetPoint('LEFT', eclipseBar, 'LEFT', 0, 0)
				lunarBar:SetSize(eclipseBar:GetWidth(), eclipseBar:GetHeight())
				lunarBar:SetStatusBarTexture(normTex)
				lunarBar:SetStatusBarColor(.50, .52, .70)
				eclipseBar.LunarBar = lunarBar

				local solarBar = CreateFrame('StatusBar', nil, eclipseBar)
				solarBar:SetPoint('LEFT', lunarBar:GetStatusBarTexture(), 'RIGHT', 0, 0)
				solarBar:SetSize(eclipseBar:GetWidth(), eclipseBar:GetHeight())
				solarBar:SetStatusBarTexture(normTex)
				solarBar:SetStatusBarColor(.80, .82,  .60)
				eclipseBar.SolarBar = solarBar

				local eclipseBarText = solarBar:CreateFontString(nil, 'OVERLAY')
				eclipseBarText:SetPoint('TOP', panel)
				eclipseBarText:SetPoint('BOTTOM', panel)
				eclipseBarText:SetFont(unitframefont, unitframefontsize, unitframefontflag)
				eclipseBar.Text = eclipseBarText
				
				-- border 
				eclipseBar.border = CreateFrame("Frame", nil,eclipseBar)
				eclipseBar.border:SetPoint("TOPLEFT", eclipseBar, "TOPLEFT", T.Scale(-2), T.Scale(2))
				eclipseBar.border:SetPoint("BOTTOMRIGHT", eclipseBar, "BOTTOMRIGHT", T.Scale(2), T.Scale(-2))
				eclipseBar.border:SetFrameStrata("MEDIUM")
				eclipseBar.border:SetFrameLevel(4)
				eclipseBar.border:SetTemplate("Hydra")
				eclipseBar.border:SetBorder()

				-- hide "low mana" text on load if eclipseBar is show
				if eclipseBar and eclipseBar:IsShown() then FlashInfo.ManaLevel:SetAlpha(0) end
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
				classbar:Height(7)
				classbar:Point( "BOTTOM", TukuiPlayer, "TOP", 0, 5 )
				classbar:SetBackdropBorderColor( 0, 0, 0, 0 )
				classbar:SetTemplate( "Default" )

				self.Runes:SetWidth(classbar:GetWidth() - 4)
				self.Runes:SetHeight(3)
				self.Runes:ClearAllPoints()
				self.Runes:SetPoint( "TOPLEFT", classbar, "TOPLEFT", 2, -2 )

				for i = 1, 6 do
					self.Runes[i]:SetHeight(3)
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
				
			if( T.myclass == "MAGE" ) then
				local classbar = CreateFrame( "Frame", "Classbar", UIParent )
				classbar:Width(224)
				classbar:Height(7)
				classbar:Point( "BOTTOM", TukuiPlayer, "TOP", 0, 5 )
				classbar:SetBackdropBorderColor( 0, 0, 0, 0 )
				classbar:SetTemplate( "Default" )

				local ABStack = {}

				for i = 1, 4 do
					ABStack[i] = CreateFrame( "StatusBar", "Classbar_Power" .. i, classbar )
					ABStack[i]:SetWidth( ( classbar:GetWidth() - 7 ) / 4 )
					ABStack[i]:SetHeight(3)
					ABStack[i].tex = ABStack[i]:CreateTexture( nil, "OVERLAY" )
					ABStack[i].tex:SetTexture( C["media"].Glamour )
					ABStack[i].tex:SetVertexColor(color.r, color.g, color.b)
					ABStack[i].tex:SetAllPoints( ABStack[i] )
					ABStack[i]:SetOrientation( "VERTICAL" )

					if( i == 1 ) then
						ABStack[i]:SetPoint( "LEFT", classbar, "LEFT", 2, 0 )
					else
						ABStack[i]:SetPoint( "LEFT", ABStack[i - 1], "RIGHT", 1, 0 )
					end
				end

				change = CreateFrame( "Frame" )
				change:RegisterEvent( "PLAYER_ENTERING_WORLD" )
				change:RegisterEvent( "UNIT_AURA" )
				change:RegisterEvent( "PLAYER_TARGET_CHANGED" )
				change:SetScript( "OnEvent", function()
					count = select( 4, UnitDebuff( "player", GetSpellInfo( 36032 ) ) )
					if( count and count > 0 ) then
						for i = 1, count do ABStack[i]:SetAlpha( 1 ) end
					else
						for i = 1, 4 do ABStack[i]:SetAlpha( 0.2 ) end
					end
				end )
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