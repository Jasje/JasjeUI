local T, C, L = unpack(select(2, ...)) 

if not C["interruptanncounce"].enable == true then return end

local announce = CreateFrame("Frame")
announce:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
announce:SetScript("OnEvent", function(self, _, _, event, _, _, sourceName, _, _, destName, _, _, _, _, spellID, spellName)
	if not (event == "SPELL_INTERRUPT" and sourceName == T.myname) then return end
	
		SendChatMessage(INTERRUPTED.." "..destName.."'s \124cff71d5ff\124Hspell:"..spellID.."\124h["..spellName.."]\124h\124r!", "YELL", nil, nil)	-- change "YELL" to whatever channel you like
	end)