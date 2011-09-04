local _, ns = ...

ns.Filger_Settings = {
	configmode = false,
}

ns.Filger_Spells = {
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
		{
			Name = "Lave Surge", -- I know Im blind :)
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, 0, -90 },

			-- Lava Burst
			{ spellID = 51505, size = 60, unitId = "player", caster = "player", filter = "CD" },
			-- Chain Lightning
			{ spellID = 421, size = 60, unitId = "player", caster = "player", filter = "CD" },
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
			setPoint = { "CENTER", UIParent, 56, -90 },

			-- Fear
			{ spellID = 5782, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Banish
			{ spellID = 710, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of the Elements
			{ spellID = 1490, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of Tongues
			{ spellID = 1714, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of Exhaustion
			{ spellID = 18223, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Bane of Agony
			{ spellID = 980, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Bane of Doom
			{ spellID = 603, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Unstable Affliction
			{ spellID = 30108, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Shadow Embrace
			{ spellID = 32395, size = 37, unitId = "target", caster = "player", filter = "BUFF" },
			-- Corruption
			{ spellID = 172, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Immolate
			{ spellID = 348, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, -60, -90 },
			
			-- Curse of Weakness
			{ spellID = 702, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Haunt
			{ spellID = 48181, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Seed of Corruption
			{ spellID = 27243, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Howl of Terror
			{ spellID = 5484, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Death Coil
			{ spellID = 6789, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Enslave Demon
			{ spellID = 1098, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
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
			setPoint = { "CENTER", "UIParent", -0, -85 },

			-- Lock and Load
			{ spellID = 56453, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Quick Shots
			{ spellID = 6150, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Improved Steady Shot
			{ spellID = 53224, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Rapid Fire
			{ spellID = 3045, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Call of the Wild
			{ spellID = 53434, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Mend Pet
			{ spellID = 136, size = 47, unitId = "pet", caster = "player", filter = "BUFF" },
			-- Feed Pet
			{ spellID = 6991, size = 47, unitId = "pet", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, 56, -90 },

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
		{
			Name = "COOLDOWN",
			Direction = "LEFT",
			Interval = 10,
			Mode = "ICON",
			setPoint = { "RIGHT", UIParent, "CENTER", -5, -400},

			-- prep
			{ spellID = 14185, size = 55, unitId = "player", caster = "player", filter = "CD" },
			-- dance
			{ spellID = 51713, size = 55, unitId = "player", caster = "player", filter = "CD" },
			-- smoke bomb
			{ spellID = 76577, size = 55, unitId = "player", caster = "player", filter = "CD" },	
			-- Vendetta
			{ spellID = 79140, size = 55, unitId = "player", caster = "player", filter = "CD" },
			-- step
			{ spellID = 36554, size = 55, unitId = "player", caster = "player", filter = "CD" },	
		},
		{
			Name = "COOLDOWN",
			Direction = "RIGHT",
			Interval = 10,
			Mode = "ICON",
			setPoint = { "LEFT", UIParent, "CENTER", 5, -400},
			
			-- cloak
			{ spellID = 31224, size = 55, unitId = "player", caster = "player", filter = "CD" },
			-- combat readiness
			{ spellID = 74001, size = 55, unitId = "player", caster = "player", filter = "CD" },
			-- kick
			{ spellID = 1766, size = 55, unitId = "player", caster = "player", filter = "CD" },		
			-- vanish
			{ spellID = 1856, size = 55, unitId = "player", caster = "player", filter = "CD" },	
			-- sprint
			{ spellID = 2983, size = 55, unitId = "player", caster = "player", filter = "CD" },			
		},
	},	
	["PALADIN"] = { -------------------------------------------------------------------------------------------------------- Paladin
		{
			Name = "Buffs and Debuffs",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, -60, -90 },

			-- Beacon of Light -- player
			{ spellID = 53563, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, 56, -90 },

			-- Beacon of Light -- target
			{ spellID = 53563, size = 37, unitId = "target", caster = "player", filter = "BUFF" },
			-- Hammer of Justice
			{ spellID = 853, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Seal of Truth Aka Censure
			{ spellID = 31803, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Divine Illumination
			{ spellID = 31842, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Divine Plea
			{ spellID = 54428, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Holy Shield
			{ spellID = 20925, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Inquisition
			{ spellID = 84963, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
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
			{ spellID = 94686, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
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
			Name = "T_DEBUFF_ICON",
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
		},
		{
			Name = "COOLDOWN",
			Direction = "RIGHT",
			Interval = 10,
			Mode = "ICON",
			setPoint = { "LEFT", UIParent, "CENTER", -100, -400},
			
			-- recklesness
			{ spellID = 1719, size = 65, unitId = "player", caster = "player", filter = "CD" },
			-- throwdown
			{ spellID = 85388, size = 65, unitId = "player", caster = "player", filter = "CD" },
			-- berserker rage
			{ spellID = 18499, size = 65, unitId = "player", caster = "player", filter = "CD" },		
		},
    },		
	["DEATHKNIGHT"] = {  -------------------------------------------------------------------------------------------------------- Deathknight
		{
			Name = "Deathknight Procs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, 106, -85 },

			-- Blood Shield
			{ spellID = 77513, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Unholy Force
			{ spellID = 67383, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Unholy Strength
			{ spellID = 53365, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Unholy Might
			{ spellID = 67117, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Dancing Rune Weapon
			{ spellID = 49028, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Icebound Fortitude
			{ spellID = 48792, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Anti-Magic Shell
			{ spellID = 48707, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Killing machine
			{ spellID = 51124, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Freezing fog
			{ spellID = 59052, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
			-- Bone Shield
			{ spellID = 49222, size = 36, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = "RIGHT",
			Interval = 3,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, 106, -43 },

			-- Strangulate
			{ spellID = 47476, size = 36, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Blood Plague
			{ spellID = 59879, size = 36, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Frost Fever
			{ spellID = 59921, size = 36, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Unholy Blight
			{ spellID = 49194, size = 36, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Summon Gargoyle
			{ spellID = 49206, size = 36, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Death and Decay/
			{ spellID = 43265, size = 36, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
	},
-----------------------------------------------------------------------------------------------------------------------
-- dont touch anything below or else ill ass rape you aight!
-----------------------------------------------------------------------------------------------------------------------	
	["ALL"] = {
		{
			Name = "Cataclysm debuff list by jasje", -- taken from aurawatch.lua
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", UIParent, "CENTER", -190, -180 },

-- Baradin Hold
			-- Consuming Darkness
            { spellID = 95173, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
-- Blackwing Descent
		-- Magmaw
			-- Constricting Chains
            { spellID = 91911, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Parasitic Infection
            { spellID = 94679, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Mangle
            { spellID = 94617, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Omintron Defense System	
			-- Poison Soaked Shell	
	        { spellID = 79835, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Conductor
			{ spellID = 91433, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Incineration Security Measure
			{ spellID = 91521, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Power Conversion - Arcanotron
            { spellID = 79729, size = 47, unitId = "focus", caster = "all", filter = "BUFF" },
		-- Maloriak	
			-- Flash Freeze
			{ spellID = 77699, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Biting Chill
			{ spellID = 77760, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- remedy -- for spellsteal 
			{ spellID = 77912, size = 47, unitId = "target", caster = "all", filter = "BUFF" },
			-- remedy -- for spellsteal  - focus
			{ spellID = 77912, size = 47, unitId = "focus", caster = "all", filter = "BUFF" },
		-- Atramedes
			-- Searing Flame
			{ spellID = 92423, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Roaring Flame
			{ spellID = 92485, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Sonic Breath
			{ spellID = 92407, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Chimaeron	
			-- Break
			{ spellID = 82881, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Low Health
			{ spellID = 89084, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
-- The Bastion of Twilight
		--Valiona & Theralion
			-- Blackout
			{ spellID = 92878, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Devouring Flames
			{ spellID = 86840, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Engulfing Magic
			{ spellID = 86840, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Halfus Wyrmbreaker	
		    -- Malevolent Strikes
			{ spellID = 39171, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Twilight Ascendant Council
			-- Hydro Lance
			{ spellID = 92511, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Waterlogged
			{ spellID = 82762, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Frozen
			{ spellID = 92505, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Flame Torrent
			{ spellID = 92518, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Rod
			{ spellID = 83099, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gravity Core
			{ spellID = 92075, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gravity Crush
			{ spellID = 92488, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Cho'gall	
		    -- Cho's Blast
		    { spellID = 86028, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gall's Blast
		    { spellID = 86029, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
-- Throne of the Four Winds
	-- Conclave of Wind
		-- Nezir <Lord of the North Wind>
			-- Ice Patch
			{ spellID = 93131, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Anshal <Lord of the West Wind>
			-- Soothing Breeze
			{ spellID = 86206, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Toxic Spores
			{ spellID = 93122, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Rohash <Lord of the East Wind>
			-- Slicing Gale
			{ spellID = 93058, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Al'Akir
			-- Ice Storm
			{ spellID = 93260, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Rod
			{ spellID = 93295, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
			
--      [[ INCOMPLETE ]] --
-- Firelands
        --Shannox
            -- Magma Rupture
            { spellID = 99840, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
            -- Crystal Prison Trap 
            { spellID = 99837, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
            -- Jagged Tear
            { spellID = 99936, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Lord Rhyolith	
            -- Eruption
            { spellID = 98492, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Alysrazor	
            -- Molten Feather
            { spellID = 97128, size = 47, unitId = "player", caster = "all", filter = "BUFF" },
            -- Wings of Flame
            { spellID = 98619, size = 47, unitId = "player", caster = "all", filter = "BUFF" },
            -- Blazing Power
            { spellID = 99461, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
            -- Alysra's Razor
            { spellID = 100029, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Beth'tilac	
            -- The Widow's Kiss
            { spellID = 99506, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Baleroc	
            -- Torment
            { spellID = 99256, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
            -- Tormented
            { spellID = 99257, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
            -- Blaze of Glory
            { spellID = 99252, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
            -- Vital Flame
            { spellID = 99262, size = 47, unitId = "player", caster = "all", filter = "BUFF" },
            -- Vital Spark
            { spellID = 99263, size = 47, unitId = "player", caster = "all", filter = "BUFF" },
		-- Majordomo Staghelm	
            -- Searing Seeds
            { spellID = 98450, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
            -- Burning Orbs
            { spellID = 98451, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Ragnaros	
            -- Blazing Heat
            { spellID = 100460, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
            -- Burning Wound 
            { spellID = 101239, size = 47, unitId = "player", caster = "all", filter = "DEBUFF" },
    	},	
		{
--[[       Tons of SpellIDs taken from LoseControl so credit to Kouri 
		    Here we track pvp buffs on our target                             ]]
			Name = "PVPYO",
			Direction = "RIGHT",
			Interval = 6,
			Mode = "ICON",
			setPoint = { "LEFT", UIParent, "CENTER", 190, -98 },

			--[[ Druid ]]--
			--Innervate
			{ spellID = 29166, size = 80, unitId = "target", caster = "all", filter = "BUFF"},
			
			--[[ Warrior ]]--
			--Spell Reflection
			{ spellID = 23920, size = 80, unitId = "target", caster = "all", filter = "BUFF" },
			
			--[[ Paladin ]]--
			--Divine Shield
			{ spellID = 642, size = 80, unitId = "target", caster = "all", filter = "BUFF" },
			-- Hand of Freedom
			{ spellID = 1044, size = 80, unitId = "target", caster = "all", filter = "BUFF" },
			-- Hand of Sacrifice
			{ spellID = 6940, size = 80, unitId = "target", caster = "all", filter = "BUFF" },
			--Aura Mastery
			{ spellID = 31821, size = 80, unitId = "target", caster = "all", filter = "BUFF" },	

            --[[ Hunter ]]--
			--Deterrence
            { spellID = 19263, size = 80, unitId = "target", caster = "all", filter = "BUFF" },
			
			--[[ Death Knight ]]--
			-- Anti-Magic Shell
			{ spellID = 48707, size = 80, unitId = "target", caster = "all", filter = "BUFF" },
			-- Lichborne
			{ spellID = 49039, size = 80, unitId = "target", caster = "all", filter = "BUFF" },
			
			--[[ Shaman ]]--
			-- Grounding Totem Effect
			{ spellID = 8178, size = 80, unitId = "target", caster = "all", filter = "BUFF" },

			--[[ Mage ]]--
			--Ice Block
			{ spellID = 45438, size = 80, unitId = "target", caster = "all", filter = "BUFF" },
			
			--[[ Rouge ]]--
			--Cloak of Shadows
			{ spellID = 31224, size = 80, unitId = "target", caster = "all", filter = "BUFF" },
			
			--[[ Priest ]]--
			-- Dispersion
			{ spellID = 47585, size = 80, unitId = "target", caster = "all", filter = "BUFF" },
		},
		{
		    -- Here we track pvp debuffs on ourself
			Name = "PVPYO",
			Direction = "LEFT",
			Interval = 6,
			Mode = "ICON",
			setPoint = { "RIGHT", UIParent, "CENTER", -190, -98 },
			
			--[[ Rouge ]]--
			--Kidney Shot
            { spellID = 408, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Blind
            { spellID = 2094, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Sap
            { spellID = 6770, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Smoke Bomb
            { spellID = 76577, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Garrote - Silence
            { spellID = 1330, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Silenced - Improved Kick
            { spellID = 18425, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Dismantle
            { spellID = 51722, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Blade Twisting
            { spellID = 31125, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Crippling Poison
            { spellID = 3409, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Deadly Throw
            { spellID = 26679, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
            --Smoke Bomb			
            { spellID = 76577, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },	
			
			--[[ Paladin ]]--
			--Hammer of Justice
		    { spellID = 853, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Seal of Justice
            { spellID = 20170, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Repentance
	        { spellID = 20066, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Holy Wrath
		    { spellID = 2812, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Turn Evil
            { spellID = 10326, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Avenger's Shield
	        { spellID = 31935, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Dazed - Avenger's Shield
            { spellID = 63529, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },	

			--[[ Mage ]]--
			--Silenced - Improved Counterspell
            { spellID = 18469, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Polymorph
	        { spellID = 118, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Improved Polymorph
	        { spellID = 83047, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Deep Freeze
	        { spellID = 44572, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Impact
            { spellID = 12355, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Ring of Frost
	        { spellID = 82691, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Fiery Payback
	        { spellID = 64346, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Freeze (Water Elemental)
	        { spellID = 33395, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Frost Nova
            { spellID = 122, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Improved Cone of Cold
	        { spellID = 83302, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Shattered Barrier
	        { spellID = 55080, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Blast Wave
	        { spellID = 11113, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Cone of Cold
	        { spellID = 120, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Frostbolt
	        { spellID = 116, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Frostfire Bolt
	        { spellID = 44614, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Slow
            { spellID = 31589, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			--[[ Death Kinght ]]--
			--Monstrous Blow (Super ghoul)
            { spellID = 91797, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Desecration
            { spellID = 55666, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Chains of Ice
	        { spellID = 45524, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Strangulate
	        { spellID = 47476, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Gnaw (Ghoul)
            { spellID = 47481, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Hungering Cold
	        { spellID = 61058, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Chilblains
	        { spellID = 50040, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },			
        
		    --[[ Druid ]]--
			--Bash (also Shaman Spirit Wolf ability)
	        { spellID = 5211, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Cyclone
	        { spellID = 33786, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Maim
	        { spellID = 22570, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Pounce
	        { spellID = 9005, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Solar Beam
	        { spellID = 97547, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Entangling Roots
	        { spellID = 339, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Feral Charge Effect
	        { spellID = 45334, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Infected Wounds
	        { spellID = 58179, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Typhoon
	        { spellID = 61391, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			--[[ Hunter ]]--
			--Freezing Trap Effect
	        { spellID = 3355, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Intimidation
	        { spellID = 24394, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Wyvern Sting
	        { spellID = 19386, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Silencing Shot
	        { spellID = 34490, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Scatter Shot
	        { spellID = 19503, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Counterattack
            { spellID = 19306, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Entrapment
	        { spellID = 19185, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Concussive Barrage
	        { spellID = 35101, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Concussive Shot
	        { spellID = 5116, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Frost Trap Aura
	        { spellID = 13810, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Glyph of Freezing Trap
            { spellID = 61394, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Wing Clip
	        { spellID = 2974, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Sonic Blast (Bat)
	        { spellID = 50519, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Snatch (Bird of Prey)
	        { spellID = 50541, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Froststorm Breath (Chimera)
	        { spellID = 95725, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Pin (Crab)
            { spellID = 50245, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Tendon Rip (Hyena)
	        { spellID = 50271, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Bad Manner (Monkey)
	        { spellID = 90337, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Venom Web Spray (Silithid)
	        { spellID = 54706, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Web (Spider)
	        { spellID = 4167, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			--[[ Priest ]]--
			--Mind Control
	        { spellID = 605, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Psychic Horror
            { spellID = 64044, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Psychic Scream
	        { spellID = 8122, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Shackle Undead
	        { spellID = 9484, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Sin and Punishment
	        { spellID = 87204, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Paralysis
	        { spellID = 87194, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Mind Flay
            { spellID = 15407, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			--[[ Shaman ]]--
			--Bind Elemental
	        { spellID = 76780, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Earthquake
	        { spellID = 61882, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Hex
	        { spellID = 51514, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Stoneclaw Stun
	        { spellID = 39796, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Earthgrab (Earth's Grasp)
            { spellID = 64695, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Freeze (Frozen Power)
	        { spellID = 63685, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Earthbind (5 second duration per pulse, but will keep re-applying the debuff as long as you stand within the pulse radius)
	        { spellID = 3600, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Frost Shock
	        { spellID = 8056, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Frostbrand Attack
	        { spellID = 8034, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			--[[ Warlock ]]--
			--Aura of Foreboding
	        { spellID = 93986, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Axe Toss (Felguard)
	        { spellID = 89766, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Banish
	        { spellID = 710, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Death Coil
            { spellID = 6789, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Demon Leap
	        { spellID = 54786, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Fear
	        { spellID = 5782, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Howl of Terror
	        { spellID = 5484, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },		
			--Seduction (Succubus)
            { spellID = 6358, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Shadowfury
	        { spellID = 30283, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Spell Lock (Felhunter)
	        { spellID = 24259, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Unstable Affliction
	        { spellID = 31117, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Aftermath
            { spellID = 18118, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Curse of Exhaustion
	        { spellID = 18223, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Curse of Tongues
	        { spellID = 1714, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Shadowsnare (Glyph of Shadowflame)
	        { spellID = 63311, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			--[[ Warrior ]]--
			--Hamstring
	        { spellID = 1715, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Improved Hamstring
	        { spellID = 23694, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },			
			--Charge Stun
	        { spellID = 7922, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Concussion Blow
            { spellID = 12809, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Heroic Leap
	        { spellID = 6544, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Intercept
	        { spellID = 20253, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Intimidating Shout
	        { spellID = 5246, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },	
			--Shockwave
            { spellID = 46968, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Throwdown
	        { spellID = 85388, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Silenced - Gag Order
	        { spellID = 18498, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Disarm
	        { spellID = 676, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Piercing Howl
	        { spellID = 12323, size = 80, unitId = "player", caster = "all", filter = "DEBUFF" },
			},
			{ -- Here we track all cc on focus target -- not finished
			Name = "Focus",  
			Direction = "UP",
			Interval = 3,
			Mode = "BAR",
			IconSide = "RIGHT",
			setPoint = { "RIGHT", UIParent, "CENTER", -190, 20},
			
            --Innervate -- I also wanna see innervate on focus
			{ spellID = 29166, size = 35, barWidth = 183,  unitId = "focus", caster = "all", filter = "BUFF"},				
			--Hungering Cold
	        { spellID = 49203, size = 35, barWidth = 183,  unitId = "focus", caster = "all", filter = "DEBUFF" },
			--Chains of Ice
	        { spellID = 45524, size = 35, barWidth = 183,  unitId = "focus", caster = "all", filter = "DEBUFF" },			
			--Hex
	        { spellID = 51514, size = 35, barWidth = 183,  unitId = "focus", caster = "all", filter = "DEBUFF" },			
			--Polymorph
	        { spellID = 118, size = 35, barWidth = 183,  unitId = "focus", caster = "all", filter = "DEBUFF" },
			--Improved Polymorph
	        { spellID = 83047, size = 35, barWidth = 183,  unitId = "focus", caster = "all", filter = "DEBUFF" },
			--Cyclone
	        { spellID = 33786, size = 35, barWidth = 183,  unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
	},
}	