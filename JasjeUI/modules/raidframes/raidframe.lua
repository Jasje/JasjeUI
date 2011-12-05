-- raid editing guide by hydra/tukz
local T, C, L = unpack(Tukui)

--------------------------------------------------------------
-- Edit Unit Raid Frames here!
--------------------------------------------------------------
-- 1 second delay before edited skin apply (can probably be a lower because 1 second is really too long, 0.1 or 0.2 should be the best, setting it to 1 was just for testing, CANNOT BE 0)
local delay = 0.1

local function EditUnitFrame(frame, header)
	local name = frame.Name
	local health = frame.Health
	local power = frame.Power
	local panel = frame.panel
	local debuff = frame.Debuffs

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

	-- for layout-specifics, here we edit only 1 layout at time
	if header == TukuiRaid25 then
		-- more blah
	elseif header == TukuiRaid40 then
		-- more blah
	elseif header == TukuiRaidHealer15 then
		health:ClearAllPoints()
		health:SetAllPoints(frame)
		health:SetStatusBarTexture(Glamour)
	    health:CreateBorder(true)
		
		health.colorDisconnected = false
	    health.colorClass = false
	    health:SetStatusBarColor(.2, .2, .2, 1)
	    health.bg:SetTexture(.6, .6, .6)
	    health.bg:SetVertexColor(0, 0, 0)
		
		health.value:Point("CENTER", health, 1, -5)
	    health.value:SetFont(font, fontsize, fontflag)

        power:ClearAllPoints()
	    power:Height(1)
	    power:SetBorder()
	    power:SetTemplate("")
	    power:Point("BOTTOMLEFT", health, "BOTTOMLEFT", 4, 2)
	    power:Point("BOTTOMRIGHT", health, "BOTTOMRIGHT", -4, 2)
	    power:SetStatusBarTexture(Glamour)
	    power:SetFrameLevel(health:GetFrameLevel() + 1)

		power.bg:SetAllPoints(power)
	    power.bg:SetTexture(C["media"].Glamour)
    	power.bg:SetAlpha(1)
	    power.bg.multiplier = 0.4

        power.colorClass = true
	    power.bg.multiplier = 0.1
		
        debuff:Kill()

		name:SetParent(health)
		name:ClearAllPoints()
		name:SetPoint("TOP", 0, -5)
		name:SetFont(font, fontsize, fontflag)
		
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
		
	elseif header == TukuiRaidHealerGrid then
	    --grid
	    panel:Kill()
		health:ClearAllPoints()
		health:SetAllPoints(frame)
		health:SetStatusBarTexture(Glamour)
	    health:CreateBorder(true)
		
		health.colorDisconnected = false
	    health.colorClass = false
	    health:SetStatusBarColor(.2, .2, .2, 1)
	    health.bg:SetTexture(.6, .6, .6)
	    health.bg:SetVertexColor(0, 0, 0)
		
		health.value:Point("CENTER", health, 1, -5)
	    health.value:SetFont(font, fontsize, fontflag)

        power:ClearAllPoints()
	    power:Height(1)
	    power:SetBorder()
	    power:SetTemplate("")
	    power:Point("BOTTOMLEFT", health, "BOTTOMLEFT", 4, 2)
	    power:Point("BOTTOMRIGHT", health, "BOTTOMRIGHT", -4, 2)
	    power:SetStatusBarTexture(Glamour)
	    power:SetFrameLevel(health:GetFrameLevel() + 1)

		power.bg:SetAllPoints(power)
	    power.bg:SetTexture(C["media"].Glamour)
    	power.bg:SetAlpha(1)
	    power.bg.multiplier = 0.4

        power.colorClass = true
	    power.bg.multiplier = 0.1
		
		name:SetParent(health)
		name:ClearAllPoints()
		name:SetPoint("TOP", 0, -5)
		name:SetFont(font, fontsize, fontflag)
		
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

	end
end

