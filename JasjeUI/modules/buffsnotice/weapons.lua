local T, C, L = unpack(Tukui)

T.remindenchants = {
	ROGUE = {
		2842, -- poison
	},
	SHAMAN = {
		8024, -- flametongue
		8232, -- windfury
		51730, -- earthliving
	},
}

local enchants = T.remindenchants[T.myclass]
if not enchants then return end

local sound
local currentlevel = UnitLevel("player")
local class = T.myclass

local function EnchantsOnEvent(self, event)
	if (event == "PLAYER_LOGIN") or (event == "ACTIVE_TALENT_GROUP_CHANGED") or (event == "PLAYER_LEVEL_UP") then
		if class == "ROGUE" then
			self:UnregisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
			self:UnregisterEvent("PLAYER_LEVEL_UP")
			self.icon:SetTexture(select(3, GetSpellInfo(enchants[1])))
			return
		elseif class == "SHAMAN" then
			local ptt = GetPrimaryTalentTree()
			if ptt and ptt == 3 and currentlevel > 53 then
				self.icon:SetTexture(select(3, GetSpellInfo(enchants[3])))
			elseif ptt and ptt == 2 and currentlevel > 31 then
				self.icon:SetTexture(select(3, GetSpellInfo(enchants[2])))
			else
				self.icon:SetTexture(select(3, GetSpellInfo(enchants[1])))
			end
			return
		end
	end

	if (class == "ROGUE" or class =="SHAMAN") and currentlevel < 10 then return end

	if (UnitAffectingCombat("player") and not UnitInVehicle("player")) then
		local mainhand, _, _, offhand, _, _, thrown = GetWeaponEnchantInfo()
		if class == "ROGUE" then
			local itemid = GetInventoryItemID("player", GetInventorySlotInfo("RangedSlot"))
			if itemid and select(7, GetItemInfo(itemid)) == INVTYPE_THROWN and currentlevel > 61 then
				if mainhand and offhand and thrown then
					self:Hide()
					sound = true
					return
				end
			else
				if mainhand and offhand then
					self:Hide()
					sound = true
					return
				end
			end
		elseif class == "SHAMAN" then
			local itemid = GetInventoryItemID("player", GetInventorySlotInfo("SecondaryHandSlot"))
			if itemid and select(6, GetItemInfo(itemid)) == ENCHSLOT_WEAPON then
				if mainhand and offhand then
					self:Hide()
					sound = true
					return
				end
			elseif mainhand then
				self:Hide()
				sound = true
				return
			end
		end
		self:Show()
		if sound == true then
			PlaySoundFile(C.media.warningsound)
			sound = false
		end
	else
		self:Hide()
		sound = true
	end
end

local frame = CreateFrame("Frame", "TukuiEnchantsWarningFrame", UIParent)

frame.icon = frame:CreateTexture(nil, "OVERLAY")
frame.icon:SetPoint("CENTER")
if (T.myclass == "ROGUE" or T.myclass =="SHAMAN") then
	frame:CreatePanel("Default", 40, 40, "CENTER", UIParent, "CENTER", 50, 200)
else
	frame:CreatePanel("Default", 40, 40, "CENTER", UIParent, "CENTER", 0, 200)
end
frame.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
frame.icon:Size(36)
frame:Hide()

frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_LEVEL_UP")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("UNIT_INVENTORY_CHANGED")
frame:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
frame:RegisterEvent("UNIT_ENTERING_VEHICLE")
frame:RegisterEvent("UNIT_ENTERED_VEHICLE")
frame:RegisterEvent("UNIT_EXITING_VEHICLE")
frame:RegisterEvent("UNIT_EXITED_VEHICLE")

frame:SetScript("OnEvent", EnchantsOnEvent)