local T, C, L = unpack(Tukui)

----------------------------------------------------------------------------------------
--	Auto change Tab key to only target enemy players(RE/TabBinder by Veev/AcidWeb)
----------------------------------------------------------------------------------------
local TabBinder = CreateFrame("Frame")
TabBinder:RegisterEvent("ZONE_CHANGED_NEW_AREA")
TabBinder:RegisterEvent("PLAYER_REGEN_ENABLED")
TabBinder:RegisterEvent("DUEL_REQUESTED")
TabBinder:RegisterEvent("DUEL_FINISHED")
TabBinder:RegisterEvent("CHAT_MSG_SYSTEM")
TabBinder:RegisterEvent("ADDON_LOADED")

local RTB_Fail = false
local RTB_DefaultKey = true

TabBinder:SetScript("OnEvent", function(self, event, ...)
	if event == "ADDON_LOADED" then
		if RTB_DefaultKey == nil then
			RTB_DefaultKey = true
		end
	elseif event == "CHAT_MSG_SYSTEM" then
		local RTBChatMessage = ...
		if RTBChatMessage == ERR_DUEL_REQUESTED then
			event = "DUEL_REQUESTED"
		end
	elseif event == "ZONE_CHANGED_NEW_AREA" or (event == "PLAYER_REGEN_ENABLED" and RTB_Fail) or event == "DUEL_REQUESTED" or event == "DUEL_FINISHED" then
		local RTB_BindSet = GetCurrentBindingSet()
		local RTB_PVPType = GetZonePVPInfo()
		local _, RTB_ZoneType = IsInInstance()

		RTB_TargetKey = GetBindingKey("TARGETNEARESTENEMYPLAYER")
		if RTB_TargetKey == nil then
			RTB_TargetKey = GetBindingKey("TARGETNEARESTENEMY")
		end
		if RTB_TargetKey == nil and RTB_DefaultKey == true then
			RTB_TargetKey = "TAB"
		end

		RTB_LastTargetKey = GetBindingKey("TARGETPREVIOUSENEMYPLAYER")
		if RTB_LastTargetKey == nil then
			RTB_LastTargetKey = GetBindingKey("TARGETPREVIOUSENEMY")
		end
		if RTB_LastTargetKey == nil and RTB_DefaultKey == true then
			RTB_LastTargetKey = "SHIFT-TAB"
		end

		if RTB_TargetKey ~= nil then
			RTB_CurrentBind = GetBindingAction(RTB_TargetKey)
		end

		if RTB_ZoneType == "arena" or RTB_PVPType == "combat" or RTB_ZoneType == "pvp" or event == "DUEL_REQUESTED" then
			if RTB_CurrentBind ~= "TARGETNEARESTENEMYPLAYER" then
				if RTB_TargetKey == nil then
					RTB_Success = 1
				else 
					RTB_Success = SetBinding(RTB_TargetKey, "TARGETNEARESTENEMYPLAYER")
				end
				if RTB_LastTargetKey ~= nil then
					SetBinding(RTB_LastTargetKey, "TARGETPREVIOUSENEMYPLAYER")
				end
				if RTB_Success == 1 then
					SaveBindings(RTB_BindSet)
					RTB_Fail = false
				else
					RTB_Fail = true
				end
			end
		else
			if RTB_CurrentBind ~= "TARGETNEARESTENEMY" then
				if RTB_TargetKey == nil then
					RTB_Success = 1
				else
					RTB_Success = SetBinding(RTB_TargetKey, "TARGETNEARESTENEMY")
				end
				if RTB_LastTargetKey ~= nil then
					SetBinding(RTB_LastTargetKey, "TARGETPREVIOUSENEMY")
				end
				if RTB_Success == 1 then
					SaveBindings(RTB_BindSet)
					RTB_Fail = false
				else
					RTB_Fail = true
				end
			end
		end
	end
end)