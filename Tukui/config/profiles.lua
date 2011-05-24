----------------------------------------------------------------------------
-- Per Class Config (overwrite general)
-- Class need to be UPPERCASE
----------------------------------------------------------------------------
local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

if T.myclass == "PRIEST" then
	-- do some config!
end

----------------------------------------------------------------------------
-- Per Character Name Config (overwrite general and class)
-- Name need to be case sensitive
----------------------------------------------------------------------------

if T.myname == "Jasjè" then
	-- yeah my default config is not really like default tukui.
	C.datatext.classcolor = false
	C.chat.classcolortab = false
end

if T.myname == "Trokz" then
	C.datatext.regen = 0
	C.datatext.crit = 9
	C.actionbar.sidebarWidth = 5
end