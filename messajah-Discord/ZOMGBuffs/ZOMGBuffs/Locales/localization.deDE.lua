local L = LibStub("AceLocale-2.2"):new("ZOMGBuffs")

L:RegisterTranslations("deDE", function() return
--[===[@debug@
{
}
--@end-debug@]===]
{
	[" on %s"] = "auf %s",
	["%s blacklisted for 10 seconds"] = "%s für 10sek auf der Blacklist",
	["%s%s%s|r to cast %s%s|r%s"] = "%s%s%s|r um %s%s|r%s zu wirken",
	["%s%s%s|r to target"] = "%s%s%s|r zum Ziel wechseln",
	["<ZOMG> Missing %s: %s"] = "<ZOMG> %s: %s fehlt",
	["<new name>"] = "<neuer Name>",
	["<template name>"] = "<Vorlagenname>",
	ABOUT = "Rundum Stärkungszauber Addon für alle Klassen. Automatische Paladin Stärkungszaubereinteilung abhängig von ihren Talenten sowie den Talentspezialisierungen von Schlachtzugsmitgliedern (Druiden Tanks, Druiden Heiler, etc.). Zusätzliche Übersicht aller Stärkungszauber innerhalb eines Schlachtzuges mit direkter Erneuerungsmöglichkeit per Rechtsklick.",
	Actions = "Aktionen",
	["Adjust height of the bars"] = "Höhe der Leisten anpassen",
	["Adjust the size of the timer text"] = "Größe des Timer Textes anpassen",
	["Adjust width of unit list"] = "Größe der Einheitenliste anpassen",
	Alphabetical = "Alphabetisch",
	["Also buff current target (assuming they're not in your party or raid"] = "Stärkungszauber automatisch auf das aktuelle Ziel wirken (in der Annahme, dass es sich nicht in deiner Gruppe oder Schlachtzug befindet)",
	["Alt-"] = "Alt-",
	["Always Load Manager"] = "Immer das Manager Modul laden",
	["Always Load Portalz"] = "Immer das Portalz Modul laden",
	["Always load the Blessings Manager, even when not eligable to modify blessings"] = "Immer den Segen Manager laden, auch ohne die benötigten Modifikationsrechte",
	["Always load the Portalz module, even when not a Mage"] = "Immer das Portalz Modul laden, auch wenn du keinen Magier spielst.",
	["Always show Stamina and Mark of the Wild Columns"] = "Zeige Spalten für Mal der Wildnis und Seelenstärke immer an",
	Anchor = "Anker",
	Arena = "Arena",
	["Auto Buy Reagents"] = "Reagenzien autom. kaufen",
	["Auto Switch"] = "Autom. wechseln",
	["Auto purchase level for %s (will not exceed this amount)"] = "Einkaufsvolumen für Reagenzien",
	["Auto-casting %s"] = "Wirke %s automatisch",
	["Auto-casting is disabled"] = "Autom. Wirken ist deaktiviert",
	["Automatically purchase required reagents from Reagents Vendor"] = "Kauft benötigte Reagenzien automatisch beim Reagenzienhändler",
	["Automatically switch to this template"] = "Automatisch auf diese Vorlage wechseln",
	Autosave = "Automatisches Speichern",
	["Bar Height"] = "Leisten-Höhe",
	["Bar Texture"] = "Leistentextur",
	Battleground = "Schlachtfeld",
	Behaviour = "Verhalten",
	Blessings = "Segen",
	Border = "Rand",
	["Bought |cFF80FF80%d|cFFFFFF80 %s|r from vendor, you now have |cFF80FF80%d|r"] = "|cFF80FF80%d|cFFFFFF80 %s|r vom Händler gekauft, du besitzt jetzt |cFF80FF80%d|r",
	["Buff Pets"] = "Begleiter buffen",
	["Buff Target"] = "Ziel buffen",
	["Buff Timer"] = "Stärkungszauber Timer",
	["Buff times over this number of minutes will not be shown"] = "Stärkungszauberdauer über dieser Anzahl von Minuten werden nicht dargestellt",
	["Button Five"] = "Maustaste Fünf",
	["Button Four"] = "Maustaste Vier",
	CHANNELING = "du kanalisierst einen Zauber",
	CHATANSWER = "<ZOMG>",
	CHATMATCH1 = "!buff",
	CHATMATCH2 = "!zomg",
	CHATMATCH3 = "!buffs",
	COMBAT = "du befindest dich im Kampf",
	Channel = "Kanal",
	["Choose the anchor to use for the player list"] = "Wähle den Anker, der für die Spielerliste benutzt werden soll",
	["Choose the relative point for the anchor"] = "Wähle die relative Position des Ankers",
	Class = "Klasse",
	["Class Icon"] = "Klassensymbol",
	["Clear talent cache to force refresh"] = "Leere den Talent Cache um einen Refresh zu forcieren",
	["Click Config"] = "Klick Konfiguration",
	Columns = "Spalten",
	["Columns to show in buff list"] = "Spalten, die in der Stärkungszauberliste angezeigt werden",
	["Configure popup raid list click behaviour"] = "Konfiguriere das popup Schlachtszugslistenverhalten",
	["Ctrl-"] = "Strg-",
	DEAD = "du bist tot",
	DISABLED = "DEAKTIVIERT",
	DRINKING = "du bist am trinken",
	Defaults = "Standardeinstellungen",
	["Define the key used for auto buffing"] = "Wähle eine Taste für das automatische Wirken von Stärkungszaubern",
	["Define the mouse click to use for |cFFFFFF80%s|r"] = "Wähle die Maustaste für |cFFFFFF80%s|r",
	Delete = "Löschen",
	["Delete this template"] = "Diese Vorlage löschen",
	Display = "Anzeige",
	["Display options"] = "Optionen anzeigen",
	["Display the ZOMGBuffs logo on icon"] = "Zeige das ZOMGBuffs Logo auf der Schaltfläche an",
	["Display the mouseover icon used by the popup player buff list"] = "Zeige das Mouseover Symbol der Spieler Stärkungszauberliste an",
	["Display the spell ready swirl when an autocast spell is loaded on the main icon"] = "Zeige den Zauber-bereit-Wirbel wenn ein automatisch zu wirkender Zauber auf der Hauptschaltfläche geladen wurde",
	["Don't auto buff when Mounted"] = "Kein automatisches Wirken von Stärkungszaubern wenn auf einem Reittier",
	["Don't auto buff when Resting"] = "Kein automatisches Wirken von Stärkungszaubern beim Ausruhen/Essen",
	["Don't auto buff when Shapeshifted"] = "Kein automatisches Wirken von Stärkungszaubern wenn Gestalt gewandelt",
	["Don't auto buff when Stealthed"] = "Kein automatisches Wirken von Stärkungszaubern wenn Unsichtbar",
	["Don't auto buff when you have Spirit Tap, so you can maximise your regeneration"] = "Kein automatisches Wirken während aktiver 5 Sekunden Regel, um Manaregeneration zu maximieren",
	["Don't directly buff PVP flagged players, unless you're already flagged for PVP"] = "Kein automatisches Wirken von Stärkungszaubern auf Spieler, die für PVP markiert sind, außer du bist selbst bereits für PVP markiert",
	EATING = "du bist am essen",
	ERRORICON = "FEHLER: self.icon fehlt",
	Empty = "Leer",
	Enable = "Einschalten",
	["Enable border on the icon"] = "Rahmen um das Icon anzeigen",
	["Enable border on the list"] = "Rahmen um die Liste anzeigen",
	FIND_FLASK = "^Fläschchen des",
	FIND_POT = "^Elixier des",
	Finish = "Fertig",
	Flask = "Fläschchen",
	Font = "Schriftart",
	["General buffing behaviour"] = "Generelles Stärkungszauberverhalten",
	["Give audible feedback when someone needs rebuffing"] = "Audiowiedergabe bei Auslaufen eines Stärkungszaubers",
	["Give feedback about events"] = "Audiowiedergabe für Events",
	Group = "Gruppe",
	["Group %d"] = "Gruppe %d",
	["Group Number"] = "Gruppennummer",
	HINT = "|cffeda55fKlick|r zum wechseln auf automatisches Wirken, |cffeda55fRechtsklick|r für Optionen, |cffeda55fKlick|r auf Symbol zum ändern, |cffeda55fUmschalt-Klick|r um Item von Selbstzauber Vorlage zu entfernen",
	HINTBM = "|cffeda55fKlick|r um automatisches Zauberwirken zu aktivieren/deaktivieren, |cffeda55fAlt-Klick|r um den Segen Manager zu öffnen/schließen, |cffeda55fRechtsklick|r für Optionen, |cffeda55fKlick|r auf eine der Einstellungen um sie zu ändern, |cffeda55fSchift-Klick|r auf eine der Einstellungen um sie von der Self-Buff Vorlage zu entfernen",
	["How much mana should you have before considering auto buffing"] = "Wieviel Mana muss vorhanden sein, bevor das Automatische Buffen möglich ist",
	Icon = "Symbol",
	["Icon Size"] = "Icon Größe",
	["If players are offline, AFK or in another instance, count them as being present and buff everyone else"] = "Wenn Spieler offline, afk oder in einer anderen Instanz sind, zähle sie zu den anwesenden Spielern und wirke Stärkungszauber auf alle anderen",
	["Ignore Absent"] = "Ignoriere nicht anwesende Spieler",
	["In-Combat"] = "In-Kampf",
	Information = "Information",
	Intellect = "Intelligenz",
	Invert = "Umkehren",
	["Invert the need/got alpha values"] = "Vertausche die benötigt/bekommen Alpha Werte",
	["Is player flasked or potted"] = "Hat der Spieler ein Fläschchen oder Elixier genommen",
	["Key-Binding"] = "Tastenbelegung",
	Kings = "Könige",
	Last = "Letzter",
	["Learn buff changes in combat"] = "Lerne Stärkungszauberänderungen im Kampf",
	["Learn buff changes out of combat"] = "Lerne Stärkungszauberänderungen außerhalb des Kampfes",
	Learning = "Lernen",
	["Left Button"] = "Linksklick",
	Light = "Licht",
	List = "Liste",
	Load = "Laden",
	["Load Raid Module"] = "Raid-Modul laden",
	["Load the Raid Buff module. Usually for Mages, Druids & Priests, this module can also track single target spells such as Earth Shield & Blessing of Sacrifice, and allow raid buffing of Undending Breath and so on"] = "Lade das Raid Stärkungszauber Modul. Gewöhnlich für Magier, Druiden und Priester, dieser Modus kann aber auch einzelne Stärkungszauber wie Erdschild und Hand der Opferung überwachen und unterstützt das Wirken von Unendlicher Atem auf den gesamten Raid, etc.",
	["Load this template"] = "Diese Vorlage laden",
	Lock = "Sperren",
	["Lock floating icon position"] = "Position der schwebenden Schaltfläche sperren",
	MANA = "Dein |cFFFFFF80Mana|r befindet sich unter dem eingestellten Minimum für das automatische Wirken von Stärkungszaubern",
	MOUNTED = "du befindest dich auf einem Reittier und die |cFFFFFF80Not When Mounted|r Option ist eingeschaltet",
	Mark = "Markierung",
	["Middle Button"] = "Mittlere Maustaste",
	Might = "Macht",
	["Minimum Mana %"] = "Minimales Mana %",
	["Miscelaneous actions"] = "Verschiedene Aktionen",
	["Mousewheel Buff"] = "Stärkungszauber per Mausrad wirken",
	NOCONTROL = "Du bist nicht bei Verstand",
	Name = "Name",
	Never = "Niemals",
	["Not Refreshing because %s"] = "Nicht aktualisiert weil %s",
	["Not When Mounted"] = "Nicht beim Reiten",
	["Not When Resting"] = "Nicht beim Sitzen/Essen",
	Notice = "Hinweis",
	["Notice Anchor"] = "Hinweis Anker",
	["Only use single target buffs"] = "Benutze nur Einzelziel-Stärkungszauber",
	["Only use single target buffs in arenas"] = "Benutze nur kleine Stärkungszauber in der Arena",
	["Only use single target buffs in battlegrounds"] = "Benutze nur kleine Stärkungszauber auf Schlachtfeldern",
	["Out of Combat"] = "Außerhalb des Kampfes",
	["Output channel selection"] = "Auswahl des Ausgabekanals",
	PERSONDIES = "^([^%s]+) stirbt%.$",
	PORTALZ_HOTKEY = "ZOMGPortalz Hotkey",
	Party = "Gruppe",
	["Position the notification area"] = "Hinweisfeld positionieren",
	["Purchase levels for reagents"] = "Einkaufsmenge für Reagenzien",
	REMOTECONTROL = "Du fühlst dich nicht, wie du selbst",
	RESTING = "du dich gerade ausruhst und die |cFFFFFF80Not When Resting|r Option aktiviert ist",
	Raid = "Schlachtzug",
	["Reagents Levels"] = "Reagenzienmenge",
	["Rebuff Sound"] = "Neu-wirken Sound",
	Reminders = "Erinnerungen",
	Rename = "Umbenennen",
	["Rename this template"] = "Vorlage umbenennen",
	["Renamed template |cFFFFFF80%s|r to |cFFFFFF80%s|r"] = "Vorlage |cFFFFFF80%s|r umbenannt zu |cFFFFFF80%s|r",
	Report = "Bericht",
	["Report Missing"] = "Bericht fehlt",
	["Report options"] = "Bericht Optionen",
	["Report raid buffs currently missing"] = "Berichte fehlende Schlachtzug Stärkungszauber",
	["Reset Icon Position"] = "Symbol Position Zurücksetzen",
	["Reset the icon position to the centre of the screen"] = "Setze die Symbol Position in die Mitte des Bildschirms zurück",
	["Restore default keybindings"] = "Standard Tastenbelegung wieder herstellen",
	["Right Button"] = "Rechtsklick",
	SHAPESHIFTED = "Gestaltenverändert",
	Salvation = "Erlösung",
	Sanctuary = "Refugium",
	Save = "Speichern",
	["Save current setup as a new template"] = "Aktuelles Setup als neues Template speichern",
	["Saved template %q"] = "Vorlage %q gespeichert",
	["Set the texture for the buff timer bars"] = "Wähle die Textur für die Buffbars",
	["Settings for the popup buff list"] = "Einstellungen für die Popup-Buffliste",
	["Shadow Protection"] = "Schattenschutz",
	["Shift-"] = "Ums.-",
	["Short Names"] = "Kurze Namen",
	Show = "Anzeigen",
	["Show Roles"] = "Zeige Rollen",
	["Show notice on screen for buff needs"] = "Zeige Meldungen für fehlende Stärkungszauber an",
	["Show player role icons"] = "Zeige Spieler Rollen Symbole",
	["Show the popup raid list when you are in a party"] = "Zeige die popup Schlachtzugsliste an, wenn du dich in einer Gruppe befindest",
	["Show the popup raid list when you are not in a raid or party"] = "Zeige die popup Schlachtzugsliste auch dann an, wenn du dich nicht in einem Schlachtzug oder Gruppe befindest",
	["Show the popup raid list when you in a raid"] = "Zeige die popup Schlachtzugsliste an, wenn du dich in einem Schlachtzug befindest",
	["Singles Always"] = "Immer kleine Stärkungszauber",
	["Singles in Arena"] = "Kleine Stärkungszauber in der Arena",
	["Singles in BGs"] = "Kleine Stärkungszauber in BGs",
	Size = "Größe",
	["Size of main icon"] = "Größe des Hauptsybols",
	["Skip PVP Players"] = "Überspringe für PVP markierte Spieler",
	Solo = "Einzelspieler",
	["Sort Order"] = "Sortier Reihenfolge",
	["Spell Icons"] = "Zauber Symbole",
	Spirit = "Willenskraft",
	Stamina = "Ausdauer",
	Suspended = "Ausgesetzt",
	["Switched to template %q"] = "Wechsle zu Vorlage %q",
	["Switched to template %q because %s"] = "Wechsle zu Vorlage %q weil %s",
	TAXI = "du bist in einem Taxi",
	TITLE = "|cFFFF8080Z|cFFFFFF80O|cFF80FF80M|cFF8080FFG|cFFFFFFFFSegen Manager|r",
	TITLECOLOUR = "|cFFFF8080Z|cFFFFFF80O|cFF80FF80M|cFF8080FFG|cFEFFFFFFBuffs|r",
	Target = "Ziel",
	Targetting = "anvisiert",
	["Thick Outline"] = "Dicke Außenlinie",
	["Timer Size"] = "Timer Größe",
	Unsorted = "Unsortiert",
	["Use mousewheel to trigger auto buffing"] = "Nutze das Mausrad um automatisches Buffen auszulösen",
	["Use short spell names where appropriate"] = "Nutze gegebenenfalls kurze Zaubernamen",
	VEHICLE = "du bist in einem Fahrzeug",
	["Wait for Class/Group"] = "Warte auf Klasse/Gruppe",
	["Wait for Raid"] = "Warte auf Raid",
	["Wait for all of a class or group to arrive before buffing them"] = "Warte auf die Ankunft aller Spieler einer Klasse oder Gruppe bevor sie gebufft werden",
	["Waiting for these groups or classes to arrive: %s"] = "Warte auf ankunft folgender Gruppen oder Klassen: %s",
	Width = "Breite",
	Wisdom = "Weisheit",
	["You are now in a battleground"] = "Du bist jetzt in einem Schlachtfeld",
	["You are now in a party"] = "Du bist jetzt in einer Gruppe",
	["You are now in a raid"] = "Du bist jetzt in einem Schlachtzug",
	["You are now in an arena"] = "Du bist jetzt in einer Arena",
	["You are now solo"] = "Du bist jetzt allein",
	["You can re-enable it by single clicking the ZOMGBuffs minimap/fubar icon"] = "Du kannst es wiedereinschalten indem du auf das ZOMGBuffs Minimap/Furbar Icon klickst",
	["You have run out of %q, now using single target buffs"] = "Du hast keine %q mehr, nutze nun deine Einzel-Stärkungszauber",
	["|cFF%02X%02X%02XGroup %d|r"] = "|cFF%02X%02X%02XGruppe %d|r",
	["|cFF80FF80Enabled"] = "|cFF80FF80Aktiviert",
	["|cFFFF8080Disabled"] = "|cFFFF8080Deaktiviert",
}

end)
