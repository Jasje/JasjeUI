-- author p3lim 
-- http://www.wowinterface.com/downloads/info22213-HabeebIt.html#info
local _, ns = ...

local encounters = {
    -- Pandaria
    [132205] = 691, -- Sha of Anger
    [132206] = 725, -- Salyis' Warband
    [136381] = 814, -- Nalak, The Storm God
    [137554] = 826, -- Oondasta
    [148317] = 857, -- Chi-Ji, The Red Crane
    [148317] = 858, -- Yu'lon, The Jade Serpent
    [148317] = 859, -- Niuzao, The Black Ox
    [148317] = 860, -- Xuen, The White Tiger
    [148316] = 861, -- Ordos, Fire-God of the Yaungol

    -- Mogu'Shan Vaults
    [125144] = 679, -- The Stone Guard
    [132189] = 689, -- Feng the Accursed
    [132190] = 682, -- Gara'jal the Spiritbinder
    [132191] = 687, -- The Spirit Kings
    [132192] = 726, -- Elegon
    [132193] = 677, -- Will of the Emperor

    -- Heart of Fear
    [132194] = 745, -- Imperial Vizier Zor'lok
    [132195] = 744, -- Blade Lord Tay'ak
    [132196] = 713, -- Garalon
    [132197] = 741, -- Wind Lord Mel'jarak
    [132198] = 737, -- Amber-Shaper Un'sok
    [132199] = 743, -- Grand Empress Shek'zeer

    -- Terrace of Endless Spring
    [132200] = 683, -- Protectors of the Endless
    [132204] = 683, -- Protectors of the Endless (Elite)
    [132201] = 742, -- Tsulong
    [132202] = 729, -- Lei Shi    
    [132203] = 709, -- Sha of Fear

    -- Throne of Thunder
    [139674] = 827, -- Jin'rokh the Breaker
    [139677] = 819, -- Horridon
    [139679] = 816, -- Council of Elders
    [139680] = 825, -- Tortos
    [139682] = 821, -- Magaera
    [139684] = 828, -- Ji'kun, the Ancient Mother
    [139686] = 818, -- Durumu the Forgotten
    [139687] = 820, -- Primordious
    [139688] = 824, -- Dark Animus
    [139689] = 817, -- Iron Qon
    [139690] = 829, -- Twin Consorts
    [139691] = 832, -- Lei Shen, The Thunder King
    [139692] = 831, -- Ra-den
	
	-- Siege of Orgrimmar
    [145909] = 852, -- Immerseus
    [145910] = 849, -- The Fallen Protectors
    [145911] = 866, -- Norushen
    [145912] = 867, -- Sha of Pride
    [145913] = 868, -- Galakras
    [145914] = 864, -- Iron Juggernaut
    [145915] = 856, -- Kor'kron Dark Shaman
    [145916] = 850, -- General Nazgrim
    [145917] = 846, -- Malkorok
    [145919] = 870, -- Spoils of Pandaria
    [145920] = 851, -- Thok the Bloodthirsty
    [145918] = 865, -- Siegecrafter Blackfuse
    [145921] = 853, -- Paragons of the Klaxxi
    [145922] = 869, -- Garrosh Hellscream
	
}

function ns.GetEncounterID(spellID)
    return encounters[spellID]
end
local _, ns = ...

local items = {}
local specializations = {}
local collapsed = true
local currentEncounterID

local Frame = CreateFrame('Frame', 'HabeebItFrame', BonusRollFrame)
local Handle = CreateFrame('Button', 'HabeebItHandle', BonusRollFrame)

local backdrop = {
	bgFile = [[Interface\ChatFrame\ChatFrameBackground]], tile = true, tileSize = 16,
	edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]], edgeSize = 16,
	insets = {left = 4, right = 4, top = 4, bottom = 4}
}

