function ColoringFriendsList()
	local friendOffset = HybridScrollFrame_GetOffset(FriendsFrameFriendsScrollFrame)
	if(not friendOffset) then return end
	if(friendOffset < 0) then
		friendOffset = 0
	end
	local button = "FriendsFrameFriendsScrollFrameButton"
	local numBNetTotal, numBNetOnline = BNGetNumFriends()
	if(numBNetOnline > 0) then
		for i = 1, numBNetOnline, 1 do
			local _, realName, _, _, toonName, toonID, client, _, _, _, _, _, _, _, _ = BNGetFriendInfo(i)
			if(client == BNET_CLIENT_D3) then
				local icon = _G[button..(i - friendOffset).."GameIcon"]
				if icon then icon:SetTexture([[Interface\AddOns\JasjeUI\media\textures\D3]]) end
				local nameString = _G[button..(i - friendOffset).."Name"]
				if(nameString) then
					nameString:SetTextColor(125/255,133/255,138/255)
					local filename, fontHeight, flags = nameString:GetFont()
				end
				local nameString = _G[button..(i - friendOffset).."Info"]
				if(nameString) then
					nameString:SetTextColor(125/255,133/255,138/255)
					local filename, fontHeight, flags = nameString:GetFont()
				end
			end
			if(client == BNET_CLIENT_SC2) then
				local icon = _G[button..(i - friendOffset).."GameIcon"]
				if icon then icon:SetTexture([[Interface\AddOns\JasjeUI\media\textures\SC2]]) end
				local nameString = _G[button..(i - friendOffset).."Name"]
				if(nameString) then
					nameString:SetTextColor(125/255,133/255,138/255)
					local filename, fontHeight, flags = nameString:GetFont()
				end
				local nameString = _G[button..(i - friendOffset).."Info"]
				if(nameString) then
					nameString:SetTextColor(125/255,133/255,138/255)
					local filename, fontHeight, flags = nameString:GetFont()
				end
			end
			if(client == BNET_CLIENT_WOW) then
				local _, _, _, realmName, _, faction, race, class, _, zoneName, level, _ = BNGetToonInfo(toonID)
				for k, v in pairs(LOCALIZED_CLASS_NAMES_MALE) do
					if(class == v) then
						class = k
					end
				end
				if(GetLocale() ~= "enUS") then
					for k, v in pairs(LOCALIZED_CLASS_NAMES_FEMALE) do
						if(class == v) then
							class = k
						end
					end
				end
				local classc = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
				if(not classc) then return end
				local nameString = _G[button..(i - friendOffset).."Name"]
				local icon = _G[button..(i - friendOffset).."GameIcon"]
				if(nameString) then
					local r, g, b = GetQuestDifficultyColor(level).r, GetQuestDifficultyColor(level).g, GetQuestDifficultyColor(level).b
					local Diff = string.format("|cff%02x%02x%02x", r * 255, g * 255, b * 255)
					nameString:SetTextColor(classc.r, classc.g, classc.b)
					nameString:SetText("|cFF82C4FC"..realName.."|r |cFFFFFFFF(|r"..toonName.."|cFFFFFFFF - "..LEVEL.."|r "..Diff..level.."|r|cFFFFFFFF)|r")
					icon:SetTexture([[Interface\AddOns\JasjeUI\media\textures\]]..faction)
					local filename, fontHeight, flags = nameString:GetFont()
				end
				if(CanCooperateWithToon(toonID) ~= true) then
					local nameString = _G[button..(i - friendOffset).."Info"]
					if(nameString) then
						nameString:SetTextColor(125/255,133/255,138/255)
						if realmName == GetRealmName() and faction == UnitFactionGroup("unit") then
							nameString:SetText("|cFFFFFFFF"..zoneName.." (|r|cFFFFF573"..realmName.."|r|cFFFFFFFF)|r")
						elseif realmName == GetRealmName() then
							nameString:SetText(zoneName.." (|cFFFFF573"..realmName.."|r)")
						else
							nameString:SetText(zoneName.." ("..realmName..")")
						end
						local filename, fontHeight, flags = nameString:GetFont()
					end
				else
					local nameString = _G[button..(i - friendOffset).."Info"]
					if(nameString) then
						nameString:SetTextColor(125/255,133/255,138/255)
						nameString:SetText(zoneName)
						if realmName == GetRealmName() then nameString:SetTextColor(1,.96,.41,1) end
						local filename, fontHeight, flags = nameString:GetFont()
					end
				end
			end
		end
	end
	local numberOfFriends, onlineFriends = GetNumFriends()
	if(onlineFriends > 0) then
		for i = 1, onlineFriends, 1 do
			j = i + numBNetOnline
			local name, level, class, area, connected, status, note, RAF = GetFriendInfo(i)
			for k, v in pairs(LOCALIZED_CLASS_NAMES_MALE) do
				if(class == v) then
					class = k
				end
			end
			if(GetLocale() ~= "enUS") then
				for k, v in pairs(LOCALIZED_CLASS_NAMES_FEMALE) do
					if(class == v) then
						class = k
					end
				end
			end
			local classc = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
			if(not classc) then return end
			if(connected) then
				local nameString = _G[button..(j - friendOffset).."Name"]
				local r, g, b = GetQuestDifficultyColor(level).r, GetQuestDifficultyColor(level).g, GetQuestDifficultyColor(level).b
				local Diff = string.format("|cff%02x%02x%02x", r * 255, g * 255, b * 255)
				if(nameString and name) then
					nameString:SetText(name.."|cFFFFFFFF - "..LEVEL.."|r "..Diff..level)
					nameString:SetTextColor(classc.r, classc.g, classc.b)
					local filename, fontHeight, flags = nameString:GetFont()
				end
			end
		end
	end
end

hooksecurefunc("FriendsList_Update", ColoringFriendsList)
hooksecurefunc("HybridScrollFrame_Update", ColoringFriendsList)