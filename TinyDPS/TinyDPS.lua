local T, C, L = unpack(Tukui)
--[[-----------------------------------------------------------------------------------------------------------------------------

	TinyDPS - Lightweight Damage Meter

	* written by: Sideshow, Draenor EU
	* initial release: May 21th, 2010
	* last updated: June 9th, 2011

---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------

	Version 0.938
	* updated bossIds (author: elsia)
	* added option "Hide In Combat" (Options -> Various)
	* using the "/tdps" command has now permanent effect
	* middle clicking the frame resets all data which is now also the case for the minimap button

	Version 0.937
	* fixes for WoW 4.1

	Version 0.936
	* corrected issue with auto hide in pvp
	
	Version 0.935
	* updated bossIds (author: elsia)
	* resize grip has now zero opacity until hovered

	Version 0.934
	* updated bossIds (author: elsia)

	Version 0.933
	* changes to report and bar menu
	* small fix concerning bar width
	* adding a custom font is now easier
	* default custom font is from TukUI

	Version 0.932
	* wintergrasp battles will now hide tinydps if needed

	Version 0.931
	* simplified color handling
	* support for CUSTOM_CLASS_COLORS

	Version 0.93
	* reworked dropdownmenu
	* reworked tooltip on minimap button
	* deDE localization (thanks to ac3r)
	* ruRU localization (thanks to mupymupa)

	Version 0.91
	* tweaked short number format
	* updated bossIds (author: elsia)
	* dropdownmenu creates much less garbage memory
	* tooltips do not create garbage memory anymore
	* text on statusbars has been lowered by 1 pixel
	* fixed absorbs (spell_aura_removed) and updated id's
	* excluded fonts due to licenses, added default system fonts
	* added koKR localization (thanks to eastkiki for help and testing)

	Version 0.90
	* fixed bug with 'Hide When Solo'
	* fixed bug with 'Short Format'
	* reworked frame positioning
	* tweaked starting of new fights
	* updated list of excluded pets
	* added absorbs: Val'anyr Hammer of Ancient Kings

	Version 0.89
	* fixed bug with frame width; this also fixes ocasionally 'empty' bars
	* added Sacred Shield and Guarded by the Light to absorb list
	* various tweaks

	Version 0.88
	* healing now includes (trackable) absorbs
	* optimized cpu usage: 'OnUpdate' halted when out of combat
	* optimized cpu usage: refreshing bar text is now much faster
	* various other optimizations, changes and tweaks

	Version 0.86
	* fixed tiny bug when swapping bar/text color
	* fixed boss tracking due to changes in patch 4.0.1

	Version 0.85
	* complete rewrite of data handling (collection and storage)
	* => fight history is now dynamic and can be completely turned off (default)
	* non damage pets (Wrath of Air Totem, etc.) are now ignored much faster (all languages, only english before)
	* changed some functions to prevent problems with saved variables and version
	* fixed a little bug with melee in the spell tracker
	* unchecking 'track spells' will now delete all spell data
	* resetting tinydps will not change to 'current fight' anymore
	* refreshing of bars can now be set to 1 second (default: 2)
	* minimap button is now disabled by default
	* lots of function rewrites and alround code cleaning

	Version 0.84
	* added: the position of the frame is now saved for all characters
	* added: a explicit reset of all saved variables and settings to prevent a bug with the spelltracker

	Version 0.83
	* fixed: bug with spell tracking

	Version 0.82
	* added: officer channel
	* fixed: cataclysm compatibility

	Version 0.81
	* fixed: tiny bug with raid colors from previous version. This changes nothing to the add-on actually, but it's just better

	Version 0.80
	* fixed: tiny bug with outline monochrome
	* changed: the default style is now more sexy ;)
	* changed: tracking of spells has been rewritten
	* changed: class colors will now use RAID_CLASS_COLORS (this changes nothing for most of us)
	* added: option to disable spell tracking completely (saves cpu and ram for the sake of tinyness)
	* the usual tiny adjustments and polish

	Version 0.79
	* (re-)added: option to autohide in pvp
	* (re-)added: option to autohide when solo
	* your dps is shown in the button tooltip (minimap)
	* some tiny adjustments not really worth mentioning

	Version 0.78
	* fixed: tiny bug with percentages (introduced in previous update)
	* changed: tiny adjustment in reporting
	* changed: simplified options menu
	* changed: updating TinyDPS will not reset your settings anymore

	Version 0.77
	* fixed: tiny bug with auto reset
	* fixed: evading mobs are now ignored (this fixes occasional empty fights)
	* added: option to only keep boss segments
	* cleaned up some scripts

	Version 0.76
	* fixed: some saved variables had the wrong location
	* fixed: on some rare occasion, bars would not update
	* optimized: "OnUpdate" event
	* optimized: "autoreset" on new group
	* optimized: combat check and fight splitting
	* optimized: updating of bars
	* => overall cpu savings up to 25%
	* added: you can now report top 3
	* minor interface adjustments

	Version 0.71
	* fixed: small bug with overall healing
	* changed: settings are now saved per account
	* changed: tried to improve the options menu again
	* changed: command options (/tdps ? for help)
	* added: you can now report to channels
	* added: options for font shadow and outline
	* added: optional minimap button
	* re-added: "show only yourself"
	* loads of code tweaks

	Version 0.62 BETA
	* fixed: hitching problem
	* changed: context menu
	* added: option to hide when not in a group

	Version 0.61 BETA
	* fixed: bug causing error on displaying damage

	Version 0.60 BETA
	* added: auto reset on new group
	* added: option hide in pvp
	* added: spell detail
	* added: fight history
	* lots of code rewrite

	Version 0.42 BETA
	* fixed: detecting of pets of pets (read: greater fire/earth elementals)
	* changed: resizing is now with a tiny grip (bottom right of the frame)
	* added: you can now scroll
	* added: short dps format
	* many code tweaks

	Version 0.41 BETA
	* fixed: better pet tracking (also tracks water elementals now)
	* changed: reporting menu and code
	* changed: reworked color code and menu
	* added: there is now an option to show rank numbers
	* added: mousebutton3 resets data, mousebutton4 shows overall data, mousebutton5 shows current fight

	Version 0.40 BETA
	* fixed: problem with tracking of (some) players
	* fixed: bug with 'hide out of combat'
	* fixed: bug in reporting
	* changed: a new fight will now be started even when the first hit is a miss
	* changed: function names for scope security
	* added: you can change the anchor, meaning the frame can grow upwards now
	* added: you can separately show and hide damage, percentage or dps
	* added: no shared media yet, but I added a pixel-font for those who care :)

	Version 0.39 BETA
	* fixed: error in option 'show only yourself'
	* change: context menu cleaned once again
	* added: option to auto hide out of combat
	* added: commands: /tdps show | hide | reset
	* added: option to enable or disable DPS and Percent
	* code optimization

	Version 0.37 BETA
	* initial public release]]






---------------------------------------------------------------------------------------------------------------------------------
--- localization ----------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------



	local tdpsL = {}
	if GetLocale() == 'koKR' then

		tdpsL.fight = '전투'
		tdpsL.allFight = '전체     모든 전투'
		tdpsL.current = '현재 '
		tdpsL.resetAllData = '초기화'
		tdpsL.showDamage = '데미지 보기'
		tdpsL.showHealing = '힐량 보기'

		tdpsL.report = '보고'
		tdpsL.top3 = '상위 3'
		tdpsL.top5 = '상위 5'
		tdpsL.top10 = '상위 10'
		tdpsL.say = '일반'
		tdpsL.raid = '공격대'
		tdpsL.party = '파티'
		tdpsL.guild = '길드'
		tdpsL.officer = '지휘관'
		tdpsL.whisper = '귓속말'
		tdpsL.whisper2 = '귓속말 <Name>'
		tdpsL.channel = '채널'

		tdpsL.options = '설정'
		tdpsL.text = '문자'
		tdpsL.size = '크기'
		tdpsL.increase = '증가'
		tdpsL.decrease = '감소'
		tdpsL.font = '글꼴'
		tdpsL.layout = '표시'
		tdpsL.outline = '외곽선'
		tdpsL.nudge = '넛지'

		tdpsL.dps = 'DPS'
		tdpsL.rank = '순위'
		tdpsL.percent = '퍼센트'
		tdpsL.amount = '데미지'
		tdpsL.short = '요약'
		tdpsL.none = '없음'
		tdpsL.thin = '얇게'
		tdpsL.thick = '굵게'
		tdpsL.shadow = '그림자'
		tdpsL.mono = '단색'

		tdpsL.bars = '바'
		tdpsL.height = '높이'
		tdpsL.spacing = '간격'
		tdpsL.maximum = '줄'
		tdpsL.oneYourself = '1 (당신)'
		tdpsL.five = '5'
		tdpsL.ten = '10'
		tdpsL.fifteen = '15'
		tdpsL.twenty = '20'
		tdpsL.unlimited = '? (무제한)'

		tdpsL.colors = '색상'
		tdpsL.barBackdrop = '바 색상'
		tdpsL.frameBorder = '테두리 색상'
		tdpsL.frameBackdrop = '배경 색상'
		tdpsL.dimClassColors = '직업 색상 어둡게'
		tdpsL.resetClassColors = '직업 색상 초기화'
		tdpsL.swapBarTextColor = '직업 색상으로 표시'

		tdpsL.history = '      %i  전투 기록'
		tdpsL.keepOnlyBossFights = '보스만 세분화 유지'

		tdpsL.various = '전환'
		tdpsL.hideInPvP = '전장/투기장에서 숨김'
		tdpsL.hideWhenSolo = '솔로잉시 숨김'
		tdpsL.hideInCombat = 'Hide In Combat (needs translatation)'
		tdpsL.hideOutOfCombat = '비전투시 숨김'
		tdpsL.growUpwards = '하단을 기준으로'
		tdpsL.minimapButton = '미니맵 버튼 보기'
		tdpsL.trackSpellDetails = '툴팁에 기술/대상 보기'
		tdpsL.resetOnNewGroup = '새 그룹시 자동삭제'
		tdpsL.refreshEverySecond = '매시간 초기화'

		tdpsL.spells = '      %i  툴팁에 표시되는 기술 갯수'
		tdpsL.targets = '      %i  툴팁에 표시되는 대상 갯수'

		tdpsL.close = '취소'
		tdpsL.empty = '<없음>'

		tdpsL.helpVersion = '버젼'
		tdpsL.helpMove = '이동: 쉬프트를 누른채로 마우스 드래그'
		tdpsL.helpResize = '사이즈조절: 우측하단 모서리를 드래그'
		tdpsL.helpToggle = '명령: /tdps 입력시 프레임 숨김/보기'
		tdpsL.helpParameters1 = '/tdps help | reset | damage | healing | whisper <name>'
		tdpsL.helpParameters2 = '/tdps visiblebars <number> | reportlength <number>'

		tdpsL.allClear = '모든 데이터 초기화'
		tdpsL.personal = '자신'
		tdpsL.byPets = '소환수'
		tdpsL.topAbilities = '상위 기술'
		tdpsL.topTargets = '상위 대상'

		tdpsL.noTarget = '잘못된 대상 혹은 대상이 선택되지 않음'
		tdpsL.noData = '기록할 데이터가 없음'

		tdpsL.tipPrefix = {d = '데미지량 -', h = '힐량 -'}
		tdpsL.repPrefix = {d = '데미지량 -', h = '힐량 -'}
		tdpsL.overallData = '전체 전투'
		tdpsL.currentFight = '현재 전투'
		tdpsL.lastFight = '마지막 전투'
		tdpsL.melee = '밀리'

	elseif GetLocale() == 'ruRU' then

		tdpsL.fight = 'Бой'
		tdpsL.allFight = 'Общий       Все бои'
		tdpsL.current = 'Текущий'
		tdpsL.resetAllData = 'Сбросить статистику'
		tdpsL.showDamage = 'Показывать урон'
		tdpsL.showHealing = 'Показывать исцеление'	

		tdpsL.report = 'Сообщить'
		tdpsL.top3 = 'Top 3'
		tdpsL.top5 = 'Top 5'
		tdpsL.top10 = 'Top 10'
		tdpsL.say = 'Сказать'
		tdpsL.raid = 'Рейд'
		tdpsL.party = 'Группа'
		tdpsL.guild = 'Гильдия'
		tdpsL.officer = 'Офицер'
		tdpsL.whisper = 'Шепнуть'
		tdpsL.whisper2 = 'Шепнуть <Name>'
		tdpsL.channel = 'Канал'

		tdpsL.options = 'Опции'
		tdpsL.text = 'Текст'
		tdpsL.size = 'Размер'
		tdpsL.increase = 'Увеличить'
		tdpsL.decrease = 'Уменьшить'
		tdpsL.font = 'Шрифт'
		tdpsL.layout = 'Отображать...'
		tdpsL.outline = 'Контур'
		tdpsL.nudge = 'Поднять текст'  

		tdpsL.dps = 'Урон в секунду'
		tdpsL.rank = 'Ранг'
		tdpsL.percent = 'Проценты'
		tdpsL.amount = 'Урон'
		tdpsL.short = 'Сократить значения'
		tdpsL.none = 'Нет'
		tdpsL.thin = 'Тонкий'
		tdpsL.thick = 'Толстый'
		tdpsL.shadow = 'Тень'
		tdpsL.mono = 'Одноцветный'
		
		tdpsL.bars = 'Полоски'
		tdpsL.height = 'Высота'
		tdpsL.spacing = 'Промежуток'
		tdpsL.maximum = 'Максимум'
		tdpsL.oneYourself = '1 (Ваш персонаж)'
		tdpsL.five = '5'
		tdpsL.ten = '10'
		tdpsL.fifteen = '15'
		tdpsL.twenty = '20'
		tdpsL.unlimited = 'Неограничено'
		
		tdpsL.colors = 'Цвета'
		tdpsL.barBackdrop = 'Цвет полос'
		tdpsL.frameBorder = 'Цвет границ окна'
		tdpsL.frameBackdrop = 'Цвет текстуры окна'
		tdpsL.dimClassColors = 'Уменьшить яркость классовых цветов'
		tdpsL.resetClassColors = 'Сбросить классовые цвета'
		tdpsL.swapBarTextColor = 'Использовать цвета классов / 1 цвет для всех полос'

		tdpsL.history = '      Боёв запоминать: %i'
		tdpsL.keepOnlyBossFights = 'Запоминать только бои с боссами'

		tdpsL.various = 'Дополнительно'
		tdpsL.hideInPvP = 'Скрывать в PvP'
		tdpsL.hideWhenSolo = 'Скрывать вне группы'
		tdpsL.hideInCombat = 'Hide In Combat (needs translatation)'
		tdpsL.hideOutOfCombat = 'Показывать только в бою'
		tdpsL.growUpwards = 'Отображать новые полосы над предыдущими'
		tdpsL.minimapButton = 'Кнопка у миникарты'
		tdpsL.trackSpellDetails = 'Показывать детали (атакуемые цели/исп. способности)'
		tdpsL.resetOnNewGroup = 'Сбрасывать статистику при входе в группу'
		tdpsL.refreshEverySecond = 'Обновлять статистику каждую секунду'

		tdpsL.spells = '      Заклинаний в подсказке: %i'
		tdpsL.targets = '      Целей в подсказке: %i'

		tdpsL.close = 'Закрыть'
		tdpsL.empty = '<Нет>'

		tdpsL.helpVersion = 'Версия'
		tdpsL.helpMove = 'Перемещение: зажмите Shift и двигайте окно'
		tdpsL.helpResize = 'Смена размера: двигайте стрелку в правой нижней части окна'
		tdpsL.helpToggle = 'Команда: "/tdps" скрыть окно/показать'
		tdpsL.helpParameters1 = '/tdps help | reset | damage | healing | whisper <name>'
		tdpsL.helpParameters2 = '/tdps visiblebars <number> | reportlength <number>'

		tdpsL.allClear = 'Статистика была сброшена'
		tdpsL.personal = 'Личный'
		tdpsL.byPets = 'Питомец'
		tdpsL.topAbilities = 'Наиболее используемые способности'
		tdpsL.topTargets = 'Наиболее атакуемые цели'

		tdpsL.noTarget = 'Возьмите в цель игрока своей фракции'
		tdpsL.noData = 'Нет статистики для сообщения'

		tdpsL.tipPrefix = {d = 'Урон:', h = 'Исцеление:'}
		tdpsL.repPrefix = {d = 'Урон:', h = 'Исцеление:'}
		tdpsL.overallData = 'Все бои'
		tdpsL.currentFight = 'Текущий бой'
		tdpsL.lastFight = 'Последний бой'
		tdpsL.melee = 'Ближний бой'

	elseif GetLocale() == 'deDE' then

		tdpsL.fight = 'Kampf'
		tdpsL.allFight = 'Gesamt   Alle Kämpfe'
		tdpsL.current = 'Aktuell'
		tdpsL.resetAllData = 'Alle Daten zurücksetzen'
		tdpsL.showDamage = 'Schaden anzeigen'
		tdpsL.showHealing = 'Heilung anzeigen'	

		tdpsL.report = 'Verkünden'
		tdpsL.top3 = 'Top 3'
		tdpsL.top5 = 'Top 5'
		tdpsL.top10 = 'Top 10'
		tdpsL.say = 'Sagen'
		tdpsL.raid = 'Schlachtzug'
		tdpsL.party = 'Gruppe'
		tdpsL.guild = 'Gilde'
		tdpsL.officer = 'Offizier'
		tdpsL.whisper = 'Flüstern'
		tdpsL.whisper2 = 'Flüstern <Name>'
		tdpsL.channel = 'Channel'

		tdpsL.options = 'Optionen'
		tdpsL.text = 'Text'
		tdpsL.size = 'Größe'
		tdpsL.increase = 'Vergrößern'
		tdpsL.decrease = 'Verkleinern'
		tdpsL.font = 'Schriftart'
		tdpsL.layout = 'Layout'
		tdpsL.outline = 'Kontur'
		tdpsL.nudge = 'Anstoßen'

		tdpsL.dps = 'DPS'
		tdpsL.rank = 'Rang'
		tdpsL.percent = 'Prozent'
		tdpsL.amount = 'Menge'
		tdpsL.short = 'Kurzes Format'
		tdpsL.none = 'Keine'
		tdpsL.thin = 'Dünn'
		tdpsL.thick = 'Dick'
		tdpsL.shadow = 'Schatten'
		tdpsL.mono = 'Monochrome'
		
		tdpsL.bars = 'Leisten'
		tdpsL.height = 'Höhe'
		tdpsL.spacing = 'Abstand'
		tdpsL.maximum = 'Maximum'
		tdpsL.oneYourself = '1 (Du selbst)'
		tdpsL.five = '5'
		tdpsL.ten = '10'
		tdpsL.fifteen = '15'
		tdpsL.twenty = '20'
		tdpsL.unlimited = '? (Unbegrenzt)'

		tdpsL.colors = 'Farben'
		tdpsL.barBackdrop = 'Leisten - Hintergrund'
		tdpsL.frameBorder = 'Fenster - Rand'
		tdpsL.frameBackdrop = 'Fenster - Hintergrund'
		tdpsL.dimClassColors = 'Klassenfarben verdunkeln'
		tdpsL.resetClassColors = 'Klassenfarben zurücksetzen'
		tdpsL.swapBarTextColor = 'Leisten/Text Farben austauschen'
		
		tdpsL.history = '      %i  Historische Kämpfe'
		tdpsL.keepOnlyBossFights = 'Nur Bosskämpfe behalten'

		tdpsL.various = 'Verschiedenes'
		tdpsL.hideInPvP = 'In PvP verstecken'
		tdpsL.hideWhenSolo = 'Wenn solo, verstecken'
		tdpsL.hideInCombat = 'Hide In Combat (needs translatation)'
		tdpsL.hideOutOfCombat = 'Außerhalb des Kampfes verstecken'
		tdpsL.growUpwards = 'Aufwärts auflisten'
		tdpsL.minimapButton = 'Minimap Button'
		tdpsL.trackSpellDetails = 'Zauber Details aufzeichnen'
		tdpsL.resetOnNewGroup = 'Bei neuer Gruppe zurücksetzen'
		tdpsL.refreshEverySecond = 'Jede Sekunde aktualisieren'

		tdpsL.spells = '      %i  Zauber in Tooltips'
		tdpsL.targets = '      %i  Ziele in Tooltips'

		tdpsL.close = 'Abbrechen'
		tdpsL.empty = '<Leer>'

		tdpsL.helpVersion = 'Version'
		tdpsL.helpMove = 'move: Halte Umschalt gedrückt und bewege das Fenster'
		tdpsL.helpResize = 'resize: An der unteren rechten Ecke ziehen'
		tdpsL.helpToggle = 'command: Tippe /tpds ein um das Fenster anzuzeigen/auszublenden'
		tdpsL.helpParameters1 = '/tdps help | reset | damage | healing | whisper <name>'
		tdpsL.helpParameters2 = '/tdps visiblebars <number> | reportlength <number>'

		tdpsL.allClear = 'Alle Daten wurden zurückgesetzt'
		tdpsL.personal = 'Persönlich'
		tdpsL.byPets = 'Durch Begleiter'
		tdpsL.topAbilities = 'Top Fähigkeiten'
		tdpsL.topTargets = 'Top Ziele'

		tdpsL.noTarget = 'Ungültig oder kein Ziel ausgewählt'
		tdpsL.noData = 'Keine Daten vorhanden zum Verkünden'

		tdpsL.tipPrefix = {d = 'Schaden für', h = 'Heilung für'}
		tdpsL.repPrefix = {d = 'Schaden gemacht für', h = 'Geheilt für'}
		tdpsL.overallData = 'gesamte Daten'
		tdpsL.currentFight = 'aktuellen Kampf'
		tdpsL.lastFight = 'letzten Kampf'
		tdpsL.melee = 'Nahkampf'

	else

		tdpsL.fight = 'Fight'
		tdpsL.allFight = 'Overall     All Fights'
		tdpsL.current = 'Current'
		tdpsL.resetAllData = 'Reset All Data'
		tdpsL.showDamage = 'Show Damage'
		tdpsL.showHealing = 'Show Healing'	

		tdpsL.report = 'Report'
		tdpsL.top3 = 'Top 3'
		tdpsL.top5 = 'Top 5'
		tdpsL.top10 = 'Top 10'
		tdpsL.say = 'Say'
		tdpsL.raid = 'Raid'
		tdpsL.party = 'Party'
		tdpsL.guild = 'Guild'
		tdpsL.officer = 'Officer'
		tdpsL.whisper = 'Whisper Target'
		tdpsL.whisper2 = 'Whisper <Name>'
		tdpsL.channel = 'Channel'

		tdpsL.options = 'Options'
		tdpsL.text = 'Text'
		tdpsL.size = 'Size'
		tdpsL.increase = 'Increase'
		tdpsL.decrease = 'Decrease'
		tdpsL.font = 'Font'
		tdpsL.layout = 'Layout'
		tdpsL.outline = 'Outline'
		tdpsL.nudge = 'Nudge'

		tdpsL.dps = 'DPS'
		tdpsL.rank = 'Rank'
		tdpsL.percent = 'Percent'
		tdpsL.amount = 'Amount'
		tdpsL.short = 'Short Format'
		tdpsL.none = 'None'
		tdpsL.thin = 'Thin'
		tdpsL.thick = 'Thick'
		tdpsL.shadow = 'Shadow'
		tdpsL.mono = 'Monochrome'
		
		tdpsL.bars = 'Bars'
		tdpsL.height = 'Height'
		tdpsL.spacing = 'Spacing'
		tdpsL.maximum = 'Visible bars'
		tdpsL.oneYourself = '1 (Yourself)'
		tdpsL.five = '5'
		tdpsL.ten = '10'
		tdpsL.fifteen = '15'
		tdpsL.twenty = '20'
		tdpsL.unlimited = '? (Unlimited)'

		tdpsL.colors = 'Colors'
		tdpsL.barBackdrop = 'Bar Backdrop'
		tdpsL.frameBorder = 'Frame Border'
		tdpsL.frameBackdrop = 'Frame Backdrop'
		tdpsL.dimClassColors = 'Dim Class Colors'
		tdpsL.resetClassColors = 'Reset Class Colors'
		tdpsL.swapBarTextColor = 'Swap Bar/Text Color'
		
		tdpsL.history = '      %i  Historic Fights'
		tdpsL.keepOnlyBossFights = 'Keep Only Boss Fights'

		tdpsL.various = 'Various'
		tdpsL.hideAlways = 'Hide Always'
		tdpsL.hideInPvP = 'Hide In PvP'
		tdpsL.hideWhenSolo = 'Hide When Solo'
		tdpsL.hideInCombat = 'Hide In Combat'
		tdpsL.hideOutOfCombat = 'Hide Out Of Combat'
		tdpsL.growUpwards = 'Grow Upwards'
		tdpsL.minimapButton = 'Minimap Button'
		tdpsL.trackSpellDetails = 'Track Spell Details'
		tdpsL.resetOnNewGroup = 'Reset On New Group'
		tdpsL.refreshEverySecond = 'Refresh Every Second'

		tdpsL.spells = '      %i  Spells in Tooltips'
		tdpsL.targets = '      %i  Targets in Tooltips'

		tdpsL.close = 'Cancel'
		tdpsL.empty = '<Empty>'

		tdpsL.helpVersion = 'Version'
		tdpsL.helpMove = 'move: hold shift and drag the frame'
		tdpsL.helpResize = 'resize: drag the bottom right corner'
		tdpsL.helpToggle = 'toggle: type /tdps to hide or show'
		tdpsL.helpParameters1 = '/tdps help | reset | damage | healing | whisper <name>'
		tdpsL.helpParameters2 = '/tdps visiblebars <number> | reportlength <number>'

		tdpsL.allClear = 'All data has been reset'
		tdpsL.personal = 'Personal'
		tdpsL.byPets = 'By Pet(s)'
		tdpsL.topAbilities = 'Top Abilities'
		tdpsL.topTargets = 'Top Targets'

		tdpsL.noTarget = 'Invalid or no target selected'
		tdpsL.noData = 'No data to report'

		tdpsL.tipPrefix = {d = 'Damage for', h = 'Healing for'}
		tdpsL.repPrefix = {d = 'Damage Done for', h = 'Healing Done for'}
		tdpsL.overallData = 'Overall Data'
		tdpsL.currentFight = 'Current Fight'
		tdpsL.lastFight = 'Last Fight'
		tdpsL.melee = 'Melee'

	end







