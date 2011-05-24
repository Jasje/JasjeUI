-- Color system for Jasje datatexts(credit hydra)
local T, C, L = unpack(select(2, ...))
local ccolor = {
	DEATHKNIGHT = {r=196/255, g= 30/255, b= 59/255},
	DRUID       = {r=255/255, g=125/255, b= 10/255},
	HUNTER      = {r=171/255, g=212/255, b=115/255},
	MAGE        = {r=105/255, g=204/255, b=240/255},
	PALADIN     = {r=245/255, g=140/255, b=186/255},
	PRIEST      = {r=255/255, g=255/255, b=255/255},
	ROGUE       = {r=255/255, g=245/255, b=105/255},
	SHAMAN      = {r=  11/255, g=112/255, b=222/255},
	WARLOCK     = {r=148/255, g=130/255, b=201/255},
	WARRIOR     = {r=199/255, g=156/255, b=110/255},
}
hexa, hexb = C["datatext"].color, "|r"

if C["datatext"].classcolor then
	hexa = string.format("|c%02x%02x%02x%02x", 255, ccolor[T.myclass].r * 255, ccolor[T.myclass].g * 255, ccolor[T.myclass].b * 255)
end