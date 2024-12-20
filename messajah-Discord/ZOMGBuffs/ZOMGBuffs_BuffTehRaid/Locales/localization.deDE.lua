local L = LibStub("AceLocale-2.2"):new("ZOMGBuffTehRaid")

L:RegisterTranslations("deDE", function() return
--[===[@debug@
{
}
--@end-debug@]===]
{
	[" and "] = " und",
	["%d of %d stacks remain"] = "%d von %d Aufladungen verbleibend",
	["%s cooldown ready for %s"] = "%s Cooldown bereit für %s",
	["%s has expired on %s"] = "%s auf %s ist ausgelaufen",
	["%s needs %s"] = "%s benötigt %s",
	["%s on %s"] = "%s auf %s",
	["%s on %s%s"] = "%s auf %s%s",
	["%s remains"] = "%s verbleibend",
	["(modified)"] = "(verändert)",
	["Adjust the scale of the tracking icon"] = "Größe des Tracker Symbols einstellen",
	Anchor = "Anker",
	["Auto-Assign"] = "Auto-Einteilungen",
	Behaviour = "Verhalten",
	["Create a tracking icon for certain exclusive spells (Earth Shield, Fear Ward). Note that the icon can always display the correct status of the spell, but if you change targets in combat then the click action will be to the player who it was last set to before entering combat"] = "Erstelle ein Überwachungsysmbol für exklusive Stärkungszauber (Erdschild, Furchtzauberschutz, etc.). Denke bitte daran, dass das Symbol immer den korrekten Status des Zaubers anzeigt, aber nicht zum Erneuern auf dem aktuellen Ziel genutzt werden kann, sobald er während des Kampfes auf ein anderes Ziel gewirkt worden ist.",
	["Default rebuff prelude for all group buffs"] = "Standard Erneuerungsvorlauf für alle Gruppenstärkungszauber",
	["Define the key used for rebuffing %s from it's Spell Tracker icon"] = "Wähle die Taste um %s über das Stärkungszauber Beobachtungs Symbol zu erneuern",
	Disabled = "Ausgeschaltet",
	Enable = "Einschalten",
	["Enable buffing of this group"] = "Schalte Stärkungszauber für diese Gruppe ein",
	Enabled = "Eingeschaltet",
	["Expiry Prelude"] = "Auslaufvorlaufzeit",
	["Group %d"] = "Gruppe %d",
	["Group %d needs %s"] = "Gruppe %d benötigt %s",
	["Group Buff Configuration"] = "Stärkungszauberkonfiguration für Gruppen",
	["Group Spells"] = "Gruppenzauber",
	["Group Template: "] = "Gruppenvorlage:",
	["Group buffing behaviour"] = "Verhalten für Gruppenstärkungszauber",
	["Group spell configuration"] = "Gruppenzauber Konfiguration",
	Groups = "Gruppen",
	["How many players of a group must need a buff before the group version is cast"] = "Anzahl der Gruppenmitglieder, die einen Stärkungszauber benötigen bevor Gruppenstärkungszauber benutzt werden",
	Invert = "Umkehren",
	["Invert the need/got alpha values"] = "Vertausche die benötigt/bekommen Alpha Werte",
	["Key-Binding"] = "Tastenbelegung",
	Learnable = "Lernfähig",
	["MISSING!"] = "FEHLT!",
	["Minimum Group"] = "Minimale Gruppe",
	["No Auto-cast"] = "Kein automatisches Wirken von Zaubern",
	["Rebuff prelude for %s (0=Module default)"] = "Auslaufvorlaufzeit für %s (0=Standardeinstellung)",
	["Remember this spell when it's cast manually?"] = "Soll dieser Zauber beibehalten werden, sobald er manuell gewirkt worden ist?",
	Reset = "Zurücksetzen",
	["Reset on Clear"] = "Zurücksetzen beim Säubern",
	["Reset the position of the tracker icon"] = "Setze die Position des Überwachungssymbols zurück",
	Scale = "Skalierung",
	["Select a soundfile to play when player's tracked buff expires"] = "Wähle die Audiodatei, die beim Auslaufen eines Stärkungszaubers wiedergegeben werden soll",
	["Select the groups to buff"] = "Wähle die Gruppen, die Stärkungszauber erhalten sollen",
	["Single Spells"] = "Einzel Zauber",
	["Single spell configuration"] = "Einzelzielzauberkonfiguration",
	Sound = "Sound",
	["Spell Tracker"] = "Zauberüberwacher",
	TICKCLICKHELP1 = "|cFFFFFFFFKlick|r um auf Spieler zu wechseln",
	TICKCLICKHELP2 = "|cFFFFFFFFRechtsklick|r um auf jeden zu wechseln",
	TICKCLICKHELP3 = " |cFFFFFFFFAlt-Klick|r um auf $class zu wechseln",
	TICKCLICKHELP4 = "|cFFFFFFFFUmschalt-Klick|r um auf $party zu wechseln",
	["Template configuration"] = "Vorlagenkonfiguration",
	Templates = "Vorlagen",
	["This button is not clickable because it was created after you entered combat"] = "Diese Schaltfläche kann nicht angeklickt werden, da sie erstellt worden ist, nachdem du den Kampf beigetreten bist",
	Tracker = "Überwacher",
	["Tracker Icon for single target exclusive buffs"] = "Überwachungssymbol für exklusive Einzel Stärkungszauber",
	["WARNING: The intended target for this icon has changed since you entered combat. (Was %s)"] = "WARNUNG: Das vorgesehene Ziel für dieses Symbol hat sich geändert, seitdem du im Kampf warst. (War zuvor %s)",
	["Warning: %s has auto-assigned themselves to buff groups %s, but you have the Auto Group Assignment option disabled"] = "Warnung: %s hat sich selbst automatisch den Gruppen %s zugewiesen, obwohl deine Auto Gruppen Einteilung Option deaktiviert ist",
	["You are now responsible for Groups %s"] = "Du bist nun verantwortlich für die Gruppen %s",
	none = "kein",
}

end)