local function OnUpdate(self, elapsed)
	if(IsModifiedClick('COMPAREITEMS') or (GetCVarBool('alwaysCompareItems') and not IsEquippedItem(self.itemID))) then
		GameTooltip_ShowCompareItem()
	else
		ShoppingTooltip1:Hide()
		ShoppingTooltip2:Hide()
		ShoppingTooltip3:Hide()
	end

	if(IsModifiedClick('DRESSUP')) then
		ShowInspectCursor()
	else
		ResetCursor()
	end
end

local function OnEnter(self)
	GameTooltip:SetOwner(self, 'ANCHOR_TOPLEFT')
	GameTooltip:SetItemByID(self.itemID)

	self:SetScript('OnUpdate', OnUpdate)
end

local function OnLeave(self)
	GameTooltip:Hide()

	self:SetScript('OnUpdate', nil)
end

local function OnClick(self)
	HandleModifiedItemClick(self.itemLink)
end

local function GetItemLine(index)
	local Item = items[index]
	if(not Item) then
		Item = CreateFrame('Button', nil, Frame)
		Item:SetSize(321, 45)

		local Icon = Item:CreateTexture(nil, 'BACKGROUND')
		Icon:SetPoint('TOPLEFT', 2, -2)
		Icon:SetSize(42, 42)
		Item.Icon = Icon

		local Background = Item:CreateTexture(nil, 'BORDER')
		Background:SetAllPoints()
		Background:SetTexture([[Interface\EncounterJournal\UI-EncounterJournalTextures]])
		Background:SetTexCoord(0.00195313, 0.62890625, 0.61816406, 0.66210938)
		Background:SetDesaturated(true)

		local Name = Item:CreateFontString(nil, 'ARTWORK', 'GameFontNormalMed3')
		Name:SetPoint('TOPLEFT', Icon, 'TOPRIGHT', 7, -7)
		Name:SetSize(250, 12)
		Name:SetJustifyH('LEFT')
		Item.Name = Name

		local Class = Item:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
		Class:SetPoint('BOTTOMRIGHT', Name, 'TOPLEFT', 264, -30)
		Class:SetSize(0, 12)
		Class:SetJustifyH('RIGHT')
		Item.Class = Class

		local Slot = Item:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
		Slot:SetPoint('BOTTOMLEFT', Icon, 'BOTTOMRIGHT', 7, 5)
		Slot:SetPoint('BOTTOMRIGHT', Class, 'BOTTOMLEFT', -15, 0)
		Slot:SetSize(0, 12)
		Slot:SetJustifyH('LEFT')
		Item.Slot = Slot

		Item:SetScript('OnClick', OnClick)
		Item:SetScript('OnEnter', OnEnter)
		Item:SetScript('OnLeave', OnLeave)

		items[index] = Item
	end

	return Item
end

local function UpdatePosition()
	local populateDown = Frame:GetBottom() > (UIParent:GetHeight() / 1.5)

	Frame:ClearAllPoints()
	if(populateDown) then
		Frame:SetPoint('TOPLEFT', BonusRollFrame, 'TOPRIGHT')
	else
		Frame:SetPoint('BOTTOMLEFT', BonusRollFrame, 'BOTTOMRIGHT')
	end

	for index, button in pairs(items) do
		button:ClearAllPoints()
		if(populateDown) then
			button:SetPoint('TOP', 0, (6 + ((index - 1) * 48)) * -1)
		else
			button:SetPoint('BOTTOM', 0, 6 + ((index - 1) * 48))
		end
	end
end

local function PopulateList()
	local numItems = 0
	for index = 1, EJ_GetNumLoot() do
		local name, texture, slot, itemClass, itemID, itemLink, encounterID = EJ_GetLootInfoByIndex(index)
		if(encounterID == currentEncounterID) then
			numItems = numItems + 1

			local Item = GetItemLine(numItems)
			Item.Icon:SetTexture(texture)
			Item.Name:SetText(name)
			Item.Slot:SetText(slot)
			Item.Class:SetText(itemClass)

			Item.itemID = itemID
			Item.itemLink = itemLink

			Item:Show()
		end
	end

	Frame:SetHeight(math.max(76, 8 + (numItems * 48)))

	if(numItems > 0) then
		Frame.Empty:Hide()
	else
		Frame.Empty:Show()
	end

	if(Frame:IsShown()) then
		UpdatePosition()
	end

	if(EncounterJournal) then
		EncounterJournal:RegisterEvent('EJ_LOOT_DATA_RECIEVED')
		EncounterJournal:RegisterEvent('EJ_DIFFICULTY_UPDATE')
	end
