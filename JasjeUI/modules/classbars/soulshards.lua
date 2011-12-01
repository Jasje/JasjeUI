local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales
if C.classbar.soulShards[1] ~= true or T.myclass ~= "WARLOCK" then return end

local tbWidth, tbHeight = C.classbar.soulShards[2], C.classbar.soulShards[3]

local sshards = CreateFrame("Frame", "TukuiSoulShards", UIParent)
sshards:Width(tbWidth)
sshards:Height(tbHeight)
sshards:Point("BOTTOM", TukuiPlayer, "TOP", 0, -3)
sshards:CreateBorder(false, true)
sshards:SetFrameLevel(10)

local shards = {}

for i=1,3 do
	shards[i] = CreateFrame("Frame", "TukuiSoulShards_Shard"..i, sshards)
	shards[i]:SetWidth((tbWidth-2) / 3)
	shards[i]:SetHeight(tbHeight)
	shards[i]:CreateBorder(false, true)
	shards[i].tex = shards[i]:CreateTexture(nil, "OVERLAY")
	shards[i].tex:SetTexture(C.media.normTex)
	shards[i].tex:SetVertexColor(150/255,100/255,250/255)
	shards[i].tex:AllPoints(shards[i])
	shards[i].BG = shards[i]:CreateTexture(nil, 'BORDER')
	shards[i].BG:SetAllPoints()
	shards[i].BG:SetTexture(.1, .1, .1)
	if i==1 then
		shards[i]:SetPoint("LEFT", sshards, "LEFT", 0, 0)
	else
		shards[i]:SetPoint("LEFT", shards[i-1], "RIGHT", 1, 0)
	end
end

local function UpdateShards()
	local numShards = UnitPower("player", SPELL_POWER_SOUL_SHARDS)
	for i = 1, 3 do
		if (i <= numShards) then
			shards[i].tex:Show()
		else
			shards[i].tex:Hide()
		end
	end
end

sshards:RegisterEvent("UNIT_POWER")
sshards:RegisterEvent("PLAYER_ENTERING_WORLD")
sshards:SetScript("OnEvent", UpdateShards)

local vehicle = CreateFrame("Frame")
vehicle:RegisterEvent("VEHICLE_UPDATE")
vehicle:SetScript("OnEvent", function()
	if UnitHasVehicleUI("player") then
		sshards:Hide()
	else
		sshards:Show()
	end
end)