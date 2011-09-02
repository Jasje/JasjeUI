local T, C, L = unpack(select(2, ...))
-----------------------------------------
--skinned by jasje
--ugly and long but what the hell
-----------------------------------------

local function LoadSkin()
    -- Here we skin the InterfaceOptionFrame
	local options = {
		"InterfaceOptionsFrameCategories",
		"InterfaceOptionsFrameAddOns",
		"InterfaceOptionsControlsPanel",
		"InterfaceOptionsCombatPanel",
		"InterfaceOptionsDisplayPanel",
		"InterfaceOptionsObjectivesPanel",
		"InterfaceOptionsSocialPanel",
		"InterfaceOptionsActionBarsPanel",
		"InterfaceOptionsNamesPanel",
		"InterfaceOptionsCombatTextPanel",
		"InterfaceOptionsBuffsPanel",
		"InterfaceOptionsBattlenetPanel",
		"InterfaceOptionsCameraPanel",
		"InterfaceOptionsMousePanel",
		"InterfaceOptionsHelpPanel",
		"InterfaceOptionsFramePanelContainer",
	}
	
	for i = 1, getn(options) do
		_G[options[i]]:StripTextures()
		_G[options[i]]:SetTemplate("Transparent")
    end
	
	-- Here we move stuff around
	T.SkinButton(InterfaceOptionsFrameTab1, true)
	InterfaceOptionsFrameTab1:ClearAllPoints()
	InterfaceOptionsFrameTab1:Point("TOPLEFT", InterfaceOptionsFrameCategories, 15, 20)
	InterfaceOptionsFrameTab1:Size(72,24)
	T.SkinButton(InterfaceOptionsFrameTab2, true)
	InterfaceOptionsFrameTab2:ClearAllPoints()
	InterfaceOptionsFrameTab2:Point("RIGHT", InterfaceOptionsFrameTab1, 80, 0)
	
	InterfaceOptionsFrameDefaults:ClearAllPoints()
	InterfaceOptionsFrameDefaults:Point("BOTTOMLEFT", InterfaceOptionsFrameCategories, 0, -40)
	InterfaceOptionsFrameDefaults:Width(InterfaceOptionsFrameCategories:GetWidth())
	
	InterfaceOptionsFrameOkay:ClearAllPoints()
	InterfaceOptionsFrameOkay:Point("LEFT", InterfaceOptionsFrameCancel, -100, 0)
	
	InterfaceOptionsFrameCancel:ClearAllPoints()
	InterfaceOptionsFrameCancel:Point("BOTTOMRIGHT", InterfaceOptionsFramePanelContainer, 0, -40)

	local optionscheck = {
		"InterfaceOptionsControlsPanelStickyTargeting",
		"InterfaceOptionsControlsPanelAutoDismount",
		"InterfaceOptionsControlsPanelAutoClearAFK",
		"InterfaceOptionsControlsPanelBlockTrades",
		"InterfaceOptionsControlsPanelBlockGuildInvites",
		"InterfaceOptionsControlsPanelLootAtMouse",
		"InterfaceOptionsControlsPanelAutoLootCorpse",
		"InterfaceOptionsCombatPanelAttackOnAssist",
		"InterfaceOptionsCombatPanelStopAutoAttack",
		"InterfaceOptionsCombatPanelNameplateClassColors",
		"InterfaceOptionsCombatPanelTargetOfTarget",
		"InterfaceOptionsCombatPanelShowSpellAlerts",
		"InterfaceOptionsCombatPanelReducedLagTolerance",
		"InterfaceOptionsCombatPanelActionButtonUseKeyDown",
		"InterfaceOptionsCombatPanelActionButtonUseKeyDown",
		"InterfaceOptionsCombatPanelEnemyCastBarsOnPortrait",
		"InterfaceOptionsCombatPanelEnemyCastBarsOnNameplates",
		"InterfaceOptionsCombatPanelAutoSelfCast",
		"InterfaceOptionsDisplayPanelShowCloak",
		"InterfaceOptionsDisplayPanelShowHelm",
		"InterfaceOptionsDisplayPanelShowAggroPercentage",
		"InterfaceOptionsDisplayPanelPlayAggroSounds",
		"InterfaceOptionsDisplayPanelDetailedLootInfo",
		"InterfaceOptionsDisplayPanelShowSpellPointsAvg",
		"InterfaceOptionsDisplayPanelemphasizeMySpellEffects",
		"InterfaceOptionsDisplayPanelCinematicSubtitles",
		"InterfaceOptionsCombatPanelAutoSelfCast",
		"InterfaceOptionsDisplayPanelRotateMinimap",
		"InterfaceOptionsDisplayPanelScreenEdgeFlash",
		"InterfaceOptionsObjectivesPanelAutoQuestTracking",
		"InterfaceOptionsObjectivesPanelAutoQuestProgress",
		"InterfaceOptionsObjectivesPanelMapQuestDifficulty",
		"InterfaceOptionsObjectivesPanelAdvancedWorldMap",
		"InterfaceOptionsObjectivesPanelWatchFrameWidth",
		"InterfaceOptionsSocialPanelProfanityFilter",
		"InterfaceOptionsSocialPanelSpamFilter",
		"InterfaceOptionsSocialPanelChatBubbles",
		"InterfaceOptionsSocialPanelPartyChat",
		"InterfaceOptionsSocialPanelChatHoverDelay",
		"InterfaceOptionsSocialPanelGuildMemberAlert",
		"InterfaceOptionsSocialPanelChatMouseScroll",
		"InterfaceOptionsActionBarsPanelLockActionBars",
		"InterfaceOptionsActionBarsPanelSecureAbilityToggle",
		"InterfaceOptionsNamesPanelMyName",
		"InterfaceOptionsNamesPanelFriendlyPlayerNames",
		"InterfaceOptionsNamesPanelFriendlyPets",
		"InterfaceOptionsNamesPanelFriendlyGuardians",
		"InterfaceOptionsNamesPanelFriendlyTotems",
		"InterfaceOptionsNamesPanelUnitNameplatesFriends",
		"InterfaceOptionsNamesPanelUnitNameplatesFriendlyPets",
		"InterfaceOptionsNamesPanelUnitNameplatesFriendlyGuardians",
		"InterfaceOptionsNamesPanelUnitNameplatesFriendlyTotems",
		"InterfaceOptionsNamesPanelGuilds",
		"InterfaceOptionsNamesPanelGuildTitles",
		"InterfaceOptionsNamesPanelTitles",
		"InterfaceOptionsNamesPanelNonCombatCreature",
		"InterfaceOptionsNamesPanelEnemyPlayerNames",
		"InterfaceOptionsNamesPanelEnemyPets",
		"InterfaceOptionsNamesPanelEnemyGuardians",
		"InterfaceOptionsNamesPanelEnemyTotems",
		"InterfaceOptionsNamesPanelUnitNameplatesEnemies",
		"InterfaceOptionsNamesPanelUnitNameplatesEnemyPets",
		"InterfaceOptionsNamesPanelUnitNameplatesEnemyGuardians",
		"InterfaceOptionsNamesPanelUnitNameplatesEnemyTotems",
		"InterfaceOptionsNamesPanelUnitNameplatesEnemyTotems",
		"InterfaceOptionsCombatTextPanelTargetDamage",
		"InterfaceOptionsCombatTextPanelPeriodicDamage",
		"InterfaceOptionsCombatTextPanelPetDamage",
		"InterfaceOptionsCombatTextPanelHealing",
		"InterfaceOptionsCombatTextPanelTargetEffects",
		"InterfaceOptionsCombatTextPanelOtherTargetEffects",
		"InterfaceOptionsCombatTextPanelEnableFCT",
		"InterfaceOptionsCombatTextPanelDodgeParryMiss",
		"InterfaceOptionsCombatTextPanelDamageReduction",
		"InterfaceOptionsCombatTextPanelRepChanges",
		"InterfaceOptionsCombatTextPanelReactiveAbilities",
		"InterfaceOptionsCombatTextPanelFriendlyHealerNames",
		"InterfaceOptionsCombatTextPanelCombatState",
		"InterfaceOptionsCombatTextPanelComboPoints",
		"InterfaceOptionsCombatTextPanelLowManaHealth",
		"InterfaceOptionsCombatTextPanelEnergyGains",
		"InterfaceOptionsCombatTextPanelPeriodicEnergyGains",
		"InterfaceOptionsCombatTextPanelHonorGains",
		"InterfaceOptionsCombatTextPanelAuras",
		"InterfaceOptionsBuffsPanelBuffDurations",
		"InterfaceOptionsBuffsPanelDispellableDebuffs",
		"InterfaceOptionsBuffsPanelCastableBuffs",
		"InterfaceOptionsBuffsPanelShowCastableDebuffs",
		"InterfaceOptionsBattlenetPanelOnlineFriends",
		"InterfaceOptionsBattlenetPanelOfflineFriends",
		"InterfaceOptionsBattlenetPanelBroadcasts",
		"InterfaceOptionsBattlenetPanelFriendRequests",
		"InterfaceOptionsBattlenetPanelConversations",
		"InterfaceOptionsBattlenetPanelShowToastWindow",
		"InterfaceOptionsCameraPanelFollowTerrain",
		"InterfaceOptionsCameraPanelHeadBob",
		"InterfaceOptionsCameraPanelWaterCollision",
		"InterfaceOptionsCameraPanelSmartPivot",
		"InterfaceOptionsMousePanelInvertMouse",
		"InterfaceOptionsMousePanelClickToMove",
		"InterfaceOptionsMousePanelWoWMouse",
		"InterfaceOptionsHelpPanelShowTutorials",
		"InterfaceOptionsHelpPanelLoadingScreenTips",
		"InterfaceOptionsHelpPanelEnhancedTooltips",
		"InterfaceOptionsHelpPanelBeginnerTooltips",
		"InterfaceOptionsHelpPanelShowLuaErrors",
		"InterfaceOptionsHelpPanelColorblindMode",
	}
	
	for i = 1, getn(optionscheck) do
		T.SkinCheckBox(_G[optionscheck[i]],8,true)
    end
	
	local optionsbox = {
		"InterfaceOptionsControlsPanelAutoLootKeyDropDown",
		"InterfaceOptionsCombatPanelTOTDropDown",
		"InterfaceOptionsCombatPanelFocusCastKeyDropDown",
		"InterfaceOptionsCombatPanelSelfCastKeyDropDown",
		"InterfaceOptionsDisplayPanelAggroWarningDisplay",
		"InterfaceOptionsDisplayPanelWorldPVPObjectiveDisplay",
		"InterfaceOptionsSocialPanelChatStyle",
		"InterfaceOptionsSocialPanelTimestamps",
		"InterfaceOptionsSocialPanelWhisperMode",
		"InterfaceOptionsSocialPanelBnWhisperMode",
		"InterfaceOptionsActionBarsPanelPickupActionKeyDropDown",
		"InterfaceOptionsNamesPanelNPCNamesDropDown",
		"InterfaceOptionsNamesPanelUnitNameplatesMotionDropDown",
		"InterfaceOptionsCombatTextPanelFCTDropDown",
		"InterfaceOptionsCameraPanelStyleDropDown",
		"InterfaceOptionsMousePanelClickMoveStyleDropDown",
    }

    for _, drop in pairs(optionsbox) do
	    local f = _G[drop]
	    T.SkinDropDownBox(f)
    end
	
	T.SkinButton(InterfaceOptionsHelpPanelResetTutorials)
	
	-- Here we skin the VideoOptionsFrame
	local options = {
		"VideoOptionsFrame",
		"VideoOptionsFrameCategoryFrame",
		"VideoOptionsFramePanelContainer",
		"AudioOptionsSoundPanelPlayback",
		"AudioOptionsSoundPanelHardware",
		"AudioOptionsSoundPanelVolume",
		"AudioOptionsVoicePanelTalking",
		"AudioOptionsVoicePanelListening",
		"AudioOptionsVoicePanelBinding",
	}
	
	for i = 1, getn(options) do
		_G[options[i]]:StripTextures()
		_G[options[i]]:SetTemplate("Transparent")
    end

	LoopbackVUMeter:StripTextures()
	LoopbackVUMeter:SetTemplate("")
	
	VideoOptionsFrameDefaults:ClearAllPoints()
	VideoOptionsFrameDefaults:Point("BOTTOMLEFT", VideoOptionsFrameCategoryFrame, 0, -40)
	VideoOptionsFrameDefaults:Width(VideoOptionsFrameCategoryFrame:GetWidth())
	
	local optionsbox = {
        "Graphics_DisplayModeDropDown",
        "Graphics_ResolutionDropDown",
        "Graphics_RefreshDropDown",
        "Graphics_PrimaryMonitorDropDown",
        "Graphics_MultiSampleDropDown",
        "Graphics_VerticalSyncDropDown",
        "Graphics_TextureResolutionDropDown",
        "Graphics_FilteringDropDown",
        "Graphics_ProjectedTexturesDropDown",
        "Graphics_ShadowsDropDown",
        "Graphics_LiquidDetailDropDown",
        "Graphics_SunshaftsDropDown",
        "Graphics_ParticleDensityDropDown",
        "Graphics_DisplayModeDropDown",
        "Graphics_ViewDistanceDropDown",
        "Graphics_EnvironmentalDetailDropDown",
        "Graphics_GroundClutterDropDown",
        "Graphics_DisplayModeDropDown",
        "Advanced_BufferingDropDown",
        "Advanced_LagDropDown",
        "Advanced_HardwareCursorDropDown",
        "Advanced_GraphicsAPIDropDown",
        "InterfaceOptionsLanguagesPanelLocaleDropDown",
        "AudioOptionsSoundPanelHardwareDropDown",
        "AudioOptionsSoundPanelSoundChannelsDropDown",
        "AudioOptionsVoicePanelInputDeviceDropDown",
        "AudioOptionsVoicePanelOutputDeviceDropDown",
        "AudioOptionsVoicePanelChatModeDropDown",
    }
	
	for _, drop in pairs(optionsbox) do
	    local f = _G[drop]
	    T.SkinDropDownBox(f)
    end
	
	local optionscheck = {
	    "Advanced_MaxFPSCheckBox",
	    "Advanced_MaxFPSBKCheckBox",
	    "InterfaceOptionsControlsPanelStickyTargeting",
	    "NetworkOptionsPanelOptimizeSpeed",
	    "NetworkOptionsPanelUseIPv6",
		"AudioOptionsSoundPanelEnableSound",
	    "AudioOptionsSoundPanelSoundEffects",
	    "AudioOptionsSoundPanelErrorSpeech",
	    "AudioOptionsSoundPanelEmoteSounds",
	    "AudioOptionsSoundPanelPetSounds",
	    "AudioOptionsSoundPanelMusic",
	    "AudioOptionsSoundPanelLoopMusic",
	    "AudioOptionsSoundPanelAmbientSounds",
	    "AudioOptionsSoundPanelSoundInBG",
	    "AudioOptionsSoundPanelReverb",
	    "AudioOptionsSoundPanelHRTF",
	    "AudioOptionsSoundPanelEnableDSPs",
	    "AudioOptionsSoundPanelUseHardware",
	    "AudioOptionsVoicePanelEnableVoice",
	    "AudioOptionsVoicePanelEnableMicrophone",
	    "AudioOptionsVoicePanelPushToTalkSound",
	}
	
	for i = 1, getn(optionscheck) do
		T.SkinCheckBox(_G[optionscheck[i]],8,true)
    end

	T.SkinButton(AudioOptionsVoicePanelChatMode1KeyBindingButton)
	T.SkinButton(RecordLoopbackSoundButton)
	T.SkinButton(PlayLoopbackSoundButton)
	
	AudioOptionsVoicePanelChatMode1KeyBindingButton:ClearAllPoints()
	AudioOptionsVoicePanelChatMode1KeyBindingButton:Point("CENTER", AudioOptionsVoicePanelBinding, 0, -20)	
	
	AudioOptionsVoicePanelPushToTalkSound:ClearAllPoints()
	AudioOptionsVoicePanelPushToTalkSound:Point("BOTTOMLEFT", AudioOptionsVoicePanelBinding, 10, 10)

end

    tinsert(T.SkinFuncs["Tukui"], LoadSkin)