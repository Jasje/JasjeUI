local T, C, L = unpack(Tukui)

local active = {}
local hooked = {}

local function OnShow(self)
	active[self] = true
end

local function OnHide(self)
	active[self] = nil
end

local function Update(self)
	if self.timer and self.timer.text then
		local font = self.timer.text:GetFont()
		if font ~= C.media.pixelfont2 then
			self.timer.text:SetFont(C.media.pixelfont2, 20, "OUTLINE")
		end
	end
end

local EventWatcher = CreateFrame("Frame")
EventWatcher:SetScript("OnEvent", function(self, event)
	for cooldown in pairs(active) do
		Update(cooldown)
	end
end)
EventWatcher:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN")

local function Register(frame)
	local cooldown = frame.cooldown
	if not hooked[cooldown] then
		cooldown:HookScript("OnShow", OnShow)
		cooldown:HookScript("OnHide", OnHide)
	end
end

if _G["ActionBarButtonEventsFrame"].frames then
	for i, frame in pairs(_G["ActionBarButtonEventsFrame"].frames) do
		Register(frame)
	end
end

hooksecurefunc("ActionBarButtonEventsFrame_RegisterFrame", Register)
