local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

local anchor = CreateFrame("Frame", "TukuiWorldStateFrameAnchor", UIParent)
anchor:Size(170, 20)
anchor:SetFrameStrata("TOOLTIP")
anchor:SetFrameLevel(20)
anchor:SetClampedToScreen(true)
anchor:SetAlpha(0)
anchor:SetPoint("TOP", UIParent, "TOP", 0, -35)
anchor:SetTemplate("Default")
anchor:SetBackdropBorderColor(1, 0, 0, 1)
anchor:SetMovable(true)
anchor.text = T.SetFontString(anchor, C.media.pixelfont, 8, "MONOCHROMEOUTLINE")
anchor.text:SetPoint("CENTER")
anchor.text:SetText(hexa.."Move WorldStateFrame")

-- always show worldstate behind buffs
WorldStateAlwaysUpFrame:SetFrameStrata("BACKGROUND")
WorldStateAlwaysUpFrame:SetFrameLevel(0)
WorldStateAlwaysUpFrame:ClearAllPoints()
WorldStateAlwaysUpFrame:SetScale(1)
WorldStateAlwaysUpFrame:SetPoint("TOP", TukuiWorldStateFrameAnchor, "BOTTOM", 0, 10)

-- reposition capture bar to top/center of the screen
local function CaptureUpdate()
	if NUM_EXTENDED_UI_FRAMES then
		local captureBar
		for i=1, NUM_EXTENDED_UI_FRAMES do
			captureBar = getglobal("WorldStateCaptureBar" .. i)

			if captureBar and captureBar:IsVisible() then
				captureBar:ClearAllPoints()

				if( i == 1 ) then
					captureBar:Point("TOP", WorldStateAlwaysUpFrame, "BOTTOM", 0, -40)
				else
					captureBar:Point("TOPLEFT", getglobal("WorldStateCaptureBar" .. i - 1 ), "TOPLEFT", 0, -25)
				end
			end	
		end	
	end
end
hooksecurefunc("UIParent_ManageFramePositions", CaptureUpdate)