local C, F = unpack(select(2, ...))

local ipairs = ipairs
local options = {}
local buttons = {}
local edit = {}
local size = {}

local configPanel = CreateFrame("Frame", "HydraChatConfig", UIParent)
F.CreatePanel(configPanel, 200, 200, "CENTER", UIParent, "CENTER", 0, 140)
F.SetBorder(configPanel)
configPanel:EnableMouse(true)
configPanel:SetMovable(true)
configPanel:RegisterForDrag("LeftButton")
configPanel:SetScript("OnDragStart", function(self) self:SetUserPlaced(true) self:StartMoving() end)
configPanel:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
configPanel:Hide()

local configTitle = CreateFrame("Frame", "HydraChatConfig", configPanel)
F.CreatePanel(configTitle, 1, 24, "TOPLEFT", UIParent, "TOPLEFT", 0, 0)
configTitle:SetPoint("TOPLEFT", F.Scale(4), F.Scale(-4))
configTitle:SetPoint("TOPRIGHT", F.Scale(-31), F.Scale(-4))
configTitle:SetFrameStrata("MEDIUM")

configTitle.text = configTitle:CreateFontString(nil, "OVERLAY")
configTitle.text:SetFont(C.pixelfont, 8, "OUTLINEMONOCHROME")
configTitle.text:SetText("|cff00AAFFHydra|r Chat")
configTitle.text:SetPoint("CENTER")

local configClose = CreateFrame("Frame", "HydraChatConfigClose", configPanel)
F.CreatePanel(configClose, 24, 24, "TOPRIGHT", configPanel, "TOPRIGHT", -4, -4)
configClose:SetFrameStrata("MEDIUM")
configClose:EnableMouse(true)
configClose:SetScript("OnEnter", function(self) self.text:SetTextColor(1,0,0) end)
configClose:SetScript("OnLeave", function(self) self.text:SetTextColor(1,1,1) end)
configClose:SetScript("OnMouseDown", function() configPanel:Hide() end)

configClose.text = configClose:CreateFontString(nil, "OVERLAY")
configClose.text:SetFont(C.font, 14)
configClose.text:SetText("X")
configClose.text:SetPoint("CENTER", configClose, 0, 0)

local OnEnterPressedWidth = function(self)
	local width = tonumber(self:GetText())
	self:ClearFocus()
	self:SetAutoFocus(false)
	
	if not width or width <= 0 or type(width) ~= "number" then return end
	
	for i, v in ipairs(F.chats) do
		v:SetWidth(F.Scale(width))
		v.Editbox:SetWidth(v:GetWidth())
	end
	
	C["ChatWindows"].Width = width
end

local OnEnterPressedHeight = function(self)
	local height = tonumber(self:GetText())
	self:ClearFocus()
	self:SetAutoFocus(false)
	
	if not height or height <= 0 or type(height) ~= "number" then return end
	
	for i, v in ipairs(F.chats) do
		v:SetHeight(F.Scale(height))
	end
	
	C["ChatWindows"].Height = height
end

local OnEnterPressedFont = function(self)
	local fontSize = tonumber(self:GetText())
	self:ClearFocus()
	self:SetAutoFocus(false)
	
	if not fontSize or fontSize <= 0 or type(fontSize) ~= "number" then return end
	
	for i, v in ipairs(F.chats) do
		v.text:SetFont(C.font, fontSize)
	end
	
	C["ChatWindows"].FontSize = fontSize
end

local UpdateTitles = function()
	for i, v in ipairs(F.chats) do
		if C["ChatWindows"].ShowTitle then
			_G[v:GetName().."Title"]:SetAlpha(1)
		else
			_G[v:GetName().."Title"]:SetAlpha(0)
		end
	end
end

local MinimizeAllChats = function()
	for i, v in ipairs(F.chats) do
		if C["ChatWindows"].MinimizeAll then
			if not v.minimized then
				F.SetMinimized(v)
			end
			_G["HydraChatConfigButton4Text"]:SetText("  Maximize All")
		else
			F.SetMaximized(v)
			_G["HydraChatConfigButton4Text"]:SetText("  Minimize All")
		end
	end
end

local OnClick = function(self) -- This is dumb, make a better method
	local button = tonumber(strsub(self:GetName(), 22))

	if button == 1 then
		if self:GetChecked() then
			C["ChatWindows"].AutoFade = true
		else
			C["ChatWindows"].AutoFade = false
		end
	elseif button == 2 then
		if self:GetChecked() then
			C["ChatWindows"].ShowTitle = true
		else
			C["ChatWindows"].ShowTitle = false
		end
		UpdateTitles()
	elseif button == 3 then
		if self:GetChecked() then
			C["ChatWindows"].AutoHide = true
		else
			C["ChatWindows"].AutoHide = false
		end
	elseif button == 4 then
		if self:GetChecked() then
			C["ChatWindows"].MinimizeAll = true
			MinimizeAllChats()
		else
			C["ChatWindows"].MinimizeAll = false
			MinimizeAllChats()
		end
	end
end

for k, v in pairs(C["ChatWindows"]) do -- place the options into a new table for ease of use
	tinsert(options, {k, v})
end

