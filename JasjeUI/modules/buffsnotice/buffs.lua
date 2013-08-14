local T, C, L, G = unpack(Tukui)
-- renimder to self http://www.wowhead.com/spell=115921/legacy-of-the-emperor#comments:id=1648358
T.remindbuffs = {
	PRIEST = {
		588, -- inner fire
		73413, -- inner will
	},
	HUNTER = {
		109260, -- hawk
		5118, -- cheetah
		13159, -- pack
		20043, -- wild
		82661, -- fox
	},
	MAGE = {
		7302, -- frost armor
		6117, -- mage armor
		30482, -- molten armor
	},
	SHAMAN = {
		52127, -- water shield
		324, -- lightning shield
		974, -- earth shield
	},
	MONK = {
		117666, -- Legacy of the Emperor
		20217, -- Blessing of Kings
		90363, -- Embrace of the Shale Spider
		1126, -- Mark of the Wild
	},
	WARRIOR = {
		469, -- commanding Shout
		6673, -- battle Shout
		93435, -- roar of courage (hunter pet)
		--57330, -- horn of Winter
		21562, -- fortitude
	},
	DEATHKNIGHT = {
		57330, -- horn of Winter
		31634, -- strength of earth totem
		6673, -- battle Shout
		93435, -- roar of courage (hunter pet)
	},
}

-- Nasty stuff below. Don't touch.
local buffs = T.remindbuffs[T.myclass]

if not buffs then return end

local sound
local function BuffsOnEvent(self, event)
	if (event == "PLAYER_LOGIN" or event == "LEARNED_SPELL_IN_TAB") then
		for i, buff in pairs(buffs) do
			local name = GetSpellInfo(buff)
			local usable, nomana = IsUsableSpell(name)
			if (usable or nomana) then
				self.icon:SetTexture(select(3, GetSpellInfo(buff)))
				break
			end
		end
		if (not self.icon:GetTexture() and event == "PLAYER_LOGIN") then
			self:UnregisterAllEvents()
			self:RegisterEvent("LEARNED_SPELL_IN_TAB")
			return
		elseif (self.icon:GetTexture() and event == "LEARNED_SPELL_IN_TAB") then
			self:UnregisterAllEvents()
			self:RegisterEvent("UNIT_AURA")
			self:RegisterEvent("PLAYER_LOGIN")
			self:RegisterEvent("PLAYER_REGEN_ENABLED")
			self:RegisterEvent("PLAYER_REGEN_DISABLED")
		end
	end

	if (UnitAffectingCombat("player") and not UnitInVehicle("player")) then
		for i, buff in pairs(buffs) do
			local name = GetSpellInfo(buff)
			if (name and UnitBuff("player", name)) then
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

local frame = CreateFrame("Frame", "TukuiBuffsWarningFrame", UIParent)
frame.icon = frame:CreateTexture(nil, "OVERLAY")
frame.icon:SetPoint("CENTER")
if (T.myclass == "ROGUE" or T.myclass =="SHAMAN") then
	frame:Point("CENTER", UIParent, "CENTER", -50, 200)
	frame:SetTemplate()
	frame:Size(40, 40) 
else
	frame:Point("CENTER", UIParent, "CENTER", 0, 200)
	frame:SetTemplate()
	frame:Size(40, 40) 
end
frame.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
frame.icon:Size(36)
frame:Hide()

frame:RegisterEvent("UNIT_AURA")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("UNIT_ENTERING_VEHICLE")
frame:RegisterEvent("UNIT_ENTERED_VEHICLE")
frame:RegisterEvent("UNIT_EXITING_VEHICLE")
frame:RegisterEvent("UNIT_EXITED_VEHICLE")

frame:SetScript("OnEvent", BuffsOnEvent)