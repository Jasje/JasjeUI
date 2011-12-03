local T, C, L = unpack(Tukui)

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
		self.text:SetFont(C.media.pixelfont2, 14, "MONOCHROMEOUTLINE")
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

-- ilvl on tooltip by Gsuz
local SlotName = {
        "Head","Neck","Shoulder","Back","Chest","Wrist",
        "Hands","Waist","Legs","Feet","Finger0","Finger1",
        "Trinket0","Trinket1","MainHand","SecondaryHand","Ranged","Ammo"
    }
local function GetItemLVL(unit)
local total, item = 0, 0;
    for i in pairs(SlotName) do
        local slot = GetInventoryItemLink(unit, GetInventorySlotInfo(SlotName[i] .. "Slot"));
        if (slot ~= nil) then
            item = item + 1;
            total = total + select(4, GetItemInfo(slot))
        end
    end
    if (item > 0) then
        return floor(total / item);
    end
    return 0;
end
GameTooltip:HookScript("OnTooltipSetUnit", function(self, ...)
    if (IsModifierKeyDown()) then
        local _, unit = GameTooltip:GetUnit();
        if (unit and CanInspect(unit)) then
            if (not ((InspectFrame and InspectFrame:IsShown()) or (Examiner and Examiner:IsShown()))) then
                NotifyInspect(unit);
                GameTooltip:AddLine(hexa.."Item Level: "..hexb.. GetItemLVL(unit));
                ClearInspectPlayer(unit);
                GameTooltip:Show();
            end
        end
	end
end)