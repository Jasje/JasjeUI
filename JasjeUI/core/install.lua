local T, C, L = unpack(Tukui)

T.release = GetAddOnMetadata("JasjeUI", "Version")

-- turning on autoloot by default
local CVarJasje = CreateFrame("Frame")
CVarJasje:SetScript("OnEvent", function()
SetCVar("autoLootDefault", 1) 

end)
CVarJasje:RegisterEvent("PLAYER_LOGIN")

--[[
if C["Filger"].enable then
	SetCVar("lossOfControl", 0)
	InterfaceOptionsCombatPanelLossOfControl:Kill()
	InterfaceOptionsCombatPanelLossOfControlFullDropDown:Kill()
	InterfaceOptionsCombatPanelLossOfControlSilenceDropDown:Kill()
	InterfaceOptionsCombatPanelLossOfControlInterruptDropDown:Kill()
	InterfaceOptionsCombatPanelLossOfControlDisarmDropDown:Kill()
	InterfaceOptionsCombatPanelLossOfControlRootDropDown:Kill()
end
]]--