---------------------------------------------------------------------------------------------------------------------------------
--- variables -------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------



	local bu = {}
	local bar = {}
	local tdpsShield = {}
	local px, com, key, arg
	local maxValue, barsWithValue
	local scrollPos, isMovingOrSizing = 1, false
	local ttSpellMerge, ttMobMerge, ttSort = {}, {}, {}
	local cColor

	local isHeal = {SPELL_PERIODIC_HEAL = true, SPELL_HEAL = true}
	local isMiss = {SWING_MISSED = true, RANGE_MISSED = true, SPELL_MISSED = true, SPELL_PERIODIC_MISSED = true}
	local isDamage = {SWING_DAMAGE = true, RANGE_DAMAGE = true, SPELL_DAMAGE = true, SPELL_PERIODIC_DAMAGE = true, DAMAGE_SHIELD = true, DAMAGE_SPLIT = true}
	local isValidEvent = {SPELL_SUMMON = true, SPELL_HEAL = true, SPELL_PERIODIC_HEAL = true, SWING_DAMAGE = true, RANGE_DAMAGE = true, SPELL_DAMAGE = true, SPELL_PERIODIC_DAMAGE = true, DAMAGE_SHIELD = true, DAMAGE_SPLIT = true, SPELL_EXTRA_ATTACKS = true, SWING_MISSED = true, RANGE_MISSED = true, SPELL_MISSED = true, SPELL_PERIODIC_MISSED = true}



	local isAbsorb = {

		-- Priest
		[17]    = true, -- Power Word: Shield
		[47753] = true, -- Divine Aegis
		--[62618] = true, -- Power Word: Barrier (not trackable)

		-- Paladin
		[86273] = true, -- Illuminated Healing
		[88063] = true, -- Guarded by the Light

		-- Death Knight
		[51271] = true, -- Unbreakable Armor
		--[77535] = true, -- Blood Shield (not trackable)

		-- Mage
		[11426] = true, -- Ice Barrier
		[6143]  = true, -- Frost Ward
		[1463]  = true, -- Mana shield
		[543]   = true, -- Fire Ward

		-- Warlock
		[7812]  = true, -- Sacrifice
		[6229]  = true, -- Shadow Ward

		-- Miscellaneous
		[64411] = true, -- Blessing of the Ancient (Val'anyr Hammer of Ancient Kings)
		[64413] = true, -- Protection of Ancient Kings (Val'anyr Hammer of Ancient Kings)

	}



	local isExcludedPet = { -- database by myself (Sideshow)

		-- Totems
		[15447] = true, -- Wrath of Air Totem
		[6112]  = true, -- Windfury Totem
		[5924]  = true, -- Cleansing Totem
		[2630]  = true, -- Earthbind Totem
		[5913]  = true, -- Tremor Totem
		[5925]  = true, -- Grounding Totem
		[10467] = true, -- Mana Tide Totem
		[3573]  = true, -- Mana Spring Totem
		[5874]  = true, -- Strength of Earth Totem
		[5873]  = true, -- Stoneskin Totem
		[17539] = true, -- Totem of Wrath
		[3579]  = true, -- Stoneclaw Totem
		[5950]  = true, -- Flametongue Totem

		-- Miscellaneous
		[29742] = true, -- Snake Wrap
		[38163] = true, -- Swarming Shadows
		[36619] = true, -- Bone Spike
		[38711] = true, -- Bone Spike
		[38712] = true, -- Bone Spike
		[2671]  = true, -- Mechanical Squirrel
		[10598] = true, -- Smolderweb Hatchling
		[10259] = true, -- Worg Pup
		[28306] = true, -- Anti-Magic Zone

	}



	local isBoss = { -- LibBossIDs-1.0 r65 (Author: Elsia) http://www.wowace.com/addons/libbossids-1-0

	   -------------------------------------------------------------------------------
	   -- Abyssal Maw: Throne of the Tides
	   -------------------------------------------------------------------------------
	   [40586]	= true,	-- Lady Naz'jar
	   [40765]	= true,	-- Commander Ulthok
	   [40825]	= true,	-- Erunak Stonespeaker
	   [40788]	= true,	-- Mindbender Ghur'sha
	   [42172]	= true,	-- Ozumat? Not in heroic! /Mikk
	   [44566]  = true, -- Ozumat - confirmed in heroic! /Mikk

	   -------------------------------------------------------------------------------
	   -- Ahn'kahet: The Old Kingdom
	   -------------------------------------------------------------------------------
	   [29309]	= true,	-- Elder Nadox
	   [29308]	= true,	-- Prince Taldaram (Ahn'kahet: The Old Kingdom)
	   [29310]	= true,	-- Jedoga Shadowseeker
	   [29311]	= true,	-- Herald Volazj
	   [30258]	= true,	-- Amanitar (Heroic)

	   -------------------------------------------------------------------------------
	   -- Auchindoun: Auchenai Crypts
	   -------------------------------------------------------------------------------
	   [18371]	= true,	-- Shirrak the Dead Watcher
	   [18373]	= true,	-- Exarch Maladaar

	   -------------------------------------------------------------------------------
	   -- Auchindoun: Mana-Tombs
	   -------------------------------------------------------------------------------
	   [18341]	= true,	-- Pandemonius
	   [18343]	= true,	-- Tavarok
	   [22930]	= true,	-- Yor (Heroic)
	   [18344]	= true,	-- Nexus-Prince Shaffar

	   -------------------------------------------------------------------------------
	   -- Auchindoun: Sethekk Halls
	   -------------------------------------------------------------------------------
	   [18472]	= true,	-- Darkweaver Syth
	   [23035]	= true,	-- Anzu (Heroic)
	   [18473]	= true,	-- Talon King Ikiss

	   -------------------------------------------------------------------------------
	   -- Auchindoun: Shadow Labyrinth
	   -------------------------------------------------------------------------------
	   [18731]	= true,	-- Ambassador Hellmaw
	   [18667]	= true,	-- Blackheart the Inciter
	   [18732]	= true,	-- Grandmaster Vorpil
	   [18708]	= true,	-- Murmur

	   -------------------------------------------------------------------------------
	   -- Azjol-Nerub
	   -------------------------------------------------------------------------------
	   [28684]	= true,	-- Krik'thir the Gatewatcher
	   [28921]	= true,	-- Hadronox
	   [29120]	= true,	-- Anub'arak

	   -------------------------------------------------------------------------------
	   -- Azshara
	   -------------------------------------------------------------------------------
	   [14464]	= true,	-- Avalanchion
	   [6109]	= true,	-- Azuregos

	   -------------------------------------------------------------------------------
	   -- Black Temple
	   -------------------------------------------------------------------------------
	   [22887]	= true,	-- High Warlord Naj'entus
	   [22898]	= true,	-- Supremus
	   [22841]	= true,	-- Shade of Akama
	   [22871]	= true,	-- Teron Gorefiend
	   [22948]	= true,	-- Gurtogg Bloodboil
	   [23420]	= true,	-- Essence of Anger
	   [23419]	= true,	-- Essence of Desire
	   [23418]	= true,	-- Essence of Suffering
	   [22947]	= true,	-- Mother Shahraz
	   [23426]	= true,	-- Illidari Council
	   [22917]	= true,	-- Illidan Stormrage -- Not adding solo quest IDs for now
	   [22949]	= true,	-- Gathios the Shatterer
	   [22950]	= true,	-- High Nethermancer Zerevor
	   [22951]	= true,	-- Lady Malande
	   [22952]	= true,	-- Veras Darkshadow

	   -------------------------------------------------------------------------------
	   -- Baradin Hold
	   -------------------------------------------------------------------------------
	   [47120]	= true,	-- Argaloth

	   -------------------------------------------------------------------------------
	   -- Blackfathom Deeps
	   -------------------------------------------------------------------------------
	   [4829]	= true,	-- Aku'mai
	   [4830]	= true,	-- Old Serra'kis
	   [4831]	= true,	-- Lady Sarevess
	   [4832]	= true,	-- Twilight Lord Kelris
	   [4887]	= true,	-- Ghamoo-ra
	   [6243]	= true,	-- Gelihast
	   [12876]	= true,	-- Baron Aquanis
	   [12902]	= true,	-- Lorgus Jett

	   -------------------------------------------------------------------------------
	   -- Blackrock Depths: Detention Block
	   -------------------------------------------------------------------------------
	   [9018]	= true,	-- High Interrogator Gerstahn

	   -------------------------------------------------------------------------------
	   -- Blackrock Depths: Grim Guzzler
	   -------------------------------------------------------------------------------
	   [9543]	= true,	-- Ribbly Screwspigot
	   [9537]	= true,	-- Hurley Blackbreath
	   [9502]	= true,	-- Phalanx
	   [9499]	= true,	-- Plugger Spazzring
	   [23872]	= true,	-- Coren Direbrew

	   -------------------------------------------------------------------------------
	   -- Blackrock Depths: Halls of the Law
	   -------------------------------------------------------------------------------
	   [9025]	= true,	-- Lord Roccor
	   [9319]	= true,	-- Houndmaster Grebmar

	   -------------------------------------------------------------------------------
	   -- Blackrock Depths: Inner Blackrock Depths
	   -------------------------------------------------------------------------------
	   [9156]	= true,	-- Ambassador Flamelash
	   [8923]	= true,	-- Panzor the Invincible
	   [17808]	= true,	-- Anger'rel
	   [9039]	= true,	-- Doom'rel
	   [9040]	= true,	-- Dope'rel
	   [9037]	= true,	-- Gloom'rel
	   [9034]	= true,	-- Hate'rel
	   [9038]	= true,	-- Seeth'rel
	   [9036]	= true,	-- Vile'rel
	   [9938]	= true,	-- Magmus
	   [10076]	= true,	-- High Priestess of Thaurissan
	   [8929]	= true,	-- Princess Moira Bronzebeard
	   [9019]	= true,	-- Emperor Dagran Thaurissan

	   -------------------------------------------------------------------------------
	   -- Blackrock Depths: Outer Blackrock Depths
	   -------------------------------------------------------------------------------
	   [9024]	= true,	-- Pyromancer Loregrain
	   [9041]	= true,	-- Warder Stilgiss
	   [9042]	= true,	-- Verek
	   [9476]	= true,	-- Watchman Doomgrip

	   [9056]	= true,	-- Fineous Darkvire
	   [9017]	= true,	-- Lord Incendius
	   [9016]	= true,	-- Bael'Gar
	   [9033]	= true,	-- General Angerforge
	   [8983]	= true,	-- Golem Lord Argelmach
	   -- Dark Keepers, 6 of em: http://www.wowpedia.org/Dark_Keeper

	   -------------------------------------------------------------------------------
	   -- Blackrock Depths: Ring of Law (Arena)
	   -------------------------------------------------------------------------------
	   [9031]	= true,	-- Anub'shiah
	   [9029]	= true,	-- Eviscerator
	   [9027]	= true,	-- Gorosh the Dervish
	   [9028]	= true,	-- Grizzle
	   [9032]	= true,	-- Hedrum the Creeper
	   [9030]	= true,	-- Ok'thor the Breaker
	   [16059]	= true,	-- Theldren

	   -------------------------------------------------------------------------------
	   -- Blackrock Mountain: Blackrock Caverns
	   -------------------------------------------------------------------------------
	   [39665]	= true,	-- Rom'ogg Bonecrusher
	   [39679]	= true,	-- Corla, Herald of Twilight
	   [39698]	= true,	-- Karsh Steelbender
	   [39700]	= true,	-- Beauty
	   [39705]	= true,	-- Ascendant Lord Obsidius

	   -------------------------------------------------------------------------------
	   -- Blackrock Mountain: Blackwing Descent
	   -------------------------------------------------------------------------------
	   [41570]	= true,	-- Magmaw
	   [42166]	= true,	-- Arcanotron
	   [42178]	= true,	-- Magmatron
	   [42179]	= true,	-- Electron
	   [42180]	= true,	-- Toxitron
	   [41378]	= true,	-- Maloriak
	   [41442]	= true,	-- Atramedes
	   [43296]	= true,	-- Chimaeron
	   [41376]	= true,	-- Nefarian

	   -------------------------------------------------------------------------------
	   -- Blackwing Lair
	   -------------------------------------------------------------------------------
	   [12435]	= true,	-- Razorgore the Untamed
	   [13020]	= true,	-- Vaelastrasz the Corrupt
	   [12017]	= true,	-- Broodlord Lashlayer
	   [11983]	= true,	-- Firemaw
	   [14601]	= true,	-- Ebonroc
	   [11981]	= true,	-- Flamegor
	   [14020]	= true,	-- Chromaggus
	   [11583]	= true,	-- Nefarian
	   [12557]	= true,	-- Grethok the Controller
	   [10162]	= true,	-- Lord Victor Nefarius <Lord of Blackrock> (Also found in Blackrock Spire)

	   -------------------------------------------------------------------------------
	   -- Caverns of Time: Battle for Mount Hyjal
	   -------------------------------------------------------------------------------
	   [17767]	= true,	-- Rage Winterchill
	   [17808]	= true,	-- Anetheron
	   [17888]	= true,	-- Kaz'rogal
	   [17842]	= true,	-- Azgalor
	   [17968]	= true,	-- Archimonde

	   -------------------------------------------------------------------------------
	   -- Caverns of Time: Culling of Stratholme
	   -------------------------------------------------------------------------------
	   [26529]	= true,	-- Meathook
	   [26530]	= true,	-- Salramm the Fleshcrafter
	   [26532]	= true,	-- Chrono-Lord Epoch
	   [32273]	= true,	-- Infinite Corruptor
	   [26533]	= true,	-- Mal'Ganis
	   [29620]	= true,	-- Mal'Ganis

	   -------------------------------------------------------------------------------
	   -- Caverns of Time: Escape from Durnholde Keep
	   -------------------------------------------------------------------------------
	   [17848]	= true,	-- Lieutenant Drake
	   [17862]	= true,	-- Captain Skarloc
	   [18096]	= true,	-- Epoch Hunter
	   [28132]	= true,	-- Don Carlos

	   -------------------------------------------------------------------------------
	   -- Caverns of Time: Opening the Dark Portal
	   -------------------------------------------------------------------------------
	   [17879]	= true,	-- Chrono Lord Deja
	   [17880]	= true,	-- Temporus
	   [17881]	= true,	-- Aeonus

	   -------------------------------------------------------------------------------
	   -- Coilfang Reservoir: Serpentshrine Cavern
	   -------------------------------------------------------------------------------
	   [21216]	= true,	-- Hydross the Unstable
	   [21217]	= true,	-- The Lurker Below
	   [21215]	= true,	-- Leotheras the Blind
	   [21214]	= true,	-- Fathom-Lord Karathress
	   [21213]	= true,	-- Morogrim Tidewalker
	   [21212]	= true,	-- Lady Vashj
	   [21875]	= true,	-- Shadow of Leotheras

	   -------------------------------------------------------------------------------
	   -- Coilfang Reservoir: Slave Pens
	   -------------------------------------------------------------------------------
	   [25740]	= true,	-- Ahune
	   [17941]	= true,	-- Mennu the Betrayer
	   [17991]	= true,	-- Rokmar the Crackler
	   [17942]	= true,	-- Quagmirran

	   -------------------------------------------------------------------------------
	   -- Coilfang Reservoir: The Steamvault
	   -------------------------------------------------------------------------------
	   [17797]	= true,	-- Hydromancer Thespia
	   [17796]	= true,	-- Mekgineer Steamrigger
	   [17798]	= true,	-- Warlord Kalithresh

	   -------------------------------------------------------------------------------
	   -- Coilfang Reservoir: The Underbog
	   -------------------------------------------------------------------------------
	   [17770]	= true,	-- Hungarfen
	   [18105]	= true,	-- Ghaz'an
	   [17826]	= true,	-- Swamplord Musel'ek
	   [17827]	= true,	-- Claw <Swamplord Musel'ek's Pet>
	   [17882]	= true,	-- The Black Stalker

	   -------------------------------------------------------------------------------
	   -- Dire Maul: Arena
	   -------------------------------------------------------------------------------
	   [11447]	= true,	-- Mushgog
	   [11498]	= true,	-- Skarr the Unbreakable
	   [11497]	= true,	-- The Razza

	   -------------------------------------------------------------------------------
	   -- Dire Maul: East
	   -------------------------------------------------------------------------------
	   [14354]	= true,	-- Pusillin
	   [14327]	= true,	-- Lethtendris
	   [14349]	= true,	-- Pimgib
	   [13280]	= true,	-- Hydrospawn
	   [11490]	= true,	-- Zevrim Thornhoof
	   [11492]	= true,	-- Alzzin the Wildshaper
	   [16097]	= true,	-- Isalien

	   -------------------------------------------------------------------------------
	   -- Dire Maul: North
	   -------------------------------------------------------------------------------
	   [14326]	= true,	-- Guard Mol'dar
	   [14322]	= true,	-- Stomper Kreeg
	   [14321]	= true,	-- Guard Fengus
	   [14323]	= true,	-- Guard Slip'kik
	   [14325]	= true,	-- Captain Kromcrush
	   [14324]	= true,	-- Cho'Rush the Observer
	   [11501]	= true,	-- King Gordok

	   -------------------------------------------------------------------------------
	   -- Dire Maul: West
	   -------------------------------------------------------------------------------
	   [11489]	= true,	-- Tendris Warpwood
	   [11487]	= true,	-- Magister Kalendris
	   [11467]	= true,	-- Tsu'zee
	   [11488]	= true,	-- Illyanna Ravenoak
	   [14690]	= true,	-- Revanchion (Scourge Invasion)
	   [11496]	= true,	-- Immol'thar
	   [14506]	= true,	-- Lord Hel'nurath
	   [11486]	= true,	-- Prince Tortheldrin

	   -------------------------------------------------------------------------------
	   -- Drak'Tharon Keep
	   -------------------------------------------------------------------------------
	   [26630]	= true,	-- Trollgore
	   [26631]	= true,	-- Novos the Summoner
	   [27483]	= true,	-- King Dred
	   [26632]	= true,	-- The Prophet Tharon'ja
	   [27696]	= true,	-- The Prophet Tharon'ja
	   
	   -------------------------------------------------------------------------------
	   -- Firelands 4.2 PTR
	   -------------------------------------------------------------------------------
	   [52530]	= true,	-- Alysrazor
	   [53494]	= true,	-- Baleroc
	   [52498]	= true,	-- Bethtilac
	   [52571]	= true,	-- FandralStaghelm
	   [52409]	= true,	-- Ragnaros
	   [52558]	= true,	-- Rhyolith
	   [53691]	= true,	-- Shannox
	   
	   -------------------------------------------------------------------------------
	   -- Forge of Souls
	   -------------------------------------------------------------------------------
	   [36497]	= true,	-- Bronjahm
	   [36502]	= true,	-- Devourer of Souls
		  
	   -------------------------------------------------------------------------------
	   -- Gnomeregan
	   -------------------------------------------------------------------------------
	   [7800]	= true,	-- Mekgineer Thermaplugg
	   [7079]	= true,	-- Viscous Fallout
	   [7361]	= true,	-- Grubbis
	   [6235]	= true,	-- Electrocutioner 6000
	   [6229]	= true,	-- Crowd Pummeler 9-60
	   [6228]	= true,	-- Dark Iron Ambassador
	   [6231]	= true,	-- Techbot, outside

	   -------------------------------------------------------------------------------
	   -- Grim Batol
	   -------------------------------------------------------------------------------
	   [39625]	= true,	-- General Umbriss
	   [40177]	= true,	-- Forgemaster Throngus
	   [40319]	= true,	-- Drahga Shadowburner
	   [40484]	= true,	-- Erudax

	   -------------------------------------------------------------------------------
	   -- Gruul's Lair
	   -------------------------------------------------------------------------------
	   [18831]	= true,	-- High King Maulgar
	   [19044]	= true,	-- Gruul the Dragonkiller

	   -- Gruul's Lair: Maulgar's Ogre Council
	   [18835]	= true,	-- Kiggler the Crazed
	   [18836]	= true,	-- Blindeye the Seer
	   [18834]	= true,	-- Olm the Summoner
	   [18832]	= true,	-- Krosh Firehand

	   -------------------------------------------------------------------------------
	   -- Gundrak
	   -------------------------------------------------------------------------------
	   [29304]	= true,	-- Slad'ran
	   [29305]	= true,	-- Moorabi
	   [29307]	= true,	-- Drakkari Colossus
	   [29306]	= true,	-- Gal'darah
	   [29932]	= true,	-- Eck the Ferocious (Heroic)

	   -------------------------------------------------------------------------------
	   -- Halls of Lightning
	   -------------------------------------------------------------------------------
	   [28586]	= true,	-- General Bjarngrim
	   [28587]	= true,	-- Volkhan
	   [28546]	= true,	-- Ionar
	   [28923]	= true,	-- Loken

	   -------------------------------------------------------------------------------
	   -- Halls of Origination
	   -------------------------------------------------------------------------------
	   [39425]	= true,	-- Temple Guardian Anhuur
	   [39428]	= true,	-- Earthrager Ptah
	   [39788]	= true,	-- Anraphet
	   [39587]	= true,	-- Isiset
	   [39731]	= true,	-- Ammunae
	   [39732]	= true,	-- Setesh
	   [39378]	= true,	-- Rajh

	   -------------------------------------------------------------------------------
	   -- Halls of Reflection
	   -------------------------------------------------------------------------------
	   [38112]	= true,	-- Falric
	   [38113]	= true,	-- Marwyn
	   [37226]	= true,	-- The Lich King
	   [38113]	= true,	-- Marvyn

	   -------------------------------------------------------------------------------
	   -- Halls of Stone
	   -------------------------------------------------------------------------------
	   [27977]	= true,	-- Krystallus
	   [27975]	= true,	-- Maiden of Grief
	   [28234]	= true,	-- The Tribunal of Ages
	   [27978]	= true,	-- Sjonnir The Ironshaper

	   -------------------------------------------------------------------------------
	   -- Hellfire Citadel: Hellfire Ramparts
	   -------------------------------------------------------------------------------
	   [17306]	= true,	-- Watchkeeper Gargolmar
	   [17308]	= true,	-- Omor the Unscarred
	   [17537]	= true,	-- Vazruden
	   [17307]	= true,	-- Vazruden the Herald
	   [17536]	= true,	-- Nazan

	   -------------------------------------------------------------------------------
	   -- Hellfire Citadel: Magtheridon's Lair
	   -------------------------------------------------------------------------------
	   [17257]	= true,	-- Magtheridon

	   -------------------------------------------------------------------------------
	   -- Hellfire Citadel: Shattered Halls
	   -------------------------------------------------------------------------------
	   [16807]	= true,	-- Grand Warlock Nethekurse
	   [20923]	= true,	-- Blood Guard Porung (Heroic)
	   [16809]	= true,	-- Warbringer O'mrogg
	   [16808]	= true,	-- Warchief Kargath Bladefist

	   -------------------------------------------------------------------------------
	   -- Hellfire Citadel: The Blood Furnace
	   -------------------------------------------------------------------------------
	   [17381]	= true,	-- The Maker
	   [17380]	= true,	-- Broggok
	   [17377]	= true,	-- Keli'dan the Breaker

	   -------------------------------------------------------------------------------
	   -- Hellfire Peninsula
	   -------------------------------------------------------------------------------
	   [18728]	= true,	-- Doom Lord Kazzak
	   [12397]	= true,	-- Lord Kazzak

	   -------------------------------------------------------------------------------
	   -- Icecrown Citadel
	   -------------------------------------------------------------------------------
	   [36612]	= true,	-- Lord Marrowgar
	   [36855]	= true,	-- Lady Deathwhisper

	   -- Gunship Battle
	   [37813]	= true,	-- Deathbringer Saurfang
	   [36626]	= true,	-- Festergut
	   [36627]	= true,	-- Rotface
	   [36678]	= true,	-- Professor Putricide
	   [37972]	= true,	-- Prince Keleseth (Icecrown Citadel)
	   [37970]	= true,	-- Prince Valanar
	   [37973]	= true,	-- Prince Taldaram (Icecrown Citadel)
	   [37955]	= true,	-- Queen Lana'thel
	   [36789]	= true,	-- Valithria Dreamwalker
	   [37950]	= true,	-- Valithria Dreamwalker (Phased)
	   [37868]	= true,	-- Risen Archmage, Valitrhia Add
	   [36791]	= true,	-- Blazing Skeleton, Valithria Add
	   [37934]	= true,	-- Blistering Zombie, Valithria Add
	   [37886]	= true,	-- Gluttonous Abomination, Valithria Add
	   [37985]	= true,	-- Dream Cloud , Valithria "Add"
	   [36853]	= true,	-- Sindragosa
	   [36597]	= true,	-- The Lich King (Icecrown Citadel)
	   [37217]	= true,	-- Precious
	   [37025]	= true,	-- Stinki
	   [36661]	= true,	-- Rimefang <Drake of Tyrannus>

	   -------------------------------------------------------------------------------
	   -- Karazhan
	   -------------------------------------------------------------------------------
	   [15550]	= true,	-- Attumen the Huntsman
	   [16151]	= true,	-- Midnight
	   [28194]	= true,	-- Tenris Mirkblood (Scourge invasion)
	   [15687]	= true,	-- Moroes
	   [16457]	= true,	-- Maiden of Virtue
	   [15691]	= true,	-- The Curator
	   [15688]	= true,	-- Terestian Illhoof
	   [16524]	= true,	-- Shade of Aran
	   [15689]	= true,	-- Netherspite
	   [15690]	= true,	-- Prince Malchezaar
	   [17225]	= true,	-- Nightbane
	   [17229]	= true,	-- Kil'rek
	   -- Chess event

	   -------------------------------------------------------------------------------
	   -- Karazhan: Servants' Quarters Beasts
	   -------------------------------------------------------------------------------
	   [16179]	= true,	-- Hyakiss the Lurker
	   [16181]	= true,	-- Rokad the Ravager
	   [16180]	= true,	-- Shadikith the Glider

	   -------------------------------------------------------------------------------
	   -- Karazhan: Opera Event
	   -------------------------------------------------------------------------------
	   [17535]	= true,	-- Dorothee
	   [17546]	= true,	-- Roar
	   [17543]	= true,	-- Strawman
	   [17547]	= true,	-- Tinhead
	   [17548]	= true,	-- Tito
	   [18168]	= true,	-- The Crone
	   [17521]	= true,	-- The Big Bad Wolf
	   [17533]	= true,	-- Romulo
	   [17534]	= true,	-- Julianne

	   -------------------------------------------------------------------------------
	   -- Lost City of the Tol'vir
	   -------------------------------------------------------------------------------
	   [44577]	= true,	-- General Husam
	   [43612]	= true,	-- High Prophet Barim
	   [43614]	= true,	-- Lockmaw
	   [49045]	= true,	-- Augh
	   [44819]	= true,	-- Siamat

	   -------------------------------------------------------------------------------
	   -- Lower Blackrock Spire
	   -------------------------------------------------------------------------------
	   [10263]	= true,	-- Burning Felguard
	   [9218]	= true,	-- Spirestone Battle Lord
	   [9219]	= true,	-- Spirestone Butcher
	   [9217]	= true,	-- Spirestone Lord Magus
	   [9196]	= true,	-- Highlord Omokk
	   [9236]	= true,	-- Shadow Hunter Vosh'gajin
	   [9237]	= true,	-- War Master Voone
	   [16080]	= true,	-- Mor Grayhoof
	   [9596]	= true,	-- Bannok Grimaxe
	   [10596]	= true,	-- Mother Smolderweb
	   [10376]	= true,	-- Crystal Fang
	   [10584]	= true,	-- Urok Doomhowl
	   [9736]	= true,	-- Quartermaster Zigris
	   [10220]	= true,	-- Halycon
	   [10268]	= true,	-- Gizrul the Slavener
	   [9718]	= true,	-- Ghok Bashguud
	   [9568]	= true,	-- Overlord Wyrmthalak

	   -------------------------------------------------------------------------------
	   -- Magisters' Terrace
	   -------------------------------------------------------------------------------
	   [24723]	= true,	-- Selin Fireheart
	   [24744]	= true,	-- Vexallus
	   [24560]	= true,	-- Priestess Delrissa
	   [24664]	= true,	-- Kael'thas Sunstrider

	   -------------------------------------------------------------------------------
	   -- Maraudon
	   -------------------------------------------------------------------------------
	   -- [13718]	= true,	-- The Nameless Prophet (Pre-instance)
	   [13742]	= true,	-- Kolk <The First Khan>
	   [13741]	= true,	-- Gelk <The Second Khan>
	   [13740]	= true,	-- Magra <The Third Khan>
	   [13739]	= true,	-- Maraudos <The Fourth Khan>
	   [12236]	= true,	-- Lord Vyletongue
	   [13738]	= true,	-- Veng <The Fifth Khan>
	   [13282]	= true,	-- Noxxion
	   [12258]	= true,	-- Razorlash
	   [12237]	= true,	-- Meshlok the Harvester
	   [12225]	= true,	-- Celebras the Cursed
	   [12203]	= true,	-- Landslide
	   [13601]	= true,	-- Tinkerer Gizlock
	   [13596]	= true,	-- Rotgrip
	   [12201]	= true,	-- Princess Theradras

	   -------------------------------------------------------------------------------
	   -- Molten Core
	   -------------------------------------------------------------------------------
	   [12118]	= true,	-- Lucifron
	   [11982]	= true,	-- Magmadar
	   [12259]	= true,	-- Gehennas
	   [12057]	= true,	-- Garr
	   [12056]	= true,	-- Baron Geddon
	   [12264]	= true,	-- Shazzrah
	   [12098]	= true,	-- Sulfuron Harbinger
	   [11988]	= true,	-- Golemagg the Incinerator
	   [12018]	= true,	-- Majordomo Executus
	   [11502]	= true,	-- Ragnaros

	   -------------------------------------------------------------------------------
	   -- Nagrand
	   -------------------------------------------------------------------------------
	   [18398]	= true,	-- Brokentoe
	   [18069]	= true,	-- Mogor <Hero of the Warmaul>, friendly
	   [18399]	= true,	-- Murkblood Twin
	   [18400]	= true,	-- Rokdar the Sundered Lord
	   [18401]	= true,	-- Skra'gath
	   [18402]	= true,	-- Warmaul Champion

	   -------------------------------------------------------------------------------
	   -- Naxxramas
	   -------------------------------------------------------------------------------
	   [30549]	= true,	-- Baron Rivendare (Naxxramas)
	   [16803]	= true,	-- Death Knight Understudy
	   [15930]	= true,	-- Feugen
	   [15929]	= true,	-- Stalagg

	   -------------------------------------------------------------------------------
	   -- Naxxramas: Abomination Wing
	   -------------------------------------------------------------------------------
	   [16028]	= true,	-- Patchwerk
	   [15931]	= true,	-- Grobbulus
	   [15932]	= true,	-- Gluth
	   [15928]	= true,	-- Thaddius

	   -------------------------------------------------------------------------------
	   -- Naxxramas: Deathknight Wing
	   -------------------------------------------------------------------------------
	   [16061]	= true,	-- Instructor Razuvious
	   [16060]	= true,	-- Gothik the Harvester

	   -------------------------------------------------------------------------------
	   -- Naxxramas: Frostwyrm Lair
	   -------------------------------------------------------------------------------
	   [15989]	= true,	-- Sapphiron
	   [15990]	= true,	-- Kel'Thuzad
	   [25465]	= true,	-- Kel'Thuzad

	   -------------------------------------------------------------------------------
	   -- Naxxramas: Plague Wing
	   -------------------------------------------------------------------------------
	   [15954]	= true,	-- Noth the Plaguebringer
	   [15936]	= true,	-- Heigan the Unclean
	   [16011]	= true,	-- Loatheb

	   -------------------------------------------------------------------------------
	   -- Naxxramas: Spider Wing
	   -------------------------------------------------------------------------------
	   [15956]	= true,	-- Anub'Rekhan
	   [15953]	= true,	-- Grand Widow Faerlina
	   [15952]	= true,	-- Maexxna

	   -------------------------------------------------------------------------------
	   -- Naxxramas: The Four Horsemen
	   -------------------------------------------------------------------------------
	   [16065]	= true,	-- Lady Blaumeux
	   [16064]	= true,	-- Thane Korth'azz
	   [16062]	= true,	-- Highlord Mograine
	   [16063]	= true,	-- Sir Zeliek

	   -------------------------------------------------------------------------------
	   -- Obsidian Sanctum
	   -------------------------------------------------------------------------------
	   [30451]	= true,	-- Shadron
	   [30452]	= true,	-- Tenebron
	   [30449]	= true,	-- Vesperon
	   [28860]	= true,	-- Sartharion

	   -------------------------------------------------------------------------------
	   -- Onyxia's Lair
	   -------------------------------------------------------------------------------
	   [10184]	= true,	-- Onyxia

	   -------------------------------------------------------------------------------
	   -- Pit of Saron
	   -------------------------------------------------------------------------------
	   [36494]	= true,	-- Forgemaster Garfrost
	   [36477]	= true,	-- Krick
	   [36476]	= true,	-- Ick <Krick's Minion>
	   [36658]	= true,	-- Scourgelord Tyrannus

	   -------------------------------------------------------------------------------
	   -- Ragefire Chasm
	   -------------------------------------------------------------------------------
	   [11517]	= true,	-- Oggleflint
	   [11518]	= true,	-- Jergosh the Invoker
	   [11519]	= true,	-- Bazzalan
	   [11520]	= true,	-- Taragaman the Hungerer
	   [17830]	= true,	-- Zelemar the Wrathful

	   -------------------------------------------------------------------------------
	   -- Razorfen Downs
	   -------------------------------------------------------------------------------
	   [7355]	= true,	-- Tuten'kash
	   [14686]	= true,	-- Lady Falther'ess (Scourge invasion only)
	   [7356]	= true,	-- Plaguemaw the Rotting
	   [7357]	= true,	-- Mordresh Fire Eye
	   [8567]	= true,	-- Glutton
	   [7354]	= true,	-- Ragglesnout
	   [7358]	= true,	-- Amnennar the Coldbringer

	   -------------------------------------------------------------------------------
	   -- Razorfen Kraul
	   -------------------------------------------------------------------------------
	   [4421]	= true,	-- Charlga Razorflank
	   [4420]	= true,	-- Overlord Ramtusk
	   [4422]	= true,	-- Agathelos the Raging
	   [4428]	= true,	-- Death Speaker Jargba
	   [4424]	= true,	-- Aggem Thorncurse
	   [6168]	= true,	-- Roogug
	   [4425]	= true,	-- Blind Hunter
	   [4842]	= true,	-- Earthcaller Halmgar

	   -------------------------------------------------------------------------------
	   -- Ruby Sanctum
	   -------------------------------------------------------------------------------
	   [39746]	= true,	-- Zarithrian
	   [39747]	= true,	-- Saviana
	   [39751]	= true,	-- Baltharus
	   [39863]	= true,	-- Halion
	   [39899]	= true,	-- Baltharus (Copy has an own id apparently)
	   [40142]	= true,	-- Halion (twilight realm)

	   -------------------------------------------------------------------------------
	   -- Ruins of Ahn'Qiraj
	   -------------------------------------------------------------------------------
	   [15348]	= true,	-- Kurinnaxx
	   [15341]	= true,	-- General Rajaxx
	   [15340]	= true,	-- Moam
	   [15370]	= true,	-- Buru the Gorger
	   [15369]	= true,	-- Ayamiss the Hunter
	   [15339]	= true,	-- Ossirian the Unscarred

	   -------------------------------------------------------------------------------
	   -- Scarlet Monastery: Armory
	   -------------------------------------------------------------------------------
	   [3975]	= true,	-- Herod

	   -------------------------------------------------------------------------------
	   -- Scarlet Monastery: Cathedral
	   -------------------------------------------------------------------------------
	   [4542]	= true,	-- High Inquisitor Fairbanks
	   [3976]	= true,	-- Scarlet Commander Mograine
	   [3977]	= true,	-- High Inquisitor Whitemane

	   -------------------------------------------------------------------------------
	   -- Scarlet Monastery: Graveyard
	   -------------------------------------------------------------------------------
	   [3983]	= true,	-- Interrogator Vishas
	   [6488]	= true,	-- Fallen Champion
	   [6490]	= true,	-- Azshir the Sleepless
	   [6489]	= true,	-- Ironspine
	   [14693]	= true,	-- Scorn (Scourge invasion only)
	   [4543]	= true,	-- Bloodmage Thalnos
	   [23682]	= true,	-- Headless Horseman
	   [23800]	= true,	-- Headless Horseman

	   -------------------------------------------------------------------------------
	   -- Scarlet Monastery: Library
	   -------------------------------------------------------------------------------
	   [3974]	= true,	-- Houndmaster Loksey
	   [6487]	= true,	-- Arcanist Doan

	   -------------------------------------------------------------------------------
	   -- Scholomance
	   -------------------------------------------------------------------------------
	   [14861]	= true,	-- Blood Steward of Kirtonos
	   [10506]	= true,	-- Kirtonos the Herald
	   [14695]	= true,	-- Lord Blackwood (Scourge Invasion)
	   [10503]	= true,	-- Jandice Barov
	   [11622]	= true,	-- Rattlegore
	   [14516]	= true,	-- Death Knight Darkreaver
	   [10433]	= true,	-- Marduk Blackpool
	   [10432]	= true,	-- Vectus
	   [16118]	= true,	-- Kormok
	   [10508]	= true,	-- Ras Frostwhisper
	   [10505]	= true,	-- Instructor Malicia
	   [11261]	= true,	-- Doctor Theolen Krastinov
	   [10901]	= true,	-- Lorekeeper Polkelt
	   [10507]	= true,	-- The Ravenian
	   [10504]	= true,	-- Lord Alexei Barov
	   [10502]	= true,	-- Lady Illucia Barov
	   [1853]	= true,	-- Darkmaster Gandling

	   -------------------------------------------------------------------------------
	   -- Searing Gorge
	   -------------------------------------------------------------------------------
	   [9026]	= true,	-- Overmaster Pyron

	   -------------------------------------------------------------------------------
	   -- Shadowfang Keep
	   -------------------------------------------------------------------------------
	   [3914]	= true,	-- Rethilgore
	   [3886]	= true,	-- Razorclaw the Butcher
	   [4279]	= true,	-- Odo the Blindwatcher
	   [3887]	= true,	-- Baron Silverlaine
	   [4278]	= true,	-- Commander Springvale
	   [4274]	= true,	-- Fenrus the Devourer
	   [3927]	= true,	-- Wolf Master Nandos
	   [14682]	= true,	-- Sever (Scourge invasion only)
	   [4275]	= true,	-- Archmage Arugal
	   [3872]	= true,	-- Deathsworn Captain
	   [46962]	= true,	-- Baron Ashbury
	   [46963]	= true,	-- Lord Walden
	   [46964]	= true,	-- Lord Godfrey

	   -------------------------------------------------------------------------------
	   -- Shadowmoon Valley
	   -------------------------------------------------------------------------------
	   [17711]	= true,	-- Doomwalker

	   -------------------------------------------------------------------------------
	   -- Silithus
	   -------------------------------------------------------------------------------
	   [15205]	= true,	-- Baron Kazum <Abyssal High Council>
	   [15204]	= true,	-- High Marshal Whirlaxis <Abyssal High Council>
	   [15305]	= true,	-- Lord Skwol <Abyssal High Council>
	   [15203]	= true,	-- Prince Skaldrenox <Abyssal High Council>
	   [14454]	= true,	-- The Windreaver

	   -------------------------------------------------------------------------------
	   -- Stormwind Stockade
	   -------------------------------------------------------------------------------
	   [1716]	= true,	-- Bazil Thredd
	   [1663]	= true,	-- Dextren Ward
	   [1717]	= true,	-- Hamhock
	   [1666]	= true,	-- Kam Deepfury
	   [1696]	= true,	-- Targorr the Dread
	   [1720]	= true,	-- Bruegal Ironknuckle
	   -- Cata:
	   [46383]  = true, -- Randolph Moloch
	   [46264]  = true, -- Lord Overheat
	   [46254]  = true, -- Hogger

	   -------------------------------------------------------------------------------
	   -- Stratholme: Scarlet Stratholme
	   -------------------------------------------------------------------------------
	   [10393]	= true,	-- Skul
	   [14684]	= true,	-- Balzaphon (Scourge Invasion)
	   -- [11082]	= true,	-- Stratholme Courier
	   [11058]	= true,	-- Fras Siabi
	   [10558]	= true,	-- Hearthsinger Forresten
	   [10516]	= true,	-- The Unforgiven
	   [16387]	= true,	-- Atiesh
	   [11143]	= true,	-- Postmaster Malown
	   [10808]	= true,	-- Timmy the Cruel
	   [11032]	= true,	-- Malor the Zealous
	   [11120]	= true,	-- Crimson Hammersmith
	   [10997]	= true,	-- Cannon Master Willey
	   [10811]	= true,	-- Archivist Galford
	   [10813]	= true,	-- Balnazzar
	   [16101]	= true,	-- Jarien
	   [16102]	= true,	-- Sothos

	   -------------------------------------------------------------------------------
	   -- Stratholme: Defenders of the Chapel
	   -------------------------------------------------------------------------------
	   [17913]	= true,	-- Aelmar the Vanquisher
	   [17911]	= true,	-- Cathela the Seeker
	   [17910]	= true,	-- Gregor the Justiciar
	   [17914]	= true,	-- Vicar Hieronymus
	   [17912]	= true,	-- Nemas the Arbiter

	   -------------------------------------------------------------------------------
	   -- Stratholme: Undead Stratholme
	   -------------------------------------------------------------------------------
	   [10809]	= true,	-- Stonespine
	   [10437]	= true,	-- Nerub'enkan
	   [10436]	= true,	-- Baroness Anastari
	   [11121]	= true,	-- Black Guard Swordsmith
	   [10438]	= true,	-- Maleki the Pallid
	   [10435]	= true,	-- Magistrate Barthilas
	   [10439]	= true,	-- Ramstein the Gorger
	   [10440]	= true,	-- Baron Rivendare (Stratholme)

	   -------------------------------------------------------------------------------
	   -- Sunwell Plateau
	   -------------------------------------------------------------------------------
	   [24891]	= true,	-- Kalecgos
	   [25319]	= true,	-- Kalecgos
	   [24850]	= true,	-- Kalecgos
	   [24882]	= true,	-- Brutallus
	   [25038]	= true,	-- Felmyst
	   [25165]	= true,	-- Lady Sacrolash
	   [25166]	= true,	-- Grand Warlock Alythess
	   [25741]	= true,	-- M'uru
	   [25315]	= true,	-- Kil'jaeden
	   [25840]	= true,	-- Entropius
	   [24892]	= true,	-- Sathrovarr the Corruptor

	   -------------------------------------------------------------------------------
	   -- Tempest Keep: The Arcatraz
	   -------------------------------------------------------------------------------
	   [20870]	= true,	-- Zereketh the Unbound
	   [20886]	= true,	-- Wrath-Scryer Soccothrates
	   [20885]	= true,	-- Dalliah the Doomsayer
	   [20912]	= true,	-- Harbinger Skyriss
	   [20904]	= true,	-- Warden Mellichar

	   -------------------------------------------------------------------------------
	   -- Tempest Keep: The Botanica
	   -------------------------------------------------------------------------------
	   [17976]	= true,	-- Commander Sarannis
	   [17975]	= true,	-- High Botanist Freywinn
	   [17978]	= true,	-- Thorngrin the Tender
	   [17980]	= true,	-- Laj
	   [17977]	= true,	-- Warp Splinter

	   -------------------------------------------------------------------------------
	   -- Tempest Keep: The Eye
	   -------------------------------------------------------------------------------
	   [19514]	= true,	-- Al'ar
	   [19516]	= true,	-- Void Reaver
	   [18805]	= true,	-- High Astromancer Solarian
	   [19622]	= true,	-- Kael'thas Sunstrider
	   [20064]	= true,	-- Thaladred the Darkener
	   [20060]	= true,	-- Lord Sanguinar
	   [20062]	= true,	-- Grand Astromancer Capernian
	   [20063]	= true,	-- Master Engineer Telonicus
	   [21270]	= true,	-- Cosmic Infuser
	   [21269]	= true,	-- Devastation
	   [21271]	= true,	-- Infinity Blades
	   [21268]	= true,	-- Netherstrand Longbow
	   [21273]	= true,	-- Phaseshift Bulwark
	   [21274]	= true,	-- Staff of Disintegration
	   [21272]	= true,	-- Warp Slicer

	   -------------------------------------------------------------------------------
	   -- Tempest Keep: The Mechanar
	   -------------------------------------------------------------------------------
	   [19218]	= true,	-- Gatewatcher Gyro-Kill
	   [19710]	= true,	-- Gatewatcher Iron-Hand
	   [19219]	= true,	-- Mechano-Lord Capacitus
	   [19221]	= true,	-- Nethermancer Sepethrea
	   [19220]	= true,	-- Pathaleon the Calculator

	   -------------------------------------------------------------------------------
	   -- Temple of Ahn'Qiraj
	   -------------------------------------------------------------------------------
	   [15263]	= true,	-- The Prophet Skeram
	   [15511]	= true,	-- Lord Kri
	   [15543]	= true,	-- Princess Yauj
	   [15544]	= true,	-- Vem
	   [15516]	= true,	-- Battleguard Sartura
	   [15510]	= true,	-- Fankriss the Unyielding
	   [15299]	= true,	-- Viscidus
	   [15509]	= true,	-- Princess Huhuran
	   [15276]	= true,	-- Emperor Vek'lor
	   [15275]	= true,	-- Emperor Vek'nilash
	   [15517]	= true,	-- Ouro
	   [15727]	= true,	-- C'Thun
	   [15589]	= true,	-- Eye of C'Thun

	   -------------------------------------------------------------------------------
	   -- Temple of Atal'Hakkar
	   -------------------------------------------------------------------------------
	   [1063]	= true,	-- Jade
	   [5400]	= true,	-- Zekkis
	   [5713]	= true,	-- Gasher
	   [5715]	= true,	-- Hukku
	   [5714]	= true,	-- Loro
	   [5717]	= true,	-- Mijan
	   [5712]	= true,	-- Zolo
	   [5716]	= true,	-- Zul'Lor
	   [5399]	= true,	-- Veyzhak the Cannibal
	   [5401]	= true,	-- Kazkaz the Unholy
	   [8580]	= true,	-- Atal'alarion
	   [8443]	= true,	-- Avatar of Hakkar
	   [5711]	= true,	-- Ogom the Wretched
	   [5710]	= true,	-- Jammal'an the Prophet
	   [5721]	= true,	-- Dreamscythe
	   [5720]	= true,	-- Weaver
	   [5719]	= true,	-- Morphaz
	   [5722]	= true,	-- Hazzas
	   [5709]	= true,	-- Shade of Eranikus

	   -------------------------------------------------------------------------------
	   -- The Bastion of Twilight
	   -------------------------------------------------------------------------------
	   [45992]	= true,	-- Valiona
	   [45993]	= true,	-- Theralion
	   [44600]	= true,	-- Halfus Wyrmbreaker
	   [43686]	= true,	-- Ignacious
	   [43687]	= true,	-- Feludius
	   [43688]	= true,	-- Arion
	   [43689]	= true,	-- Terrastra
	   [43735]	= true,	-- Elementium Monstrosity
	   [43324]	= true, -- Cho'gall
	   [45213]	= true,	-- Sinestra (heroic) drycoded from http://db.mmo-champion.com/c/45213/sinestra/

	   -------------------------------------------------------------------------------
	   -- The Deadmines
	   -------------------------------------------------------------------------------
	   [642]	= true,	-- Sneed's Shredder
	   [643]	= true,	-- Sneed
	   [644]	= true,	-- Rhahk'Zor
	   [645]	= true,	-- Cookie
	   [646]	= true,	-- Mr. Smite
	   [647]	= true,	-- Captain Greenskin
	   [3586]	= true,	-- Miner Johnson
	   [1763]	= true,	-- Gilnid
	   [639]	= true,	-- Edwin VanCleef
	   [596]	= true,	-- Brainwashed Noble, outside
	   [626]	= true,	-- Foreman Thistlenettle, outside
	   [599]	= true,	-- Marisa du'Paige, outside
	   [47162]	= true,	-- Glubtok
	   [47296]	= true,	-- Helix Gearbreaker
	   [43778]	= true,	-- Foe Reaper 5000
	   [47626]	= true,	-- Admiral Ripsnarl
	   [47739]	= true,	-- "Captain" Cookie
	   [49541]	= true,	-- Vanessa VanCleef

	   -------------------------------------------------------------------------------
	   -- The Eye of Eternity
	   -------------------------------------------------------------------------------
	   [28859]	= true,	-- Malygos

	   -------------------------------------------------------------------------------
	   -- The Nexus
	   -------------------------------------------------------------------------------
	   [26798]	= true,	-- Commander Kolurg (Heroic)
	   [26796]	= true,	-- Commander Stoutbeard (Heroic)
	   [26731]	= true,	-- Grand Magus Telestra
	   [26832]	= true,	-- Grand Magus Telestra
	   [26928]	= true,	-- Grand Magus Telestra
	   [26929]	= true,	-- Grand Magus Telestra
	   [26930]	= true,	-- Grand Magus Telestra
	   [26763]	= true,	-- Anomalus
	   [26794]	= true,	-- Ormorok the Tree-Shaper
	   [26723]	= true,	-- Keristrasza

	   -------------------------------------------------------------------------------
	   -- The Oculus
	   -------------------------------------------------------------------------------
	   [27654]	= true,	-- Drakos the Interrogator
	   [27447]	= true,	-- Varos Cloudstrider
	   [27655]	= true,	-- Mage-Lord Urom
	   [27656]	= true,	-- Ley-Guardian Eregos

	   -------------------------------------------------------------------------------
	   -- The Stonecore
	   -------------------------------------------------------------------------------
	   [43438]	= true,	-- Corborus
	   [43214]	= true,	-- Slabhide
	   [42188]	= true,	-- Ozruk
	   [42333]	= true,	-- High Priestess Azil

	   -------------------------------------------------------------------------------
	   -- The Violet Hold
	   -------------------------------------------------------------------------------
	   [29315]	= true,	-- Erekem
	   [29313]	= true,	-- Ichoron
	   [29312]	= true,	-- Lavanthor
	   [29316]	= true,	-- Moragg
	   [29266]	= true,	-- Xevozz
	   [29314]	= true,	-- Zuramat the Obliterator
	   [31134]	= true,	-- Cyanigosa

	   -------------------------------------------------------------------------------
	   -- The Vortex Pinnacle
	   -------------------------------------------------------------------------------
	   [43878]	= true,	-- Grand Vizier Ertan
	   [43873]	= true,	-- Altairus
	   [43875]	= true,	-- Asaad

	   -------------------------------------------------------------------------------
	   -- Throne of the Four Winds
	   -------------------------------------------------------------------------------
	   [45871]	= true,	-- Nezir
	   [46753]	= true,	-- Al'Akir

	   -------------------------------------------------------------------------------
	   -- Trial of the Champion
	   -------------------------------------------------------------------------------
	   -- Alliance
	   [35617]	= true,	-- Deathstalker Visceri <Grand Champion of Undercity>
	   [35569]	= true,	-- Eressea Dawnsinger <Grand Champion of Silvermoon>
	   [35572]	= true,	-- Mokra the Skullcrusher <Grand Champion of Orgrimmar>
	   [35571]	= true,	-- Runok Wildmane <Grand Champion of the Thunder Bluff>
	   [35570]	= true,	-- Zul'tore <Grand Champion of Sen'jin>

	   -- Horde
	   [34702]	= true,	-- Ambrose Boltspark <Grand Champion of Gnomeregan>
	   [34701]	= true,	-- Colosos <Grand Champion of the Exodar>
	   [34705]	= true,	-- Marshal Jacob Alerius <Grand Champion of Stormwind>
	   [34657]	= true,	-- Jaelyne Evensong <Grand Champion of Darnassus>
	   [34703]	= true,	-- Lana Stouthammer <Grand Champion of Ironforge>

	   -- Neutral
	   [34928]	= true,	-- Argent Confessor Paletress
	   [35119]	= true,	-- Eadric the Pure
	   [35451]	= true,	-- The Black Knight

	   -------------------------------------------------------------------------------
	   -- Trial of the Crusader
	   -------------------------------------------------------------------------------
	   [34796]	= true,	-- Gormok
	   [35144]	= true,	-- Acidmaw
	   [34799]	= true,	-- Dreadscale
	   [34797]	= true,	-- Icehowl

	   [34780]	= true,	-- Jaraxxus

	   [34461]	= true,	-- Tyrius Duskblade <Death Knight>
	   [34460]	= true,	-- Kavina Grovesong <Druid>
	   [34469]	= true,	-- Melador Valestrider <Druid>
	   [34467]	= true,	-- Alyssia Moonstalker <Hunter>
	   [34468]	= true,	-- Noozle Whizzlestick <Mage>
	   [34465]	= true,	-- Velanaa <Paladin>
	   [34471]	= true,	-- Baelnor Lightbearer <Paladin>
	   [34466]	= true,	-- Anthar Forgemender <Priest>
	   [34473]	= true,	-- Brienna Nightfell <Priest>
	   [34472]	= true,	-- Irieth Shadowstep <Rogue>
	   [34470]	= true,	-- Saamul <Shaman>
	   [34463]	= true,	-- Shaabad <Shaman>
	   [34474]	= true,	-- Serissa Grimdabbler <Warlock>
	   [34475]	= true,	-- Shocuul <Warrior>

	   [34458]	= true,	-- Gorgrim Shadowcleave <Death Knight>
	   [34451]	= true,	-- Birana Stormhoof <Druid>
	   [34459]	= true,	-- Erin Misthoof <Druid>
	   [34448]	= true,	-- Ruj'kah <Hunter>
	   [34449]	= true,	-- Ginselle Blightslinger <Mage>
	   [34445]	= true,	-- Liandra Suncaller <Paladin>
	   [34456]	= true,	-- Malithas Brightblade <Paladin>
	   [34447]	= true,	-- Caiphus the Stern <Priest>
	   [34441]	= true,	-- Vivienne Blackwhisper <Priest>
	   [34454]	= true,	-- Maz'dinah <Rogue>
	   [34444]	= true,	-- Thrakgar	<Shaman>
	   [34455]	= true,	-- Broln Stouthorn <Shaman>
	   [34450]	= true,	-- Harkzog <Warlock>
	   [34453]	= true,	-- Narrhok Steelbreaker <Warrior>

	   [35610]	= true,	-- Cat <Ruj'kah's Pet / Alyssia Moonstalker's Pet>
	   [35465]	= true,	-- Zhaagrym <Harkzog's Minion / Serissa Grimdabbler's Minion>

	   [34497]	= true,	-- Fjola Lightbane
	   [34496]	= true,	-- Eydis Darkbane
	   [34564]	= true,	-- Anub'arak (Trial of the Crusader)

	   -------------------------------------------------------------------------------
	   -- Uldaman
	   -------------------------------------------------------------------------------
	   [7057]	= true,	-- Digmaster Shovelphlange
	   -- [2932]	= true,	-- Magregan Deepshadow (Outside the instance, not elite)
	   [6910]	= true,	-- Revelosh
	   [7228]	= true,	-- Ironaya
	   [7023]	= true,	-- Obsidian Sentinel
	   [7206]	= true,	-- Ancient Stone Keeper
	   [7291]	= true,	-- Galgann Firehammer
	   [4854]	= true,	-- Grimlok
	   [2748]	= true,	-- Archaedas
	   [6906]	= true,	-- Baelog

	   -------------------------------------------------------------------------------
	   -- Ulduar: The Antechamber of Ulduar
	   -------------------------------------------------------------------------------
	   [32867]	= true,	-- Steelbreaker
	   [32927]	= true,	-- Runemaster Molgeim
	   [32857]	= true,	-- Stormcaller Brundir
	   [32930]	= true,	-- Kologarn
	   [33515]	= true,	-- Auriaya
	   [34035]	= true,	-- Feral Defender
	   [32933]	= true,	-- Left Arm
	   [32934]	= true,	-- Right Arm
	   [33524]	= true,	-- Saronite Animus

	   -------------------------------------------------------------------------------
	   -- Ulduar: The Celestial Planetarium
	   -------------------------------------------------------------------------------
	   [32871]	= true,	-- Algalon the Observer

	   -------------------------------------------------------------------------------
	   -- Ulduar: The Descent into Madness
	   -------------------------------------------------------------------------------
	   [33271]	= true,	-- General Vezax
	   [33890]	= true,	-- Brain of Yogg-Saron
	   [33136]	= true,	-- Guardian of Yogg-Saron
	   [33288]	= true,	-- Yogg-Saron
	   [32915]	= true,	-- Elder Brightleaf
	   [32913]	= true,	-- Elder Ironbranch
	   [32914]	= true,	-- Elder Stonebark
	   [32882]	= true,	-- Jormungar Behemoth
	   [33432]	= true,	-- Leviathan Mk II
	   [34014]	= true,	-- Sanctum Sentry

	   -------------------------------------------------------------------------------
	   -- Ulduar: The Keepers of Ulduar
	   -------------------------------------------------------------------------------
	   [33350]	= true,	-- Mimiron
	   [32906]	= true,	-- Freya
	   [32865]	= true,	-- Thorim
	   [32845]	= true,	-- Hodir

	   -------------------------------------------------------------------------------
	   -- Ulduar: The Siege of Ulduar
	   -------------------------------------------------------------------------------
	   [33113]	= true,	-- Flame Leviathan
	   [33118]	= true,	-- Ignis the Furnace Master
	   [33186]	= true,	-- Razorscale
	   [33293]	= true,	-- XT-002 Deconstructor
	   [33670]	= true,	-- Aerial Command Unit
	   [33329]	= true,	-- Heart of the Deconstructor
	   [33651]	= true,	-- VX-001

	   -------------------------------------------------------------------------------
	   -- Un'Goro Crater
	   -------------------------------------------------------------------------------
	   [14461]	= true,	-- Baron Charr

	   -------------------------------------------------------------------------------
	   -- Upper Blackrock Spire
	   -------------------------------------------------------------------------------
	   [9816]	= true,	-- Pyroguard Emberseer
	   [10264]	= true,	-- Solakar Flamewreath
	   [10509]	= true,	-- Jed Runewatcher
	   [10899]	= true,	-- Goraluk Anvilcrack
	   [10339]	= true,	-- Gyth
	   [10429]	= true,	-- Warchief Rend Blackhand
	   [10430]	= true,	-- The Beast
	   [16042]	= true,	-- Lord Valthalak
	   [10363]	= true,	-- General Drakkisath

	   -------------------------------------------------------------------------------
	   -- Utgarde Keep: Main Bosses
	   -------------------------------------------------------------------------------
	   [23953]	= true,	-- Prince Keleseth (Utgarde Keep)
	   [27390]	= true,	-- Skarvald the Constructor
	   [24200]	= true,	-- Skarvald the Constructor
	   [23954]	= true,	-- Ingvar the Plunderer
	   [23980]	= true,	-- Ingvar the Plunderer

	   -------------------------------------------------------------------------------
	   -- Utgarde Keep: Secondary Bosses
	   -------------------------------------------------------------------------------
	   [27389]	= true,	-- Dalronn the Controller
	   [24201]	= true,	-- Dalronn the Controller

	   -------------------------------------------------------------------------------
	   -- Utgarde Pinnacle
	   -------------------------------------------------------------------------------
	   [26668]	= true,	-- Svala Sorrowgrave
	   [26687]	= true,	-- Gortok Palehoof
	   [26693]	= true,	-- Skadi the Ruthless
	   [26861]	= true,	-- King Ymiron

	   -------------------------------------------------------------------------------
	   -- Wailing Caverns
	   -------------------------------------------------------------------------------
	   [5775]	= true,	-- Verdan the Everliving
	   [3670]	= true,	-- Lord Pythas
	   [3673]	= true,	-- Lord Serpentis
	   [3669]	= true,	-- Lord Cobrahn
	   [3654]	= true,	-- Mutanus the Devourer
	   [3674]	= true,	-- Skum
	   [3653]	= true,	-- Kresh
	   [3671]	= true,	-- Lady Anacondra
	   [5912]	= true,	-- Deviate Faerie Dragon
	   [3672]	= true,	-- Boahn, outside
	   [3655]	= true,	-- Mad Magglish, outside
	   [3652]	= true,	-- Trigore the Lasher, outside

	   -------------------------------------------------------------------------------
	   -- Vault of Archavon
	   -------------------------------------------------------------------------------
	   [31125]	= true,	-- Archavon the Stone Watcher
	   [33993]	= true,	-- Emalon the Storm Watcher
	   [35013]	= true,	-- Koralon the Flamewatcher
	   [38433]	= true,	--Toravon the Ice Watcher

	   -------------------------------------------------------------------------------
	   -- Winterspring
	   -------------------------------------------------------------------------------
	   [14457]	= true,	-- Princess Tempestria

	   -------------------------------------------------------------------------------
	   -- World Dragons
	   -------------------------------------------------------------------------------
	   [14889]	= true,	-- Emeriss
	   [14888]	= true,	-- Lethon
	   [14890]	= true,	-- Taerar
	   [14887]	= true,	-- Ysondre

	   -------------------------------------------------------------------------------
	   -- Zul'Aman
	   -------------------------------------------------------------------------------
	   -- Animal Bosses
	   [29024]	= true,	-- Nalorakk
	   [28514]	= true,	-- Nalorakk
	   [23576]	= true,	-- Nalorakk
	   [23574]	= true,	-- Akil'zon
	   [23578]	= true,	-- Jan'alai
	   [28515]	= true,	-- Jan'alai
	   [29023]	= true,	-- Jan'alai
	   [23577]	= true,	-- Halazzi
	   [28517]	= true,	-- Halazzi
	   [29022]	= true,	-- Halazzi
	   [24239]	= true,	-- Malacrass

	   -- Final Bosses
	   [24239]	= true,	-- Hex Lord Malacrass
	   [23863]	= true,	-- Zul'jin

	   -------------------------------------------------------------------------------
	   -- Zul'Farrak
	   -------------------------------------------------------------------------------
	   [7267]	= true,	-- Chief Ukorz Sandscalp
	   [7271]	= true,	-- Witch Doctor Zum'rah
	   [7272]	= true,	-- Theka the Martyr
	   [7273]	= true,	-- Gahz'rilla
	   [7274]	= true,	-- Sandfury Executioner
	   [7275]	= true,	-- Shadowpriest Sezz'ziz
	   [7604]	= true,	-- Sergeant Bly
	   [7605]	= true,	-- Raven
	   [7606]	= true,	-- Oro Eyegouge
	   [7608]	= true,	-- Murta Grimgut
	   [7795]	= true,	-- Hydromancer Velratha
	   [7796]	= true,	-- Nekrum Gutchewer
	   [7797]	= true,	-- Ruuzlu
	   [8127]	= true,	-- Antu'sul
	   [10080]	= true,	-- Sandarr Dunereaver
	   [10082]	= true,	-- Zerillis
	   [10081]	= true,	-- Dustwraith

	   -------------------------------------------------------------------------------
	   -- Zul'Gurub - 4.1
	   -------------------------------------------------------------------------------
	   [52053]	=true,	-- Zanzil
	   [52059]	=true,	-- High Priestess Kilnara
	   [52148]	=true,	-- Jin'do the Godbreaker
	   [52151]	=true,	-- Bloodlord Mandokir
	   [52155]	=true,	-- High Priest Venoxis
	   -- [52157]	=true,	-- Ohgan (Mandokirs Raptor)  disabled by Mikk- this is an add, not a boss.
	   [52269]	=true,	-- Renataki
	   [52258]	=true,	-- Gri'lek
	   [52271]	=true,	-- Hazza'rah
	   [52286]	=true,	-- Wushoolay

	}



	local function initialiseSavedVariables()

		tdps = {
			speed = 2,
			width = 190,
			version = -1,
			autoReset = true,
			swapColor = true,
			tooltipSpells = 3,
			tooltipTargets = 3,
			anchor = 'TOPLEFT',
			layout = 10,
			showRank = true,
			onlyBossSegments = false,
			showMinimapButton = false,
			spacing = 2, barHeight = 15,
			bar = {.9, .9, .9, 1}, barbackdrop = {1, 1, 1, .05}, border = {0, 0, 0, .8}, backdrop = {0, 0, 0, .8},
		}

		tdpsTextOffset = 0
		tdpsVisibleBars = 10
		tdpsReportLength = 5

		if GameFontNormal then tdpsFont = {name = GameFontNormal:GetFont(), size = 12, outline = '', shadow = 1}
		else tdpsFont = {name = [[Interface\AddOns\TinyDPS\Fonts\Visitor.ttf]], size = 13, outline = 'Outlinemonochrome', shadow = 0} end

		tdpsColorAlpha = .8

	end



	tdpsPosition = {x = 0, y = 0}



	local function initialiseSavedVariablesPerCharacter()

		tdpsVersion = -1
		tdpsPet, tdpsPlayer, tdpsLink = {}, {}, {}
		tdpsFight = {{name = tdpsL.overallData, d = 0, h = 0}, {name = nil, boss = nil, d = 0, h = 0}}

		tdpsPartySize = 0
		tdpsF = 1
		tdpsV = 'd'
		tdpsNumberOfFights = 2

	end



	initialiseSavedVariables()
	initialiseSavedVariablesPerCharacter()






---------------------------------------------------------------------------------------------------------------------------------
--- frames ----------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------



	-- anchor frame
	CreateFrame('Frame', 'tdpsAnchor', UIParent)
	tdpsAnchor:SetWidth(3)
	tdpsAnchor:SetHeight(3)
	tdpsAnchor:SetMovable(1)
	tdpsAnchor:SetPoint('CENTER', UIParent, 'CENTER', 0, 0)
	tdpsAnchor:SetFrameStrata('BACKGROUND')
	tdpsAnchor:SetBackdrop({bgFile = [[Interface\AddOns\TinyDPS\Textures\blank.tga]], edgeFile = [[Interface\AddOns\TinyDPS\Textures\blank.tga]], tile = false, tileSize = 1, edgeSize = 1, insets = {left = 1, right = 1, top = 1, bottom = 1}})
	tdpsAnchor:SetBackdropColor(0,0,0,0)
	tdpsAnchor:SetBackdropBorderColor(0,0,0,0)



	-- main window
	CreateFrame('Frame', 'tdpsFrame', UIParent)
	tdpsFrame:SetWidth(190)
	tdpsFrame:SetHeight(tdps.barHeight + 4)
	tdpsFrame:EnableMouse(1)
	tdpsFrame:EnableMouseWheel(1)
	tdpsFrame:SetResizable(1)
	tdpsFrame:SetPoint('TOPLEFT', tdpsAnchor, 'TOPLEFT', 0, 0)
	tdpsFrame:SetFrameStrata('MEDIUM')
	tdpsFrame:SetFrameLevel(1)
	tdpsFrame:SetBackdrop({bgFile = [[Interface\AddOns\TinyDPS\Textures\blank.tga]], edgeFile = [[Interface\AddOns\TinyDPS\Textures\blank.tga]], tile = false, tileSize = 1, edgeSize = 1, insets = {left = 1, right = 1, top = 1, bottom = 1}})



	-- main window animation
	local tdpsAnimationGroup = tdpsFrame:CreateAnimationGroup()   
	local tdpsAnimation = tdpsAnimationGroup:CreateAnimation('Alpha')
	tdpsAnimation:SetChange(-1)
	tdpsAnimation:SetDuration(.2)
	tdpsAnimation:SetScript('OnFinished', function(self, requested) tdpsRefresh() end)



	-- title font string
	tdpsFrame:CreateFontString('noData', 'OVERLAY')
	noData:SetPoint('CENTER', tdpsFrame, 'CENTER')
	noData:SetJustifyH('CENTER')
    noData:SetFont(C.media.pixelfont2, C.datatext.fontsize,C.datatext.fontflag) -- setting font, size and outline
	noData:SetShadowColor(.1, .1, .1, 1)
	noData:SetShadowOffset(tdpsFont.shadow, tdpsFont.shadow * -1)
    noData:SetText(hexa..'tinydps'..hexb) -- color like datatext

	-- resize frame
	CreateFrame('Frame', 'tdpsResizeFrame', tdpsFrame)
	tdpsResizeFrame:SetFrameStrata('MEDIUM')
	tdpsResizeFrame:SetFrameLevel(3)
	tdpsResizeFrame:SetWidth(6)
	tdpsResizeFrame:SetHeight(6)
	tdpsResizeFrame:SetPoint('BOTTOMRIGHT', tdpsFrame, 'BOTTOMRIGHT', 0, 0)
	tdpsResizeFrame:EnableMouse(1)
	tdpsResizeFrame:CreateTexture('tdpsResizeTexture')
	tdpsResizeTexture:SetTexture([[Interface\Buttons\UI-AutoCastableOverlay]])
	tdpsResizeTexture:SetTexCoord(.619, .760, .612, .762)
	tdpsResizeTexture:SetDesaturated(1)
	tdpsResizeTexture:SetAlpha(0)
	tdpsResizeTexture:ClearAllPoints()
	tdpsResizeTexture:SetPoint('TOPLEFT', tdpsResizeFrame)
	tdpsResizeTexture:SetPoint('BOTTOMRIGHT', tdpsResizeFrame, 'BOTTOMRIGHT', 0, 0)
	tdpsResizeFrame:SetScale(1.3)



	-- minimap button frame
	CreateFrame('Button', 'tdpsButtonFrame', Minimap)
	tdpsButtonFrame:SetHeight(30)
	tdpsButtonFrame:SetWidth(30)
	tdpsButtonFrame:SetMovable(1)
	tdpsButtonFrame:SetUserPlaced(1)
	tdpsButtonFrame:EnableMouse(1)
	tdpsButtonFrame:RegisterForDrag('LeftButton')
	tdpsButtonFrame:SetFrameStrata('MEDIUM')
	tdpsButtonFrame:SetPoint('CENTER', Minimap:GetWidth()/2*-1, Minimap:GetHeight()/2*-1)
	tdpsButtonFrame:CreateTexture('tdpsButtonTexture', 'BACKGROUND')
	tdpsButtonTexture:SetWidth(24)
	tdpsButtonTexture:SetHeight(24)
	tdpsButtonTexture:SetTexture([[Interface\AddOns\TinyDPS\Textures\minimapbutton.blp]])
	tdpsButtonTexture:SetPoint('CENTER')
	tdpsButtonFrame:SetNormalTexture(tdpsButtonTexture)
	tdpsButtonFrame:CreateTexture('tdpsButtonTexturePushed', 'BACKGROUND')
	tdpsButtonTexturePushed:SetWidth(24)
	tdpsButtonTexturePushed:SetHeight(24)
	tdpsButtonTexturePushed:SetTexture([[Interface\AddOns\TinyDPS\Textures\minimapbutton.blp]])
	tdpsButtonTexturePushed:SetPoint('CENTER', 1, -1)
	tdpsButtonFrame:SetPushedTexture(tdpsButtonTexturePushed)
	tdpsButtonFrame:SetHighlightTexture([[Interface\Minimap\UI-Minimap-ZoomButton-Highlight]])
	tdpsButtonFrame:CreateTexture('tdpsButtonOverlay', 'OVERLAY')
	tdpsButtonOverlay:SetWidth(53)
	tdpsButtonOverlay:SetHeight(53)
	tdpsButtonOverlay:SetTexture([[Interface\Minimap\MiniMap-TrackingBorder]])
	tdpsButtonOverlay:SetPoint('TOPLEFT')



	-- dropdown frame
	CreateFrame('Frame', 'tdpsDropDown')
	tdpsDropDown.displayMode = 'MENU'






---------------------------------------------------------------------------------------------------------------------------------
--- functions -------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------



	-- make local copy of global functions (faster)
	local toNum, select, band = tonumber, select, bit.band
	local floor, abs = math.floor, abs
	local t_sort, t_remove, t_insert, t_wipe = table.sort, table.remove, table.insert, table.wipe
	local pairs, ipairs, type = pairs, ipairs, type
	local GetNumRaidMembers, GetNumPartyMembers = GetNumRaidMembers, GetNumPartyMembers
	local sub, tok, fmt = strsub, strsplit, string.format
	local UnitName, UnitGUID, UnitClass = UnitName, UnitGUID, UnitClass
	local UnitIsPlayer, UnitAffectingCombat = UnitIsPlayer, UnitAffectingCombat



	-- some random functions
	local function round(num, idp) return floor(num * (10^(idp or 0)) + .5) / (10^(idp or 0)) end
	local function echo(str) print('|cfffef00fTinyDPS |cff82e2eb' .. (str or '')) end
	local function getClass(name) return select(2,UnitClass(name)) or 'UNKNOWN' end



	local function isPvpZone()
		if select(2,IsInInstance()) == "pvp"
			or select(2,IsInInstance()) == "arena"
			or GetCurrentMapAreaID() == 501 and select(3,GetWorldPVPAreaInfo(1)) -- Wintergrasp (only when a battle is going on)
			or GetCurrentMapAreaID() == 708 and select(3,GetWorldPVPAreaInfo(2)) -- Tol Barad (only when a battle is going on)
		then return true end
	end



	local function nudgeText()
		if tdpsTextOffset == 2 then tdpsTextOffset = -2 else tdpsTextOffset = tdpsTextOffset + 1 end
		for i=1,#bar do
			bar[i].fontStringLeft:ClearAllPoints()
			bar[i].fontStringRight:ClearAllPoints()
			bar[i].fontStringRight:SetPoint('RIGHT', -1, tdpsTextOffset)
			bar[i].fontStringLeft:SetPoint('LEFT', 1, tdpsTextOffset)
			bar[i].fontStringLeft:SetPoint('RIGHT', bar[i].fontStringRight, 'LEFT', -2, 1)
		end
	end



	local function report(button, channel, playername)

		if type(channel) == 'number' then destination = channel channel = 'CHANNEL' end

		if channel == 'WHISPER' then
			if not playername then
				destination = UnitName('target')
				if not UnitIsPlayer(destination) or not UnitCanCooperate('player', destination) then echo(tdpsL.noTarget) return end
			else destination = playername end
		end

		-- make table for sorting
		local report = {}
		for k,v in pairs(tdpsPlayer) do
			local reportPlayer = {name = tok('-', tdpsPlayer[k].name), n = tdpsPlayer[k].fight[tdpsF][tdpsV], t = tdpsPlayer[k].fight[tdpsF].t}
			local pet = tdpsPlayer[k].pet
			for i=1,#pet do
				-- add pet number
				reportPlayer.n = reportPlayer.n + tdpsPet[pet[i]].fight[tdpsF][tdpsV]
				-- check time
				if tdpsPet[pet[i]].fight[tdpsF].t > reportPlayer.t then reportPlayer.t = tdpsPet[pet[i]].fight[tdpsF].t end
			end
			t_insert(report, reportPlayer)
		end
		t_sort(report, function(x,y) return x.n > y.n end)

		-- check if there is any data
		if not report[1] or report[1].n == 0 then echo(tdpsL.noData) return end

		-- output report title
		if tdpsF == 2 then
			SendChatMessage(fmt('%s %s', tdpsL.repPrefix[tdpsV], tdpsL.lastFight), channel, nil, destination)
		else
			SendChatMessage(fmt('%s %s', tdpsL.repPrefix[tdpsV], tdpsFight[tdpsF].name or '?'), channel, nil, destination)
		end

		-- output the text lines
		for i=1,math.min(#report, tdpsReportLength) do
			if report[i].n > 0 then
				SendChatMessage(fmt('%i. %s    %i    %i%%    (%i)', i, report[i].name, report[i].n, report[i].n/tdpsFight[tdpsF][tdpsV]*100, report[i].n/report[i].t), channel, nil, destination)
			end
		end

	end



	local function visibilityEvent()

		if (tdps.hidePvP and isPvpZone()) -- hide in pvp is true and we are in pvp zone
				or (tdps.hideSolo and math.max(GetNumPartyMembers(), GetNumRaidMembers()) == 0) -- hide when solo is true and we are alone
				or (tdps.hideOOC and not UnitAffectingCombat('player')) -- hide when ooc is true and we are not fighting
				or (tdps.hideIC and UnitAffectingCombat('player')) then -- hide when in combat is true and we are fighting
			tdpsFrame:Hide()
		else
			tdpsFrame:Show()
			tdpsRefresh()
		end

	end



	local function deleteSpellData()
		for _,v in pairs(tdpsPlayer) do
			for i=1,#v.fight do
				v.fight[i].ds, v.fight[i].hs = {}, {}
			end
		end
		for _,v in pairs(tdpsPet) do
			for i=1,#v.fight do
				v.fight[i].ds, v.fight[i].hs = {}, {}
			end
		end
		collectgarbage()
	end



	local function short(n)
		if n > 999999 then return fmt('%.1fM', n/1000000)
		elseif n > 9999 then return fmt('%.0fK', n/1000)
		elseif n > 999 then return fmt('%.1fK', n/1000)
		else return fmt('%i', n) end
	end



	local textLayout = { -- bits: 8 = dps, 4 = percentage, 2 = amount, 1 = short format. Example: 13 = 1101 = percentage and dps (short)

		[0]  = function(i, n, t) bar[i].fontStringRight:SetText('') end,
		[1]  = function(i, n, t) bar[i].fontStringRight:SetText('') end,
		[2]  = function(i, n, t) bar[i].fontStringRight:SetFormattedText('%i', n) end,
		[3]  = function(i, n, t) bar[i].fontStringRight:SetText(short(n)) end,
		[4]  = function(i, n, t) bar[i].fontStringRight:SetFormattedText('%i%%', n/tdpsFight[tdpsF][tdpsV]*100) end,
		[5]  = function(i, n, t) bar[i].fontStringRight:SetFormattedText('%i%%', n/tdpsFight[tdpsF][tdpsV]*100) end,
		[6]  = function(i, n, t) bar[i].fontStringRight:SetFormattedText('%i%% %i', n/tdpsFight[tdpsF][tdpsV]*100, n/t) end,
		[7]  = function(i, n, t) bar[i].fontStringRight:SetFormattedText('%s %i%%', short(n), n/tdpsFight[tdpsF][tdpsV]*100) end,
		[8]  = function(i, n, t) bar[i].fontStringRight:SetFormattedText('%i', n/t) end,
		[9]  = function(i, n, t) bar[i].fontStringRight:SetText(short(n/t)) end,
		[10] = function(i, n, t) bar[i].fontStringRight:SetFormattedText('%i %i', n, n/t) end,
		[11] = function(i, n, t) bar[i].fontStringRight:SetFormattedText('%s %s', short(n), short(n/t)) end,
		[12] = function(i, n, t) bar[i].fontStringRight:SetFormattedText('%i%% %i', n/tdpsFight[tdpsF][tdpsV]*100, n/t) end,
		[13] = function(i, n, t) bar[i].fontStringRight:SetFormattedText('%i%% %s', n/tdpsFight[tdpsF][tdpsV]*100, short(n/t)) end,
		[14] = function(i, n, t) bar[i].fontStringRight:SetFormattedText('%i %i%% %i', n, n/tdpsFight[tdpsF][tdpsV]*100, n/t) end,
		[15] = function(i, n, t) bar[i].fontStringRight:SetFormattedText('%s %i%% %s', short(n), n/tdpsFight[tdpsF][tdpsV]*100, short(n/t)) end

	}



	function tdpsRefresh()

		maxValue, barsWithValue = 0, 0
		local n, t, h, p, g -- amount, time, height, pet, text, guid

		-- update all bar values
		for i=1,#bar do
			bar[i]:Hide()
			g = bar[i].guid
			n, t, p = tdpsPlayer[g].fight[tdpsF][tdpsV], tdpsPlayer[g].fight[tdpsF].t, tdpsPlayer[g].pet
			for i=1,#p do n = n + tdpsPet[p[i]].fight[tdpsF][tdpsV] if tdpsPet[p[i]].fight[tdpsF].t > t then t = tdpsPet[p[i]].fight[tdpsF].t end end
			-- update bar values
			if n > 0 then
				barsWithValue = barsWithValue + 1
				if n > maxValue then maxValue = n end
				textLayout[tdps.layout](i, n, t)
			end
			bar[i].n = n
		end

		-- sort all bars
		t_sort(bar, function(x,y) return x.n > y.n end)

		-- layout the bars
		px = -2
		if tdpsVisibleBars == 1 then
			for i=1,#bar do
				if bar[i].name == UnitName('player') and bar[i].n > 0 then
					bar[i]:SetMinMaxValues(0, maxValue)
					bar[i]:SetValue(bar[i].n)
					bar[i]:SetPoint('TOPLEFT', tdpsFrame, 'TOPLEFT', 2, px)
					if tdps.showRank then bar[i].fontStringLeft:SetFormattedText('%i%s%s', i, '. ', bar[i].name) else bar[i].fontStringLeft:SetText(bar[i].name) end
					px = px - tdps.barHeight - tdps.spacing
					bar[i]:Show()
				end
			end
		else
			local to if barsWithValue < tdpsVisibleBars+scrollPos-1 then to = barsWithValue else to = tdpsVisibleBars+scrollPos-1 end
			for i=scrollPos,to do
				bar[i]:SetWidth(tdpsFrame:GetWidth() - 4)
				bar[i]:SetMinMaxValues(0, maxValue)
				bar[i]:SetValue(bar[i].n)
				bar[i]:SetPoint('TOPLEFT', tdpsFrame, 'TOPLEFT', 2, px)
				if tdps.showRank then bar[i].fontStringLeft:SetFormattedText('%i%s%s', i, '. ', bar[i].name) else bar[i].fontStringLeft:SetText(bar[i].name) end
				px = px - tdps.barHeight - tdps.spacing
				bar[i]:Show()
			end
		end

		-- set the frame height
		h = abs(px) + 2 - tdps.spacing
		if h < tdps.barHeight then tdpsFrame:SetHeight(tdps.barHeight+4) noData:Show() else tdpsFrame:SetHeight(h) noData:Hide() end

	end



	--local function tdpsShowStatus()
	--	ACTION_STATUS_FADETIME = 3
	--	if tdpsF == 2 then ActionStatus_DisplayMessage(fmt('%s for Current Fight', viewTitle[tdpsV]), true)
	--	else ActionStatus_DisplayMessage(fmt('%s for %s', viewTitle[tdpsV], tdpsFight[tdpsF].name), true) end
	--end



	local function changeView(button, v) if tdpsV == v then return end tdpsV = v scrollPos = 1 CloseDropDownMenus() tdpsAnimationGroup:Play() end
	local function checkView(v) if tdpsV == v then return true end end
	local function changeFight(button, f) if tdpsF == f then return else tdpsF = f scrollPos = 1 CloseDropDownMenus() tdpsAnimationGroup:Play() end end
	local function checkFight(f) if tdpsF == f then return true end end
	local function changeTextLayout(button, bit) if band(tdps.layout,bit) > 0 then tdps.layout = tdps.layout - bit else tdps.layout = tdps.layout + bit end tdpsRefresh() end



	local function changeNumberOfFights(button)
	
		if tdpsNumberOfFights == 11 then tdpsNumberOfFights = 2 else tdpsNumberOfFights = tdpsNumberOfFights + 1 end
		if button then button:SetFormattedText(tdpsL.history, tdpsNumberOfFights - 2) end

		-- make or delete entries for global fight data
		while #tdpsFight > tdpsNumberOfFights do t_remove(tdpsFight) end
		while #tdpsFight < tdpsNumberOfFights do t_insert(tdpsFight, {name = nil, boss = nil, d = 0, h = 0}) end

		-- make or delete entries for combatants data
		for _,v in pairs(tdpsPlayer) do
			while #v.fight > tdpsNumberOfFights do t_remove(v.fight) end
			while #v.fight < tdpsNumberOfFights do t_insert(v.fight, {d = 0, ds = {}, h = 0, hs = {}, t = 0}) end
		end
		for _,v in pairs(tdpsPet) do
			while #v.fight > tdpsNumberOfFights do t_remove(v.fight) end
			while #v.fight < tdpsNumberOfFights do t_insert(v.fight, {d = 0, ds = {}, h = 0, hs = {}, t = 0}) end
		end

		-- adjust the current selected fight
		-- example: selected fight is 5; user disables fight history; we now have only 2 fights (overall and current); the new selected fight has to be 2
		while not tdpsFight[tdpsF] do tdpsF = tdpsF - 1 end

		-- clean up memory
		collectgarbage()

	end



	local function changeBarSpacing(button) if tdps.spacing + 1 > 8 then tdps.spacing = 0 else tdps.spacing = tdps.spacing + 1 end button:SetText(tdpsL.spacing .. ': ' .. tdps.spacing) tdpsRefresh() end
	local function changeBarHeight(button, d) if tdps.barHeight + d < 2 then tdps.barHeight = 2 elseif tdps.barHeight + d > 40 then tdps.barHeight = 40 else tdps.barHeight = tdps.barHeight + d end for i=1,#bar do bar[i]:SetHeight(tdps.barHeight) end tdpsRefresh() end



	local function changeFont(button, change, arg)
		-- check arg
		if change == 'font' then tdpsFont.name = arg end
		if change == 'size' then if tdpsFont.size + arg < 4 then tdpsFont.size = 4 elseif tdpsFont.size + arg > 30 then tdpsFont.size = 30 else tdpsFont.size = tdpsFont.size + arg end end
		if change == 'outline' then tdpsFont.outline, tdpsFont.shadow = arg, 0 end
		if change == 'shadow' then tdpsFont.outline, tdpsFont.shadow = '', arg end
		-- set the font
		noData:SetFont(tdpsFont.name, tdpsFont.size, tdpsFont.outline)
		noData:SetShadowOffset(tdpsFont.shadow, tdpsFont.shadow * -1)
		for i=1,#bar do
			bar[i].fontStringLeft:SetFont(tdpsFont.name, tdpsFont.size, tdpsFont.outline)
			bar[i].fontStringRight:SetFont(tdpsFont.name, tdpsFont.size, tdpsFont.outline)
			bar[i].fontStringLeft:SetShadowOffset(tdpsFont.shadow, tdpsFont.shadow * -1)
			bar[i].fontStringRight:SetShadowOffset(tdpsFont.shadow, tdpsFont.shadow * -1)
		end
	end



	local function changeBarColor()
		if tdps.swapColor then
			for i=1,#bar do
				bar[i]:SetStatusBarColor(cColor[tdpsPlayer[bar[i].guid].class].r, cColor[tdpsPlayer[bar[i].guid].class].g, cColor[tdpsPlayer[bar[i].guid].class].b, tdpsColorAlpha)
				bar[i].fontStringLeft:SetTextColor(tdps.bar[1], tdps.bar[2], tdps.bar[3], tdps.bar[4])
				bar[i].fontStringRight:SetTextColor(tdps.bar[1], tdps.bar[2], tdps.bar[3], tdps.bar[4])
			end
		else
			for i=1,#bar do
				bar[i]:SetStatusBarColor(tdps.bar[1], tdps.bar[2], tdps.bar[3], tdps.bar[4])
				bar[i].fontStringLeft:SetTextColor(cColor[tdpsPlayer[bar[i].guid].class].r, cColor[tdpsPlayer[bar[i].guid].class].g, cColor[tdpsPlayer[bar[i].guid].class].b, tdpsColorAlpha)
				bar[i].fontStringRight:SetTextColor(cColor[tdpsPlayer[bar[i].guid].class].r, cColor[tdpsPlayer[bar[i].guid].class].g, cColor[tdpsPlayer[bar[i].guid].class].b, tdpsColorAlpha)
			end
		end
	end



	local function changeBarBackdropColor()
		for i=1,#bar do
			bar[i]:SetBackdropColor(tdps.barbackdrop[1], tdps.barbackdrop[2], tdps.barbackdrop[3], tdps.barbackdrop[4])
		end
	end



	local function startNewFight(target, mobid)

		tdpsStartNewFight = false
		tdpsInCombat = true
		if tdpsF ~= 1 then scrollPos = 1 end

		-- insert a new fight at position 2
		if tdpsFight[2].d + tdpsFight[2].h > 0 and ((tdps.onlyBossSegments and tdpsFight[2].boss) or not tdps.onlyBossSegments) then
			t_insert(tdpsFight, 2, {name = target or '?', boss = isBoss[toNum(mobid:sub(7, 10), 16)], d = 0, h = 0})
			t_remove(tdpsFight)
			for _,v in pairs(tdpsPlayer) do
				t_insert(v.fight, 2, {d = 0, ds = {}, h = 0, hs = {}, t = 0})
				t_remove(v.fight)
			end
			for _,v in pairs(tdpsPet) do
				t_insert(v.fight, 2, {d = 0, ds = {}, h = 0, hs = {}, t = 0})
				t_remove(v.fight)
			end

		-- reset current fight
		else
			tdpsFight[2] = {name = target or '?', boss = isBoss[toNum(mobid:sub(7, 10), 16)], d = 0, h = 0}
			for _,v in pairs(tdpsPlayer) do
				v.fight[2] = {d = 0, ds = {}, h = 0, hs = {}, t = 0}
			end
			for _,v in pairs(tdpsPet) do
				v.fight[2] = {d = 0, ds = {}, h = 0, hs = {}, t = 0}
			end
		end

	end



	local function checkCombat()
		if tdpsStartNewFight then return end
		if UnitAffectingCombat('player') or UnitAffectingCombat('pet') then tdpsInCombat = true return end
		for i=1,GetNumRaidMembers() do
			if UnitAffectingCombat(fmt('raid%i', i)) or UnitAffectingCombat(fmt('raidpet%i', i)) then tdpsInCombat = true return end
		end
		for i=1,GetNumPartyMembers() do
			if UnitAffectingCombat(fmt('party%i', i)) or UnitAffectingCombat(fmt('partypet%i', i)) then tdpsInCombat = true return end
		end
		tdpsInCombat = false
	end



	local function getPetOwnerName(petguid)
		local n, s
		if petguid == UnitGUID('pet') then n, s = UnitName('player') if s then return n..'-'..s else return n end
		else
			for i=1,GetNumRaidMembers() do
				if petguid == UnitGUID(fmt('raidpet%i', i)) then n, s = UnitName(fmt('raid%i', i)) if s then return n..'-'..s else return n end end
			end
			for i=1,GetNumPartyMembers() do
				if petguid == UnitGUID(fmt('partypet%i', i)) then n, s = UnitName(fmt('party%i', i)) if s then return n..'-'..s else return n end end
			end
		end
	end
	local function getPetOwnerGUID(petguid)
		if petguid == UnitGUID('pet') then return UnitGUID('player')
		else
			for i=1,GetNumRaidMembers() do
				if petguid == UnitGUID(fmt('raidpet%i', i)) then return UnitGUID(fmt('raid%i', i)) end
			end
			for i=1,GetNumPartyMembers() do
				if petguid == UnitGUID(fmt('partypet%i', i)) then return UnitGUID(fmt('party%i', i)) end
			end
		end
	end



	local function isPartyPet(petguid)
		if petguid == UnitGUID('pet') then return true
		else
			for i=1,GetNumRaidMembers() do
				if petguid == UnitGUID(fmt('raidpet%i', i)) then return true end
			end
			for i=1,GetNumPartyMembers() do
				if petguid == UnitGUID(fmt('partypet%i', i)) then return true end
			end
		end
	end



	local function toggleMinimapButton()
		tdps.showMinimapButton = not tdps.showMinimapButton
		if tdps.showMinimapButton then tdpsRefresh() tdpsButtonFrame:Show() else tdpsButtonFrame:Hide() end
	end



	local function ver()
		--echo(tdpsL.helpVersion .. ' ' .. GetAddOnMetadata('TinyDPS', 'Version') .. ' by Sideshow (Draenor EU)')
	end
	local function slashhelp()
		echo(tdpsL.helpParameters1)
		echo(tdpsL.helpParameters2)
	end
	local function help()
		ver()
		echo('- ' .. tdpsL.helpMove)
		echo('- ' .. tdpsL.helpResize)
		echo('- ' .. tdpsL.helpToggle)
		slashhelp()
	end



	local function reset()
		-- hide all bars in the GUI
		for i=1,#bar do bar[i]:ClearAllPoints() bar[i]:Hide() end
		-- delete data
		tdpsPlayer, tdpsPet, tdpsLink, tdpsFight, bar = {}, {}, {}, {}, {}
		-- make new fight data
		t_insert(tdpsFight, {name = tdpsL.overallData, d = 0, h = 0})
		while #tdpsFight < tdpsNumberOfFights do t_insert(tdpsFight, 2, {name = nil, boss = false, d = 0, h = 0}) end
		-- reset scroll position
		scrollPos = 1
		-- return to current fight if needed
		if tdpsF > 2 then tdpsF = 2 end
		-- reset the window
		tdpsFrame:SetHeight(tdps.barHeight + 4)
		noData:Show()
		-- output message
		echo(tdpsL.allClear)
		CloseDropDownMenus()
		-- clean up memory
		collectgarbage()
	end



	local function toggle()
		if tdpsFrame:IsVisible() then
			CloseDropDownMenus()
			tdps.hidePvP, tdps.hideSolo, tdps.hideIC, tdps.hideOOC = true, true, true, true
			tdpsFrame:Hide() 
		else
			CloseDropDownMenus()
			tdps.hidePvP, tdps.hideSolo, tdps.hideIC, tdps.hideOOC = nil, nil, nil, nil
			tdpsRefresh()
			tdpsFrame:Show()
		end
		PlaySound('gsTitleOptionExit')
	end



	SLASH_TINYDPS1, SLASH_TINYDPS2 = '/tinydps', '/tdps'
	function SlashCmdList.TINYDPS(msg, editbox)
		msg = strlower(msg)
		if msg == 'reset' or msg == 'r' then reset()
		elseif msg == 'damage' or msg == 'd' then changeView(nil, 'd')
		elseif msg == 'healing' or msg == 'h' then changeView(nil, 'h')
		elseif tok(' ',msg) == 'reportlength' and tonumber(select(2,tok(' ',msg))) then tdpsReportLength = min(40, max(1, tonumber(select(2,tok(' ',msg)))))
		elseif tok(' ',msg) == 'visiblebars' and tonumber(select(2,tok(' ',msg))) then tdpsVisibleBars = min(40, max(1, tonumber(select(2,tok(' ',msg))))) scrollPos = 1 tdpsRefresh()
		elseif tok(' ',msg) == 'whisper' and select(2,tok(' ',msg)) then report(nil, 'WHISPER', select(2,tok(' ',msg)))
		elseif msg == 'help' or msg == '?' then help()
		elseif msg == '' then toggle()
		else slashhelp() end
	end



	local function scroll(d)
		if bar[1] and bar[1].n > 0 and scrollPos - d > 0 and scrollPos - d + tdpsVisibleBars <= barsWithValue + 1 and tdpsVisibleBars > 1 then
			scrollPos = scrollPos - d
			tdpsRefresh()
		end
	end



	-- function for adding buttons in the context menu
	local function newBu(...) -- level, text, title, notCheckable, hasArrow, value, keepShownOnClick, func, arg1, arg2, checked, disabled, isNotRadio, hasColorSwatch, swatchFunc, hasOpacity, opacityFunc, r, g, b, opacity, notClickable
		level, bu.text, bu.isTitle, bu.notCheckable, bu.hasArrow, bu.value, bu.keepShownOnClick, bu.func, bu.arg1, bu.arg2, bu.checked, bu.disabled, bu.isNotRadio, bu.hasColorSwatch, bu.swatchFunc, bu.hasOpacity, bu.opacityFunc, bu.r, bu.g, bu.b, bu.opacity, bu.notClickable = ...
		UIDropDownMenu_AddButton(bu, level)
		t_wipe(bu)
	end



	tdpsDropDown.initialize = function(self, level)

		if level == 1 then

			PlaySound('gsTitleOptionExit')
			newBu(level, 'TinyDPS       ', 1, 1)
			newBu(level, tdpsL.fight, nil, 1, 1, 'fight', 1)
			newBu(level, tdpsL.report, nil, 1, 1, 'report', 1)
			newBu(level, tdpsL.options, nil, 1, 1, 'options', 1)
			newBu(level, tdpsL.close, nil, 1)

		elseif level == 2 and UIDROPDOWNMENU_MENU_VALUE == 'fight' then

			newBu(level, tdpsL.allFight, nil, nil, nil, nil, nil, changeFight, 1, nil, checkFight(1))
			newBu(level, tdpsL.current .. '    ' .. (tdpsFight[2].name or tdpsL.empty), nil, nil, nil, nil, nil, changeFight, 2, nil, checkFight(2))
			if tdpsNumberOfFights > 2 then newBu(level, '', nil, 1, nil, nil, nil, nil, nil, nil, nil, 1) end
			for i=3,tdpsNumberOfFights do newBu(level, fmt('%s %i     %s', tdpsL.fight, i-2, (tdpsFight[i].name or tdpsL.empty)), nil, nil, nil, nil, nil, changeFight, i, nil, checkFight(i)) end
			newBu(level, '', nil, 1, nil, nil, nil, nil, nil, nil, nil, 1)
			newBu(level, tdpsL.showDamage, nil, nil, nil, nil, nil, changeView, 'd', nil, checkView('d'))
			newBu(level, tdpsL.showHealing, nil, nil, nil, nil, nil, changeView, 'h', nil, checkView('h'))
			newBu(level, '', nil, 1, nil, nil, nil, nil, nil, nil, nil, 1)
			newBu(level, '     ' .. tdpsL.resetAllData, nil, 1, nil, nil, nil , reset)

		elseif level == 2 and UIDROPDOWNMENU_MENU_VALUE == 'report' then

			newBu(level, tdpsL.say, nil, 1, nil, nil, nil, report, 'SAY')
			newBu(level, tdpsL.raid, nil, 1, nil, nil, nil, report, 'RAID')
			newBu(level, tdpsL.party, nil, 1, nil, nil, nil, report, 'PARTY')
			newBu(level, tdpsL.guild, nil, 1, nil, nil, nil, report, 'GUILD')
			newBu(level, tdpsL.officer, nil, 1, nil, nil, nil, report, 'OFFICER')
			newBu(level, tdpsL.whisper, nil, 1, nil, nil, nil, report, 'WHISPER')
			newBu(level, tdpsL.whisper2, nil, 1, nil, nil, nil, function() ChatEdit_ActivateChat(DEFAULT_CHAT_FRAME.editBox) DEFAULT_CHAT_FRAME.editBox:SetText('/tdps whisper ') end)
			for i=1,20 do if select(2,GetChannelName(i)) then newBu(level, select(2,GetChannelName(i)) .. '     ', nil, 1, nil, nil, nil, report, i) end end
			newBu(level, '', nil, 1, nil, nil, nil, nil, nil, nil, nil, 1)
			newBu(level, 'Report Length: ' .. tdpsReportLength, nil, 1, nil, nil, nil, function() ChatEdit_ActivateChat(DEFAULT_CHAT_FRAME.editBox) DEFAULT_CHAT_FRAME.editBox:SetText('/tdps reportlength ' .. tdpsReportLength) end)

		elseif level == 2 and UIDROPDOWNMENU_MENU_VALUE == 'options' then

			newBu(level, tdpsL.text, nil, 1, 1, 'text', 1)
			newBu(level, tdpsL.bars, nil, 1, 1, 'bars', 1)
			newBu(level, tdpsL.colors, nil, 1, 1, 'colors', 1)
			newBu(level, tdpsL.various, nil, 1, 1, 'various', 1)

		elseif level == 3 and UIDROPDOWNMENU_MENU_VALUE == 'text' then

			newBu(level, tdpsL.size, nil, 1, 1, 'size', 1)
			newBu(level, tdpsL.font, nil, 1, 1, 'font', 1)
			newBu(level, tdpsL.layout, nil, 1, 1, 'layout', 1)
			newBu(level, tdpsL.outline, nil, 1, 1, 'outline', 1)
			newBu(level, fmt(tdpsL.nudge, tdpsTextOffset), nil, 1, nil, nil, 1, nudgeText)

		elseif level == 3 and UIDROPDOWNMENU_MENU_VALUE == 'bars' then

			newBu(level, tdpsL.height, nil, 1, 1, 'height', 1)
			newBu(level, tdpsL.spacing .. ': ' .. tdps.spacing, nil, 1, nil, nil, 1, changeBarSpacing)
			newBu(level, tdpsL.maximum .. ': ' .. tdpsVisibleBars, nil, 1, nil, nil, nil, function() ChatEdit_ActivateChat(DEFAULT_CHAT_FRAME.editBox) DEFAULT_CHAT_FRAME.editBox:SetText('/tdps visiblebars ' .. tdpsVisibleBars) end)

		elseif level == 3 and UIDROPDOWNMENU_MENU_VALUE == 'colors' then

			local st if tdps.swapColor then st = tdpsL.text else st = tdpsL.bars end
			newBu(level, st, nil, 1, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1, function()
					ColorPickerOkayButton:Hide()
					ColorPickerCancelButton:SetText('Close')
					local red, green, blue = ColorPickerFrame:GetColorRGB()
					local alpha = 1 - OpacitySliderFrame:GetValue()
					tdps.bar[1], tdps.bar[2], tdps.bar[3], tdps.bar[4] = red, green, blue, alpha
					changeBarColor() end,
				1,
				function()
					local red, green, blue = ColorPickerFrame:GetColorRGB()
					local alpha = 1 - OpacitySliderFrame:GetValue()
					tdps.bar[1], tdps.bar[2], tdps.bar[3], tdps.bar[4] = red, green, blue, alpha
					changeBarColor() end,
				tdps.bar[1], tdps.bar[2], tdps.bar[3], 1 - tdps.bar[4], 1)
				
			newBu(level, tdpsL.barBackdrop, nil, 1, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1, function()
					ColorPickerOkayButton:Hide()
					ColorPickerCancelButton:SetText('Close')
					local red, green, blue = ColorPickerFrame:GetColorRGB()
					local alpha = 1 - OpacitySliderFrame:GetValue()
					tdps.barbackdrop[1], tdps.barbackdrop[2], tdps.barbackdrop[3], tdps.barbackdrop[4] = red, green, blue, alpha
					changeBarBackdropColor() end,
				1,
				function()
					local red, green, blue = ColorPickerFrame:GetColorRGB()
					local alpha = 1 - OpacitySliderFrame:GetValue()
					tdps.barbackdrop[1], tdps.barbackdrop[2], tdps.barbackdrop[3], tdps.barbackdrop[4] = red, green, blue, alpha
					changeBarBackdropColor() end,
					tdps.barbackdrop[1], tdps.barbackdrop[2], tdps.barbackdrop[3], 1 - tdps.barbackdrop[4], 1)
				
			newBu(level, tdpsL.frameBorder, nil, 1, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1, function()
					ColorPickerOkayButton:Hide()
					ColorPickerCancelButton:SetText('Close')
					local red, green, blue = ColorPickerFrame:GetColorRGB()
					local alpha = 1 - OpacitySliderFrame:GetValue()
					tdpsFrame:SetBackdropBorderColor(red, green, blue, alpha)
					tdps.border[1], tdps.border[2], tdps.border[3], tdps.border[4] = red, green, blue, alpha end,
				1,
				function()
					local red, green, blue = ColorPickerFrame:GetColorRGB()
					local alpha = 1 - OpacitySliderFrame:GetValue()
					tdpsFrame:SetBackdropBorderColor(red, green, blue, alpha)
					tdps.border[1], tdps.border[2], tdps.border[3], tdps.border[4] = red, green, blue, alpha end,
					tdps.border[1], tdps.border[2], tdps.border[3], 1 - tdps.border[4], 1)
				
			newBu(level, tdpsL.frameBackdrop, nil, 1, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1, function()
					ColorPickerOkayButton:Hide()
					ColorPickerCancelButton:SetText('Close')
					local red, green, blue = ColorPickerFrame:GetColorRGB()
					local alpha = 1 - OpacitySliderFrame:GetValue()
					tdpsFrame:SetBackdropColor(red, green, blue, alpha)
					tdps.backdrop[1], tdps.backdrop[2], tdps.backdrop[3], tdps.backdrop[4] = red, green, blue, alpha end,
				1,
				function()
					local red, green, blue = ColorPickerFrame:GetColorRGB()
					local alpha = 1 - OpacitySliderFrame:GetValue()
					tdpsFrame:SetBackdropColor(red, green, blue, alpha)
					tdps.backdrop[1], tdps.backdrop[2], tdps.backdrop[3], tdps.backdrop[4] = red, green, blue, alpha end,
					tdps.backdrop[1], tdps.backdrop[2], tdps.backdrop[3], 1 - tdps.backdrop[4], 1)

			newBu(level, tdpsL.dimClassColors, nil, 1, nil, nil, 1, function() if tdpsColorAlpha - .1 < 0 then tdpsColorAlpha = 0 else tdpsColorAlpha = tdpsColorAlpha - .1 end changeBarColor() end)
			newBu(level, tdpsL.resetClassColors, nil, 1, nil, nil, 1, function() tdpsColorAlpha = 1 changeBarColor() end)
			newBu(level, tdpsL.swapBarTextColor .. '     ', nil, 1, nil, nil, 1, function() tdps.swapColor = not tdps.swapColor if tdps.swapColor then DropDownList3Button1:SetText(tdpsL.text) else DropDownList3Button1:SetText(tdpsL.bars) end changeBarColor() end)

		elseif level == 3 and UIDROPDOWNMENU_MENU_VALUE == 'various' then

			newBu(level, tdpsL.hideInPvP, nil, nil, nil, nil, 1, function() tdps.hidePvP = not tdps.hidePvP visibilityEvent() end, nil, nil, tdps.hidePvP, nil, 1)
			newBu(level, tdpsL.hideWhenSolo, nil, nil, nil, nil, 1, function() tdps.hideSolo = not tdps.hideSolo visibilityEvent() end, nil, nil, tdps.hideSolo, nil, 1)
			newBu(level, tdpsL.hideInCombat, nil, nil, nil, nil, 1, function() tdps.hideIC = not tdps.hideOOC visibilityEvent() end, nil, nil, tdps.hideIC, nil, 1)
			newBu(level, tdpsL.hideOutOfCombat, nil, nil, nil, nil, 1, function() tdps.hideOOC = not tdps.hideOOC visibilityEvent() end, nil, nil, tdps.hideOOC, nil, 1)
			newBu(level, '', nil, 1, nil, nil, nil, nil, nil, nil, nil, 1)
			newBu(level, tdpsL.growUpwards, nil, nil, nil, nil, 1, function() if tdps.anchor == 'TOPLEFT' then tdps.anchor = 'BOTTOMLEFT' else tdps.anchor = 'TOPLEFT' end tdpsFrame:ClearAllPoints() tdpsFrame:SetPoint(tdps.anchor, tdpsAnchor, tdps.anchor) end, nil, nil, function() if tdps.anchor == 'BOTTOMLEFT' then return true end end, nil, 1)
			newBu(level, tdpsL.minimapButton, nil, nil, nil, nil, 1, toggleMinimapButton, nil, nil, tdps.showMinimapButton, nil, 1)
			newBu(level, tdpsL.resetOnNewGroup, nil, nil, nil, nil, 1, function() tdps.autoReset = not tdps.autoReset end, nil, nil, tdps.autoReset, nil, 1)
			newBu(level, tdpsL.refreshEverySecond, nil, nil, nil, nil, 1, function() if tdps.speed == 2 then tdps.speed = 1 else tdps.speed = 2 end end, nil, nil, function() if tdps.speed == 1 then return true end end, nil, 1)
			newBu(level, '', nil, 1, nil, nil, nil, nil, nil, nil, nil, 1)
			newBu(level, tdpsL.trackSpellDetails, nil, nil, nil, nil, 1, function() tdps.trackSpells = not tdps.trackSpells if not tdps.trackSpells then deleteSpellData() end end, nil, nil, tdps.trackSpells, nil, 1)
			newBu(level, fmt(tdpsL.spells, tdps.tooltipSpells), nil, 1, nil, nil, 1, function() if tdps.tooltipSpells == 10 then tdps.tooltipSpells = 0 else tdps.tooltipSpells = tdps.tooltipSpells + 1 end DropDownList3Button12:SetFormattedText(tdpsL.spells, tdps.tooltipSpells) end)
			newBu(level, fmt(tdpsL.targets, tdps.tooltipTargets), nil, 1, nil, nil, 1, function() if tdps.tooltipTargets == 10 then tdps.tooltipTargets = 0 else tdps.tooltipTargets = tdps.tooltipTargets + 1 end DropDownList3Button13:SetFormattedText(tdpsL.targets, tdps.tooltipTargets) end)
			newBu(level, '', nil, 1, nil, nil, nil, nil, nil, nil, nil, 1)
			newBu(level, tdpsL.keepOnlyBossFights, nil, nil, nil, nil, 1, function() tdps.onlyBossSegments = not tdps.onlyBossSegments end, nil, nil, tdps.onlyBossSegments, nil, 1)
			newBu(level, fmt(tdpsL.history, tdpsNumberOfFights - 2), nil, 1, nil, nil, 1, changeNumberOfFights)


		elseif level == 4 and UIDROPDOWNMENU_MENU_VALUE == 'size' then

			newBu(level, tdpsL.increase, nil, 1, nil, nil, 1, changeFont, 'size', 1)
			newBu(level, tdpsL.decrease, nil, 1, nil, nil, 1, changeFont, 'size', -1)

		elseif level == 4 and UIDROPDOWNMENU_MENU_VALUE == 'font' then

			if GetLocale() == "koKR" then
				newBu(level, '굵은 글꼴', nil, nil, nil, nil, nil, changeFont, 'font', [[Fonts\2002B.TTF]], function() if tdpsFont.name == [[Fonts\2002B.TTF]] then return true end end, nil, nil)
				newBu(level, '기본 글꼴', nil, nil, nil, nil, nil, changeFont, 'font', [[Fonts\2002.TTF]], function() if tdpsFont.name == [[Fonts\2002.TTF]] then return true end end, nil, nil)
				newBu(level, '데미지 글꼴', nil, nil, nil, nil, nil, changeFont, 'font', [[Fonts\K_Damage.TTF]], function() if tdpsFont.name == [[Fonts\K_Damage.TTF]] then return true end end, nil, nil)
				newBu(level, '퀘스트 글꼴', nil, nil, nil, nil, nil, changeFont, 'font', [[Fonts\K_Pagetext.TTF]], function() if tdpsFont.name == [[Fonts\K_Pagetext.TTF]] then return true end end, nil, nil)
			elseif GetLocale() == "zhCN" then
				newBu(level, '默认', nil, nil, nil, nil, nil, changeFont, 'font', [[Fonts\ZYKai_T.TTF]], function() if tdpsFont.name == [[Fonts\ZYKai_T.TTF]] then return true end end, nil, nil)
				newBu(level, '聊天', nil, nil, nil, nil, nil, changeFont, 'font', [[Fonts\ZYHei.TTF]], function() if tdpsFont.name == [[Fonts\ZYHei.TTF]] then return true end end, nil, nil)
				newBu(level, '伤害数字', nil, nil, nil, nil, nil, changeFont, 'font', [[Fonts\ZYKai_C.TTF]], function() if tdpsFont.name == [[Fonts\ZYKai_C.TTF]] then return true end end, nil, nil)
			elseif GetLocale() == "zhTW" then
				newBu(level, '預設', nil, nil, nil, nil, nil, changeFont, 'font', [[Fonts\bLEI00D.TTF]], function() if tdpsFont.name == [[Fonts\bLEI00D.TTF]] then return true end end, nil, nil)
				newBu(level, '聊天', nil, nil, nil, nil, nil, changeFont, 'font', [[Fonts\bHEI01B.TTF]], function() if tdpsFont.name == [[Fonts\bHEI01B.TTF]] then return true end end, nil, nil)
				newBu(level, '傷害數字', nil, nil, nil, nil, nil, changeFont, 'font', [[Fonts\bKAI00M.TTF]], function() if tdpsFont.name == [[Fonts\bKAI00M.TTF]] then return true end end, nil, nil)
				newBu(level, '提示訊息', nil, nil, nil, nil, nil, changeFont, 'font', [[Fonts\bHEI00M.TTF]], function() if tdpsFont.name == [[Fonts\bHEI00M.TTF]] then return true end end, nil, nil)
			else
				newBu(level, 'Skurri', nil, nil, nil, nil, nil, changeFont, 'font', [[Fonts\SKURRI.TTF]], function() if tdpsFont.name == [[Fonts\SKURRI.TTF]] then return true end end, nil, nil)
				newBu(level, 'Visitor', nil, nil, nil, nil, nil, changeFont, 'font', [[Interface\AddOns\TinyDPS\Fonts\visitor.ttf]], function() if tdpsFont.name == [[Interface\AddOns\TinyDPS\Fonts\visitor.ttf]] then return true end end, nil, nil)
				newBu(level, 'Morpheus', nil, nil, nil, nil, nil, changeFont, 'font', [[Fonts\MORPHEUS.TTF]], function() if tdpsFont.name == [[Fonts\MORPHEUS.TTF]] then return true end end, nil, nil)
				newBu(level, 'Arial Narrow', nil, nil, nil, nil, nil, changeFont, 'font', [[Fonts\ARIALN.TTF]], function() if tdpsFont.name == [[Fonts\ARIALN.TTF]] then return true end end, nil, nil)				
				newBu(level, 'Friz Quadrata TT', nil, nil, nil, nil, nil, changeFont, 'font', [[Fonts\FRIZQT__.TTF]], function() if tdpsFont.name == [[Fonts\FRIZQT__.TTF]] then return true end end, nil, nil)
			end
			
			if GetLocale() == "ruRU" then
				newBu(level, 'Nimrod MT', nil, nil, nil, nil, nil, changeFont, 'font', [[Fonts\NIM_____.TTF]], function() if tdpsFont.name == [[Fonts\NIM_____.TTF]] then return true end end, nil, nil)
			end

			newBu(level, 'Custom', nil, nil, nil, nil, nil, changeFont, 'font', [[Interface\AddOns\TinyDPS\Fonts\custom.ttf]], function() if tdpsFont.name == [[Interface\AddOns\TinyDPS\Fonts\custom.ttf]] then return true end end, nil, nil)

		elseif level == 4 and UIDROPDOWNMENU_MENU_VALUE == 'layout' then

			newBu(level, tdpsL.dps, nil, nil, nil, nil, 1, changeTextLayout, 8, nil, function() if band(tdps.layout,8) > 0 then return true end end, nil, 1)
			newBu(level, tdpsL.rank, nil, nil, nil, nil, 1, function() tdps.showRank = not tdps.showRank tdpsRefresh() end, nil, nil, tdps.showRank, nil, 1)
			newBu(level, tdpsL.percent, nil, nil, nil, nil, 1, changeTextLayout, 4, nil, function() if band(tdps.layout,4) > 0 then return true end end, nil, 1)
			newBu(level, tdpsL.amount, nil, nil, nil, nil, 1, changeTextLayout, 2, nil, function() if band(tdps.layout,2) > 0 then return true end end, nil, 1)
			newBu(level, tdpsL.short, nil, nil, nil, nil, 1, changeTextLayout, 1, nil, function() if band(tdps.layout,1) > 0 then return true end end, nil, 1)

		elseif level == 4 and UIDROPDOWNMENU_MENU_VALUE == 'outline' then

			newBu(level, tdpsL.none, nil, nil, nil, nil, nil, changeFont, 'outline', '', function() if tdpsFont.outline == '' and tdpsFont.shadow == 0 then return true end end)
			newBu(level, tdpsL.thin, nil, nil, nil, nil, nil, changeFont, 'outline', 'Outline', function() if tdpsFont.outline == 'Outline' and tdpsFont.shadow == 0 then return true end end)
			newBu(level, tdpsL.thick, nil, nil, nil, nil, nil, changeFont, 'outline', 'Thickoutline', function() if tdpsFont.outline == 'Thickoutline' and tdpsFont.shadow == 0 then return true end end)
			newBu(level, tdpsL.shadow, nil, nil, nil, nil, nil, changeFont, 'shadow', 1, function() if tdpsFont.outline == '' and tdpsFont.shadow > 0 then return true end end)
			newBu(level, tdpsL.mono , nil, nil, nil, nil, nil, changeFont, 'outline', 'Outlinemonochrome', function() if tdpsFont.outline == 'Outlinemonochrome' and tdpsFont.shadow == 0 then return true end end)

		elseif level == 4 and UIDROPDOWNMENU_MENU_VALUE == 'height' then

			newBu(level, tdpsL.increase, nil, 1, nil, nil, 1, changeBarHeight, 1)
			newBu(level, tdpsL.decrease, nil, 1, nil, nil, 1, changeBarHeight, -1)

		elseif level == 4 and UIDROPDOWNMENU_MENU_VALUE == 'spacing' then

			newBu(level, tdpsL.increase, nil, 1, nil, nil, 1, changeBarSpacing, 1)
			newBu(level, tdpsL.decrease, nil, 1, nil, nil, 1, changeBarSpacing, -1)

		end

	end



	local function tdpsSpellSort(x,y) if ttSpellMerge[x] > ttSpellMerge[y] then return true end end
	local function tdpsMobSort(x,y) if ttMobMerge[x] > ttMobMerge[y] then return true end end



	local function newBar(g)

		local dummybar = CreateFrame('Statusbar', 'tdpsStatusBar', tdpsFrame)
		dummybar:SetFrameStrata('MEDIUM')
		dummybar:SetFrameLevel(2)
		dummybar:SetOrientation('HORIZONTAL')
		dummybar:EnableMouse(1)
		dummybar:EnableMouseWheel(1)
		dummybar:SetWidth(tdpsFrame:GetWidth() - 4)
		dummybar:SetHeight(tdps.barHeight)
		dummybar:Hide()
		--dummybar:SetPoint('RIGHT', tdpsFrame, 'RIGHT', -2, 0)
		dummybar:SetBackdrop({bgFile = [[Interface\AddOns\TinyDPS\Textures\wglass.tga]], edgeFile = [[Interface\AddOns\TinyDPS\Textures\blank.tga]], tile = false, tileSize = 1, edgeSize = 1, insets = { left = 0, right = 0, top = 0, bottom = 0}})
		dummybar:SetStatusBarTexture([[Interface\AddOns\TinyDPS\Textures\wglass.tga]])

		-- bar info
		dummybar.name, dummybar.guid, dummybar.n = tok('-', tdpsPlayer[g]['name']), g, 0

		-- scripts
		dummybar:SetScript('OnEnter', function(self)

			GameTooltip:SetOwner(self)
			GameTooltip:SetText(tdpsPlayer[g].name)

			-- tooltip title
			if tdpsF == 2 then GameTooltip:AddLine(fmt('%s %s', tdpsL.tipPrefix[tdpsV], tdpsL.currentFight), 1, .85, 0)
			else GameTooltip:AddLine(fmt('%s %s', tdpsL.tipPrefix[tdpsV], tdpsFight[tdpsF].name or '?'), 1, .85, 0) end

			-- own amount
			GameTooltip:AddDoubleLine(tdpsL.personal, tdpsPlayer[self.guid].fight[tdpsF][tdpsV] .. ' (' .. round(tdpsPlayer[self.guid].fight[tdpsF][tdpsV]/(self.n)*100,0) .. '%)', 1, 1, 1, 1, 1, 1)

			-- pet amount
			local pet, petAmount = tdpsPlayer[g].pet, 0
			for i=1,#pet do petAmount = petAmount + tdpsPet[pet[i]].fight[tdpsF][tdpsV] end
			if petAmount > 0 then GameTooltip:AddDoubleLine(tdpsL.byPets, petAmount .. ' (' .. round(petAmount/(self.n)*100,0) .. '%)', 1, 1, 1, 1, 1, 1) end

			-- spell details
			if tdps.trackSpells then

				-- merge the data of this player
				for k,v in pairs(tdpsPlayer[g].fight[tdpsF][tdpsV..'s']) do for kk,vv in pairs(v) do ttSpellMerge[k] = (ttSpellMerge[k] or 0) + vv ttMobMerge[kk] = (ttMobMerge[kk] or 0) + vv end end
				for i=1,#pet do for k,v in pairs(tdpsPet[pet[i]].fight[tdpsF][tdpsV..'s']) do for kk,vv in pairs(v) do ttSpellMerge[k] = (ttSpellMerge[k] or 0) + vv ttMobMerge[kk] = (ttMobMerge[kk] or 0) + vv end end end

				-- display spells
				if tdps.tooltipSpells > 0 then GameTooltip:AddLine(tdpsL.topAbilities, 1, .85, 0) end
				for k,v in pairs(ttSpellMerge) do t_insert(ttSort, k) end
				t_sort(ttSort, tdpsSpellSort)
				for i=1,tdps.tooltipSpells do if ttSort[i] then GameTooltip:AddDoubleLine(i .. '. ' .. ttSort[i], ttSpellMerge[ttSort[i]] .. ' (' .. round(ttSpellMerge[ttSort[i]]/(self.n)*100,0) .. '%)', 1, 1, 1, 1, 1, 1) end end
				t_wipe(ttSort)

				-- display targets
				if tdps.tooltipTargets > 0 then GameTooltip:AddLine(tdpsL.topTargets, 1, .85, 0) end
				for k,v in pairs(ttMobMerge) do t_insert(ttSort, k) end
				t_sort(ttSort, tdpsMobSort)
				for i=1,tdps.tooltipTargets do if ttSort[i] then GameTooltip:AddDoubleLine(i .. '. ' .. ttSort[i], ttMobMerge[ttSort[i]] .. ' (' .. round(ttMobMerge[ttSort[i]]/(self.n)*100,0) .. '%)', 1, 1, 1, 1, 1, 1) end end
				t_wipe(ttSort)
				t_wipe(ttSpellMerge)
				t_wipe(ttMobMerge)

			end
			
			-- display the tooltip
			GameTooltip:Show()

		end)

		dummybar:SetScript('OnLeave', function(self) GameTooltip:Hide() end)

		dummybar:SetScript('OnMouseDown', function(self, button)
			if button == 'LeftButton' and IsShiftKeyDown() then GameTooltip:Hide() CloseDropDownMenus() isMovingOrSizing = true tdpsAnchor:StartMoving()
			elseif button == 'RightButton' then ToggleDropDownMenu(1, nil, tdpsDropDown, 'cursor', 0, 0)
			elseif button == 'MiddleButton' then reset()
			elseif button == 'Button4' then changeFight(nil, 1)
			elseif button == 'Button5' then changeFight(nil, 2) end
		end)

		dummybar:SetScript('OnMouseUp', function(self, button)
			if button == 'LeftButton' then
				tdpsAnchor:StopMovingOrSizing()
				isMovingOrSizing = nil
				-- set position of frame
				tdpsFrame:ClearAllPoints()
				tdpsFrame:SetPoint(tdps.anchor, tdpsAnchor, tdps.anchor, 0, 0)
				-- save position of anchor
				local xOfs, yOfs = tdpsAnchor:GetCenter()
				local scale = tdpsAnchor:GetEffectiveScale()
				local uis = UIParent:GetScale()
				xOfs = xOfs * scale - GetScreenWidth() * uis / 2
				yOfs = yOfs * scale - GetScreenHeight() * uis / 2
				tdpsPosition.x = xOfs / uis
				tdpsPosition.y = yOfs / uis
			end
		end)

		dummybar:SetScript('OnMouseWheel', function(self, direction) scroll(direction) end)

		-- number fontstring
		dummybar.fontStringRight = dummybar:CreateFontString(nil, 'OVERLAY')
		dummybar.fontStringRight:SetPoint('RIGHT', -1, tdpsTextOffset)
		dummybar.fontStringRight:SetJustifyH('RIGHT')
		dummybar.fontStringRight:SetFont(tdpsFont.name, tdpsFont.size, tdpsFont.outline)
		dummybar.fontStringRight:SetShadowColor(.05, .05, .05, 1)
		dummybar.fontStringRight:SetShadowOffset(tdpsFont.shadow, tdpsFont.shadow * -1)

		-- name fontstring
		dummybar.fontStringLeft = dummybar:CreateFontString(nil, 'OVERLAY')
		dummybar.fontStringLeft:SetPoint('LEFT', 1, tdpsTextOffset)
		dummybar.fontStringLeft:SetPoint('RIGHT', dummybar.fontStringRight, 'LEFT', -2, 1)
		dummybar.fontStringLeft:SetJustifyH('LEFT')
		dummybar.fontStringLeft:SetFont(tdpsFont.name, tdpsFont.size, tdpsFont.outline)
		dummybar.fontStringLeft:SetShadowColor(.05, .05, .05, 1)
		dummybar.fontStringLeft:SetShadowOffset(tdpsFont.shadow, tdpsFont.shadow * -1)

		-- colors
		local classR, classG, classB, classA = cColor[tdpsPlayer[g].class].r, cColor[tdpsPlayer[g].class].g, cColor[tdpsPlayer[g].class].b, tdpsColorAlpha
		if tdps.swapColor then
			dummybar:SetStatusBarColor(classR, classG, classB, classA)
			dummybar.fontStringRight:SetTextColor(tdps.bar[1], tdps.bar[2], tdps.bar[3], tdps.bar[4])
			dummybar.fontStringLeft:SetTextColor(tdps.bar[1], tdps.bar[2], tdps.bar[3], tdps.bar[4])
		else
			dummybar:SetStatusBarColor(tdps.bar[1], tdps.bar[2], tdps.bar[3], tdps.bar[4])
			dummybar.fontStringRight:SetTextColor(classR, classG, classB, classA)
			dummybar.fontStringLeft:SetTextColor(classR, classG, classB, classA)
		end
		dummybar:SetBackdropColor(tdps.barbackdrop[1], tdps.barbackdrop[2], tdps.barbackdrop[3], tdps.barbackdrop[4])
		dummybar:SetBackdropBorderColor(0, 0, 0, 0)

		-- save bar
		t_insert(bar, dummybar)

	end



	local function makeCombatant(k, n, pgl, c)
		if c == 'PET' then
			tdpsPet[k] = {name = n, guid = pgl, class = c, stamp = 0, fight = {}}
			while #tdpsPet[k].fight < tdpsNumberOfFights do t_insert(tdpsPet[k].fight, {d = 0, ds = {}, h = 0, hs = {}, t = 0}) end
		else
			tdpsPlayer[k] = {name = n, pet = pgl, class = c, stamp = 0, fight = {}}
			while #tdpsPlayer[k].fight < tdpsNumberOfFights do t_insert(tdpsPlayer[k].fight, {d = 0, ds = {}, h = 0, hs = {}, t = 0}) end
			newBar(k)
		end
	end



	local function trackSpell(amount, target, spell, dh)
		if tdps.trackSpells then
			dh = dh .. 's'
			if not com.fight[1][dh][spell] then com.fight[1][dh][spell] = {} end -- make the spell
			if not com.fight[2][dh][spell] then com.fight[2][dh][spell] = {} end
			com.fight[1][dh][spell][target] = (com.fight[1][dh][spell][target] or 0) + amount -- record the amount
			com.fight[2][dh][spell][target] = (com.fight[2][dh][spell][target] or 0) + amount
		end
	end






---------------------------------------------------------------------------------------------------------------------------------
--- combat event handler --------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------



	local function tdpsCombatEvent(self, event, ...)

		local arg1, arg2, arg4, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14 = ...

		-- return when source is an outsider
		if arg6%8 == 0 then return end

		-- track absorbs
		if arg2 == 'SPELL_AURA_APPLIED' and arg9%8>0 and isAbsorb[arg10] then tdpsShield[arg4..arg10..arg7] = arg14 return
		elseif arg2 == 'SPELL_AURA_REFRESH' and arg9%8>0 and isAbsorb[arg10] and tdpsShield[arg4..arg10..arg7] then
			-- launch a fake healing event
			if tdpsShield[arg4..arg10..arg7] - arg14 > 0 then tdpsCombatEvent(self, event, arg1, 'SPELL_HEAL', arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, tdpsShield[arg4..arg10..arg7] - arg14, 0, 0, 0) end
			-- add the new value to the shield
			tdpsShield[arg4..arg10..arg7] = arg14 return
		elseif arg2 == 'SPELL_AURA_REMOVED' and arg9%8>0 and isAbsorb[arg10] and tdpsShield[arg4..arg10..arg7] then
			-- launch a fake healing event
			if tdpsShield[arg4..arg10..arg7] - arg14 > 0 then tdpsCombatEvent(self, event, arg1, 'SPELL_HEAL', arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, tdpsShield[arg4..arg10..arg7] - arg14, 0, 0, 0) end
			-- delete the shield
			tdpsShield[arg4..arg10..arg7] = nil return end

		-- return on invalid event, vehicle, friendly fire, hostile healing, evaded
		if not isValidEvent[arg2] or sub(arg4,5,5) == '5' or (band(arg9,16) > 0 and isDamage[arg2]) or (band(arg9,16) == 0 and isHeal[arg2]) or arg13 == 'EVADE' then return end

		-- create summoned pets
		if arg2 == 'SPELL_SUMMON' then
			if UnitIsPlayer(arg5) and not isExcludedPet[toNum(arg7:sub(7, 10), 16)] then -- add pet when player summons
				-- make owner if necessary
				if not tdpsPlayer[arg4] then
					makeCombatant(arg4, arg5, {arg5 .. ': ' .. arg8}, getClass(arg5))
				end
				-- make pointer
				tdpsLink[arg7] = arg5 .. ': ' .. arg8
				-- make pet if it does not exist yet
				if not tdpsPet[arg5 .. ': ' .. arg8] then makeCombatant(arg5 .. ': ' .. arg8, arg8, arg7, 'PET') end
				-- add pet to owner if it's not there yet
				local found = nil for i=1,#tdpsPlayer[arg4].pet do if tdpsPlayer[arg4].pet[i] == arg5 .. ': ' .. arg8 then found = true break end end
				if not found then t_insert(tdpsPlayer[arg4].pet, arg5 .. ': ' .. arg8) end
			elseif tdpsLink[arg4] then -- the summoner is also a pet. Example: totem summons greater fire elemental.
				 -- ownername of owner
				local oo = tok(':', tdpsLink[arg4])
				-- make pointer
				tdpsLink[arg7] = oo .. ': ' ..arg8
				-- make pet
				makeCombatant(oo .. ': ' .. arg8, arg8, arg7, 'PET')
				-- add pet to owner if it's not there yet
				local found = nil
				for i=1,#tdpsPlayer[UnitGUID(oo)].pet do if tdpsPlayer[UnitGUID(oo)].pet[i] == oo..': '..arg8 then found = true break end end
				if not found then t_insert(tdpsPlayer[UnitGUID(oo)].pet, oo .. ': ' .. arg8) end
			end
			return
		end

		-- select or create combatant
		if tdpsPlayer[arg4] then com = tdpsPlayer[arg4]
		elseif tdpsPet[tdpsLink[arg4]] then com = tdpsPet[tdpsLink[arg4]]
		elseif UnitIsPlayer(arg5) then
			makeCombatant(arg4, arg5, {}, getClass(arg5))
			tdpsCombatEvent(self, event, ...)
			return
		elseif isPartyPet(arg4) then
			-- get owner
			local oGuid, oName = getPetOwnerGUID(arg4), getPetOwnerName(arg4)
			-- make owner if it does not exist yet
			if not tdpsPlayer[oGuid] then
				makeCombatant(oGuid, oName, {oName .. ': ' .. arg5}, getClass(oName))
			end
			-- make pointer
			tdpsLink[arg4] = oName .. ': ' .. arg5
			-- make pet if it does not exist yet
			if not tdpsPet[oName .. ': ' .. arg5] then
				makeCombatant(oName .. ': ' .. arg5, arg5, arg4, 'PET')
			end
			-- add pet to owner if it's not there yet
			local found = nil
			for i=1,#tdpsPlayer[oGuid].pet do if tdpsPlayer[oGuid].pet[i] == oName .. ': ' .. arg5 then found = true break end end
			if not found then t_insert(tdpsPlayer[oGuid].pet, oName .. ': ' .. arg5) end
			-- event
			tdpsCombatEvent(self, event, ...)
			return
		else
			return
		end

		-- track numbers
		if isMiss[arg2] then
			if tdpsStartNewFight then startNewFight(arg8, arg7) end
		elseif isDamage[arg2] then
			if tdpsStartNewFight then startNewFight(arg8, arg7) end
			if arg2 == 'SWING_DAMAGE' then arg = arg10 trackSpell(arg, arg8, tdpsL.melee, 'd') else arg = arg13 trackSpell(arg, arg8, arg11, 'd') end
			tdpsFight[1].d, tdpsFight[2].d = tdpsFight[1].d + arg, tdpsFight[2].d + arg
			com.fight[1].d, com.fight[2].d = com.fight[1].d + arg, com.fight[2].d + arg
		elseif isHeal[arg2] then
			arg = arg13 - arg14 -- effective healing
			if arg < 1 or not tdpsInCombat then return end -- stop on complete overheal or out of combat. Note that heals will never start a new fight.
			trackSpell(arg, arg8, arg11, 'h')
			tdpsFight[1].h, tdpsFight[2].h = tdpsFight[1].h + arg, tdpsFight[2].h + arg
			com.fight[1].h, com.fight[2].h = com.fight[1].h + arg, com.fight[2].h + arg
		end

		-- add combat time
		arg = arg1 - com.stamp
		if arg < 3.5 then com.fight[1].t = com.fight[1].t + arg else com.fight[1].t = com.fight[1].t + 3.5 end
		if arg < 3.5 then com.fight[2].t = com.fight[2].t + arg else com.fight[2].t = com.fight[2].t + 3.5 end

		-- save time stamp
		com.stamp = arg1

		-- set onupdate
		tdpsAnchor:SetScript('OnUpdate', tdpsOnUpdate)

	end






---------------------------------------------------------------------------------------------------------------------------------
--- addon scripts ---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------



	tdpsFrame:RegisterEvent('ADDON_LOADED')



	tdpsFrame:SetScript('OnEvent', function(self, event)

		local curVer = GetAddOnMetadata('TinyDPS', 'Version')
		
		ver()

		-- global version mismatch
		if curVer ~= tdps.version and '0.935' ~= tdps.version and '0.936' ~= tdps.version and '0.937' ~= tdps.version then
			initialiseSavedVariables()
			echo('Global variables have been reset to version ' .. curVer)
		end

		-- character version mismatch
		if curVer ~= tdpsVersion and '0.935' ~= tdpsVersion and '0.936' ~= tdpsVersion and '0.937' ~= tdpsVersion then
			initialiseSavedVariablesPerCharacter()
			echo('Character variables have been reset to version ' .. curVer)
			tdpsFrame:SetHeight(tdps.barHeight + 4)
		end

		-- save current version
		tdps.version = curVer
		tdpsVersion = curVer

		-- set position of anchor
		tdpsAnchor:ClearAllPoints()
		local scale = tdpsAnchor:GetEffectiveScale()
		local uis = UIParent:GetScale()
		tdpsAnchor:SetPoint('CENTER', UIParent, 'CENTER', tdpsPosition.x*uis/scale, tdpsPosition.y*uis/scale)

		-- set position of frame
		tdpsFrame:ClearAllPoints()
		tdpsFrame:SetPoint(tdps.anchor, tdpsAnchor, tdps.anchor)

		-- set width
		tdpsFrame:SetWidth(tdps.width)

		-- check for custom class colors
		if CUSTOM_CLASS_COLORS then cColor = CUSTOM_CLASS_COLORS else cColor = RAID_CLASS_COLORS end

		-- make bars if any
		for k in pairs(tdpsPlayer) do newBar(k) end

		-- set font and colors
		noData:SetFont(tdpsFont.name, tdpsFont.size, tdpsFont.outline)
		noData:SetShadowOffset(tdpsFont.shadow, tdpsFont.shadow * -1)
		tdpsFrame:SetBackdropBorderColor(tdps.border[1], tdps.border[2], tdps.border[3], tdps.border[4])
		tdpsFrame:SetBackdropColor(tdps.backdrop[1], tdps.backdrop[2], tdps.backdrop[3], tdps.backdrop[4])

		-- tukui match
        tdpsFrame:SetBorder() -- Hydra border
		
		-- hide when necessary
		visibilityEvent()

		-- minimap button
		if tdps.showMinimapButton then tdpsButtonFrame:Show() else tdpsButtonFrame:Hide() end

		-- reset events
		tdpsFrame:UnregisterEvent('ADDON_LOADED')
		tdpsFrame:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
		tdpsFrame:SetScript('OnEvent', tdpsCombatEvent)

	end)



	-- all events that can show or hide the main window
	tdpsAnchor:RegisterEvent('PLAYER_REGEN_ENABLED')
	tdpsAnchor:RegisterEvent('PLAYER_REGEN_DISABLED')
	tdpsAnchor:RegisterEvent('PARTY_MEMBERS_CHANGED')
	tdpsAnchor:RegisterEvent('PLAYER_ENTERING_WORLD')
	tdpsAnchor:RegisterEvent('ZONE_CHANGED_NEW_AREA')
	tdpsAnchor:RegisterEvent('UPDATE_WORLD_STATES')



	tdpsAnchor:SetScript('OnEvent', function(self, event, ...)
		visibilityEvent()
		if event == 'PARTY_MEMBERS_CHANGED' then
			if tdps.autoReset and tdpsPartySize == 0 and math.max(GetNumPartyMembers(), GetNumRaidMembers()) > 0 then reset() end
			tdpsPartySize = math.max(GetNumPartyMembers(), GetNumRaidMembers())
		end
	end)



	-- onupdate
	local sec = 2
	function tdpsOnUpdate(self, elapsed)
		sec = sec + elapsed
		if sec > tdps.speed then
			checkCombat()
			if not tdpsInCombat then
				tdpsStartNewFight = true
				tdpsAnchor:SetScript('OnUpdate', nil) -- this onupdate function is automatically halted if we go out of combat. It's restarted when a combat event happens (see function tdpsCombatEvent)
			end
			-- conditional refresh of the main window
			if tdpsFrame:IsVisible() and not isMovingOrSizing and not tdpsAnimationGroup:IsPlaying() then tdpsRefresh() end
			sec = 0
		end
	end
	tdpsAnchor:SetScript('OnUpdate', tdpsOnUpdate)



	tdpsFrame:SetScript('OnMouseDown', function(self, button)
		if button == 'LeftButton' and IsShiftKeyDown() then CloseDropDownMenus() GameTooltip:Hide() isMovingOrSizing = true tdpsAnchor:StartMoving()
		elseif button == 'RightButton' then ToggleDropDownMenu(1, nil, tdpsDropDown, 'cursor', 0, 0)
		elseif button == 'MiddleButton' then reset()
		elseif button == 'Button4' then changeFight(nil, 1)
		elseif button == 'Button5' then changeFight(nil, 2) end
	end)



	tdpsFrame:SetScript('OnMouseUp', function(self, button)
		if button == 'LeftButton' then 
			tdpsAnchor:StopMovingOrSizing()
			isMovingOrSizing = nil
			-- set position of frame
			tdpsFrame:ClearAllPoints()
			tdpsFrame:SetPoint(tdps.anchor, tdpsAnchor, tdps.anchor, 0, 0)
			-- save position of anchor
			local xOfs, yOfs = tdpsAnchor:GetCenter()
			local scale = tdpsAnchor:GetEffectiveScale()
			local uis = UIParent:GetScale()
			xOfs = xOfs * scale - GetScreenWidth() * uis / 2
			yOfs = yOfs * scale - GetScreenHeight() * uis / 2
			tdpsPosition.x = xOfs / uis
			tdpsPosition.y = yOfs / uis
		end
	end)



	tdpsFrame:SetScript('OnMouseWheel', function(self, direction) scroll(direction) end)






---------------------------------------------------------------------------------------------------------------------------------
--- minimap button scripts ------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------



	tdpsButtonFrame:SetScript('OnMouseDown', function(self, button)
		if button == 'RightButton' then ToggleDropDownMenu(1, nil, tdpsDropDown, 'cursor', 0, 0) end
		if button == 'MiddleButton' then reset() end
	end)



	tdpsButtonFrame:SetScript('OnMouseUp', function(self, button)
		if button == 'LeftButton' then toggle() end
	end)



	tdpsButtonFrame:SetScript('OnDragStart', function(self, button)
		tdpsButtonFrame:SetScript('OnUpdate', function(self, elapsed)
			local x, y = Minimap:GetCenter()
			local cx, cy = GetCursorPosition()
			x, y = cx / self:GetEffectiveScale() - x, cy / self:GetEffectiveScale() - y
			if x > Minimap:GetWidth()/2+tdpsButtonFrame:GetWidth()/2 then x = Minimap:GetWidth()/2+tdpsButtonFrame:GetWidth()/2 end
			if x < Minimap:GetWidth()/2*-1-tdpsButtonFrame:GetWidth()/2 then x = Minimap:GetWidth()/2*-1-tdpsButtonFrame:GetWidth()/2 end
			if y > Minimap:GetHeight()/2+tdpsButtonFrame:GetHeight()/2 then y = Minimap:GetHeight()/2+tdpsButtonFrame:GetHeight()/2 end
			if y < Minimap:GetHeight()/2*-1-tdpsButtonFrame:GetHeight()/2 then y = Minimap:GetHeight()/2*-1-tdpsButtonFrame:GetHeight()/2 end
			tdpsButtonFrame:ClearAllPoints()
			tdpsButtonFrame:SetPoint('CENTER', x, y)
		end)
	end)



	tdpsButtonFrame:SetScript('OnDragStop', function(self, button) tdpsButtonFrame:SetScript('OnUpdate', nil) end)



	tdpsButtonFrame:SetScript('OnEnter', function(self)

		GameTooltip:SetOwner(tdpsButtonFrame)
		GameTooltip:SetText('TinyDPS')

		if tdpsF == 2 then
			GameTooltip:AddLine(fmt('%s %s', tdpsL.tipPrefix[tdpsV], tdpsL.currentFight), 1, .85, 0)
		else
			GameTooltip:AddLine(fmt('%s %s', tdpsL.tipPrefix[tdpsV], tdpsFight[tdpsF].name), 1, .85, 0)
		end

		-- personal amount
		local ownAmount, ownTime, pet = 0, 0
		if tdpsPlayer[UnitGUID('player')] then
			pet, ownAmount, ownTime = tdpsPlayer[UnitGUID('player')].pet, tdpsPlayer[UnitGUID('player')].fight[tdpsF][tdpsV], tdpsPlayer[UnitGUID('player')].fight[tdpsF].t
			for i=1,#pet do
				ownAmount = ownAmount + tdpsPet[pet[i]].fight[tdpsF][tdpsV]
				if tdpsPet[pet[i]].fight[tdpsF].t > ownTime then ownTime = tdpsPet[pet[i]].fight[tdpsF].t end
			end
			if ownAmount > 0 then GameTooltip:AddDoubleLine(UnitName('player'), fmt('%i (%i)', ownAmount, ownAmount / ownTime), 1, 1, 1, 1, 1, 1) end
		end

		-- raid amount
		local partyAmount, partyTime = 0, 0
		for k,v in pairs(tdpsPlayer) do
			partyAmount = partyAmount + v.fight[tdpsF][tdpsV]
			if v.fight[tdpsF].t > partyTime then partyTime = v.fight[tdpsF].t end
		end
		for k,v in pairs(tdpsPet) do
			partyAmount = partyAmount + v.fight[tdpsF][tdpsV]
			if v.fight[tdpsF].t > partyTime then partyTime = v.fight[tdpsF].t end
		end

		if partyAmount > ownAmount then
			GameTooltip:AddDoubleLine(tdpsL.raid, fmt('%i (%i)', partyAmount, partyAmount / partyTime), 1, 1, 1, 1, 1, 1)
		end

		GameTooltip:Show()

	end)



	tdpsButtonFrame:SetScript('OnLeave', function(self) GameTooltip:Hide() end)






---------------------------------------------------------------------------------------------------------------------------------
--- resizing scripts ------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------



	tdpsResizeFrame:SetScript('OnEnter', function() tdpsResizeTexture:SetDesaturated(0) tdpsResizeTexture:SetAlpha(1) end)
	tdpsResizeFrame:SetScript('OnLeave', function() tdpsResizeTexture:SetDesaturated(1) tdpsResizeTexture:SetAlpha(0) end)



	tdpsResizeFrame:SetScript('OnMouseDown', function() isMovingOrSizing = true tdpsFrame:SetMinResize(60, tdpsFrame:GetHeight()) tdpsFrame:SetMaxResize(400, tdpsFrame:GetHeight()) tdpsFrame:StartSizing() end)



	tdpsResizeFrame:SetScript('OnMouseUp', function()
		tdpsFrame:StopMovingOrSizing()
		tdpsFrame:ClearAllPoints()
		tdpsFrame:SetPoint(tdps.anchor, tdpsAnchor, tdps.anchor)
		isMovingOrSizing = nil
		tdps.width = tdpsFrame:GetWidth()
		for i=1,#bar do bar[i]:SetWidth(tdpsFrame:GetWidth() - 4) bar[i]:SetValue(0) end
		tdpsRefresh()
	end)