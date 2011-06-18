local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
-----------------------------------------
-- Tukui Micro Menu
--
-- By: Rian Quinn
-- Date: 12-17-2010
--
-- Notes: This datatext is designed to
--        show the same micromenu that
--        is shown when you use the
--        middle mouse key on the mini
--        map.
-----------------------------------------

if C["datatext"].micromenu and C["datatext"].micromenu > 0 then
	local Stat = CreateFrame("Frame")
	Stat:EnableMouse(true)
	Stat:SetFrameStrata("HIGH")
	Stat:SetFrameLevel(3)

	local Text  = TukuiInfoLeft:CreateFontString(nil, "OVERLAY")
	Text:SetFont(C["datatext"].font, C["datatext"].fontsize,C["datatext"].fontflag)
	T.PP(C["datatext"].micromenu, Text)

	local function OnEvent(self, event, ...)
		Text:SetText(hexa..MAINMENU_BUTTON..hexb)
		self:SetAllPoints(Text)
	end

	local function OpenMenu()
		local menuFrame = CreateFrame("Frame", "TukuiDataTextMicroMenu", UIParent, "UIDropDownMenuTemplate")
		local menuList = {
			{text = hexa..CHARACTER_BUTTON..hexb,
			func = function() ToggleCharacter("PaperDollFrame") end},
			{text = hexa..SPELLBOOK_ABILITIES_BUTTON..hexb,
			func = function() ToggleFrame(SpellBookFrame) end},
			{text = hexa..TALENTS_BUTTON..hexb,
			func = function() 
				if not PlayerTalentFrame then 
					LoadAddOn("Blizzard_TalentUI") 
				end 

				if not GlyphFrame then 
					LoadAddOn("Blizzard_GlyphUI") 
				end 
				PlayerTalentFrame_Toggle() 
			end},
			{text = hexa..ACHIEVEMENT_BUTTON..hexb,
			func = function() ToggleAchievementFrame() end},
			{text = hexa..QUESTLOG_BUTTON..hexb,
			func = function() ToggleFrame(QuestLogFrame) end},
			{text = hexa..SOCIAL_BUTTON..hexb,
			func = function() ToggleFriendsFrame(1) end},
			{text = hexa..PLAYER_V_PLAYER..hexb,
			func = function() ToggleFrame(PVPFrame) end},
			{text = hexa..ACHIEVEMENTS_GUILD_TAB..hexb,
			func = function() 
				if IsInGuild() then 
					if not GuildFrame then LoadAddOn("Blizzard_GuildUI") end 
					GuildFrame_Toggle() 
				else 
					if not LookingForGuildFrame then LoadAddOn("Blizzard_LookingForGuildUI") end 
					LookingForGuildFrame_Toggle() 
				end
			end},
			{text = hexa..LFG_TITLE..hexb,
			func = function() ToggleFrame(LFDParentFrame) end},
			{text = hexa..LOOKING_FOR_RAID..hexb,
			func = function() ToggleFrame(LFRParentFrame) end},
			{text = hexa..HELP_BUTTON..hexb,
			func = function() ToggleHelpFrame() end},
			{text = hexa..CALENDAR_VIEW_EVENT..hexb,
			func = function()
			if(not CalendarFrame) then LoadAddOn("Blizzard_Calendar") end
				Calendar_Toggle()
			end},
			{text = ENCOUNTER_JOURNAL,
			func = function() if T.toc >= 40200 then ToggleFrame(EncounterJournal) end end}, 
		}

		EasyMenu(menuList, menuFrame, "cursor", 0, 0, "MENU", 2)
	end

	Stat:RegisterEvent("PLAYER_LOGIN")
	Stat:SetScript("OnEvent", OnEvent)
	Stat:SetScript("OnMouseDown", function() OpenMenu() end)
end