local T, C, L = unpack(select(2, ...))

local function LoadSkin()
	InspectFrame:StripTextures(true)
	InspectFrameInset:StripTextures(true)
	InspectTalentFramePointsBar:StripTextures()
	InspectFrame:CreateBackdrop("Transparent")
	InspectFrame.backdrop:SetAllPoints()
	T.SkinCloseButton(InspectFrameCloseButton)

	for i=1, 4 do
		T.SkinTab(_G["InspectFrameTab"..i])
	end

	InspectModelFrameBorderTopLeft:Kill()
	InspectModelFrameBorderTopRight:Kill()
	InspectModelFrameBorderTop:Kill()
	InspectModelFrameBorderLeft:Kill()
	InspectModelFrameBorderRight:Kill()
	InspectModelFrameBorderBottomLeft:Kill()
	InspectModelFrameBorderBottomRight:Kill()
	InspectModelFrameBorderBottom:Kill()
	InspectModelFrameBorderBottom2:Kill()
	InspectModelFrameBackgroundOverlay:Kill()
	InspectModelFrame:CreateBackdrop("Default")

		local slots = {
			"HeadSlot",
			"NeckSlot",
			"ShoulderSlot",
			"BackSlot",
			"ChestSlot",
			"ShirtSlot",
			"TabardSlot",
			"WristSlot",
			"HandsSlot",
			"WaistSlot",
			"LegsSlot",
			"FeetSlot",
			"Finger0Slot",
			"Finger1Slot",
			"Trinket0Slot",
			"Trinket1Slot",
			"MainHandSlot",
			"SecondaryHandSlot",
			"RangedSlot",
		}
		for _, slot in pairs(slots) do
			local icon = _G["Inspect"..slot.."IconTexture"]
			local slot = _G["Inspect"..slot]
			slot:StripTextures()
			slot:StyleButton(false)
			icon:SetTexCoord(.08, .92, .08, .92)
			icon:ClearAllPoints()
			icon:Point("TOPLEFT", 2, -2)
			icon:Point("BOTTOMRIGHT", -2, 2)

			slot:SetFrameLevel(slot:GetFrameLevel() + 2)
			slot:CreateBackdrop("Default")
			slot.backdrop:SetAllPoints()
		end		

	T.SkinRotateButton(InspectModelFrameRotateLeftButton)
	T.SkinRotateButton(InspectModelFrameRotateRightButton)
	InspectModelFrameRotateRightButton:Point("TOPLEFT", InspectModelFrameRotateLeftButton, "TOPRIGHT", 3, 0)

	InspectPVPFrameBottom:Kill()
	InspectGuildFrameBG:Kill()
	InspectPVPFrame:HookScript("OnShow", function() InspectPVPFrameBG:Kill() end)

	for i=1, 3 do
		_G["InspectPVPTeam"..i]:StripTextures()
		_G["InspectTalentFrameTab"..i]:StripTextures()
	end

	InspectTalentFrame.bg = CreateFrame("Frame", nil, InspectTalentFrame)
	InspectTalentFrame.bg:SetTemplate("Default")
	InspectTalentFrame.bg:Point("TOPLEFT", InspectTalentFrameBackgroundTopLeft, "TOPLEFT", -2, 2)
	InspectTalentFrame.bg:Point("BOTTOMRIGHT", InspectTalentFrameBackgroundBottomRight, "BOTTOMRIGHT", -20, 52)
	InspectTalentFrame.bg:SetFrameLevel(InspectTalentFrame.bg:GetFrameLevel() - 2)

	for i = 1, MAX_NUM_TALENTS do
		local button = _G["InspectTalentFrameTalent"..i]
		local icon = _G["InspectTalentFrameTalent"..i.."IconTexture"]
		if button then
			button:StripTextures()
			button:StyleButton()
			button:SetTemplate("Default")
			button.SetHighlightTexture = T.dummy
			button.SetPushedTexture = T.dummy
			button:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
			button:GetPushedTexture():SetTexCoord(.08, .92, .08, .92)
			button:GetHighlightTexture():SetAllPoints(icon)
			button:GetPushedTexture():SetAllPoints(icon)

			if button.Rank then
				button.Rank:SetFont(C.media.font, 12, "THINOUTLINE")
				button.Rank:ClearAllPoints()
				button.Rank:SetPoint("BOTTOMRIGHT")
			end		

			icon:ClearAllPoints()
			icon:Point("TOPLEFT", 2, -2)
			icon:Point("BOTTOMRIGHT", -2, 2)
			icon:SetTexCoord(.08, .92, .08, .92)
		end
	end		

   -- color item by rarity on inspect frame.
   local function ColorItemBorder()
      if(not InspectFrame:IsShown()) then return end
      for _, slot in pairs(slots) do
         -- Color the equipment slots by rarity
         local target = _G["Inspect"..slot]
         local slotId, _, _ = GetInventorySlotInfo(slot)
         local itemId = GetInventoryItemID("target", slotId)

         if itemId then
            local _, _, rarity, _, _, _, _, _, _, _, _ = GetItemInfo(itemId)
            if rarity then
               target.backdrop:SetBackdropBorderColor(GetItemQualityColor(rarity))
            end
         else
            target.backdrop:SetBackdropBorderColor(unpack(C.media.bordercolor))
         end
      end
   end

   -- execute item coloring everytime we open character frame
   InspectFrame:HookScript("OnShow", ColorItemBorder)

   -- execute item coloring everytime an item is changed
   local CheckItemBorderColor = CreateFrame("Frame")
   CheckItemBorderColor:RegisterEvent("PLAYER_TARGET_CHANGED")
   CheckItemBorderColor:SetScript("OnEvent", ColorItemBorder)
