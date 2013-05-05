local T, C, L, G = unpack( Tukui )

if not C.highlight.Enable == true then return end

-- No touchy
local NewBackdrop = {
	edgeFile = C["media"].blank, edgeSize = C.highlight.FlashBorderSize,
	insets = {left = T.mult, right = T.mult, top = T.mult, bottom = T.mult},
}

local ShowOverlayGlow = function(self)
    if (self.overlay) then
        if (self.overlay.animOut:IsPlaying()) then
            self.overlay.animOut:Stop()
            self.overlay.animIn:Play()
        end
    else
        self.overlay = ActionButton_GetOverlayGlow()
        local frameWidth, frameHeight = self:GetSize()
        self.overlay:SetParent(self)
        self.overlay:ClearAllPoints()
        self.overlay:SetSize(frameWidth * 1.4, frameHeight * 1.4)
        self.overlay:SetPoint("TOPLEFT", self, "TOPLEFT", -frameWidth * 0.2, frameHeight * 0.2)
        self.overlay:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", frameWidth * 0.2, -frameHeight * 0.2)
        self.overlay.animIn:Play()
    end
end
 
local HideOverlayGlow = function(self)
    if (self.overlay) then
        if (self.overlay.animIn:IsPlaying()) then
            self.overlay.animIn:Stop()
        end
        if (self:IsVisible()) then
            self.overlay.animOut:Play()
        else
            ActionButton_OverlayGlowAnimOutFinished(self.overlay.animOut)
        end
    end
end

local ShowOverlayGlowNew = function(self)
	if (self.overlay and C.highlight.OriginalStyle) then
		if self.NewProc then
			self.NewProc:Hide()
		end
		
		self.overlay:Show()
		ShowOverlayGlow(self)
	else
		HideOverlayGlow(self)
	end

	if (C.highlight.FlashEntireButton and not self.Animation.Modified) then
		local Animation = self:CreateAnimationGroup()
		Animation:SetLooping("BOUNCE")

		local FadeOut = Animation:CreateAnimation("Alpha")
		FadeOut:SetChange(-1)
		FadeOut:SetDuration(0.40)
		FadeOut:SetSmoothing("IN_OUT")
		
		self.Animation = Animation
		self.Animation.Modified = true
	end
	
	if (self.NewProc and C.highlight.FlashButtonBorder and not self.NewProc.Styled) then
		self.NewProc:SetBackdrop(NewBackdrop)
		self.NewProc:SetBackdropBorderColor(unpack(C.highlight.FlashBorderColor))
		self.NewProc.Styled = true
	end

	if (not C.highlight.OriginalStyle and not self.Animation:IsPlaying()) then
		self.Animation:Play()
		self.NewProc:Show()
	end
end

local HideOverlayGlowNew = function(self)
	if (self.Animation and self.Animation:IsPlaying()) then
		self.Animation:Stop()
		self.NewProc:Hide()
	end
end

hooksecurefunc("ActionButton_ShowOverlayGlow", ShowOverlayGlowNew)
hooksecurefunc("ActionButton_HideOverlayGlow", HideOverlayGlowNew)