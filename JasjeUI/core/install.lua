local T, C, L = unpack(Tukui)

T.release = GetAddOnMetadata("JasjeUI", "Version")

-- turning on autoloot by default
local function CVarJasje()
	SetCVar("autoLootDefault", 1) 
end	