local function EditUnitAttributes(layout)
	local header = _G[layout]
	local dpsmax25 = layout:match("Raid25")
	local dpsmax40 = layout:match("Raid40")
	local healmax15 = layout:match("Healer15")
	local grid = layout:match("HealerGrid")
	
	-- set your new attributes here, in this example we only resize units, X/Y offset and column spacing to Grid.
	if dpsmax25 then
		-- do your attribute
	elseif dpsmax40 then
		-- do your attributes
	elseif healmax15 then
		header:SetAttribute("initial-width", 150)
		header:SetAttribute("initial-height", 32)
		header:SetAttribute("xoffset", 7)
		header:SetAttribute("yOffset", -7)
		header:SetAttribute("columnSpacing", T.Scale(8))
	elseif grid then
		header:SetAttribute("initial-width", 68)
		header:SetAttribute("initial-height", 30)
		header:SetAttribute("xoffset", 7)
		header:SetAttribute("yOffset", -7)
		header:SetAttribute("columnSpacing", T.Scale(10))
	end
end

--------------------------------------------------------------
-- Stop Editing!
--------------------------------------------------------------

-- import the framework
local oUF = oUFTukui or oUF

local function InitScript()
	local children
	local heal = IsAddOnLoaded("Tukui_Raid_Healing")
	local dps = IsAddOnLoaded("Tukui_Raid")
	
	-- don't need to load, because we will reload anyway after user select their layout
	if heal and dps then return end
	
	local function UpdateRaidUnitSize(frame, header)
		frame:SetSize(header:GetAttribute("initial-width"), header:GetAttribute("initial-height"))
	end

	local GetActiveHeader = function()
		local players = (GetNumPartyMembers() + 1)
		
		if UnitInRaid("player") then
			players = GetNumRaidMembers()
		end

		if heal then
			if C["unitframes"].gridonly then
				return TukuiRaidHealerGrid
			else
				if players <= 15 then
					return TukuiRaidHealer15
				else
					return TukuiRaidHealerGrid
				end
			end
		elseif dps then
			if players <= 25 then
				return TukuiRaid25
			elseif players > 25 then
				return TukuiRaid40
			end
		end
	end
	
	local function Update(frame, header, event)
		if (frame and frame.unit) then
			local isEdited = frame.isEdited
			
			-- we need to update size of every raid frames if already in raid when we enter world (or /rl)
			if event == "PLAYER_ENTERING_WORLD" then
				UpdateRaidUnitSize(frame, header)
			end
			
			-- we check for "isEdited" here because we don't want to edit every frame
			-- every time a member join the raid else it will cause high cpu usage
			-- and could cause screen freezing
			if not frame.isEdited then
				EditUnitFrame(frame, header)
				frame.isEdited = true
			end
		end	
	end

	local function Skin(header, event)
		children = {header:GetChildren()}
		
		for _, frame in pairs(children) do
			Update(frame, header, event)
		end	
	end
	
	local StyleRaidFrames = function(self, event)
		local header = GetActiveHeader()
		-- make sure we... catch them all! (I feel pikachu inside me)
		-- we add a delay to make sure latest created unit is catched.
		T.Delay(delay, function() Skin(header, event) end)
	end

	-- init, here we modify the initial Config.
	local function SpawnHeader(name, layout, visibility, ...)
		EditUnitAttributes(layout)
	end
	
	-- this is the function oUF framework use to create and set attributes to headers
	hooksecurefunc(oUF, "SpawnHeader", SpawnHeader)

	local style = CreateFrame("Frame")
	style:RegisterEvent("PLAYER_ENTERING_WORLD")
	style:RegisterEvent("PARTY_MEMBERS_CHANGED")
	style:RegisterEvent("RAID_ROSTER_UPDATE")
	style:SetScript("OnEvent", StyleRaidFrames)
end

local script = CreateFrame("Frame")
script:RegisterEvent("ADDON_LOADED")
script:SetScript("OnEvent", function(self, event, addon)
	if addon == "Tukui_Raid" or addon == "Tukui_Raid_Healing" then
		InitScript()
	end
end)