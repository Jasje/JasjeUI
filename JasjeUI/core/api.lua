local T, C, L = unpack(Tukui)

local function CreateBorder( self, s )
	if( self:GetFrameStrata() == "BACKGROUND") then self:SetFrameStrata("LOW") end

	local border = CreateFrame( "Frame", nil, self )
	border:SetPoint("TOPLEFT", self, "TOPLEFT", T.Scale(-2), T.Scale( 2 ))
	border:SetPoint( "BOTTOMRIGHT", self, "BOTTOMRIGHT", T.Scale(2), T.Scale(-2))
	border:SetTemplate("Default")
	border:SetFrameLevel( self:GetFrameLevel() )
end

-- Hydra Border Function 
local function SetBorder(f)
	if f:GetFrameStrata() == "BACKGROUND" then f:SetFrameStrata("LOW") end
	f:SetBackdropColor(.075, .075, .075, 0.7)
	f:SetBackdropBorderColor(unpack(C["media"].bordercolor))
	
	local border = CreateFrame("Frame", nil, f)
	border:SetPoint("TOPLEFT", f, "TOPLEFT", T.Scale(-1), T.Scale(1))
	border:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", T.Scale(1), T.Scale(-1))
	border:SetFrameStrata("BACKGROUND")
	border:SetFrameLevel(1)
	border:SetBackdrop { edgeFile = C["media"].blank, edgeSize = T.Scale(3), insets = {left = 0, right = 0, top = 0, bottom = 0} }
	border:SetBackdropColor(unpack(C["media"].backdropcolor))
	border:SetBackdropBorderColor(unpack(C["media"].backdropcolor))
end

local function AllPoints(obj, frame, inset)
	if not inset then inset = 0 end
	obj:SetPoint("TOPLEFT", frame, "TOPLEFT", inset, -inset)
	obj:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -inset, inset)
end

--	Fade in/out functions
local function FadeIn(f)
	UIFrameFadeIn(f, 0.1, f:GetAlpha(), 1)
end

local function FadeOut(f)
	UIFrameFadeOut(f, 0, f:GetAlpha(), 0)
end

local function addapi(object)
	local mt = getmetatable(object).__index
	if not object.CreateBorder then mt.CreateBorder = CreateBorder end
	if not object.SetBorder then mt.SetBorder = SetBorder end -- hydra border
	if not object.AllPoints then mt.AllPoints = AllPoints end
	if not object.FadeIn then mt.FadeIn = FadeIn end
	if not object.FadeOut then mt.FadeOut = FadeOut end
end

local handled = {["Frame"] = true}
local object = CreateFrame("Frame")
addapi(object)
addapi(object:CreateTexture())
addapi(object:CreateFontString())

object = EnumerateFrames()
while object do
	if not handled[object:GetObjectType()] then
		addapi(object)
		handled[object:GetObjectType()] = true
	end

	object = EnumerateFrames(object)
end

local color = RAID_CLASS_COLORS[select(2, UnitClass("player"))] -- did this for button hover, pushed

local function StyleButton(b, c) 
    local name = b:GetName()
	
	if b then
		hover:SetTexture(color.r, color.g, color.b,0.3)
		elseif c then
		checked:SetTexture(color.r, color.g, color.b,.5)
		end
		end		
				
				
				
				
				
				
				
				