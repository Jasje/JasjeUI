local C, F = unpack(select(2, ...))

C["General"] = {
	["BorderColor"] = {.2, .2, .2},
	["BackdropColor"] = {.075, .075, .075},
}

C["ChatWindows"] = {
	["AutoFade"] = false,       -- Auto fade out inactive frames
	["AutoHide"] = false,       -- Automatically minimize new whisper windows
	["ShowTitle"] = true,       -- Show persons name above chat window
	["MinimizeAll"] = false,    -- Minimize all opened chat windows
	["Width"] = 300,            -- Chat window width
	["Height"] = 100,           -- Chat window height
	["FontSize"] = 12,          -- Chat window font size
}

-- Using this space as a to-do list atm

-- make "alert" red