for i = 1, 3 do
	size[i] = CreateFrame("Frame", nil, configPanel)
	F.CreatePanel(size[i], 50, 20, "BOTTOM", configPanel, "BOTTOM", 5, 0)
	size[i]:EnableMouse(true)

	size[i].edit = CreateFrame("EditBox", "HydraChatConfigEdit"..i, configPanel)
	size[i].edit:SetFont(C.pixelfont, 8,"OUTLINEMONOCHROME")
	size[i].edit:SetPoint("TOPLEFT", size[i], F.Scale(4), F.Scale(-2))
	size[i].edit:SetPoint("BOTTOMRIGHT", size[i], F.Scale(-4), F.Scale(2))
	size[i].edit:SetMaxLetters(3)
	size[i].edit:SetAutoFocus(false)
	size[i].edit:EnableKeyboard(true)
	size[i].edit:EnableMouse(true)
	size[i].edit:SetScript("OnMouseDown", function(self) self:SetAutoFocus(true) end)
	size[i].edit:SetScript("OnEscapePressed", function(self) self:SetAutoFocus(false) self:ClearFocus() end)
	
	size[i].text = configPanel:CreateFontString(nil, "OVERLAY")
	size[i].text:SetFont(C.pixelfont, 8, "MONOCHROMEOUTLINE")
	size[i].text:SetPoint("BOTTOM", size[i], "TOP", 0, F.Scale(3))

	if i == 1 then -- Width
		size[i]:SetPoint("BOTTOM", configPanel, "BOTTOM", F.Scale(36), F.Scale(12))
		size[i].edit:SetScript("OnEnterPressed", OnEnterPressedWidth)
		size[i].text:SetText("Width") -- localize
	elseif i == 2 then -- Height
		size[i]:SetPoint("BOTTOM", size[i-1], "TOP", 0, F.Scale(20))
		size[i].edit:SetScript("OnEnterPressed", OnEnterPressedHeight)
		size[i].text:SetText("Height") -- localize
	else -- Fontsize
		size[i]:SetPoint("BOTTOM", size[i-1], "TOP", 0, F.Scale(20))
		size[i].edit:SetScript("OnEnterPressed", OnEnterPressedFont)
		size[i].text:SetText("Font Size") -- localize
	end
end

for key, option in ipairs(options) do
	local name, value = unpack(option)
	
	buttons[key] = CreateFrame("CheckButton", "HydraChatConfigButton"..key, configPanel, "ChatConfigCheckButtonTemplate")
	buttons[key]:ClearAllPoints()
	
	if key == 1 then
		buttons[key]:SetPoint("BOTTOMLEFT", configPanel, "BOTTOMLEFT", F.Scale(6), F.Scale(6))
		_G[format("HydraChatConfigButton%dText", key)]:SetText("  Auto Fade") -- localize later
	elseif key == 2 then
		buttons[key]:SetPoint("BOTTOM", buttons[key-1], "TOP", 0, F.Scale(4))
		_G[format("HydraChatConfigButton%dText", key)]:SetText("  Show Title") -- localize later
	elseif key == 3 then
		buttons[key]:SetPoint("BOTTOM", buttons[key-1], "TOP", 0, F.Scale(4))
		_G[format("HydraChatConfigButton%dText", key)]:SetText("  Auto Hide") -- localize later
	elseif key == 4 then
		buttons[key]:SetPoint("BOTTOM", buttons[key-1], "TOP", 0, F.Scale(4))
		_G[format("HydraChatConfigButton%dText", key)]:SetText("  Minimize All") -- localize later
	end
	
	-- Add a tooltip info
	
	buttons[key]:SetScript("OnClick", OnClick)
	configPanel:SetSize(F.Scale(200), F.Scale((30 * (key-2)) + 30)) -- Auto size the background
end

local EnableConfig = function()
	ToggleFrame(configPanel)
end

SLASH_HYDRACHATCONFIG1 = "/hydrachat"
SlashCmdList["HYDRACHATCONFIG"] = EnableConfig

-- Saved Variables
local SaveVariables = function(self, event)
	if event == "ADDON_LOADED" then
		if Config == nil then
			Config = {
				["AutoFade"] = C["ChatWindows"].AutoFade,
				["AutoHide"] = C["ChatWindows"].AutoHide,
				["ShowTitle"] = C["ChatWindows"].ShowTitle,
				["MinimizeAll"] = C["ChatWindows"].MinimizeAll,
				["Width"] = C["ChatWindows"].Width,
				["Height"] = C["ChatWindows"].Height,
				["FontSize"] = C["ChatWindows"].FontSize,
			}
		end
		
		if Config then
			C["ChatWindows"] = Config
		end
		
	elseif event == "PLAYER_LOGOUT" then
		Config = {
			["AutoFade"] = C["ChatWindows"].AutoFade,
			["AutoHide"] = C["ChatWindows"].AutoHide,
			["ShowTitle"] = C["ChatWindows"].ShowTitle,
			["MinimizeAll"] = C["ChatWindows"].MinimizeAll,
			["Width"] = C["ChatWindows"].Width,
			["Height"] = C["ChatWindows"].Height,
			["FontSize"] = C["ChatWindows"].FontSize,
		}
	end
	
	if C["ChatWindows"].AutoFade then HydraChatConfigButton1:SetChecked() end
	if C["ChatWindows"].ShowTitle then HydraChatConfigButton2:SetChecked() end
	if C["ChatWindows"].AutoHide then HydraChatConfigButton3:SetChecked() end
	if C["ChatWindows"].MinimizeAll then HydraChatConfigButton4:SetChecked() end
	HydraChatConfigEdit1:SetText(C["ChatWindows"].Width)
	HydraChatConfigEdit2:SetText(C["ChatWindows"].Height)
	HydraChatConfigEdit3:SetText(C["ChatWindows"].FontSize)
end

local saver = CreateFrame("FRAME")
saver:RegisterEvent("ADDON_LOADED")
saver:RegisterEvent("PLAYER_LOGOUT")
saver:SetScript("OnEvent", SaveVariables)