end

local function UpdateSpecializations(currentIndex)
	for index, button in pairs(specializations) do
		if(currentIndex == index) then
			button.LeftBorder:SetVertexColor(1, 0, 0)
			button.RightBorder:SetVertexColor(1, 0, 0)
		else
			button.LeftBorder:SetVertexColor(1, 1, 1)
			button.RightBorder:SetVertexColor(1, 1, 1)
		end
	end
end

local function InitializeList(specialization, shown)
	if(EncounterJournal) then
		EncounterJournal:UnregisterEvent('EJ_DIFFICULTY_UPDATE')
	end

	for index, button in pairs(items) do
		button:Hide()
	end

	if(not shown) then
		collapsed = false
		Handle:GetScript('OnClick')(Handle)
		UpdateSpecializations(specialization)
	end

	local _, _, difficulty = GetInstanceInfo()
	EJ_SetDifficulty(difficulty > 0 and difficulty or 4)

	local currentInstance = EJ_GetCurrentInstance()
	EJ_SelectInstance(currentInstance > 0 and currentInstance or 322)
	EJ_SelectEncounter(currentEncounterID)

	local _, _, classID = UnitClass('player')
	EJ_SetLootFilter(classID, specialization and GetSpecializationInfo(specialization) or 0)

	PopulateList()
end

local function SpecializationClick(self)
	UpdateSpecializations(self.index)
	InitializeList(self.index, true)
end

local function SpecializationEnter(self)
	GameTooltip:SetOwner(self, 'ANCHOR_TOPRIGHT')
	GameTooltip:AddLine(self.name, 1, 1, 1)
	GameTooltip:Show()
end

local function CreateSpecializationTabs(self)
	for index = 1, GetNumSpecializations() do
		local SpecButton = CreateFrame('Button', nil, self)
		SpecButton:SetSize(24, 16)
		SpecButton:SetScript('OnClick', SpecializationClick)
		SpecButton:SetScript('OnEnter', SpecializationEnter)
		SpecButton:SetScript('OnLeave', GameTooltip_Hide)
		SpecButton:SetFrameLevel(6)

		local _, name, _, texture = GetSpecializationInfo(index)
		SpecButton.index = index
		SpecButton.name = name

		local SpecBackground = SpecButton:CreateTexture(nil, 'BACKGROUND')
		SpecBackground:SetAllPoints()
		SpecBackground:SetTexture(texture)
		SpecBackground:SetTexCoord(0, 1, 0.2, 0.8)

		local SpecLeft = SpecButton:CreateTexture(nil, 'BORDER')
		SpecLeft:SetPoint('BOTTOMLEFT', -6, -7)
		SpecLeft:SetSize(18, 24)
		SpecLeft:SetTexture([[Interface\RaidFrame\RaidPanel-BottomLeft]])
		SpecLeft:SetTexCoord(0, 0.8, 0, 1)
		SpecButton.LeftBorder = SpecLeft

		local SpecRight = SpecButton:CreateTexture(nil, 'BORDER')
		SpecRight:SetPoint('BOTTOMRIGHT', 6, -7)
		SpecRight:SetSize(18, 24)
		SpecRight:SetTexture([[Interface\RaidFrame\RaidPanel-BottomRight]])
		SpecRight:SetTexCoord(0.2, 1, 0, 1)
		SpecButton.RightBorder = SpecRight

		if(index == 1) then
			SpecButton:SetPoint('TOPLEFT', self, 'BOTTOMLEFT', 20, 2)
		else
			SpecButton:SetPoint('LEFT', specializations[index - 1], 'RIGHT', 15, 0)
		end

		specializations[index] = SpecButton
	end

	UpdateSpecializations(GetSpecialization())
