local C, F = unpack(select(2, ...))

local options = {}
local buttons = {}
local edit = {}

-- To be written... Also add saved variables
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
configTitle:SetPoint("TOPRIGHT", F.Scale(-4), F.Scale(-4))
configTitle:SetFrameStrata("MEDIUM")

configTitle.text = configTitle:CreateFontString(nil, "OVERLAY")
configTitle.text:SetFont(C.pixelfont, 8, "MONOCHROMEOUTLINE")
configTitle.text:SetText("|cff00AAFFHydra|r Chat")
configTitle.text:SetPoint("CENTER")

local UpdateTitles = function()
	for i, v in ipairs(F.chats) do
		if C["ChatWindows"].ShowTitle then
			_G[v:GetName().."Title"]:SetAlpha(1)
		else
			_G[v:GetName().."Title"]:SetAlpha(0)
		end
	end
end

local OnClick = function(self) -- This is dumb, make a better method
	if strfind(self:GetName(), "1") then
		if self:GetChecked() then
			C["ChatWindows"].AutoFade = true
		else
			C["ChatWindows"].AutoFade = false
		end
	else
		if self:GetChecked() then
			C["ChatWindows"].ShowTitle = true
		else
			C["ChatWindows"].ShowTitle = false
		end
		UpdateTitles()
	end
end

for k, v in pairs(C["ChatWindows"]) do -- place the options into a new table for ease of use
	tinsert(options, {k, v})
end

for key, option in ipairs(options) do
	local name, value = unpack(option)
	
	buttons[key] = CreateFrame("CheckButton", "HydraChatConfigButton"..key, configPanel, "ChatConfigCheckButtonTemplate")
	buttons[key]:ClearAllPoints()
	
	if key == 1 then
		buttons[key]:SetPoint("BOTTOMLEFT", configPanel, "BOTTOMLEFT", F.Scale(6), F.Scale(6))
		_G[format("HydraChatConfigButton%dText", key)]:SetText("  Auto Fade") -- localize later
	else
		buttons[key]:SetPoint("BOTTOM", buttons[key-1], "TOP", 0, F.Scale(4))
		_G[format("HydraChatConfigButton%dText", key)]:SetText("  Show Title") -- localize later
	end
	
	buttons[key]:SetScript("OnClick", OnClick)
	
	configPanel:SetSize(F.Scale(200), F.Scale((30 * (key)) + 30)) -- Auto size the background
end

if C["ChatWindows"].AutoFade then HydraChatConfigButton1:SetChecked() end -- temp until saved vars
if C["ChatWindows"].ShowTitle then HydraChatConfigButton2:SetChecked() end

local EnableConfig = function()
	ToggleFrame(configPanel)
end

SLASH_HYDRACHATCONFIG1 = "/hydrachat "
SlashCmdList["HYDRACHATCONFIG"] = EnableConfig