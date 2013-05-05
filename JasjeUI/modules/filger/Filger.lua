local T, C, L, G = unpack(Tukui)

if not C["Filger"].enable == true then return end
--[[
	
	Filger
	Copyright (c) 2009, Nils Ruesch
	All rights reserved.
	
]]--

Filger_Settings = {
	config_mode = false,
	max_test_icon = 7,
}

Filger_Spells = {
    ["DEATHKNIGHT"] = {  -------------------------------------------------------------------------------------------------------- Deathknight
		{
			Name = "Deathknight Procs",
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 47,
			Position = { "CENTER", "UIParent", -0, -85 },

			-- Killing Machine
			{ spellID = 51124, unitID = "player", caster = "player", filter = "BUFF" },
			-- Freezing Fog
			{ spellID = 59052, unitID = "player", caster = "player", filter = "BUFF" },
			-- Blood Charge
			{ spellID = 114851, unitID = "player", caster = "player", filter = "BUFF" },
			-- Relenless Grip 4pc pvp
			{ spellID = 131547, unitID = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 47,
			Position = { "CENTER", UIParent, -110, -40 },

			-- Bone Shield
			{ spellID = 49222, unitID = "player", caster = "player", filter = "BUFF" },
			-- Scent of Blood
			{ spellID = 49509, unitID = "player", caster = "player", filter = "BUFF" },
			-- Surge of Victory
			{ spellID = 102432, unitID = "player", caster = "player", filter = "BUFF" },
			-- Lichborne
			{ spellID = 49039, unitID = "player", caster = "player", filter = "BUFF" },
			-- Summon Gargoyle
			{ spellID = 61777, unitID = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 47,
			Position = { "CENTER", UIParent, 110, -40 },

			-- Necrotic Strike
			{ spellID = 73975, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Blood Plague
			{ spellID = 55078, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Frost Fever
			{ spellID = 55095, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Soul Reaper 
			{ spellID = 130736, unitID = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "COOLDOWN",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 60,
			Position = { "LEFT", UIParent, "CENTER", -240, -40 },

			--Death Grip
			{ spellID = 49576, filter = "CD" },	
			-- Conversion
			{ spellID = 119975, unitID = "player", caster = "player", filter = "BUFF" },
		},
        {		
			Name = "Pet",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 60,
			Position = { "LEFT", TukuiPet, "RIGHT", -80, -45},
			
			--Shadow infusion
			{ spellID = 91342, unitID = "pet", caster = "player", filter = "BUFF" },
			-- Dark Transformation
			{ spellID = 63560, unitID = "pet", caster = "player", filter = "BUFF" },
		},
	},
	["SHAMAN"] = { -------------------------------------------------------------------------------------------------------- Shaman
		{
			Name = "Shaman Procs",
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 47,
			Position = { "CENTER", "UIParent", -0, -85 },
			
			-- Clearcasting
			{ spellID = 16246, unitID = "player", caster = "player", filter = "BUFF" },
			-- Lava Surge
			{ spellID = 77762, unitID = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Shaman Procs",
			Direction = "LEFT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 37,
			Position = { "RIGHT", UIParent, "CENTER", -190, -20 },

			-- Shamanistic Rage
			{ spellID = 30823, unitID = "player", caster = "player", filter = "BUFF" },
			-- Spiritswalkers Grace
			{ spellID = 79206, unitID = "player", caster = "player", filter = "BUFF" },
			-- Lightning SHield
			{ spellID = 324, unitID = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 9,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 60,
			Position = { "LEFT", UIParent, "CENTER", -133, -234},

			-- Hex
			{ spellID = 51514, unitID = "target", caster = "all", filter = "DEBUFF" },
			-- Earth Shock
			{ spellID = 8042, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Frost Shock
			{ spellID = 8056, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Flame Shock
			{ spellID = 8050, unitID = "target", caster = "player", filter = "DEBUFF" },
		},
	},	
	 ["MAGE"] = { -------------------------------------------------------------------------------------------------------- Mage
		{
			Name = "Cooldown",
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 37,
			Position = { "CENTER", UIParent, 173, 10 },

			-- Water Elemental Freeze
			{ spellID = 33395, filter = "CD" },
			-- Blast Wave
			{ spellID = 11113, filter = "CD" },
			-- Mana shield
			{ spellID = 1463, unitID = "player", caster = "player", filter = "BUFF" },
		},	
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 37,
			Position = { "CENTER", UIParent, 173, -30 },
			
			-- Frostfire Bolt aka Glyph of Frostfire
			{ spellID = 44614, unitID = "target", caster = "all", filter = "DEBUFF" },
			--Innervate
			{ spellID = 29166, unitID = "player", caster = "all", filter = "BUFF"},
			--Icy Veins
			{ spellID = 12472, unitID = "player", caster = "player", filter = "BUFF" },
			-- Ice Barrier
			{spellID = 11426,  unitID = "player", caster = "player", filter = "BUFF" },
			-- Slow
			{spellID = 31589, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Ignite
			{spellID = 12654, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Living Bomb
			{spellID = 44457, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Nether Tempest
			{spellID = 114923, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Pyroblast
			{spellID = 11366, unitID = "target", caster = "player", filter = "DEBUFF"},
		},
		{
			Name = "Mage Procs",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 47,
			Position = { "CENTER", "UIParent", 219, 15 },
			
			-- Fingers of Frost
			{spellID = 44544, unitID = "player", caster = "player", filter = "BUFF" },
			-- Brain Freeze
			{spellID = 57761, unitID = "player", caster = "player", filter = "BUFF" },
			-- Arcane Missiles!
			{spellID = 79683, unitID = "player", caster = "player", filter = "BUFF" },
			-- Heating Up
			{spellID = 48107, unitID = "player", caster = "player", filter = "BUFF" },
			-- Pyroblast!
			{spellID = 48108, unitID = "player", caster = "player", filter = "BUFF" },
		},
	},
	["PRIEST"] = { -------------------------------------------------------------------------------------------------------- Priest
		{
			Name = "Buffs and Debuffs",
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 47,
			Position = { "CENTER", "UIParent", -0, -85 },

			-- Divine insight
			{spellID = 124430, unitID = "player", caster = "player", filter = "BUFF"},			
			-- Fade
			{spellID = 586, unitID = "player", caster = "player", filter = "BUFF"},
			-- Surge of Darkness
			{spellID = 87160, unitID = "player", caster = "player", filter = "BUFF"},
		},	
	    {
			Name = "Priest Procs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 36,
			Position = { "CENTER", UIParent, 106, -85 },

			-- Surge of Light
			{ spellID = 114255, unitID = "player", caster = "all", filter = "BUFF" },
			-- Serendipity
			{ spellID = 63735, unitID = "player", caster = "player", filter = "BUFF" },
			-- Archangel
			{ spellID = 81700, unitID = "player", caster = "player", filter = "BUFF" },
			-- Evangelism
			{ spellID = 81662, unitID = "player", caster = "player", filter = "BUFF" },
			-- Dark Archangel
			{spellID = 87153, unitID = "player", caster = "player", filter = "BUFF"},
			-- Glyph of Inner Focus
			{spellID = 96267, unitID = "player", caster = "player", filter = "BUFF"},
			-- Prayer of Mending
			{spellID = 41635, unitID = "player", caster = "player", filter = "BUFF"},
			-- Holy Walk
			{spellID = 96219, unitID = "player", caster = "player", filter = "BUFF"},
			-- Borrowed Time
			{spellID = 59889, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dispersion
			{spellID = 47585, unitID = "player", caster = "player", filter = "BUFF"},
			-- Power Infusion
			{spellID = 10060, unitID = "player", caster = "player", filter = "BUFF"},
			-- Fear Ward
			{spellID = 6346, unitID = "player", caster = "player", filter = "BUFF"},
		},	

		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 36,
			Position = { "CENTER", UIParent, 106, -43 },

			-- Shackle undead
			{ spellID = 9484, unitID = "target", caster = "all", filter = "DEBUFF" },
			-- Psychic Scream
			{ spellID = 8122, unitID = "target", caster = "all", filter = "DEBUFF" },
			-- Prayer of Mending
			{ spellID = 41635, unitID = "target", caster = "player", filter = "BUFF" },
			-- Guardian Spirit
			{ spellID = 47788, unitID = "target", caster = "player", filter = "BUFF" },
			-- Pain Suppression
			{ spellID = 33206, unitID = "target", caster = "player", filter = "BUFF" },
			-- Power Word: Shield
			{ spellID = 17, unitID = "target", caster = "player", filter = "BUFF" },
			-- Renew
			{ spellID = 139, unitID = "target", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Debuff",
			Direction = "RIGHT",
			Interval = 10,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 65,
			Position = { "LEFT", UIParent, "CENTER", -100, -284},
			
			-- Shadow Word: Pain
			{ spellID = 589, unitID = "target", caster = "player", filter = "DEBUFF" },
		    -- Devouring Plague
			{ spellID = 2944, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Vampiric Touch
			{ spellID = 34914, unitID = "target", caster = "player", filter = "DEBUFF" },	
		},
	},
	["WARLOCK"] = { -------------------------------------------------------------------------------------------------------- Warlock
		{
			Name = "Warlock Procs",
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 37,
			Position = { "CENTER", "UIParent", -0, -85 },

			-- Burning Soul
			{spellID = 74434, unitID = "player", caster = "player", filter = "BUFF" },
			-- Molten Core
			{spellID = 122351, unitID = "player", caster = "player", filter = "BUFF" },
			-- Dark Soul: Knowledge
			{spellID = 113861, unitID = "player", caster = "player", filter = "BUFF" },
			-- Dark Soul: Misery
			{spellID = 113860, unitID = "player", caster = "player", filter = "BUFF" },
			-- Dark Soul: Instability
			{spellID = 113858, unitID = "player", caster = "player", filter = "BUFF" },
			-- Unending Resolve
			{spellID = 104773, unitID = "player", caster = "player", filter = "BUFF" },
			-- Dark Bargain
			{spellID = 110913, unitID = "player", caster = "player", filter = "BUFF" },
			-- Twilight Ward
			{spellID = 6229, unitID = "player", caster = "player", filter = "BUFF" },
			-- Soul Swap
			{spellID = 86211, unitID = "player", caster = "player", filter = "BUFF" },
			-- Burning Rush
			{spellID = 111400, unitID = "player", caster = "player", filter = "BUFF" },
			-- Backdraft
			{spellID = 117896, unitID = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 37,
			Position = {"CENTER", UIParent, 60, -130},
			
			-- Fear
			{ spellID = 5782, unitID = "target", caster = "all", filter = "DEBUFF" },
			-- Howl of Terror
			{ spellID = 5484, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Blood Horror
			{ spellID = 111397, unitID = "player", caster = "player", filter = "BUFF" },
			-- Mortal Coil
			{ spellID = 6789, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Banish
			{ spellID = 710, unitID = "target", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 37,
			Position = {"CENTER", UIParent, 60, -90},

			-- Haunt
			{ spellID = 48181, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Unstable Affliction
			{ spellID = 30108, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Corruption
			{ spellID = 172, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Bane of Agony
			{ spellID = 980, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Immolate
			{ spellID = 348, unitID = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 37,
			Position = { "CENTER", UIParent, -60, -90 },
			
			-- Curse of Enfeeblement
			{ spellID = 109466, unitID = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of Exhaustion
			{ spellID = 18223, unitID = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of the Elements
			{ spellID = 1490, unitID = "target", caster = "all", filter = "DEBUFF" },
			-- Bane of Doom
			{ spellID = 603, unitID = "target", caster = "player", filter = "DEBUFF" },
            -- doom			
			{ spellID = 124913, unitID = "target", caster = "player", filter = "DEBUFF" },	
			-- Seed of Corruption
			{ spellID = 27243, unitID = "target", caster = "player", filter = "DEBUFF" },
		},
        {
			Name = "Cooldown",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 37,
			Position = { "CENTER", UIParent, -60, -130 },

			-- SoulBurn
			{ spellID = 74434, filter = "CD" },
		},
	},
	["DRUID"] = { -------------------------------------------------------------------------------------------------------- Druid
		{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 32,
			Position = { "CENTER", UIParent, -60, -90 },

			-- Lifebloom
			{ spellID = 33763, unitID = "player", caster = "player", filter = "BUFF" },
			-- Rejuvenation
			{ spellID = 774, unitID = "player", caster = "player", filter = "BUFF" },
			-- Regrowth
			{ spellID = 8936, unitID = "player", caster = "player", filter = "BUFF" },
			-- Wild Growth
			{ spellID = 48438, unitID = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 32,
			Position = { "CENTER", UIParent, 56, -90 },

			-- Lifebloom
			{ spellID = 33763, unitID = "target", caster = "player", filter = "BUFF" },
			-- Rejuvenation
			{ spellID = 774, unitID = "target", caster = "player", filter = "BUFF" },
			-- Regrowth
			{ spellID = 8936, unitID = "target", caster = "player", filter = "BUFF" },
			-- Wild Growth
			{ spellID = 48438, unitID = "target", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Druid Procs",
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 47,
			Position = { "CENTER", "UIParent", -0, -85 },

			-- Buffs
			-- Eclipse (Lunar)
			--OLD{spellID = 48518, unitID = "player", caster = "player", filter = "BUFF" },
			-- Eclipse (Solar)
			--OLD{spellID = 48517, unitID = "player", caster = "player", filter = "BUFF" },
			-- Shooting Stars
			{spellID = 93400, unitID = "player", caster = "player", filter = "BUFF" },
			-- Lunar Shower
			{spellID = 81192, unitID = "player", caster = "player", filter = "BUFF" },
			-- Nature's Grace
			{spellID = 16886, unitID = "player", caster = "player", filter = "BUFF" },
			-- Glyph of Rejuvenation
			{spellID = 96206, unitID = "player", caster = "player", filter = "BUFF" },
			-- Clearcasting
			{spellID = 16870, unitID = "player", caster = "player", filter = "BUFF" },
			-- Predator's Swiftness
			{spellID = 69369, unitID = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 37,
			Position = { "CENTER", UIParent, 56, -90 },

			-- Hibernate
			{ spellID = 2637, unitID = "target", caster = "all", filter = "DEBUFF" },
			-- Entangling Roots
			{ spellID = 339, unitID = "target", caster = "all", filter = "DEBUFF" },
			-- Cyclone
			{ spellID = 33786, unitID = "target", caster = "all", filter = "DEBUFF" },
			-- Moonfire
			{spellID = 8921, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Sunfire
			{spellID = 93402, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Rake
			{spellID = 1822, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Rip
			{spellID = 1079, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Pounce Bleed
			{spellID = 9007, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Lacerate
			{spellID = 33745, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Thrash
			{spellID = 77758, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Skull Bash
			{spellID = 82365, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Immobilized
			{spellID = 45334, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Infected Wounds
			{spellID = 58180, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Faerie Fire
			{ spellID = 770, unitID = "target", caster = "all", filter = "DEBUFF" },
		},
	},
	["HUNTER"] = { -------------------------------------------------------------------------------------------------------- Hunter
		{
			Name = "Hunter Procs",
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 47,
			Position = { "CENTER", "UIParent", -25, -95},

			-- Lock and Load
			{ spellID = 56453, unitID = "player", caster = "player", filter = "BUFF" },
			-- Quick Shots
			{ spellID = 6150, unitID = "player", caster = "player", filter = "BUFF" },
			-- Improved Steady Shot
			{ spellID = 53224, unitID = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Hunter Procs",
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 47,
			Position = { "CENTER", "UIParent", 25, -95},
			
			-- Rapid Fire
			{ spellID = 3045, unitID = "player", caster = "player", filter = "BUFF" },
			-- Ready, Set, Aim
			{ spellID = 82925, unitID = "player", caster = "player", filter = "BUFF" },
		},
        {		
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 37,
			Position = { "CENTER", UIParent, 75, -90 },

			-- Wyvern Sting
			{ spellID = 19386, unitID = "target", caster = "all", filter = "DEBUFF" },
			-- Silencing Shot
			{ spellID = 34490, unitID = "target", caster = "all", filter = "DEBUFF" },
			-- Serpent Sting
			{ spellID = 1978, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Black Arrow
			{ spellID = 3674, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Explosive Shot
			{ spellID = 53301, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Hunter's Mark
			{ spellID = 1130, unitID = "target", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 37,
			Position = { "CENTER", UIParent, -75, -90 },
			
			-- Mend Pet
			{ spellID = 136, unitID = "pet", caster = "player", filter = "BUFF" },
			-- Feed Pet
			{ spellID = 6991, unitID = "pet", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Cooldown",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 37,
			Position = { "BOTTOMLEFT", TukuiBar1,"TOPLEFT", -0, 35},
			
			-- Bad Manner
			{ spellID = 90337, unitID = "player", caster = "player", filter = "CD" },
			-- Roar of Sacrifice
			{ spellID = 53480, unitID = "player", caster = "player", filter = "CD" },
		},
	},	
	["ROGUE"] = { -------------------------------------------------------------------------------------------------------- Rogue
		{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 37,
			Position = { "RIGHT", UIParent, "CENTER", -190, -20 },

			-- Sprint
			{spellID = 2983, unitID = "player", caster = "player", filter = "BUFF" },
			-- Adrenaline Rush
			{spellID = 13750, unitID = "player", caster = "player", filter = "BUFF" },
			-- Evasion
			{spellID = 5277, unitID = "player", caster = "player", filter = "BUFF" },
			-- Envenom
			{spellID = 32645, unitID = "player", caster = "player", filter = "BUFF" },
			-- Overkill
			{spellID = 58426, unitID = "player", caster = "player", filter = "BUFF" },
			-- Slice and Dice
			{spellID = 5171, unitID = "player", caster = "player", filter = "BUFF" },
			-- Shadow Dance
			{spellID = 51713, unitID = "player", caster = "player", filter = "BUFF" },
			-- Recuperate
			{spellID = 73651, unitID = "player", caster = "player", filter = "BUFF" },
			-- Shadowstep
			{spellID = 36563, unitID = "player", caster = "player", filter = "BUFF" },
			-- Master of Subtlety
			{spellID = 31665, unitID = "player", caster = "player", filter = "BUFF" },
			-- Cloak of Shadows
			{spellID = 31224, unitID = "player", caster = "player", filter = "BUFF" },
			-- Vanish
			{spellID = 1856, unitID = "player", caster = "player", filter = "BUFF" },
			-- Cheating Death
			{spellID = 45182, unitID = "player", caster = "player", filter = "BUFF" },
			-- Blade Flurry
			{spellID = 13877, unitID = "player", caster = "player", filter = "BUFF" },
			-- Shallow Insight
			{spellID = 84745, unitID = "player", caster = "player", filter = "BUFF" },
			-- Moderate Insight
			{spellID = 84746, unitID = "player", caster = "player", filter = "BUFF" },
			-- Deep Insight
			{spellID = 84747, unitID = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 37,
			Position = { "LEFT", UIParent, "CENTER", 190, -20 },

			-- Rupture
			{spellID = 1943, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Garrote
			{spellID = 703, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Gouge
			{spellID = 1776, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Weakened Armor
			{spellID = 113746, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Dismantle
			{spellID = 51722, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Revealing Strike
			{spellID = 84617, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Vendetta
			{spellID = 79140, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Hemorrhage
			{spellID = 16511, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Glyph of Hemorrhage
			--{spellID = 89775, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Find Weakness
			{spellID = 91021, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Deadly Poison
			{spellID = 2818, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Mind-numbing Poison
			{spellID = 5760, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Crippling Poison
			{spellID = 3409, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Wound Poison
			{spellID = 8680, unitID = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "Shivable Rage effects",
			Direction = "RIGHT",
			IconSide = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 50,
			Position = { "CENTER", UIParent, 0, 250 },

			-- Unholy Frenzy
			{ spellID = 49016, unitID = "target", caster = "all", filter = "BUFF" },
			-- Vengeance
			{ spellID = 76691, unitID = "target", caster = "all", filter = "BUFF" },
			-- Enrage
			{ spellID = 5229, unitID = "target", caster = "all", filter = "BUFF" },
			-- Savage Roar
			{ spellID = 52610, unitID = "target", caster = "all", filter = "BUFF" },
			-- Owlkin Frenzy
			{ spellID = 48391, unitID = "target", caster = "all", filter = "BUFF" },
			-- Berserker Rage *
			{ spellID = 18499, unitID = "target", caster = "all", filter = "BUFF" },
			-- Wrecking Crew  *
			{ spellID = 56611, unitID = "target", caster = "all", filter = "BUFF" },
			-- Death Wish  *
			{ spellID = 12292, unitID = "target", caster = "all", filter = "BUFF" },
			-- Bastion of Defense  *
			{ spellID = 84608, unitID = "target", caster = "all", filter = "BUFF" },
        },
	},	
	["PALADIN"] = { -------------------------------------------------------------------------------------------------------- Paladin
		{
			Name = "Buffs and Debuffs",
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 37,
			Position = { "CENTER", UIParent, -90, -85 },

			-- Beacon of Light -- player
			{ spellID = 53563, unitID = "player", caster = "player", filter = "BUFF" },
			-- Divine Illumination
			{ spellID = 31842, unitID = "player", caster = "player", filter = "BUFF" },
			-- Divine Plea
			{ spellID = 54428, unitID = "player", caster = "player", filter = "BUFF" },
			-- Holy Shield
			{ spellID = 20925, unitID = "player", caster = "player", filter = "BUFF" },
			-- Inquisition
			{ spellID = 84963, unitID = "player", caster = "player", filter = "BUFF" },
			-- Judgements of the Pure
			{ spellID = 53657, unitID = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 37,
			Position = { "CENTER", UIParent, 90, -85 },

			-- Beacon of Light -- target
			{ spellID = 53563, unitID = "target", caster = "player", filter = "BUFF" },
			-- Hammer of Justice
			{ spellID = 853, unitID = "target", caster = "all", filter = "DEBUFF" },
			-- Seal of Truth Aka Censure
			{ spellID = 31803, unitID = "target", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "Paladin Procs",
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 47,
			Position = { "CENTER", "UIParent", -0, -85 },

			-- Infusion of Light
			{ spellID = 54149, unitID = "player", caster = "player", filter = "BUFF" },
			-- Glyph of Denounce
			{ spellID = 115654, unitID = "player", caster = "player", filter = "BUFF" },
			-- Art of War
			{ spellID = 87138, unitID = "player", caster = "player", filter = "BUFF" },
			-- Hand of Light 
			{ spellID = 90174, unitID = "player", caster = "player", filter = "BUFF" },
		},
	},
	["MONK"] = { -------------------------------------------------------------------------------------------------------- Monk
		{ -- Not finished
			Name = "Buffs and Debuffs",
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 47,
			Position = { "CENTER", UIParent, 110, -40 },

			-- Shuffle
			{spellID = 115307, unitID = "player", caster = "player", filter = "BUFF"},
			-- Vital Mists
			{spellID = 118674, unitID = "player", caster = "player", filter = "BUFF"},
			-- Renewing Mist
			{ spellID = 119611, unitID = "target", caster = "player", filter = "BUFF" },
			-- Soothing Mist
			{ spellID = 115175, unitID = "target", caster = "player", filter = "BUFF" },
			-- Enveloping Mist
			{ spellID = 132120, unitID = "target", caster = "player", filter = "BUFF" },
			
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 47,
			Position = { "LEFT", TukuiPlayer,"RIGHT", 5, 2},
			
			-- Serpent's Zeal
			{ spellID = 127722, unitID = "player", caster = "player", filter = "BUFF" },
			-- Brewing: Mana Tea
			{ spellID = 123766, unitID = "player", caster = "player", filter = "BUFF" },
			-- Tiger Power
			{ spellID = 125359, unitID = "player", caster = "player", filter = "BUFF" },
			-- Blackout Kick
			{ spellID = 100784, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Disable
			{ spellID = 116095, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Crackling Jade Lightning
			{ spellID = 117952, unitID = "target", caster = "player", filter = "DEBUFF" },
			-- Healing Spehere
			{ spellID = 124458, unitID = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Procs",
			Direction = "DOWN",
			Interval = 3,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 47,
			Position = { "CENTER", "UIParent", -0, -85 },
			
			-- Combo Breaker: Blackout Kick
			{spellID = 116768, unitID = "player", caster = "player", filter = "BUFF"},
			-- Combo Breaker: Tiger Palm
			{spellID = 118864, unitID = "player", caster = "player", filter = "BUFF"},
			-- Power Guard
			{spellID = 118636, unitID = "player", caster = "player", filter = "BUFF"},
		},
	},
	["WARRIOR"] = {  -------------------------------------------------------------------------------------------------------- Warrior
		{
			Name = "Warrior Procs",
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 47,
			Position = { "CENTER", "UIParent", -0, -85 },

		   -- Bloodsurge
			{spellID = 46916, unitID = "player", caster = "player", filter = "BUFF"},
			-- Sword and Board
			{spellID = 50227, unitID = "player", caster = "player", filter = "BUFF"},
			-- Ultimatum
			{spellID = 122510, unitID = "player", caster = "player", filter = "BUFF"},
			-- Taste for Blood
			{spellID = 125831, unitID = "player", caster = "player", filter = "BUFF"},
			-- Enrage
			{spellID = 12880, unitID = "player", caster = "player", filter = "BUFF"},
			-- Meat Cleaver
			{spellID = 85739, unitID = "player", caster = "player", filter = "BUFF"},
			-- Rude Interruption
			{spellID = 86663, unitID = "player", caster = "player", filter = "BUFF"},
		},
        {		
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 37,
			Position = { "CENTER", UIParent, -60, -90 },
			
		    -- Shield Wall
			{spellID = 871, unitID = "player", caster = "player", filter = "BUFF"},
			-- Last Stand
			{spellID = 12975, unitID = "player", caster = "player", filter = "BUFF"},
			-- Enraged Regeneration
			{spellID = 55694, unitID = "player", caster = "player", filter = "BUFF"},
			-- Shield Block
			{spellID = 2565, unitID = "player", caster = "player", filter = "BUFF"},
			-- Shield Barrier
			{spellID = 112048, unitID = "player", caster = "player", filter = "BUFF"},
			-- Spell Reflection
			{spellID = 23920, unitID = "player", caster = "player", filter = "BUFF"},
			-- Berserker Rage
			{spellID = 18499, unitID = "player", caster = "player", filter = "BUFF"},
			-- Bloodbath
			{spellID = 12292, unitID = "player", caster = "player", filter = "BUFF"},
			-- Recklesness
			{spellID = 1719, unitID = "player", caster = "player", filter = "BUFF"},
			-- Deadly Calm
			{spellID = 85730, unitID = "player", caster = "player", filter = "BUFF"},
			-- Sweeping Strikes
			{spellID = 12328, unitID = "player", caster = "player", filter = "BUFF"},
			-- Victorious
			{spellID = 32216, unitID = "player", caster = "player", filter = "BUFF"},
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "UP",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 37,
			Position = { "CENTER", UIParent, 75, -90 },

			-- Colossus Smash
			{spellID = 86346, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Hamstring
			{spellID = 1715, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Demoralizing Shout
			{spellID = 1160, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Weakened Armor
			{spellID = 113746, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Weakened Blows
			{spellID = 115798, unitID = "target", caster = "all", filter = "DEBUFF"},
		},
		{
			Name = "COOLDOWN",
			Direction = "RIGHT",
			Interval = 10,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 65,
			Position = { "LEFT", UIParent, "CENTER", -100, -400},
			
			-- Recklesness
			{ spellID = 1719, filter = "CD" },
			-- Intervene
			{ spellID = 3411, filter = "CD" },
			-- Berserker rage
			{ spellID = 18499, filter = "CD" },	
			--Last Stand
			{ spellID = 12975, filter = "CD" },		
			-- Taunt
			{ spellID = 355, filter = "CD" },		
			-- Commanding Shout
			{ spellID = 469, filter = "CD" },	
           -- Heroic Leap			
			{ spellID = 6544, filter = "CD" },		
		},
    },		
-----------------------------------------------------------------------------------------------------------------------
-- dont touch anything below or else ill ass rape you aight!
-----------------------------------------------------------------------------------------------------------------------	
	["ALL"] = {
		{ -- Here we track pvp debuffs on ourself
			Name = "PVPYOSELF",
			Direction = "LEFT",
			Interval = 2,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 70,
			Position = { "CENTER", UIParent, "CENTER", -180, 150 },

			--Rouge
			--Kidney Shot
            { spellID = 408, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Blind
            { spellID = 2094, unitID = "player", caster = "all", filter = "DEBUFF" },	
			--Sap
            { spellID = 6770, unitID = "player", caster = "all", filter = "DEBUFF" },			
			--Smoke Bomb
            { spellID = 88611, unitID = "player", caster = "all", filter = "DEBUFF" },		
			--Garrote - Silence
            { spellID = 1330, unitID = "player", caster = "all", filter = "DEBUFF" },		
			--Dismantle
            { spellID = 51722, unitID = "player", caster = "all", filter = "DEBUFF" },			
			--Crippling Poison
            { spellID = 3409, unitID = "player", caster = "all", filter = "DEBUFF" },		
			--Deadly Throw
            { spellID = 26679, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Gouge
            { spellID = 1776, unitID = "player", caster = "all", filter = "DEBUFF" },	
			--Paralysis (Paralytic Poison)
            { spellID = 113953, unitID = "player", caster = "all", filter = "DEBUFF" },
            -- Partial Paralysis			
            { spellID = 115197, unitID = "player", caster = "all", filter = "DEBUFF" },	

			--Paladin 
			--Hammer of Justice
		    { spellID = 853, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Blinding Light
		    { spellID = 105421, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Blinding Light (Glyph of Blinding Light)
		    { spellID = 115752, unitID = "player", caster = "all", filter = "DEBUFF" },	
			--Repentance
	        { spellID = 20066, unitID = "player", caster = "all", filter = "DEBUFF" },			
			--Holy Wrath
		    { spellID = 2812, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Turn Evil
            { spellID = 10326, unitID = "player", caster = "all", filter = "DEBUFF" },	
			--Avenger's Shield
	        { spellID = 31935, unitID = "player", caster = "all", filter = "DEBUFF" },			
			--Dazed - Avenger's Shield
            { spellID = 63529, unitID = "player", caster = "all", filter = "DEBUFF" },	

			--Mage
			--Silenced - Improved Counterspell
            { spellID = 55021, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Polymorph
	        { spellID = 118, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Deep Freeze
	        { spellID = 44572, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Combustion Impact
            { spellID = 118271, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Ring of Frost
	        { spellID = 82691, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Freeze (Water Elemental)
	        { spellID = 33395, unitID = "player", caster = "all", filter = "DEBUFF" },		
			--Frost Nova
            { spellID = 122, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Blast Wave
	        { spellID = 11113, unitID = "player", caster = "all", filter = "DEBUFF" },
            --Dragon's Breath
			{ spellID = 31661, unitID = "player", caster = "all", filter = "DEBUFF" },
            -- Frostjaw
			{ spellID = 102051, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Ice Ward
			{ spellID = 111340, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Cone of Cold
			{ spellID = 120, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Slow
			{ spellID = 31589, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Frost Bomb
			{ spellID = 113092, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Frostbolt
			{ spellID = 116, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Frostfire Bolt
			{ spellID = 44614, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Chilled
			{ spellID = 7321, unitID = "player", caster = "all", filter = "DEBUFF" },

			-- Monk
			--Fists of Fury
			{ spellID = 120086, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Paralysis
			{ spellID = 115078, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Charging Ox Wave
			{ spellID = 119392, unitID = "player", caster = "all", filter = "DEBUFF" },
			
			-- Death Knight
			-- Gnaw 
			{ spellID = 47481, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Monstrous Blow 
			{ spellID = 91797, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Asphyxiate
			{ spellID = 108194, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Remorseless Winter
			{ spellID = 115001, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Strangulate
			{ spellID = 47476, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Dark Simulacrum
			{ spellID = 77606, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Necrotic Strike
			{ spellID = 73975, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Chains of Ice
			{ spellID = 45524, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Chilblains
			{ spellID = 50435, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Desecrated Ground
			{ spellID = 115018, unitID = "player", caster = "all", filter = "DEBUFF" },	
        
		    --Druid
			--Cyclone
			{ spellID = 33786, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Hibernate
			{ spellID = 2637, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Mighty Bash
			{ spellID = 5211, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Bear Hug
			{ spellID = 102795, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Maim
			{ spellID = 22570, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Pounce
			{ spellID = 9005, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Disorienting Roar
			{ spellID = 99, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Solar Beam
			{ spellID = 78675, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Entangling Roots
			{ spellID = 339, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Immobilized
			{ spellID = 45334, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Infected Wounds
			{ spellID = 58180, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Typhoon
			{ spellID = 61391, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Fungal Growth
			{ spellID = 81281, unitID = "player", caster = "all", filter = "DEBUFF" },
		
			-- Hunter
			-- Intimidation
			{spellID = 24394, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Freezing Trap
			{spellID = 3355, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Scare Beast
			{spellID = 1513, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Scatter Shot
			{spellID = 19503, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Wyvern sting
			{spellID = 19386, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Silencing Shot
			{spellID = 34490, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Entrapment
			{spellID = 19185, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Concussive Barrage
			{spellID = 35101, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Concussive Shot
			{spellID = 5116, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Ice Trap
			{spellID = 13810, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Wing Clip
			--MOP{spellID = 2974, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Glyph of Freezing Trap
			{spellID = 61394, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Pets
			-- Sonic Blast (Bat)
			{spellID = 50519, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Pin (Crab)
			{spellID = 50245, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Venom Web Spray (Silithid)
			{spellID = 54706, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Bad Manner (Monkey)
			{spellID = 90337, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Web (Spider)
			{spellID = 4167, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Frost Breath (Chimaera)
			{spellID = 54644, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Ankle Crack (Crocolisk)
			{spellID = 50433, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Clench (Scorpid)
			{spellID = 50541, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Time Warp (Warp Stalker)
			{spellID = 35346, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Sting (Wasp)
			{spellID = 56626, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Nether Shock (Nether Ray)
			{spellID = 44957, unitID = "player", caster = "all", filter = "DEBUFF" },

			-- Mage
			-- Cauterize
			{spellID = 87023, unitID = "player", caster = "player", filter = "DEBUFF"},
			-- Deep Freeze
			{spellID = 44572, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Polymorph
			{spellID = 118, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Ring of Frost
			{spellID = 82691, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Dragon's Breath
			{spellID = 31661, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Combustion Impact
			{spellID = 118271, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Frostjaw
			{spellID = 102051, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Silenced - Improved Counterspell
			{spellID = 55021, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Freeze (Pet)
			{spellID = 33395, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Frost Nova
			{spellID = 122, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Ice Ward
			{spellID = 111340, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Cone of Cold
			{spellID = 120, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Slow
			{spellID = 31589, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Frostbolt
			{spellID = 116, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Frostfire Bolt
			{spellID = 44614, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Chilled
			{spellID = 7321, unitID = "player", caster = "all", filter = "DEBUFF" },

			-- Monk
			-- Fists of Fury
			{spellID = 113656, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Paralysis
			{spellID = 115078, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Charging Ox Wave
			{spellID = 119392, unitID = "player", caster = "all", filter = "DEBUFF" },

			-- Paladin
			-- Hammer of Justice
			{spellID = 853, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Repentance
			{spellID = 20066, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Avenger's Shield
			{spellID = 31935, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Avenger's Shield with Glyph
			{spellID = 63529, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Seal of Justice proc
			{spellID = 20170, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Denounce
			{spellID = 2812, unitID = "player", caster = "all", filter = "DEBUFF" },

			-- Priest
			-- Psychic Horror
			{spellID = 64044, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Psychic Horror(disarm)
			{spellID = 64058, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Psychic Scream
			{spellID = 8122, unitID = "player", caster = "all", filter = "DEBUFF" },
			--Psychic Terror (Psyfiend)
			{spellID = 113792, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Dominate Mind
			{spellID = 605, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Silence
			{spellID = 15487, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Glyph of Mind Blast
			{spellID = 87194, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Mind Flay
			{spellID = 15407, unitID = "player", caster = "all", filter = "DEBUFF" },

			-- Shaman
			-- Hex
			{spellID = 51514, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Earthquake
			{spellID = 77505, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Earthgrab
			{spellID = 64695, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Earthbind
			{spellID = 3600, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Frost Shock
			{spellID = 8056, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Frostbrand Attack
			{spellID = 8034, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Thunderstorm
			{spellID = 51490, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Static Charge (Capacitor Totem)
			{spellID = 118905, unitID = "player", caster = "all", filter = "DEBUFF" },

			-- Warlock
			-- Shadowfury
			{spellID = 30283, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Axe Toss (Felguard)
			{spellID = 89766, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Aftermath
			{spellID = 85387, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Fear
			{spellID = 5782, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Howl of Terror
			{spellID = 5484, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Mortal Coil
			{spellID = 6789, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Seduction (Succubus)
			{spellID = 6358, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Unstable Affliction
			{spellID = 31117, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Spell Lock (Felhunter)
			{spellID = 24259, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Shadowsnare
			{spellID = 63311, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Curse of Exhaustion
			{spellID = 18223, unitID = "player", caster = "all", filter = "DEBUFF" },

			-- Warrior
			-- Shockwave
			{spellID = 46968, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Charge Stun
			{spellID = 7922, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Intimidating Shout
			{spellID = 20511, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Silenced (Gag Order)
			{spellID = 18498, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Disarm
			{spellID = 676, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Hamstring
			{spellID = 1715, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Piercing Howl
			{spellID = 12323, unitID = "player", caster = "all", filter = "DEBUFF" },
			-- Colossus Smash
			{spellID = 86346, unitID = "player", caster = "all", filter = "DEBUFF" },

		},
		{
--Tons of SpellIDs taken from LoseControl so credit to Kouri 
--Here we track pvp buffs on our target
			Name = "PVPYOTAR",
			Direction = "RIGHT",
			Interval = 2,
			Mode = "ICON",
			Alpha = 1,
			IconSize = 70,
			Position = { "CENTER", UIParent, "CENTER", 180, 150 },

	        --Druid 
			--Innervate
			{ spellID = 29166, unitID = "target", caster = "all", filter = "BUFF"},

			--Warrior 
			--Spell Reflection
			{ spellID = 23920, unitID = "target", caster = "all", filter = "BUFF" },
			-- Mass Spell Reflection
			{ spellID = 114028, unitID = "target", caster = "all", filter = "BUFF" },

			--Paladin 
			--Divine Shield
			{ spellID = 642, unitID = "target", caster = "all", filter = "BUFF" },
			-- Hand of Freedom
			{ spellID = 1044, unitID = "target", caster = "all", filter = "BUFF" },
			-- Hand of Sacrifice
			{ spellID = 6940, unitID = "target", caster = "all", filter = "BUFF" },
			--Aura Mastery
			{ spellID = 31821, unitID = "target", caster = "all", filter = "BUFF" },	

            --Hunter
			--Deterrence
            { spellID = 19263, unitID = "target", caster = "all", filter = "BUFF" },

			--Death Knight
			-- Anti-Magic Shell
			{ spellID = 48707, unitID = "target", caster = "all", filter = "BUFF" },
			-- Lichborne
			{ spellID = 49039, unitID = "target", caster = "all", filter = "BUFF" },

			-- Shaman
			-- Grounding Totem Effect
			{ spellID = 8178, unitID = "target", caster = "all", filter = "BUFF" },

			--Mage 
			--Ice Block
			{ spellID = 45438, unitID = "target", caster = "all", filter = "BUFF" },

			--Rouge 
			--Cloak of Shadows
			{ spellID = 31224, unitID = "target", caster = "all", filter = "BUFF" },

			--Priest 
			--Dispersion
			{ spellID = 47585, unitID = "target", caster = "all", filter = "BUFF" },
			
			--Monk
			--Touch of Karma
			{ spellID = 125174,  unitID = "target", caster = "all", filter = "BUFF" },
			
		},
	},
}

SpellActivationOverlayFrame:SetFrameStrata("BACKGROUND")
local Filger = {}
local MyUnits = {player = true, vehicle = true, pet = true}
local class = select(2, UnitClass("player"))
local classcolor = RAID_CLASS_COLORS[class]

function Filger:TooltipOnEnter()
	if self.spellID > 20 then
		local str = "spell:%s"
		local BadTotems = {
			[8076] = 8075,
			[8972] = 8071,
			[5677] = 5675,
		}
		GameTooltip:ClearLines()
		GameTooltip:SetOwner(ChatFrame4, "ANCHOR_TOPRIGHT", 0, 0)
		if BadTotems[self.spell] then
			GameTooltip:SetHyperlink(format(str, BadTotems[self.spellID]))
		else
			GameTooltip:SetHyperlink(format(str, self.spellID))
		end
		GameTooltip:Show()
	end
end

function Filger:TooltipOnLeave()
	GameTooltip:Hide()
end

function Filger:UnitBuff(unitID, inSpellID, spn, absID)
	if absID then
		for i = 1, 40, 1 do
			local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID = UnitBuff(unitID, i)
			if not name then break end
			if inSpellID == spellID then
				return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID
			end
		end
	else
		return UnitBuff(unitID, spn)
	end
	return nil
end

function Filger:UnitDebuff(unitID, inSpellID, spn, absID)
	if absID then
		for i = 1, 40, 1 do
			local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID = UnitDebuff(unitID, i)
			if not name then break end
			if inSpellID == spellID then
				return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID
			end
		end
	else
		return UnitDebuff(unitID, spn)
	end
	return nil
end

function Filger:UpdateCD()
	local time = self.value.start + self.value.duration - GetTime()

	if self:GetParent().Mode == "BAR" then
		self.statusbar:SetValue(time)
		if time <= 60 then
			self.time:SetFormattedText("%.1f", time)
		else
			self.time:SetFormattedText("%d:%.2d", time / 60, time % 60)
		end
	else
		if time < 0 then
			local frame = self:GetParent()
			frame.actives[self.activeIndex] = nil
			self:SetScript("OnUpdate", nil)
			Filger.DisplayActives(frame)
		end
	end
end

function Filger:DisplayActives()
	if not self.actives then return end
	if not self.bars then self.bars = {} end
	local id = self.Id
	local index = 1
	local previous = nil

	for _, _ in pairs(self.actives) do
		local bar = self.bars[index]
		if not bar then
			bar = CreateFrame("Frame", "FilgerAnchor"..id.."Frame"..index, self)
			bar:SetScale(1)
            bar:SetTemplate("Transparent")
			
			if index == 1 then
				bar:SetPoint(unpack(self.Position))
			else
				if self.Direction == "UP" then
					bar:SetPoint("BOTTOM", previous, "TOP", 0, self.Interval)
				elseif self.Direction == "RIGHT" then
					bar:SetPoint("LEFT", previous, "RIGHT", self.Mode == "ICON" and self.Interval or (self.BarWidth + self.Interval + 7), 0)
				elseif self.Direction == "LEFT" then
					bar:SetPoint("RIGHT", previous, "LEFT", self.Mode == "ICON" and -self.Interval or -(self.BarWidth + self.Interval + 7), 0)
				else
					bar:SetPoint("TOP", previous, "BOTTOM", 0, -self.Interval)
				end
			end

	    	if bar.icon then
				bar.icon = _G[bar.icon:GetName()]
			else
				bar.icon = bar:CreateTexture("$parentIcon", "ARTWORK")
				bar.icon:Point("TOPLEFT", 2, -2)
				bar.icon:Point("BOTTOMRIGHT", -2, 2)
				bar.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			end

			if self.Mode == "ICON" then
				if bar.cooldown then
					bar.cooldown = _G[bar.cooldown:GetName()]
				else
					bar.cooldown = CreateFrame("Cooldown", "$parentCD", bar, "CooldownFrameTemplate")
					bar.cooldown:SetAllPoints(bar.icon)
					bar.cooldown:SetReverse()
				end

				if bar.count then
					bar.count = _G[bar.count:GetName()]
				else
					bar.count = bar:CreateFontString("$parentCount", "OVERLAY")
					bar.count:SetFont(T.SetPixelFont())
					bar.count:Point("TOPLEFT", 1, 5)
					bar.count:SetJustifyH("CENTER")
				end
			else
				if bar.statusbar then
					bar.statusbar = _G[bar.statusbar:GetName()]
				else
					bar.statusbar = CreateFrame("StatusBar", "$parentStatusBar", bar)
					bar.statusbar:SetWidth(self.BarWidth)
					bar.statusbar:SetHeight(self.IconSize - 10)
					bar.statusbar:SetStatusBarTexture(C.media.Glamour)
					bar.statusbar:SetStatusBarColor(classcolor.r, classcolor.g, classcolor.b,  0.25)
					if self.IconSide == "LEFT" then
						bar.statusbar:SetPoint("BOTTOMLEFT", bar, "BOTTOMRIGHT", 5, 2)
					elseif self.IconSide == "RIGHT" then
						bar.statusbar:SetPoint("BOTTOMRIGHT", bar, "BOTTOMLEFT", -5, 2)
					end
				end
				bar.statusbar:SetMinMaxValues(0, 1)
				bar.statusbar:SetValue(0)

				if bar.bg then
					bar.bg = _G[bar.bg:GetName()]
				else
					bar.bg = CreateFrame("Frame", "$parentBG", bar.statusbar)
					bar.bg:SetPoint("TOPLEFT", -2, 2)
					bar.bg:SetPoint("BOTTOMRIGHT", 2, -2)
					bar.bg:SetFrameStrata("BACKGROUND")
				end

				if bar.background then
					bar.background = _G[bar.background:GetName()]
				else
					bar.background = bar.statusbar:CreateTexture(nil, "BACKGROUND")
					bar.background:SetAllPoints()
					bar.background:SetTexture(C.media.texture)
					bar.background:SetVertexColor(classcolor.r, classcolor.g, classcolor.b,  0.25)
				end

				if bar.time then
					bar.time = _G[bar.time:GetName()]
				else
					bar.time = bar.statusbar:CreateFontString("$parentTime", "OVERLAY")
					bar.time:SetFont(T.SetPixelFont())
					bar.time:SetPoint("RIGHT", bar.statusbar, 0, 0)
					bar.time:SetJustifyH("RIGHT")
				end

				if bar.count then
					bar.count = _G[bar.count:GetName()]
				else
					bar.count = bar:CreateFontString("$parentCount", "OVERLAY")
					bar.count:SetFont(T.SetPixelFont())
					bar.count:SetPoint("BOTTOMRIGHT", 1, 0)
					bar.count:SetJustifyH("CENTER")
				end

				if bar.spellname then
					bar.spellname = _G[bar.spellname:GetName()]
				else
					bar.spellname = bar.statusbar:CreateFontString("$parentSpellName", "OVERLAY")
					bar.spellname:SetFont(T.SetPixelFont())
					bar.spellname:SetPoint("LEFT", bar.statusbar, 2, 0)
					bar.spellname:SetPoint("RIGHT", bar.time, "LEFT")
					bar.spellname:SetJustifyH("LEFT")
				end
			end
			bar.spellID = 0
			self.bars[index] = bar
		end
		previous = bar
		index = index + 1
	end

	if not self.sortedIndex then self.sortedIndex = {} end

	for n in pairs(self.sortedIndex) do
		self.sortedIndex[n] = 999
	end

	local activeCount = 1
	for n in pairs(self.actives) do
		self.sortedIndex[activeCount] = n
		activeCount = activeCount + 1
	end
	table.sort(self.sortedIndex)

	index = 1

	for n in pairs(self.sortedIndex) do
		if n >= activeCount then
			break
		end
		local activeIndex = self.sortedIndex[n]
		local value = self.actives[activeIndex]
		local bar = self.bars[index]
		bar.spellName = GetSpellInfo(value.spid)
		if self.Mode == "BAR" then
			bar.spellname:SetText(bar.spellName)
		end
		bar.icon:SetTexture(value.icon)
		if value.count and value.count > 1 then
			bar.count:SetText(value.count)
			bar.count:Show()
		else
			bar.count:Hide()
		end
		if value.duration and value.duration > 0 then
			if self.Mode == "ICON" then
				CooldownFrame_SetTimer(bar.cooldown, value.start, value.duration, 1)
				if value.data.filter == "CD" or value.data.filter == "ICD" then
					bar.value = value
					bar.activeIndex = activeIndex
					bar:SetScript("OnUpdate", Filger.UpdateCD)
				else
					bar:SetScript("OnUpdate", nil)
				end
				bar.cooldown:Show()
			else
				bar.statusbar:SetMinMaxValues(0, value.duration)
				bar.value = value
				bar.activeIndex = activeIndex
				bar:SetScript("OnUpdate", Filger.UpdateCD)
			end
		else
			if self.Mode == "ICON" then
				bar.cooldown:Hide()
			else
				bar.statusbar:SetMinMaxValues(0, 1)
				bar.statusbar:SetValue(1)
				bar.time:SetText("")
			end
			bar:SetScript("OnUpdate", nil)
		end
		bar.spellID = value.spid
		if C["Filger"].show_tooltip then
			bar:EnableMouse(true)
			bar:SetScript("OnEnter", Filger.TooltipOnEnter)
			bar:SetScript("OnLeave", Filger.TooltipOnLeave)
		end
		bar:SetWidth(self.IconSize or 37)
		bar:SetHeight(self.IconSize or 37)
		bar:SetAlpha(value.data.opacity or 1)
		bar:Show()
		index = index + 1
	end

	for i = index, #self.bars, 1 do
		local bar = self.bars[i]
		bar:Hide()
	end
end

function Filger:OnEvent(event, unit)
	if event == "SPELL_UPDATE_COOLDOWN" or event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_FOCUS_CHANGED" or event == "PLAYER_ENTERING_WORLD" or event == "UNIT_AURA" and (unit == "target" or unit == "player" or unit == "pet" or unit == "focus") then
		local needUpdate = false
		local id = self.Id

		for i = 1, #Filger_Spells[class][id], 1 do
			local data = Filger_Spells[class][id][i]
			local found = false
			local name, icon, count, duration, start, spid
			spid = 0

			if data.filter == "BUFF" then
				local caster, spn, expirationTime
				spn, _, _ = GetSpellInfo(data.spellID)
				name, _, icon, count, _, duration, expirationTime, caster, _, _, spid = Filger:UnitBuff(data.unitID, data.spellID, spn, data.absID)
				if name and (data.caster ~= 1 and (caster == data.caster or data.caster == "all") or MyUnits[caster]) then
					start = expirationTime - duration
					found = true
				end
			elseif data.filter == "DEBUFF" then
				local caster, spn, expirationTime
				spn, _, _ = GetSpellInfo(data.spellID)
				name, _, icon, count, _, duration, expirationTime, caster, _, _, spid = Filger:UnitDebuff(data.unitID, data.spellID, spn, data.absID)
				if name and (data.caster ~= 1 and (caster == data.caster or data.caster == "all") or MyUnits[caster]) then
					start = expirationTime - duration
					found = true
				end
			elseif data.filter == "CD" then
				if data.spellID then
					name, _, icon = GetSpellInfo(data.spellID)
					if data.absID then
						start, duration = GetSpellCooldown(data.spellID)
					else
						start, duration = GetSpellCooldown(name)
					end
					spid = data.spellID
				elseif data.slotID then
					spid = data.slotID
					local slotLink = GetInventoryItemLink("player", data.slotID)
					if slotLink then
						name, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink)
						start, duration = GetInventoryItemCooldown("player", data.slotID)
					end
				end
				if name and (duration or 0) > 1.5 then
					found = true
				end
			elseif data.filter == "ICD" then
				if data.trigger == "BUFF" then
					local spn
					spn, _, icon = GetSpellInfo(data.spellID)
					name, _, _, _, _, _, _, _, _, _, spid = Filger:UnitBuff("player", data.spellID, spn, data.absID)
				elseif data.trigger == "DEBUFF" then
					local spn
					spn, _, icon = GetSpellInfo(data.spellID)
					name, _, _, _, _, _, _, _, _, _, spid = Filger:UnitDebuff("player", data.spellID, spn, data.absID)
				end
				if name then
					if data.slotID then
						local slotLink = GetInventoryItemLink("player", data.slotID)
						_, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink)
					end
					duration = data.duration
					start = GetTime()
					found = true
				end
			end

			if found then
				if not self.actives then self.actives = {} end
				if not self.actives[i] then
					self.actives[i] = {data = data, name = name, icon = icon, count = count, start = start, duration = duration, spid = spid}
					needUpdate = true
				else
					if data.filter ~= "ICD" and (self.actives[i].count ~= count or self.actives[i].start ~= start or self.actives[i].duration ~= duration) then
						self.actives[i].count = count
						self.actives[i].start = start
						self.actives[i].duration = duration
						needUpdate = true
					end
				end
			else
				if data.filter ~= "ICD" and self.actives and self.actives[i] then
					self.actives[i] = nil
					needUpdate = true
				end
			end
		end

		if needUpdate and self.actives then
			Filger.DisplayActives(self)
		end
	end
end

class = select(2, UnitClass("player"))

if Filger_Spells and Filger_Spells["ALL"] then
	if not Filger_Spells[class] then
		Filger_Spells[class] = {}
	end

	for i = 1, #Filger_Spells["ALL"], 1 do
		local merge = false
		local spellListAll = Filger_Spells["ALL"][i]
		local spellListClass = nil
		for j = 1, #Filger_Spells[class], 1 do
			spellListClass = Filger_Spells[class][j]
			local mergeAll = spellListAll.Merge or false
			local mergeClass = spellListClass.Merge or false
			if spellListClass.Name == spellListAll.Name and (mergeAll or mergeClass) then
				merge = true
				break
			end
		end
		if not merge or not spellListClass then
			table.insert(Filger_Spells[class], Filger_Spells["ALL"][i])
		else
			for j = 1, #spellListAll, 1 do
				table.insert(spellListClass, spellListAll[j])
			end
		end
	end
end

if Filger_Spells and Filger_Spells[class] then
	for index in pairs(Filger_Spells) do
		if index ~= class then
			Filger_Spells[index] = nil
		end
	end

	local idx = {}
	for i = 1, #Filger_Spells[class], 1 do
		local jdx = {}
		local data = Filger_Spells[class][i]

		for j = 1, #data, 1 do
			local spn
			if data[j].spellID then
				spn = GetSpellInfo(data[j].spellID)
			else
				local slotLink = GetInventoryItemLink("player", data[j].slotID)
				if slotLink then
					spn = GetItemInfo(slotLink)
				end
			end
			if not spn and not data[j].slotID then
				print("|cffff0000WARNING: spell/slot ID ["..(data[j].spellID or data[j].slotID or "UNKNOWN").."")
				table.insert(jdx, j)
			end
		end

		for _, v in ipairs(jdx) do
			table.remove(data, v)
		end

		if #data == 0 then
			print("|cffff0000WARNING: section ["..data.Name.."] is empty! Report this to Jasje.|r")
			table.insert(idx, i)
		end
	end

	for _, v in ipairs(idx) do
		table.remove(Filger_Spells[class], v)
	end

	for i = 1, #Filger_Spells[class], 1 do
		local data = Filger_Spells[class][i]
		local frame = CreateFrame("Frame", "FilgerFrame"..i.."_"..data.Name, UIParent)
		frame.Id = i
		frame.Name = data.Name
		frame.Direction = data.Direction or "DOWN"
		frame.IconSide = data.IconSide or "LEFT"
		frame.Mode = data.Mode or "ICON"
		frame.Interval = data.Interval or 3
		frame:SetAlpha(data.Alpha or 1)
		frame.IconSize = data.IconSize or 37
		frame.BarWidth = data.BarWidth or 186
		frame.Position = data.Position or "CENTER"
		frame:SetPoint(unpack(data.Position))

		if Filger_Settings.config_mode then
			frame.actives = {}
			for j = 1, math.min(Filger_Settings.max_test_icon, #Filger_Spells[class][i]), 1 do
				local data = Filger_Spells[class][i][j]
				local name, icon
				if data.spellID then
					name, _, icon = GetSpellInfo(data.spellID)
				elseif data.slotID then
					local slotLink = GetInventoryItemLink("player", data.slotID)
					if slotLink then
						name, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink)
					end
				end
				frame.actives[j] = {data = data, name = name, icon = icon, count = 9, start = 0, duration = 0, spid = data.spellID or data.slotID}
			end
			Filger.DisplayActives(frame)
		else
			for j = 1, #Filger_Spells[class][i], 1 do
				local data = Filger_Spells[class][i][j]
				if data.filter == "CD" then
					frame:RegisterEvent("SPELL_UPDATE_COOLDOWN")
					break
				end
			end
			frame:RegisterEvent("UNIT_AURA")
			frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
			frame:RegisterEvent("PLAYER_TARGET_CHANGED")
			frame:RegisterEvent("PLAYER_ENTERING_WORLD")
			frame:SetScript("OnEvent", Filger.OnEvent)
		end
	end
end