end

Frame:RegisterEvent('PLAYER_LOGIN')
Frame:SetScript('OnEvent', function(self, event, ...)
	if(event == 'SPELL_CONFIRMATION_PROMPT') then
		local spellID, confirmType = ...
		if(confirmType == CONFIRMATION_PROMPT_BONUS_ROLL) then
			currentEncounterID = ns.GetEncounterID(spellID)
			if(currentEncounterID) then
				if(#specializations == 0) then
					CreateSpecializationTabs(self)
				end

				InitializeList(GetSpecialization())
			else
				print('|cffff8080HabeebIt:|r Found an unknown spell [' .. spellID .. ']. Please report this!')
			end
		end
	elseif(event == 'SPELL_CONFIRMATION_TIMEOUT') then
		currentEncounterID = nil
	elseif(event == 'EJ_LOOT_DATA_RECIEVED' and currentEncounterID) then
		PopulateList()

		if(EncounterJournal) then
			EncounterJournal:UnregisterEvent(event)
		end
	elseif(event == 'PLAYER_LOGIN') then
		self:RegisterEvent('SPELL_CONFIRMATION_PROMPT')
		self:RegisterEvent('SPELL_CONFIRMATION_TIMEOUT')
		self:RegisterEvent('EJ_LOOT_DATA_RECIEVED')

		self:SetScript('OnShow', UpdatePosition)
		self:SetPoint('BOTTOMLEFT', BonusRollFrame, 'BOTTOMRIGHT')
		self:SetSize(338, 76)
		self:SetFrameLevel(10)
		self:Hide()

		self:SetBackdrop(backdrop)
		self:SetBackdropColor(0, 0, 0, 0.8)
		self:SetBackdropBorderColor(0.6, 0.6, 0.6)

		local Empty = self:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
		Empty:SetPoint('CENTER')
		Empty:SetText('This encounter has no possible items for\nyour current class and/or specialization')
		self.Empty = Empty

		Handle:SetPoint('BOTTOMRIGHT', 16, 4)
		Handle:SetSize(16, 64)
		Handle:SetNormalTexture([[Interface\RaidFrame\RaidPanel-Toggle]])
		Handle:GetNormalTexture():SetTexCoord(0, 1/2, 0, 1)
		Handle:SetFrameLevel(6)

		local HandleBackground = Handle:CreateTexture(nil, 'BACKGROUND')
		HandleBackground:SetPoint('BOTTOMLEFT', -2, 0)
		HandleBackground:SetPoint('TOPRIGHT')
		HandleBackground:SetTexture(0, 0, 0, 0.8)

		local BorderBottom = Handle:CreateTexture(nil, 'BORDER')
		BorderBottom:SetPoint('BOTTOMRIGHT', 6, -3)
		BorderBottom:SetSize(24, 24)
		BorderBottom:SetTexture([[Interface\RaidFrame\RaidPanel-BottomRight]])

		local BorderRight = Handle:CreateTexture(nil, 'BORDER')
		BorderRight:SetPoint('RIGHT', 7.5, 0)
		BorderRight:SetSize(12, 24)
		BorderRight:SetTexture([[Interface\RaidFrame\RaidPanel-Right]])

		local BorderTop = Handle:CreateTexture(nil, 'BORDER')
		BorderTop:SetPoint('TOPRIGHT', 6, 3)
		BorderTop:SetSize(24, 24)
		BorderTop:SetTexture([[Interface\RaidFrame\RaidPanel-UpperRight]])
	end
end)

Handle:SetScript('OnClick', function(self)
	self:ClearAllPoints()

	if(collapsed) then
		self:SetPoint('BOTTOMRIGHT', Frame, 16, 4)
		self:GetNormalTexture():SetTexCoord(1/2, 1, 0, 1)
		Frame:Show()
	else
		self:SetPoint('BOTTOMRIGHT', BonusRollFrame, 16, 4)
		self:GetNormalTexture():SetTexCoord(0, 1/2, 0, 1)
		Frame:Hide()
	end

	collapsed = not collapsed
end)
