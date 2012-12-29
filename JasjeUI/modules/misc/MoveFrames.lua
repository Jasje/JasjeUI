local T, C, L, G = unpack(Tukui)

local MoveFrames = {
	"DressUpFrame",
	"CharacterFrame",
}

local OnDragStart = function(self)
	self:SetUserPlaced(true) 
	self:StartMoving() 
end

local OnDragStop = function(self)
	self:StopMovingOrSizing() 
end

local SetFrameMovable = function(object)
	object:SetMovable(true)
	object:EnableMouse(true)
	object:RegisterForDrag("LeftButton")
	object:SetScript("OnDragStart", OnDragStart)
	object:SetScript("OnDragStop", OnDragStop)
end

for i = 1, #MoveFrames do
	SetFrameMovable(_G[MoveFrames[i]])
end