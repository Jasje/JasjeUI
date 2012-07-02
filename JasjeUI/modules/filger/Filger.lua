local T, C, L = unpack(Tukui)

local _, ns = ...

--[[
	
	Filger
	Copyright (c) 2009, Nils Ruesch
	All rights reserved.
	
]]

ns.Filger_Settings = {
	configmode = false,
}

ns.Filger_Spells = {
    ["DEATHKNIGHT"] = {  -------------------------------------------------------------------------------------------------------- Deathknight
		{
			Name = "Deathknight Procs",
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "CENTER", "UIParent", -0, -85 },

			-- Killing Machine
			{ spellID = 51124, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Freezing Fog
			{ spellID = 59052, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Dark Succor
			{ spellID = 101568, size = 47, unitId = "player", caster = "player", filter = "BUFF" },	
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, -110, -40 },

			-- Bone Shield
			{ spellID = 49222, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Surge of Victory
			{ spellID = 102432, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			--Lichborne
			{ spellID = 49039, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Summon Gargoyle
			{ spellID = 49206, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, 110, -40 },

			-- Necrotic Strike
			{ spellID = 73975, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Blood Plague
			{ spellID = 59879, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Frost Fever
			{ spellID = 59921, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "COOLDOWN",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", UIParent, "CENTER", -240, -40 },

			--Death Grip
			{ spellID = 49576, size = 60, filter = "CD" },	
		},
        {		
			Name = "Pet",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", TukuiPet, "RIGHT", -80, -45},
			
			--Shadow infusion
			{ spellID = 91342, size = 60, unitId = "pet", caster = "player", filter = "BUFF" },
			-- Dark Transformation
			{ spellID = 63560, size = 60, unitId = "pet", caster = "player", filter = "BUFF" },
		},
	},
	["SHAMAN"] = { -------------------------------------------------------------------------------------------------------- Shaman
		{
			Name = "Shaman Procs",
			Direction = "LEFT",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "RIGHT", UIParent, "CENTER", -190, -20 },

			-- Maelstorm Weapon
			{ spellID = 53817, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shamanistic Rage
			{ spellID = 30823, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Clearcasting
			{ spellID = 16246, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tidal Waves
			-- { spellID = 51562, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Spiritswalkers Grace
			{ spellID = 79206, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Focused Insight
			{ spellID = 77796, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "LEFT", UIParent, "CENTER", 190, -20 },

			-- Hex
			{ spellID = 51514, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Storm Strike
			{ spellID = 17364, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Earth Shock
			{ spellID = 8042, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Frost Shock
			{ spellID = 8056, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Flame Shock
			{ spellID = 8050, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
	},	
	 ["MAGE"] = { -------------------------------------------------------------------------------------------------------- Mage
		{
			Name = "Cooldown",
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, 173, 10 },

			-- Water Elemental Freeze
			{ spellID = 33395, size = 37, filter = "CD" },
			-- Blast Wave
			{ spellID = 11113, size = 37, filter = "CD" },
			-- Mana shield
			{ spellID = 1463, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
		},	
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, 173, -30 },
			
			-- Frostfire Bolt aka Glyph of Frostfire
			{ spellID = 44614, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			--Slow
			{ spellID = 31589, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			--Innervate
			{ spellID = 29166, size = 37, unitId = "player", caster = "all", filter = "BUFF"},
			--Icy Veins
			{ spellID = 12472, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Mage Procs",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "CENTER", "UIParent", 219, 15 },
			
			--Brain Freeze
			{ spellID = 57761, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Impact
			{ spellID = 64343, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			--Missile Barrage
			{ spellID = 54486, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			--Hot Streak(improved)
			{ spellID = 44448, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			--Hot Streak
			{ spellID = 44445, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Deep Freeze
			{ spellID = 44572, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			--Scorch aka Critical Mass
			{ spellID = 12873, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
			--Arcane Blast
			{ spellID = 30451, size = 47, unitId = "player", caster = "player", filter = "DEBUFF" },
			--Fingers Of Frost
            { spellID = 83074, size = 47, unitId = "player", caster = "player", filter = "BUFF"},
		},
	},
	["PRIEST"] = { -------------------------------------------------------------------------------------------------------- Priest
		{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, -100, -86},


			-- Prayer of Mending
			{ spellID = 41635, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Guardian Spirit
			{ spellID = 47788, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Pain Suppression
			{ spellID = 33206, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Renew
			{ spellID = 139, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Power Word: Shield
			{ spellID = 17, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Cooldown",
			Direction = "LEFT",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, -55, 5 },

			-- Mind Blast
			{ spellID = 8092, size = 36, filter = "CD" },
		},	
	    {
			Name = "Priest Procs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, 106, -85 },

			-- Surge of Light
			{ spellID = 88688, size = 36, unitId = "player", caster = "all", filter = "BUFF" },
			-- Serendipity
			{ spellID = 63735, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shadow Orb
			{ spellID = 77487, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Archangel
			{ spellID = 81700, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Evangelism
			{ spellID = 81662, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Dispersion
			{ spellID = 47585, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
		},	

		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, 106, -43 },

			-- Shackle undead
			{ spellID = 9484, size = 36, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Psychic Scream
			{ spellID = 8122, size = 36, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Shadow Word: Pain
			--{ spellID = 589, size = 36, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Devouring Plague
			--{ spellID = 2944, size = 36, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Vampiric Touch
			--{ spellID = 34914, size = 36, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Prayer of Mending
			{ spellID = 41635, size = 36, unitId = "target", caster = "player", filter = "BUFF" },
			-- Guardian Spirit
			{ spellID = 47788, size = 36, unitId = "target", caster = "player", filter = "BUFF" },
			-- Pain Suppression
			{ spellID = 33206, size = 36, unitId = "target", caster = "player", filter = "BUFF" },
			-- Power Word: Shield
			{ spellID = 17, size = 36, unitId = "target", caster = "player", filter = "BUFF" },
			-- Renew
			{ spellID = 139, size = 36, unitId = "target", caster = "player", filter = "BUFF" },
		},
	},
	["WARLOCK"] = { -------------------------------------------------------------------------------------------------------- Warlock
		{
			Name = "Warlock Procs",
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "CENTER", "UIParent", -0, -85 },

			--Devious Minds
			{ spellID = 70840, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Improved Soul Fire
			{ spellID = 18120, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Molten Core
			{ spellID = 47247, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Decimation
			{ spellID = 63158, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Backdraft
			{ spellID = 47260, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Backlash
			{ spellID = 34939, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Nether Protection
			{ spellID = 30301, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Nightfall
			{ spellID = 18095, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Burning Soul
			{ spellID = 84254, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			setPoint = {"CENTER", UIParent, 60, -130},
			
			-- Fear
			{ spellID = 5782, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Howl of Terror
			{ spellID = 5484, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Death Coil
			{ spellID = 6789, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Banish
			{ spellID = 710, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			setPoint = {"CENTER", UIParent, 60, -90},

			-- Haunt
			{ spellID = 48181, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Unstable Affliction
			{ spellID = 30108, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Corruption
			{ spellID = 172, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Bane of Agony
			{ spellID = 980, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Immolate
			{ spellID = 348, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, -60, -90 },
			
			-- Curse of Tongues
			{ spellID = 1714, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of Exhaustion
			{ spellID = 18223, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of the Elements
			{ spellID = 1490, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of Weakness
			{ spellID = 702, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Bane of Doom
			{ spellID = 603, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },	
			-- Seed of Corruption
			{ spellID = 27243, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
        {
			Name = "Cooldown",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, -60, -130 },

			-- SoulBurn
			{ spellID = 74434, size = 37, filter = "CD" },
		},
	},
	["DRUID"] = { -------------------------------------------------------------------------------------------------------- Druid
		{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, -60, -90 },

			-- Lifebloom
			{ spellID = 33763, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Rejuvenation
			{ spellID = 774, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Regrowth
			{ spellID = 8936, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Wild Growth
			{ spellID = 48438, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, 56, -90 },

			-- Lifebloom
			{ spellID = 33763, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
			-- Rejuvenation
			{ spellID = 774, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
			-- Regrowth
			{ spellID = 8936, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
			-- Wild Growth
			{ spellID = 48438, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Druid Procs",
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "CENTER", "UIParent", -0, -85 },

			-- Eclipse (Lunar)
			{ spellID = 48518, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Eclipse (Solar)
			{ spellID = 48517, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shooting Stars
			{ spellID = 93400, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Savage Roar
			{ spellID = 52610, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Survival Instincts
			{ spellID = 61336, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tree of Life
			{ spellID = 33891, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Clearcasting
			{ spellID = 16870, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Innervate
			{ spellID = 29166, size = 47, unitId = "player", caster = "all", filter = "BUFF" },
			-- Barkskin
			{ spellID = 22812, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, 56, -90 },

			-- Hibernate
			{ spellID = 2637, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Entangling Roots
			{ spellID = 339, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Cyclone
			{ spellID = 33786, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Moonfire
			{ spellID = 8921, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Sunfire
			{ spellID = 93402, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Insect Swarm
			{ spellID = 5570, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Rake
			{ spellID = 1822, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Rip
			{ spellID = 1079, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Lacerate
			{ spellID = 33745, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Pounce Bleed
			{ spellID = 9007, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Mangle
			{ spellID = 33876, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Earth and Moon
			{ spellID = 48506, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Faerie Fire
			{ spellID = 770, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
		},
	},
	["HUNTER"] = { -------------------------------------------------------------------------------------------------------- Hunter
		{
			Name = "Hunter Procs",
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "CENTER", "UIParent", -25, -95},

			-- Lock and Load
			{ spellID = 56453, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Quick Shots
			{ spellID = 6150, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Improved Steady Shot
			{ spellID = 53224, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Hunter Procs",
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "CENTER", "UIParent", 25, -95},
			
			-- Rapid Fire
			{ spellID = 3045, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Call of the Wild
			{ spellID = 53434, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Ready, Set, Aim
			{ spellID = 82925, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
		},
        {		
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, 75, -90 },

			-- Wyvern Sting
			{ spellID = 19386, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Silencing Shot
			{ spellID = 34490, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Serpent Sting
			{ spellID = 1978, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Black Arrow
			{ spellID = 3674, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Explosive Shot
			{ spellID = 53301, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Hunter's Mark
			{ spellID = 1130, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, -75, -90 },
			
			-- Mend Pet
			{ spellID = 136, size = 37, unitId = "pet", caster = "player", filter = "BUFF" },
			-- Feed Pet
			{ spellID = 6991, size = 37, unitId = "pet", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Cooldown",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "BOTTOMLEFT", TukuiBar1,"TOPLEFT", -0, 35},
			
			-- Bad Manner
			{ spellID = 90337, size = 37, unitId = "player", caster = "player", filter = "CD" },
			-- Roar of Sacrifice
			{ spellID = 53480, size = 37, unitId = "player", caster = "player", filter = "CD" },
		},
	},	
	["ROGUE"] = { -------------------------------------------------------------------------------------------------------- Rogue
		{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "RIGHT", UIParent, "CENTER", -190, -20 },

			-- Sprint
			{ spellID = 2983, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Cloak of Shadows
			{ spellID = 31224, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Adrenaline Rush
			{ spellID = 13750, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Evasion
			{ spellID = 5277, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Envenom
			{ spellID = 32645, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Overkill
			{ spellID = 58426, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Slice and Dice
			{ spellID = 5171, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tricks of the Trade
			{ spellID = 57934, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Turn the Tables
			{ spellID = 51627, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Recuperate
			{ spellID = 73651, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", UIParent, "CENTER", 190, -20 },

			-- hemo bleed
			{ spellID = 16511, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Cheap shot
			{ spellID = 1833, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Kidney shot
			{ spellID = 408, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Blind
			{ spellID = 2094, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Sap
			{ spellID = 6770, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Rupture
			{ spellID = 1943, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Garrote
			{ spellID = 703, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Gouge
			{ spellID = 1776, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Expose Armor
			{ spellID = 8647, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Dismantle
			{ spellID = 51722, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Deadly Poison
			{ spellID = 2818, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Mind-numbing Poison
			{ spellID = 5760, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Crippling Poison
			{ spellID = 3409, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Wound Poison
			{ spellID = 13218, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- garrote silence
			{ spellID = 1330, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "Shivable Rage effects",
			Direction = "RIGHT",
			IconSide = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, 0, 250 },

			-- Unholy Frenzy
			{ spellID = 49016, size = 50, unitId = "target", caster = "all", filter = "BUFF" },
			-- Vengeance
			{ spellID = 76691, size = 50, unitId = "target", caster = "all", filter = "BUFF" },
			-- Enrage
			{ spellID = 5229, size = 50, unitId = "target", caster = "all", filter = "BUFF" },
			-- Savage Roar
			{ spellID = 52610, size = 50, unitId = "target", caster = "all", filter = "BUFF" },
			-- Owlkin Frenzy
			{ spellID = 48391, size = 50, unitId = "target", caster = "all", filter = "BUFF" },
			-- Berserker Rage *
			{ spellID = 18499, size = 50, unitId = "target", caster = "all", filter = "BUFF" },
			-- Wrecking Crew  *
			{ spellID = 57519, size = 50, unitId = "target", caster = "all", filter = "BUFF" },
			-- Death Wish  *
			{ spellID = 12292, size = 50, unitId = "target", caster = "all", filter = "BUFF" },
			-- Bastion of Defense  *
			{ spellID = 29594, size = 50, unitId = "target", caster = "all", filter = "BUFF" },
        },
	},	
	["PALADIN"] = { -------------------------------------------------------------------------------------------------------- Paladin
		{
			Name = "Buffs and Debuffs",
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, -90, -85 },

			-- Beacon of Light -- player
			{ spellID = 53563, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Divine Illumination
			{ spellID = 31842, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Divine Plea
			{ spellID = 54428, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Holy Shield
			{ spellID = 20925, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Inquisition
			{ spellID = 84963, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Judgements of the Pure
			{ spellID = 53657, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "UP",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, 90, -85 },

			-- Beacon of Light -- target
			{ spellID = 53563, size = 37, unitId = "target", caster = "player", filter = "BUFF" },
			-- Hammer of Justice
			{ spellID = 853, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Seal of Truth Aka Censure
			{ spellID = 31803, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "Paladin Procs",
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "CENTER", "UIParent", -0, -85 },

			-- Infusion of Light
			{ spellID = 54149, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Crusader
			--{ spellID = 94686, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Art of War
			{ spellID = 87138, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Hand of Light 
			{ spellID = 90174, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
		},
	},
	["WARRIOR"] = {  -------------------------------------------------------------------------------------------------------- Warrior
		{
			Name = "Warrior Procs",
			Direction = "DOWN",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "CENTER", "UIParent", -0, -85 },

			-- Sudden Death
			{ spellID = 52437, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Slam!
			{ spellID = 46916, size = 47, unitId = "player", caster = "all", filter = "BUFF" },
			-- Sword and Board
			{ spellID = 50227, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Blood Reserve
			{ spellID = 64568, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Victorious
			{ spellID = 32216, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Battle trance
			{ spellID = 85742, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Incite
			{ spellID = 86627, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
		},
        {		
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, -60, -90 },
			
			-- Last Stand
			{ spellID = 12975, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shield Wall
			{ spellID = 871, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "UP",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, 75, -90 },

			-- Hamstring
			{ spellID = 1715, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Improved Hamstring
			{ spellID = 12668, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Rend
			{ spellID = 94009, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Sunder Armor
			{ spellID = 7386, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Thunder Clap
			{ spellID = 6343, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Demoralizing Shout
			{ spellID = 1160, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Collosus Smash
			{ spellID = 86346, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "COOLDOWN",
			Direction = "RIGHT",
			Interval = 10,
			Mode = "ICON",
			setPoint = { "LEFT", UIParent, "CENTER", -100, -400},
			
			-- Recklesness
			{ spellID = 1719, size = 65, filter = "CD" },
			-- Throwdown
			{ spellID = 85388, size = 65, filter = "CD" },
			-- Intercept
			{ spellID = 20252, size = 65, filter = "CD" },
			-- Berserker rage
			{ spellID = 18499, size = 65, filter = "CD" },	
			--Last Stand
			{ spellID = 12975, size = 65, filter = "CD" },		
			-- Taunt
			{ spellID = 355, size = 65, filter = "CD" },		
			-- Commanding Shout
			{ spellID = 469, size = 65, filter = "CD" },	
           -- Heroic Leap			
			{ spellID = 6544, size = 65, filter = "CD" },		
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
			setPoint = { "CENTER", UIParent, "CENTER", -180, 150 },

			--Rouge
			--Kidney Shot
            { spellID = 408, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Blind
            { spellID = 2094, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Sap
            { spellID = 6770, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Smoke Bomb
            { spellID = 76577, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Garrote - Silence
            { spellID = 1330, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Silenced - Improved Kick
            { spellID = 18425, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Dismantle
            { spellID = 51722, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Blade Twisting
            { spellID = 31125, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Crippling Poison
            { spellID = 3409, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Deadly Throw
            { spellID = 26679, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
            --Smoke Bomb			
            { spellID = 76577, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	

			--Paladin 
			--Hammer of Justice
		    { spellID = 853, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Seal of Justice
            { spellID = 20170, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Repentance
	        { spellID = 20066, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Holy Wrath
		    { spellID = 2812, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Turn Evil
            { spellID = 10326, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Avenger's Shield
	        { spellID = 31935, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Dazed - Avenger's Shield
            { spellID = 63529, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	

			--Mage
			--Silenced - Improved Counterspell
            { spellID = 18469, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Polymorph
	        { spellID = 118, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Improved Polymorph
	        { spellID = 83047, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Deep Freeze
	        { spellID = 44572, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Impact
            { spellID = 12355, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Ring of Frost
	        { spellID = 82691, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Fiery Payback
	        { spellID = 64346, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Freeze (Water Elemental)
	        { spellID = 33395, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Frost Nova
            { spellID = 122, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Improved Cone of Cold
	        { spellID = 83302, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Shattered Barrier
	        { spellID = 55080, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Blast Wave
	        { spellID = 11113, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Cone of Cold
	        { spellID = 120, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Frostbolt
	        { spellID = 116, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Frostfire Bolt
	        { spellID = 44614, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Slow
            { spellID = 31589, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },

			--Death Kinght 
			--Monstrous Blow (Super ghoul)
            { spellID = 91797, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Desecration
            { spellID = 55666, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Chains of Ice
	        { spellID = 45524, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Strangulate
	        { spellID = 47476, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Gnaw (Ghoul)
            { spellID = 47481, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Hungering Cold
	        { spellID = 61058, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Chilblains
	        { spellID = 50040, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },			
        
		    --Druid
			--Bash (also Shaman Spirit Wolf ability)
	        { spellID = 5211, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Cyclone
	        { spellID = 33786, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Maim
	        { spellID = 22570, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Pounce
	        { spellID = 9005, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Solar Beam
	        { spellID = 97547, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Entangling Roots
	        { spellID = 339, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Feral Charge Effect
	        { spellID = 45334, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Infected Wounds
	        { spellID = 58179, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Typhoon
	        { spellID = 61391, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },

			--Hunter 
			--Freezing Trap Effect
	        { spellID = 3355, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Intimidation
	        { spellID = 24394, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Wyvern Sting
	        { spellID = 19386, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Silencing Shot
	        { spellID = 34490, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Scatter Shot
	        { spellID = 19503, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Counterattack
            { spellID = 19306, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Entrapment
	        { spellID = 19185, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Concussive Barrage
	        { spellID = 35101, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Concussive Shot
	        { spellID = 5116, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Frost Trap Aura
	        { spellID = 13810, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Glyph of Freezing Trap
            { spellID = 61394, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Wing Clip
	        { spellID = 2974, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Sonic Blast (Bat)
	        { spellID = 50519, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Snatch (Bird of Prey)
	        { spellID = 50541, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Froststorm Breath (Chimera)
	        { spellID = 95725, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Pin (Crab)
            { spellID = 50245, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Tendon Rip (Hyena)
	        { spellID = 50271, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Bad Manner (Monkey)
	        { spellID = 90337, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Venom Web Spray (Silithid)
	        { spellID = 54706, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Web (Spider)
	        { spellID = 4167, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },

			--Priest
			--Mind Control
	        { spellID = 605, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Psychic Horror
            { spellID = 64044, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Psychic Scream
	        { spellID = 8122, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Shackle Undead
	        { spellID = 9484, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Sin and Punishment
	        { spellID = 87204, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Paralysis
	        { spellID = 87194, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Mind Flay
            { spellID = 15407, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },

			--Shaman
			--Bind Elemental
	        { spellID = 76780, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Earthquake
	        { spellID = 61882, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Hex
	        { spellID = 51514, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Stoneclaw Stun
	        { spellID = 39796, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Earthgrab (Earth's Grasp)
            { spellID = 64695, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Freeze (Frozen Power)
	        { spellID = 63685, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Earthbind (5 second duration per pulse, but will keep re-applying the debuff as long as you stand within the pulse radius)
	        { spellID = 3600, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Frost Shock
	        { spellID = 8056, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Frostbrand Attack
	        { spellID = 8034, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },

			--Warlock
			--Aura of Foreboding
	        { spellID = 93986, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Axe Toss (Felguard)
	        { spellID = 89766, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Banish
	        { spellID = 710, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Death Coil
            { spellID = 6789, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Demon Leap
	        { spellID = 54786, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Fear
	        { spellID = 5782, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Howl of Terror
	        { spellID = 5484, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Seduction (Succubus)
            { spellID = 6358, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Shadowfury
	        { spellID = 30283, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Spell Lock (Felhunter)
	        { spellID = 24259, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Unstable Affliction
	        { spellID = 31117, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Aftermath
            { spellID = 18118, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Curse of Exhaustion
	        { spellID = 18223, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Curse of Tongues
	        { spellID = 1714, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Shadowsnare (Glyph of Shadowflame)
	        { spellID = 63311, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },

			--Warrior 
			--Hamstring
	        { spellID = 1715, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Improved Hamstring
	        { spellID = 23694, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Charge Stun
	        { spellID = 7922, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Concussion Blow
            { spellID = 12809, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Heroic Leap
	        { spellID = 6544, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Intercept
	        { spellID = 20253, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Intimidating Shout
	        { spellID = 5246, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Shockwave
            { spellID = 46968, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Throwdown
	        { spellID = 85388, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Silenced - Gag Order
	        { spellID = 18498, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Disarm
	        { spellID = 676, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Piercing Howl
	        { spellID = 12323, size = 70, unitId = "player", caster = "all", filter = "DEBUFF" },
		},
		{
--Tons of SpellIDs taken from LoseControl so credit to Kouri 
--Here we track pvp buffs on our target
			Name = "PVPYOTAR",
			Direction = "RIGHT",
			Interval = 2,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, "CENTER", 180, 150 },

	        --Druid 
			--Innervate
			{ spellID = 29166, size = 70, unitId = "target", caster = "all", filter = "BUFF"},

			--Warrior 
			--Spell Reflection
			{ spellID = 23920, size = 70, unitId = "target", caster = "all", filter = "BUFF" },

			--Paladin 
			--Divine Shield
			{ spellID = 642, size = 70, unitId = "target", caster = "all", filter = "BUFF" },
			-- Hand of Freedom
			{ spellID = 1044, size = 70, unitId = "target", caster = "all", filter = "BUFF" },
			-- Hand of Sacrifice
			{ spellID = 6940, size = 70, unitId = "target", caster = "all", filter = "BUFF" },
			--Aura Mastery
			{ spellID = 31821, size = 70, unitId = "target", caster = "all", filter = "BUFF" },	

            --Hunter
			--Deterrence
            { spellID = 19263, size = 70, unitId = "target", caster = "all", filter = "BUFF" },

			--Death Knight
			-- Anti-Magic Shell
			{ spellID = 48707, size = 70, unitId = "target", caster = "all", filter = "BUFF" },
			-- Lichborne
			{ spellID = 49039, size = 70, unitId = "target", caster = "all", filter = "BUFF" },

			-- Shaman
			-- Grounding Totem Effect
			{ spellID = 8178, size = 70, unitId = "target", caster = "all", filter = "BUFF" },

			--Mage 
			--Ice Block
			{ spellID = 45438, size = 70, unitId = "target", caster = "all", filter = "BUFF" },

			--Rouge 
			--Cloak of Shadows
			{ spellID = 31224, size = 70, unitId = "target", caster = "all", filter = "BUFF" },

			--Priest 
			-- Dispersion
			{ spellID = 47585, size = 70, unitId = "target", caster = "all", filter = "BUFF" },
		},
	},
}

local _, ns = ...
local f_s = ns.Filger_Settings;
local Filger_Spells = ns.Filger_Spells;

SpellActivationOverlayFrame:SetFrameStrata("BACKGROUND")
local class = select(2, UnitClass("player"))
local classcolor = RAID_CLASS_COLORS[class]
local active, bars = {}, {}
local MyUnits = {
	player = true,
	vehicle = true,
	pet = true,
}

local function OnUpdate(self, elapsed)
	local time = self.filter == "CD" and (self.expirationTime + self.duration - GetTime()) or (self.expirationTime - GetTime())
	if self:GetParent().Mode == "BAR" then
		self.statusbar:SetValue(time)
		if time <= 60 then
			self.time:SetFormattedText("%.1f", time)
		else
			self.time:SetFormattedText("%d:%.2d", time/60, time%60)
		end
	end
	if (time < 0 and self.filter == "CD") then
		local id = self:GetParent().Id
		for index, value in ipairs(active[id]) do
			local spn = GetFilgerData(value.data)
			if self.spellName == spn then
				tremove(active[id], index)
				break
			end
		end
		self:SetScript("OnUpdate", nil)
		Update(self:GetParent())
	end
end

function Update(self)
	local id = self.Id
	if not bars[id] then
		bars[id] = {}
	end
	for index, value in ipairs(bars[id]) do
		value:Hide()
	end
	local bar
	for index, value in ipairs(active[id]) do
		bar = bars[id][index]
		if not bar then
			bar = CreateFrame("Frame", "FilgerAnchor"..id.."Frame"..index, self)
			bar:Width(value.data.size)
			bar:Height(value.data.size)
			bar:SetScale(1)
			bar:SetTemplate("Transparent")

			if index == 1 then
				bar:Point(unpack(self.setPoint))
			else
				if self.Direction == "UP" then
					bar:Point("BOTTOM", bars[id][index-1], "TOP", 0, self.Interval)
				elseif self.Direction == "RIGHT" then
					bar:Point("LEFT", bars[id][index-1], "RIGHT", self.Mode == "ICON" and self.Interval or value.data.barWidth + self.Interval, 0)
				elseif self.Direction == "LEFT" then
					bar:Point("RIGHT", bars[id][index-1], "LEFT", self.Mode == "ICON" and -self.Interval or -(value.data.barWidth + self.Interval), 0)
				else
					bar:Point("TOP", bars[id][index-1], "BOTTOM", 0, -self.Interval)
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
				bar.cooldown = CreateFrame("Cooldown", "$parentCD", bar, "CooldownFrameTemplate")
				bar.cooldown:SetAllPoints(bar.icon)
				bar.cooldown:SetReverse()

				if bar.count then
					bar.count = _G[bar.count:GetName()]
				else
					bar.count = bar.cooldown:CreateFontString("$parentCount", "OVERLAY")
					bar.count:SetFont(T.SetPixelFont())
					bar.count:Point("TOPLEFT", 1, 5)
					bar.count:SetJustifyH("CENTER")
				end
			else
				if bar.statusbar then
					bar.statusbar = _G[bar.statusbar:GetName()]
				else
					bar.statusbar = CreateFrame("StatusBar", "$parentStatusBar", bar)
					bar.statusbar:Width(value.data.barWidth - 2)
					bar.statusbar:Height(value.data.size - 10)
					bar.statusbar:SetStatusBarTexture(C.media.Glamour)
					bar.statusbar:SetStatusBarColor(classcolor.r, classcolor.g, classcolor.b, 1)
					if self.IconSide == "LEFT" then
						bar.statusbar:Point("BOTTOMLEFT", bar, "BOTTOMRIGHT", 5, 2)
					elseif self.IconSide == "RIGHT" then
						bar.statusbar:Point("BOTTOMRIGHT", bar, "BOTTOMLEFT", -5, 2)
					end
				end
				bar.statusbar:SetMinMaxValues(0, 1)
				bar.statusbar:SetValue(0)

				if bar.bg then
					bar.bg = _G[bar.bg:GetName()]
				else
					bar.bg = CreateFrame("Frame", "$parentBG", bar.statusbar)
					bar.bg:Point("TOPLEFT", -2, 2)
					bar.bg:Point("BOTTOMRIGHT", 2, -2)
					bar.bg:SetFrameStrata("BACKGROUND")
					bar.bg:SetTemplate("Transparent")
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
					bar.time = bar.statusbar:CreateFontString("$parentTime", "ARTWORK")
                    bar.time:SetFont(T.SetPixelFont())
					bar.time:Point("RIGHT", bar.statusbar, 0, 0)
				end

				if bar.count then
					bar.count = _G[bar.count:GetName()]
				else
					bar.count = bar:CreateFontString("$parentCount", "ARTWORK")
					bar.count:SetFont(T.SetPixelFont())
					bar.count:SetPoint("TOPLEFT", -2, 2)
					bar.count:SetJustifyH("CENTER")
				end

				if bar.spellname then
					bar.spellname = _G[bar.spellname:GetName()]
				else
					bar.spellname = bar.statusbar:CreateFontString("$parentSpellName", "ARTWORK")
					bar.spellname:SetFont(T.SetPixelFont())
					bar.spellname:Point("LEFT", bar.statusbar, 2, 0)
					bar.spellname:Point("RIGHT", bar.time, "LEFT")
					bar.spellname:SetJustifyH("LEFT")
				end
			end
			tinsert(bars[id], bar)
		end

		bar.spellName = value.data.displayName

		bar.icon:SetTexture(value.icon)
		bar.count:SetText(value.count > 1 and value.count or "")
		if self.Mode == "BAR" then
			bar.spellname:SetText(value.data.displayName)
		end
		if value.duration > 0 then
			if self.Mode == "ICON" then
				CooldownFrame_SetTimer(bar.cooldown, value.data.filter == "CD" and value.expirationTime or (value.expirationTime - value.duration), value.duration, 1)
				bar.count:SetParent(bar.cooldown)
				if value.data.filter == "CD" then
					bar.expirationTime = value.expirationTime
					bar.duration = value.duration
					bar.filter = value.data.filter
					bar:SetScript("OnUpdate", OnUpdate)
				end
			else
				bar.statusbar:SetMinMaxValues(0, value.duration)
				bar.expirationTime = value.expirationTime
				bar.duration = value.duration
				bar.filter = value.data.filter
				bar:SetScript("OnUpdate", OnUpdate)
			end
		else
			if self.Mode == "ICON" then
				bar.cooldown:Hide()
				bar.count:SetParent(bar)
			else
				bar.statusbar:SetMinMaxValues(0, 1)
				bar.statusbar:SetValue(1)
				bar.time:SetText("")
				bar:SetScript("OnUpdate", nil)
			end
		end

		bar:Show()
	end
end

local function OnEvent(self, event, ...)
	local unit = ...
	if ((unit == "target" or unit == "player" or unit == "pet" or unit == "focus") or event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_ENTERING_WORLD" or event == "SPELL_UPDATE_COOLDOWN" ) then
		local data, name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable, start, enabled, slotLink, spn
		local id = self.Id
		for i = 1, #Filger_Spells[class][id], 1 do
			data = Filger_Spells[class][id][i]

			name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable, start, enabled, filgerId = GetFilgerData(data)

			if not active[id] then
				active[id] = {}
			end

			for index, value in ipairs(active[id]) do
				if data.filgerId == value.data.filgerId then
					tremove(active[id], index)
				end
			end

			if data.filter == "CD" then
				if (name and ((enabled or 0) > 0 and (duration or 0) > 1.5)) then
					table.insert(active[id], { data = data, icon = icon, count = count, duration = duration, expirationTime = expirationTime or start, displayName = spn, filgerId = filgerId })
				end
			elseif data.filter == "BUFF" then
				spn = GetSpellInfo(data.spellID)
				name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable = UnitBuff(data.unitId, spn)
				if (name and (data.caster ~= 1 and (caster == data.caster or data.caster == "all") or MyUnits[caster])) then
					table.insert(active[id], { data = data, icon = icon, count = count, duration = duration, expirationTime = expirationTime or start})
				end
			elseif data.filter == "DEBUFF" then
				spn = GetSpellInfo(data.spellID)
				name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable = UnitDebuff(data.unitId, spn)
				if (name and (data.caster ~= 1 and (caster == data.caster or data.caster == "all" ) or MyUnits[caster])) then
					table.insert(active[id], { data = data, icon = icon, count = count, duration = duration, expirationTime = expirationTime or start})
				end
			end
		end
		Update(self)
	end
end

function GetFilgerData(data)
	local name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable, start, enabled, slotLink, spn, filgerId

	if data.spellID then
		filgerId = data.spellID
		spn, _, icon = GetSpellInfo(data.spellID)
		if not spn then
			print("|cffff0000WARNING: spellID "..data.spellID.." no longer exists!|r")
		end
		if data.filter == "BUFF" then
			name, rank, _, count, debuffType, duration, expirationTime, caster, isStealable = UnitBuff(data.unitId, spn)
		elseif data.filter == "DEBUFF" then
			name, rank, _, count, debuffType, duration, expirationTime, caster, isStealable = UnitDebuff(data.unitId, spn)
		elseif data.filter == "CD" then
			start, duration, enabled = GetSpellCooldown(spn)
		end
	elseif data.slotID then
		filgerId = data.slotID
		if data.filter == "CD" then
			slotLink = GetInventoryItemLink("player", data.slotID)

			if slotLink then
				spn, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink)
				start, duration, enabled = GetInventoryItemCooldown("player", data.slotID)
			end
		end
		count = 0
		caster = "all"
	elseif data.itemID then
		filgerId = data.itemID
		if data.filter == "CD" then
			start, duration, enabled = GetItemCooldown(data.itemID)
			spn, _, _, _, _, _, _, _, _, icon = GetItemInfo(data.itemID)
		end
	end

	if not count then
		count = 0
	end

	if not duration then
		duration = 0
	end

	if not start then
		start = 0
	end

	if not enabled then
		enabled = 0
	end

	if not data.displayName then
		data.displayName = spn
	end

	if not data.filgerId then
		data.filgerId = filgerId
	end

	return spn, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable, start, enabled, filgerId
end

if Filger_Spells and Filger_Spells["ALL"] then
	if not Filger_Spells[class] then
		Filger_Spells[class] = {}
	end
	local didMerge
	for i = 1, #Filger_Spells["ALL"], 1 do
		didMerge = false
		for j = 1, #Filger_Spells[class], 1 do
			local baseTable = Filger_Spells[class][j]
			local addTable = Filger_Spells["ALL"][i]
			if baseTable["Name"] and addTable["Name"] and baseTable["Name"] == addTable["Name"] then
				for k = 1, #addTable, 1 do
					if addTable[k].spellID or addTable[k].slotID or addTable[k].itemID then
						table.insert(baseTable, addTable[k])
					end
				end

				didMerge = true
			end
		end

		if not didMerge then
			table.insert(Filger_Spells[class], Filger_Spells["ALL"][i])
		end
	end
end

if Filger_Spells and Filger_Spells[class] then
	for index in pairs(Filger_Spells) do
		if index ~= class then
			Filger_Spells[index] = nil
		end
	end
	local data, frame
	for i = 1, #Filger_Spells[class], 1 do
		data = Filger_Spells[class][i]

		frame = CreateFrame("Frame", "FilgerAnchor"..i, UIParent)
		frame.Id = i
		frame.Name = data.Name
		frame.Direction = data.Direction or "DOWN"
		frame.IconSide = data.IconSide or "LEFT"
		frame.Interval = data.Interval or 3
		frame.Mode = data.Mode or "ICON"
		frame.setPoint = data.setPoint or "CENTER"
		frame:Width(Filger_Spells[class][i][1] and Filger_Spells[class][i][1].size or 100)
		frame:Height(Filger_Spells[class][i][1] and Filger_Spells[class][i][1].size or 20)
		frame:Point(unpack(data.setPoint))

		if (f_s.configmode) then
			for j = 1, #Filger_Spells[class][i], 1 do
				data = Filger_Spells[class][i][j]
				if not active[i] then
					active[i] = {}
				end
				_, _, spellIcon = GetFilgerData(data)
				table.insert(active[i], {data = data, icon = spellIcon, count = 9, duration = 0, expirationTime = 0})
			end
			Update(frame)
		else
			for j = 1, #Filger_Spells[class][i], 1 do
				data = Filger_Spells[class][i][j]
				if data.filter == "CD" then
					frame:RegisterEvent("SPELL_UPDATE_COOLDOWN")
					break
				end
			end
			frame:RegisterEvent("UNIT_AURA")
			frame:RegisterEvent("PLAYER_TARGET_CHANGED")
			frame:RegisterEvent("PLAYER_ENTERING_WORLD")
			frame:SetScript("OnEvent", OnEvent)
		end
	end
end