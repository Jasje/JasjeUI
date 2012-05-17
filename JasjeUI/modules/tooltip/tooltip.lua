local T, C, L = unpack(Tukui)
if not C["tooltip"].enable then return end

TukuiTooltipAnchor:ClearAllPoints()
TukuiTooltipAnchor:Point("BOTTOMRIGHT", ChatFrame4, "TOPRIGHT", 0, 0)

local hexa = T.StatColor
local hexb = T.StatColorEnd

----------------------------------------------------------------------------------------
--	Displays a players LFD/LFR role(gTooltipRoles by g0st)
----------------------------------------------------------------------------------------
local function GetLFDRole(unit)
	local role = UnitGroupRolesAssigned(unit)

	if role == "NONE" then
		return "|cFFB5B5B5"..NO_ROLE.."|r"
	elseif role == "TANK" then
		return "|cFFE06D1B"..TANK.."|r"
	elseif role == "HEALER" then
		return "|cFF1B70E0"..HEALER.."|r"
	else
		return "|cFFE01B35"..DAMAGER.."|r"
	end
end

GameTooltip:HookScript("OnTooltipSetUnit", function(self, ...)
    if (IsModifierKeyDown()) then
	    local name, unit = GameTooltip:GetUnit()
	    if unit and UnitIsPlayer(unit) and (UnitInParty(unit) or UnitInRaid(unit)) then
		    GameTooltip:AddLine(hexa..ROLE..": "..hexb..GetLFDRole(unit))
	    end
	end
end)

-- GuildNote and PvpTitle
local Blah = function()
	local unit = "mouseover"
	local guildName, guildRankName, guildRankIndex = GetGuildInfo(unit)
	
	if guildName then
		if UnitIsInMyGuild(unit) then
			_G["GameTooltipTextLeft2"]:SetText("<".."|cff0090ff"..guildName.."|r> [".."|cff00ff10"..guildRankName.."|r]") -- setting guildranks here
		else
			_G["GameTooltipTextLeft2"]:SetText("<|cff00ff10"..guildName.."|r> [|cff00ff10"..guildRankName.."|r]")
		end	
	end
end

GameTooltip:HookScript("OnTooltipSetUnit", Blah)

-- Hp font
local TooltipUpdateFont = function(self)
	if self.text and not self.resized then
		self.text:SetFont(T.SetTooltipFont())
		self.resized = true
	end
end

GameTooltipStatusBar:HookScript("OnValueChanged", TooltipUpdateFont) 

-- StatusbarTexture
local healthBar = GameTooltipStatusBar
healthBar:SetStatusBarTexture(C.media.Glamour)

-- spellID on tooltip
hooksecurefunc(GameTooltip, "SetUnitBuff", function(self,...)
	local id = select(11,UnitBuff(...))
	if id then
		self:AddLine(hexa.."SpellID: "..hexb..id)
		self:Show()
	end
end)

hooksecurefunc(GameTooltip, "SetUnitDebuff", function(self,...)
	local id = select(11,UnitDebuff(...))
	if id then
		self:AddLine(hexa.."SpellID: "..hexb..id)
		self:Show()
	end
end)

hooksecurefunc(GameTooltip, "SetUnitAura", function(self,...)
	local id = select(11,UnitAura(...))
	if id then
		self:AddLine(hexa.."SpellID: "..hexb..id)
		self:Show()
	end
end)

GameTooltip:HookScript("OnTooltipSetSpell", function(self)
	local id = select(3,self:GetSpell())
	if id then
		self:AddLine(hexa.."SpellID: "..hexb..id)
		self:Show()
	end
end)

-- TooltipIcon
local function AddTooltipIcon(self, icon)
	if icon then
		local title = _G[self:GetName() .. "TextLeft1"]
		if title and not title:GetText():find("|T" .. icon) then
			title:SetFormattedText("|T%s:20:20:0:0:64:64:5:59:5:59:%d|t %s", icon, 18, title:GetText())
		end
	end
end

local function hookItem(tip)
	tip:HookScript("OnTooltipSetItem", function(self, ...)
		local name, link = self:GetItem()
		local icon = link and GetItemIcon(link)
		AddTooltipIcon(self, icon)
	end)
end
hookItem(_G["GameTooltip"])
hookItem(_G["ItemRefTooltip"])

local function hookSpell(tip)
	tip:HookScript("OnTooltipSetSpell", function(self, ...)
		if self:GetSpell() then
			local name, rank, icon = GetSpellInfo(self:GetSpell())
			AddTooltipIcon(self, icon)
		end
	end)
end
hookSpell(_G["GameTooltip"])
hookSpell(_G["ItemRefTooltip"])