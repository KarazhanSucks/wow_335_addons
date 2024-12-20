local L = LibStub("AceLocale-2.2"):new("ZOMGBuffs")

L:RegisterTranslations("frFR", function() return
--[===[@debug@
{
}
--@end-debug@]===]
{
	[" on %s"] = " sur %s", -- Needs review
	["%s blacklisted for 10 seconds"] = "%s ignoré pendant 10 secondes",
	["%s%s%s|r to cast %s%s|r%s"] = "%s%s%s|r a lancé %s%s|r%s",
	["%s%s%s|r to target"] = "%s%s%s|r pour cibler",
	["...unless PvP"] = "...à moins que PvP",
	["<ZOMG> Missing %s: %s"] = "<ZOMG> Manque %s : %s",
	["<new name>"] = "<Nouveau nom>",
	["<template name>"] = "<Nom du modèle>",
	ABOUT = [=[Add-on de buff tout-en-un pour toutes les classes. Générations des assignements de bénédictions de paladins basés sur les capacités des paladins présents et les sous-classes des membres du raid (Druide tank vs Druide heal, etc.). Vue d'ensemble des buffs de raid important et rebuff instantanés avec le click droit.

Auteur: {Author}
Catégorie: {X-Category}
E-mail: {X-Email}
Website: {X-Website}
License: {X-License}]=],
	Actions = "Actions",
	["Adjust height of the bars"] = "Ajuste la hauteur des barres",
	["Adjust the size of the timer text"] = "Ajuste la taille du texte de la minuterie",
	["Adjust width of unit list"] = "Ajuste la largeur de la liste des membres",
	["Allow auto buffing when resting when your PvP is enabled"] = "Autoriser l'auto-buff quand vous vous reposez et que votre PvP est activé",
	Alphabetical = "Alphabétique",
	["Also buff current target (assuming they're not in your party or raid"] = "Buffer aussi la cible actuelle (en supposant qu'elle n'est pas dans votre groupe ou raid)",
	["Alt-"] = "Alt-",
	["Always Load Manager"] = "Toujours charger le Blessings Manager",
	["Always Load Portalz"] = "Toujours charger Portalz",
	["Always load the Blessings Manager, even when not eligable to modify blessings"] = "Toujours charger le Blessings Manager, même si vous n'êtes pas autorisé à modifier les bénédictions",
	["Always load the Portalz module, even when not a Mage"] = "Toujours charger Portalz, même si vous n'êtes pas un mage",
	["Always show Stamina and Mark of the Wild Columns"] = "Toujours montrer la colonne Endurance et Marque du fauve",
	Anchor = "Ancrage",
	Arena = "Arène",
	["Auto Buy Reagents"] = "Achat automatique de composants",
	["Auto Switch"] = "Changement auto",
	["Auto purchase level for %s (will not exceed this amount)"] = "Achat automatique de %s (ne dépassera pas ce nombre)",
	["Auto-casting %s"] = "Lancement automatique de %s",
	["Auto-casting is disabled"] = "L'auto-incantation est désactivée",
	["Automatically purchase required reagents from Reagents Vendor"] = "Achète automatiquement les composants nécessaires chez les vendeurs de composants",
	["Automatically switch to this template"] = "Change automatiquement vers ce modèle",
	Autosave = "Sauvegarde auto",
	["Bar Height"] = "Hauteur des barres",
	["Bar Texture"] = "Texture des barres",
	Battleground = "Champ de bataille",
	Behaviour = "Comportement",
	Blessings = "Bénédictions",
	Border = "Bordure",
	["Bought |cFF80FF80%d|cFFFFFF80 %s|r from vendor, you now have |cFF80FF80%d|r"] = "|cFF80FF80%d|cFFFFFF80 %s|r acheté(s) au vendeur, vous en possédez maintenant |cFF80FF80%d|r",
	["Buff Pets"] = "Buffer les familiers",
	["Buff Target"] = "Buff la cible",
	["Buff Timer"] = "Timer des buffs",
	["Buff times over this number of minutes will not be shown"] = "Les buffs dont la durée est superieure à ce nombre de minutes ne seront pas montrés",
	["Button Five"] = "5èeme bouton",
	["Button Four"] = "4ème bouton",
	CHANNELING = "vous canalisez un sort",
	CHATANSWER = "<ZOMG>",
	CHATMATCH1 = "!buff",
	CHATMATCH2 = "!zomg",
	CHATMATCH3 = "!buffs",
	COMBAT = "vous êtes en combat",
	Channel = "Canal",
	["Choose the anchor to use for the player list"] = "Choisissez le point d'ancrage pour la liste des joueurs",
	["Choose the relative point for the anchor"] = "Choisissez le point relatif de l'ancrage",
	Class = "Classe",
	["Class Icon"] = "Icône de classe",
	["Clear talent cache to force refresh"] = "Purge les talents du cache pour forcer un rafraîchissement",
	["Click Config"] = "Configuration du clique",
	Columns = "Colonnes",
	["Columns to show in buff list"] = "Colonnes pour afficher les buffs",
	["Configure popup raid list click behaviour"] = "Configure la réaction au clique sur la fenêtre de liste de raid",
	["Ctrl-"] = "Ctrl-",
	DEAD = "vous êtes mort",
	DISABLED = "ZOMGBuffs est inactif",
	DRINKING = "vous buvez",
	Defaults = "Défauts",
	["Define the key used for auto buffing"] = "Définit la touche utilisée pour les buffs automatiques",
	["Define the mouse click to use for |cFFFFFF80%s|r"] = "Clique de la souris utiliser pour |cFFFFFF80%s|r",
	Delete = "Effacer",
	["Delete this template"] = "Efface ce modèle",
	Display = "Affichage",
	["Display options"] = "Affichage des options",
	["Display the ZOMGBuffs logo on icon"] = "Afficher le logo ZOMGBuff sur l'icône",
	["Display the mouseover icon used by the popup player buff list"] = "Affiche l'icône utilisé par la liste de buffs des joueurs",
	["Don't auto buff when Mounted"] = "Ne pas buffer automatiquement si sur une monture",
	["Don't auto buff when Resting"] = "Ne pas buffer automatiquement si au repos",
	["Don't auto buff when Shapeshifted"] = "Ne pas buffer automatiquement si transformé",
	["Don't auto buff when Stealthed"] = "Ne pas buffer automatiquement si camouflé",
	["Don't auto buff when you have Spirit Tap, so you can maximise your regeneration"] = "Ne pas buffer quand vous êtes sous Connexion spirituelle, afin de maximiser votre régénération",
	["Don't directly buff PVP flagged players, unless you're already flagged for PVP"] = "Ne buff pas directement les joueurs en JcJ, à moins que vous soyez vous même en JcJ",
	EATING = "vous mangez",
	ERRORICON = "ERREUR : self.icon manquant",
	Empty = "Vide",
	Enable = "Activé",
	["Enable border on the icon"] = "Activer la bordure sur l'icône",
	["Enable border on the list"] = "Activer la bordure sur la liste",
	FIND_FLASK = "^Flacon de",
	FIND_POT = "^Elixir d",
	Finish = "Terminer",
	Flask = "Flacon",
	Font = "Police",
	["General buffing behaviour"] = "Comportement général pour les buffs",
	["Give audible feedback when someone needs rebuffing"] = "Emettre un avertissement sonore quand quelqu'un a besoin d'être rebuff",
	["Give feedback about events"] = "Informations sur les évènements",
	Group = "Groupe",
	["Group %d"] = "Groupe %d",
	["Group Number"] = "Numéro de groupe",
	HINT = "|cffeda55fClic|r pour activer/désactiver l'auto-incantation, |cffeda55fClic-droit|r pour les options, |cffeda55fClic|r sur un buff pour modifier, |cffeda55fMaj-Clic|r sur un buff pour le supprimer du modèle self-buffs",
	HINTBM = "|cffeda55fClic|r pour activer/désactiver l'auto-incantation, |cffeda55fAlt-Clic|r pour activer/désactiver le Blessings Manager, |cffeda55fClic-droit|r pour les options, |cffeda55fClic|r sur un buff pour modifier, |cffeda55fMaj-Clic|r sur un buff pour le supprimer du modèle self-buffs",
	["How much mana should you have before considering auto buffing"] = "Pourcentage minimum de mana requis pour utiliser l'auto-buff",
	INVIS = "Vous êtes invisible",
	Icon = "Icône",
	["Icon Size"] = "Taille de l'icône",
	["If players are offline, AFK or in another instance, count them as being present and buff everyone else"] = "Si des joueurs sont hors-ligne, AFK ou dans une autre instance, les conmpter comme présent et buffer tous les autres",
	["Ignore Absent"] = "Ignorer les absents",
	["In-Combat"] = "En combat",
	Information = "Information",
	Intellect = "Intelligence",
	Invert = "Inversion",
	["Invert the need/got alpha values"] = "Inverse la valeur de transparence des buffs requis/obtenus",
	["Is player flasked or potted"] = "Le joueur a-t-il un flacon ou une potion",
	["Key-Binding"] = "Raccourci clavier",
	Kings = "Rois",
	Last = "Dernier",
	["Learn buff changes in combat"] = "Prend connaissance des changements de buff en combat",
	["Learn buff changes out of combat"] = "Prend connaissance des changements de buffs hors combat",
	Learning = "Apprentissage",
	["Left Button"] = "Bouton gauche",
	Light = "Lumière",
	List = "Liste",
	Load = "Charger",
	["Load Raid Module"] = "Charger le module Raid",
	["Load the Raid Buff module. Usually for Mages, Druids & Priests, this module can also track single target spells such as Earth Shield & Blessing of Sacrifice, and allow raid buffing of Undending Breath and so on"] = "Charger le module Buff de Raid. Habituellement pour Mages, Druides & Prêtres, ce module peut aussi surveiller des sorts à cible unique comme le bouclier de terre ou la bénédiction de sacrifice, et permet de buffer le raid avec \"Réspiration interminable\" etc...",
	["Load this template"] = "Charge ce modèle",
	Lock = "bloquer",
	["Lock floating icon position"] = "Bloque la position de l'icône flottante",
	MANA = "votre |cFFFFFF80mana|r est sous le seuil minimum configuré pour l'auto-buff",
	MOUNTED = "vous êtes sur une monture et l'option |cFFFFFF80Pas sur une monture|r est active",
	Mark = "Marque",
	["Middle Button"] = "Bouton du milieu",
	Might = "Puissance",
	["Minimum Mana %"] = "Minimum de % de mana",
	["Miscelaneous actions"] = "Actions diverses",
	["Mousewheel Buff"] = "Buff avec la roulette de la souris",
	NOCONTROL = "vous avez perdu le contrôle",
	Name = "Nom",
	Never = "Jamais",
	None = "Aucun",
	["Not Refreshing because %s"] = "Non rafraîchi car %s",
	["Not When Mounted"] = "Pas sur une monture",
	["Not When Resting"] = "Pas au repos",
	["Not When Shapeshifted"] = "Pas quand transformé",
	["Not When Stealthed"] = "Pas quand camouflé",
	["Not with Spirit Tap"] = "Pas lors d'une Connexion spirituelle",
	Notice = "Notification",
	["Notice Anchor"] = "Ancragre de notification",
	["Only use single target buffs"] = "Utiliser uniquement des buff à cible unique",
	["Only use single target buffs in arenas"] = "Utiliser uniquement des buff à cible unique en arène",
	["Only use single target buffs in battlegrounds"] = "Utiliser seulement les buffs individuels en champs de bataille",
	["Options to help you notice when things need doing"] = "Options pour vous aider à noter quand des choses doivent être faites",
	["Out of Combat"] = "Hors combat",
	["Out-of-date spell (should be %s). Will be updated when combat ends"] = "Sort périmé (devrait être %s). Sera mis à jour à la fin du combat",
	Outline = "Contour",
	Outlining = "Contour",
	["Output channel selection"] = "Sélection du canal de chat",
	PERSONDIES = "^([^%s]+) est mort%.$",
	PORTALZ_HOTKEY = "Raccourci ZOMGPortalz",
	Party = "Groupe",
	["Perform extra checks for pets in case any missed the group buffs when they were done"] = "Effectue des vérifications supplémentaires pour les familiers dans le cas où ils auraient manqués les buffs de groupe",
	["Position the notification area"] = "Position de la zone de notification",
	["Purchase levels for reagents"] = "Nombre de composants à acheter",
	REMOTECONTROL = "vous ne vous sentez pas vous même",
	RESTING = "vous êtes au repos et l'option |cFFFFFF80Pas au repos|r est active",
	Raid = "Raid",
	["Reagents Levels"] = "Nombre de composants",
	["Rebuff Sound"] = "Son pour les rebuff",
	["Relative Point"] = "Point relatif",
	Reminders = "Pense-bête",
	Rename = "Renommer",
	["Rename this template"] = "Renomme ce modèle",
	["Renamed template |cFFFFFF80%s|r to |cFFFFFF80%s|r"] = "Modèle |cFFFFFF80%s|r renommé en |cFFFFFF80%s|r",
	Report = "Rapport",
	["Report Missing"] = "Rapporter les manquants",
	["Report options"] = "Options de rapport",
	["Report raid buffs currently missing"] = "Rapporter les buffs de raid actuellements manquants",
	["Reset Icon Position"] = "Réinitialise la position de l'icône",
	["Reset the icon position to the centre of the screen"] = "Replace l'icône au centre de l'écran",
	["Restore default keybindings"] = "Restores les raccourcies par défaut",
	["Revert to the previously unsaved template"] = "Retour au dernier modèle non sauvé",
	["Right Button"] = "Bouton droit",
	["RuneScroll/Drums"] = "Parchemins/Tambours",
	SHAPESHIFTED = "vous êtes transformé et l'option |cFFFFFF80Pas quand transformé|r est active",
	SPIRITTAP = "vous êtes sous Connexion spirituelle et l'option |cFFFFFF80Pas lors d'une Connexion spirituelle|r est active",
	STEALTHED = "vous êtes camouflé et l'option |cFFFFFF80Pas quand camouflé|r est active",
	Salvation = "Salut",
	Sanctuary = "Sanctuaire",
	Save = "Sauvegader",
	["Save current setup as a new template"] = "Sauvegarde la configuration actuelle comme un nouveau modèle",
	["Saved template %q"] = "Modèle %q sauvegardé",
	["Select sorting order for buff overview (can't be changed during combat)"] = "Sélectionne l'ordre de tri d'affichage des buffs (ne peut être changé en combat)",
	Selling = "Vendre", -- Needs review
	["Set the texture for the buff timer bars"] = "Définit la texture pour la barre de temps des buffs",
	["Settings for the mouseover icon used by the popup player buff list"] = "Paramètres pour l'icône utilisée pour la liste de buffs des joueurs",
	["Settings for the popup buff list"] = "Paramètres de la liste de buffs",
	["Setup spell learning behaviour"] = "Configuration du comportement de l'aprentissage des sorts",
	["Shadow Protection"] = "Protection contre l'ombre",
	["Shift-"] = "Maj-",
	["Short Names"] = "Noms abrégés",
	Show = "Afficher",
	["Show Roles"] = "Montrer les rôles",
	["Show buff time remaining with bar"] = "Montrer la durée de buff restante avec une barre",
	["Show notice on screen for buff needs"] = "Affiche les notifications des buffs requis",
	["Show player role icons"] = "Montrer les icônes de rôle des joueurs",
	["Show spell icons with spell names in messages"] = "Montrer les icônes des sorts avec leur noms dans les messages",
	["Show the Notice area anchor"] = "Affiche l'ancre de la zone de notification",
	["Show the group number next to list"] = "Affiche le numéro du groupe à côté de la liste",
	["Show the popup raid list when you are in a party"] = "Affiche la liste des membres du raid quand vous êtes en groupe",
	["Show the popup raid list when you are not in a raid or party"] = "Affiche la liste des membres du raid même si vous n'êtes pas en raid ou en groupe",
	["Show the popup raid list when you in a raid"] = "Affiche la liste des membres du raid quand vous êtes en raid",
	["Singles Always"] = "Buffs personnels toujours",
	["Singles in Arena"] = "Buffs personnels en arène",
	["Singles in BGs"] = "Individuels en BG",
	Size = "Taille",
	["Size of main icon"] = "Taille de l'icône principale",
	["Skip PVP Players"] = "Ignorer les joueurs en JcJ",
	Solo = "Seul",
	["Sort Order"] = "Ordre de tri",
	Spirit = "Esprit",
	Stamina = "Endurance",
	Suspended = "Suspendu",
	["Switched to template %q"] = "Passage au modèle %q",
	["Switched to template %q because %s"] = "%s a provoqué le passage au modèle %q",
	TAXI = "vous êtes en griphon",
	TITLE = "ZOMGBuffs",
	TITLECOLOUR = "|cFFFF8080Z|cFFFFFF80O|cFF80FF80M|cFF8080FFG|cFEFFFFFFBuffs|r",
	Target = "Cible",
	Targetting = "Ciblé",
	["Thick Outline"] = "Contour épais",
	Training = "Apprendre", -- Needs review
	Unsorted = "Non-trié",
	["Use mousewheel to trigger auto buffing"] = "Utilise la roulette de la souris pour lancer les buffs automatiquement",
	["Use short spell names where appropriate"] = "Utilsiez les noms abrégés des sort lorsque c'est approprié",
	VEHICLE = "Vous êtes dans un véhicule",
	["Visiblity options"] = "Options d'affichage",
	["Wait for Class/Group"] = "Attendre les classes/groupes",
	["Wait for Raid"] = "Attendre le raid",
	["Wait for all of a class or group to arrive before buffing them"] = "Attendre que l'ensemble des classes ou groupes soit arrivé avant de buffer",
	["Wait for certain amount of the raid to arrive before group and class buffing commences. Zero to always buff."] = "Attendre qu'un certain nombre de membres du raid arrive avant que les buffs de groupe et classe ne commencent. 0 pour toujours buffer",
	["Waiting for %d%% of raid to arrive before buffing commences (%d%% currently present)"] = "Attendre l'arrivée de %d%% du raid avant que l'auto-buffs ne commence (%d%% actuellement présent)",
	["Waiting for these groups or classes to arrive: %s"] = "Attendre l'arrivée de ces groupes ou classes : %s",
	["Well Fed"] = "Bien nourri",
	Width = "Largeur",
	["Wipe Talent Cache"] = "Purger les talents en cache",
	Wisdom = "Sagesse",
	["You are now in a battleground"] = "Vous êtes maintenant sur un champ de bataille",
	["You are now in a party"] = "Vous êtes maintenant dans un groupe",
	["You are now in a raid"] = "Vous êtes maintenant dans un raid",
	["You are now in an arena"] = "Vous êtes maintenant dans une arène",
	["You are now solo"] = "Vous êtes maintenant seul",
	["You can re-enable it by single clicking the ZOMGBuffs minimap/fubar icon"] = "Vous pouvez le réactiver d'un simple clique sur l'icone ZOMGBuff de la minimap/fubar",
	["You have run out of %q, now using single target buffs"] = "Vous n'avez plus de %q, utilisation des buffs individuels à la place",
	ZONED = "vous avez récemment changé de zone, attendez quelques secondes",
	["|cFF%02X%02X%02XGroup %d|r"] = "|cFF%02X%02X%02XGroupe %d|r",
	["|cFF808080%s|r [|Hplayer:%s|h%s|h's pet]"] = "|cFF808080%s|r [Familier de |Hjoueur:%s|h%s|h]",
	["|cFF80FF80Enabled"] = "Actif",
	["|cFFFF8080Disabled"] = "Inactif",
	["|cFFFF8080Waiting for these groups or classes to arrive:"] = "|cFFFF8080En attente de l'arrivée de ces groupes ou classes :",
}

end)