end
   
-- settings
local font = C["datatext"].font 
local size = C["datatext"].fontsize
local fontflag = C["datatext"].fontflag

-- the ilevel script itself
local slots = {
	"HeadSlot",
	"NeckSlot",
	"ShoulderSlot",
	"BackSlot",
	"ChestSlot",
	"ShirtSlot",
	"TabardSlot",
	"WristSlot",
	"HandsSlot",
	"WaistSlot",
	"LegsSlot",
	"FeetSlot",
	"Finger0Slot",
	"Finger1Slot",
	"Trinket0Slot",
	"Trinket1Slot",
	"MainHandSlot",
	"SecondaryHandSlot",
	"RangedSlot",
}
	
local function CreateButtonsText(frame)
	for _, slot in pairs(slots) do
		local button = _G[frame..slot]
		button.t = button:CreateFontString(nil, "OVERLAY")
		button.t:SetFont(font, size, fontflag)
		button.t:SetPoint("BOTTOM", 1, 2)
		button.t:SetText("")
	end
end

local function UpdateButtonsText(frame)
	if frame == "Inspect" and not InspectFrame:IsShown() then return end

	for _, slot in pairs(slots) do
		local id = GetInventorySlotInfo(slot)
		local item
		local text = _G[frame..slot].t
		
		if frame == "Inspect" then
			item = GetInventoryItemLink("target", id)
		else
			item = GetInventoryItemLink("player", id)
		end
		
		if item then
			local oldilevel = text:GetText()
			local ilevel = select(4, GetItemInfo(item))
			
			if ilevel then
				if ilevel ~= oldilevel then
					text:SetText(ilevel)
				end
			else
				text:SetText("")
			end
		else
			text:SetText("")
		end
	end
end

local OnEvent = CreateFrame("Frame")
OnEvent:RegisterEvent("PLAYER_LOGIN")
OnEvent:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
OnEvent:SetScript("OnEvent", function(self, event)
	if event == "PLAYER_LOGIN" then
		CreateButtonsText("Character")
		UpdateButtonsText("Character")
		self:UnregisterEvent("PLAYER_LOGIN")
	elseif event == "PLAYER_TARGET_CHANGED" then
		UpdateButtonsText("Inspect")
	else
		UpdateButtonsText("Character")
	end		
end)

local OnLoad = CreateFrame("Frame")
OnLoad:RegisterEvent("ADDON_LOADED")
OnLoad:SetScript("OnEvent", function(self, event, addon)
	if addon == "Blizzard_InspectUI" then
		CreateButtonsText("Inspect")
		InspectFrame:HookScript("OnShow", function(self) UpdateButtonsText("Inspect") end)
		OnEvent:RegisterEvent("PLAYER_TARGET_CHANGED")
		self:UnregisterEvent("ADDON_LOADED")		
	end	
end)
  
T.SkinFuncs["Blizzard_InspectUI"] = LoadSkin