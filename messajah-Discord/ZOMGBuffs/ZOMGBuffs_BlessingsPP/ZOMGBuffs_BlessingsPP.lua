﻿if (ZOMGBlessingsPP) then
	ZOMGBuffs:Print("Installation error, duplicate copy of ZOMGBuffs_BlessingsPP (Addons\ZOMGBuffs\ZOMGBuffs_BlessingsPP and Addons\ZOMGBuffs_BlessingsPP)")
	return
end

-- ZOMGBUffs, Pally Power comunication module, for those Paladins who've not yet seen the light

local L = LibStub("AceLocale-2.2"):new("ZOMGBlessingsPP")
local LGT = LibStub("LibGroupTalents-1.0")
local bm

-- Traffic
-- ASSIGN Name classIndex spellIndex   				- When PallyPower click on your spell for a class (1 spell only)
-- NASSIGN PaladinName classIndex TargetName buffIndex		- Single exception

L:RegisterTranslations("enUS", function()
	return {
		["PP_TSEARCH"]		= "^Improved (.*)",
	}
end)

L:RegisterTranslations("deDE", function()
	return {
		["PP_TSEARCH"]		= "^Verbesserter (.*)",
	}
end)

L:RegisterTranslations("frFR", function()
	return {
		["PP_TSEARCH"]		= "(.*) améliorée$",
	}
end)

L:RegisterTranslations("esES", function()
	return {
		["PP_TSEARCH"]		= "(.*) mejorada$",
	}
end)

L:RegisterTranslations("zhCN", function()
	return {
		["PP_TSEARCH"]		= "^强化(.*)",
	}
end)

L:RegisterTranslations("zhTW", function()
	return {
		["PP_TSEARCH"]		= "^強化(.*)",
	}
end)

L:RegisterTranslations("koKR", function()
	return {
		["PP_TSEARCH"]		= "(.*) 연마$",
	}
end)
	
local z = ZOMGBuffs
local mod = z:NewModule("ZOMGBlessingsPP")
ZOMGBlessingsPP = mod

local ppPrefix = "PLPWR"

local new, del, deepDel, copy = z.new, z.del, z.deepDel, z.copy

local PALLYPOWER_MAXAURAS = 7;
local PallyPowerAuras = {
	[0] = "",
	[1] = GetSpellInfo(465), --BS["Devotion Aura"],
	[2] = GetSpellInfo(7294), --BS["Retribution Aura"],
	[3] = GetSpellInfo(19746), --BS["Concentration Aura"],
	[4] = GetSpellInfo(19876), --BS["Shadow Resistance Aura"],
	[5] = GetSpellInfo(19888), --BS["Frost Resistance Aura"],
	[6] = GetSpellInfo(19891), --BS["Fire Resistance Aura"],
	[7] = GetSpellInfo(32223), --BS["Crusader Aura"],
};

local ppSpellOrder = {"BOW", "BOM", "BOK", "SAN"}
local ppClassOrder = {"WARRIOR", "ROGUE", "PRIEST", "DRUID", "PALADIN", "HUNTER", "MAGE", "WARLOCK", "SHAMAN", "DEATHKNIGHT", "PET"}
local ppSpellIndex
local ppClassIndex
do
	local function IndexArray(source)
		local ret = {}
		for a,b in ipairs(source) do
			ret[b] = a
		end
		return ret
	end
	ppSpellIndex = IndexArray(ppSpellOrder)
	ppClassIndex = IndexArray(ppClassOrder)
end

-- GetAuraAssignment
function mod:GetAuraAssignment()
	if (ZOMGSelfBuffs) then
		local zomgKey = ZOMGSelfBuffs:GetPaladinAuraKey()
        return zomgKey and z.auraIndex[zomgKey] or 0
    end
    return 0
end

-- PowerChat
local reqHistory = {}
function mod:ProcessChat(sender, msg)
	if (not self.AllPallys) then
		return
	end

	if (msg == "REQ") then
		if (not reqHistory[sender] or reqHistory[sender] < GetTime() - 15) then
			reqHistory[sender] = GetTime()
			self:SendSelf()
		end

	elseif (strfind(msg, "^SELF")) then
		local numbers, assign = strmatch(msg, "SELF ([0-9n]*)@([0-9n]*)")
		if (numbers) then
			local s = {}
			self.AllPallys[sender] = s
			for i = 1, 4 do
				local rank = strsub(numbers, (i - 1) * 2 + 1, (i - 1) * 2 + 1)
				local talent = strsub(numbers, (i - 1) * 2 + 2, (i - 1) * 2 + 2)
				if (rank ~= "n") then
					s[i] = { }
					s[i].rank = tonumber(rank)
					s[i].talent = tonumber(talent)
				end
			end

			local t = new()
			t.canKings = s[ppSpellIndex.BOK] and (s[ppSpellIndex.BOK].rank or 0) > 0
			t.canSanctuary = s[ppSpellIndex.SAN] and (s[ppSpellIndex.SAN].rank or 0) > 0
			t.impMight = (s[ppSpellIndex.BOM] and (s[ppSpellIndex.BOM].talent or 0) > 0 and s[ppSpellIndex.BOM].talent) or 0
			t.impWisdom = (s[ppSpellIndex.BOW] and (s[ppSpellIndex.BOW].talent or 0) > 0 and s[ppSpellIndex.BOW].talent) or 0
			bm:OnReceiveCapability(sender, t)
			del(t)

			if (assign) then
				local template = {}
				for i,class in ipairs(ppClassOrder) do
					local tmp = string.sub(assign, i, i)
					if (tmp == "n" or tmp == "") then
						tmp = 0
					end

					local zomgBuffType = ppSpellOrder[tmp + 0]
					if (zomgBuffType) then
						if (class) then
							template[class] = zomgBuffType
						end
					end
				end

				bm:OnReceiveTemplate(sender, template)
			end
		end

	elseif (strfind(msg, "^ASELF")) then
		local newaura = 0
		local p = self.AllPallys[sender]
		if (p) then
			p.AuraInfo = { }
			local _, _, numbers, assign = string.find(msg, "ASELF ([0-9a-fn]*)@([0-9n]*)")
			for i = 1, PALLYPOWER_MAXAURAS do
				local rank = string.sub(numbers, (i - 1) * 2 + 1, (i - 1) * 2 + 1)
				local talent = string.sub(numbers, (i - 1) * 2 + 2, (i - 1) * 2 + 2)
				if rank ~= "n" then
					p.AuraInfo[i] = { }
					p.AuraInfo[i].rank = tonumber(rank,16)
					p.AuraInfo[i].talent = tonumber(talent,16)
				end
			end
			if assign then
				if assign == "n" or assign == "" then 
					assign = 0
				end
				newaura = assign + 0

				local zomgAuraKey = z.auraCycle[newaura + 0]
				bm:OnReceiveAura(sender, zomgAuraKey)
			end
		end

	elseif (strfind(msg, "^ASSIGN")) then
		-- When a paladin changes their own spell assignment for a class
		-- ASSIGN Name classIndex spellIndex
		local name, classIndex, spellIndex = strmatch(msg, "^ASSIGN (.*) (.*) (.*)")
		if (name) then
			local zomgSpellType = ppSpellOrder[spellIndex + 0]
			local className = ppClassOrder[classIndex + 0]
			if (className) then
				bm:OnReceiveTemplatePart(sender, name, className, zomgSpellType)
			end
		end

	elseif (strfind(msg, "^NASSIGN")) then
		-- NASSIGN PaladinName classIndex TargetName buffIndex		- Single exception

		for pname, classIndex, tname, spellIndex in string.gmatch(string.sub(msg, 9), "([^@]*) ([^@]*) ([^@]*) ([^@]*)") do
			local zomgSpellType = ppSpellOrder[spellIndex + 0]
			--local className = ppClassOrder[classIndex + 0]		-- ZOMG doesn't care about class index

			bm:OnReceiveTemplatePart(sender, sender, tname, zomgSpellType)
		end

	elseif (strfind(msg, "^MASSIGN")) then
		-- MASSIGN PaladinName buffIndex		- Set all spells to same on for a paladin
		local name, spellIndex = strmatch(msg, "^MASSIGN (.*) (.*)")
		if (name) then
			local zomgSpellType = ppSpellOrder[spellIndex + 0]
			for i,class in ipairs(ppClassOrder) do
				bm:OnReceiveTemplatePart(sender, name, class, zomgSpellType)
			end
		end

	elseif (strfind(msg, "^AASSIGN")) then
		-- AASSIGN PaladinName auraIndex		- Set the aura for the paladin to use
		local name, auraIndex = strmatch(msg, "^AASSIGN (.*) (.*)")
		if (name ~= sender) then
			local zomgAuraKey = z.auraCycle[auraIndex + 0]
			bm:OnReceiveBroadcastAura(sender, name, zomgAuraKey)
		end

	elseif (strfind(msg, "^SYMCOUNT")) then
		-- SYMCOUNT symbolOfKingsCount
		local count = strmatch(msg, "^SYMCOUNT (.*)")
		if (count) then
			bm:OnReceiveSymbolCount(sender, count + 0)
		end

	elseif (strfind(msg, "^FREEASSIGN")) then
		local enable = strmatch(msg, "^FREEASSIGN (%s)") == "YES"
		-- TODO - Free assign lets anyone set blessings, regardless of rank. So reflect this in Manager

	elseif (strfind(msg, "^CLEAR")) then
		-- Do nothing with this. Clear is necessary with Pally power because of the necessity to setup blessings from scratch.
		-- Since the manager will auto-allocate easily, we'll avoid this for now.
	end
end

-- GiveTemplate
-- Called by Blessings Manager to give template part changes to PallyPower users
function mod:GiveTemplatePart(name, class, buff)
	local ppClassID = ppClassIndex[class]
	local ppSpellID = ppSpellIndex[buff]

	if (ppClassID) then
		-- A class name was given
		-- ASSIGN Name classIndex spellIndex
		self:SendMessage(format("ASSIGN %s %d %d", name, ppClassID, ppSpellID or 0))
	else
		-- A player name was given, instead of a class name
		-- NASSIGN PaladinName classIndex TargetName buffIndex		- Single exception
		local unit = z:GetUnitID(class)
		if (unit) then
			local _, unitclass = UnitClass(unit)
			ppClassID = ppClassIndex[unitclass]
			if (ppClassID) then
				self:SendMessage(format("NASSIGN %s %d %s %d", name, ppClassID, class, ppSpellID or 0))
			end
		end
	end
end

-- GiveTemplateAura
function mod:GiveTemplateAura(name, Type)
	local ppAuraID = z.auraIndex[Type] or 0
	if (ppAuraID) then
		self:SendMessage(format("AASSIGN %s %d", name, ppAuraID))
	end
end

-- GiveTemplate
-- Called by Blessings Manager to give template changes to PallyPower users
function mod:GiveTemplate(name, template)
	-- Group buffs
	for i,class in ipairs(ppClassOrder) do
		local ppSpellID = ppSpellIndex[template[class]]
		self:SendMessage(format("ASSIGN %s %d %d", name, i, ppSpellID or 0))
	end

	-- Exceptions
	for classOrName,zomgBuffType in pairs(template) do
		if (not ppClassIndex[classOrName] and classOrName ~= "modified" and classOrName ~= "default" and classOrName ~= "state") then
			local unit = z:GetUnitID(classOrName)
			if (unit) then
				local _, unitclass = UnitClass(unit)
				local ppSpellID = ppSpellIndex[zomgBuffType]
				local ppClassID = ppClassIndex[unitclass]

				if (ppSpellID and ppClassID) then
					self:SendMessage(format("NASSIGN %s %d %s %d", name, ppClassID, classOrName, ppSpellID))
				end
			end
		end
	end
end

-- SignalClear
function mod:SignalClear()
	self:SendMessage("CLEAR")
end

-- ScanInventory
function mod:ScanInventory()
	if (self.AllPallys) then
		if (not self.AllPallys[self.player]) then
			self.AllPallys[self.player] = {}
		end
		self.AllPallys[self.player].symbols = GetItemCount(21177)
	end
end

local ppRankSearch = RANK.." (%d+)"
function mod:ScanSpells()
	if (not self.AllPallys) then
		self.AllPallys = {}
		self.player = UnitName("player")
	end

	local _, class = UnitClass("player")
	if (class == "PALADIN") then
		local RankInfo = {}
		local i = 1
		while true do
			local spellName, spellRank = GetSpellName(i, BOOKTYPE_SPELL)
			--local spellTexture = GetSpellTexture(i, BOOKTYPE_SPELL)
			if (not spellName) then
				break
			end

			local zomgBlessing = z.blessings[spellName]
			if (zomgBlessing) then
				if (not spellRank or spellRank == "") then
					spellRank = RANK.." 1"
				end

				local rank = strmatch(spellRank, ppRankSearch)
				if (rank) then
					local id = ppSpellIndex[zomgBlessing.type]
					rank = tonumber(rank)
					if (id) then
						if (not RankInfo[id]) then
							RankInfo[id] = {}
						end
						if (not RankInfo[id].rank or (zomgBlessing.class and not RankInfo[id].greater) or ((RankInfo[id].greater == zomgBlessing.class) and rank > (RankInfo[id].rank or 0))) then
							RankInfo[id].rank = rank
						end
						RankInfo[id].talent = 0
						RankInfo[id].greater = zomgBlessing.class or RankInfo[id].greater
					end
				end
			end
			i = i + 1
		end

		local group = GetActiveTalentGroup()
		for t = 1,GetNumTalentTabs() do
			for i = 1,GetNumTalents(t) do
				local nameTalent, icon, iconx, icony, currRank, maxRank = GetTalentInfo(t, i, nil, nil, group)
				local bless = strmatch(nameTalent, L["PP_TSEARCH"])
				if (bless) then
					self.initialized = true
					local zomgBlessing = z.blessings[bless]
					if (zomgBlessing) then
						local id = ppSpellIndex[zomgBlessing.type]
						if (id and RankInfo[id]) then
							RankInfo[id].talent = currRank
							break
						end
					end
				end
			end
		end

		self.AllPallys[self.player] = RankInfo

		RankInfo.AuraInfo = {}
		for i = 1, PALLYPOWER_MAXAURAS do -- find max ranks/talents for auaras
			local spellName, spellRank = GetSpellInfo(PallyPowerAuras[i])
			
			if spellName then
				RankInfo.AuraInfo[i] = {}
				
				if not spellRank or spellRank == "" then -- spells without ranks
					spellRank = "1"		 -- Concentration, Crusader
				end

				local talent = 0
				if i == 1 then
					talent = LGT:UnitHasTalent("player", (GetSpellInfo(20138))) or 0	-- Improved Devotion Aura

				elseif i == 2 then
					talent = LGT:UnitHasTalent("player", (GetSpellInfo(31869))) or 0	-- Sanctified Retribution

			    elseif i == 3 then
					talent = LGT:UnitHasTalent("player", (GetSpellInfo(20254))) or 0	-- Improved Concentration Aura
				end

				RankInfo.AuraInfo[i].talent = talent
				RankInfo.AuraInfo[i].rank = tonumber(select(3, string.find(spellRank, "(%d+)")))
			end
		end
	end
end

-- GetSelf
function mod:GetSelf()
	if (not self.AllPallys) then
		return
	end

	if (not self.AllPallys[self.player]) then
		self.AllPallys[self.player] = {}
	end

	local SkillInfo = self.AllPallys[self.player]
	local s = ""
	for i = 1,4 do
		if (not SkillInfo[i]) then
			s = s.."nn"
		else
			s = s .. SkillInfo[i].rank .. SkillInfo[i].talent
		end
	end

	return s
end

-- SendSelf
function mod:SendSelf()
	if (not self.initialized) then
		self:ScanSpells()
		if (not self.initialized) then
			return
		end
	end

	local s = self:GetSelf() .. "@"

	-- Class Assignments
	local b = ZOMGBlessings
	local template = b and b.db.char.templates and b.db.char.templates.current
	if (b and template) then
		for i,class in ipairs(ppClassOrder) do
			local zomgBuffType = template[class] or template.default
			if (zomgBuffType) then
				local ppSpellIndex = ppSpellIndex[zomgBuffType]
				s = s .. (ppSpellIndex or "n")
			else
				s = s .. "n"
			end
		end
	else
		s = s .. "nnnnnnnnn"
	end

	self:SendMessage("SELF " .. s)

	-- Exceptions
	if (template) then
		local AssignList = {}
		for classOrName,zomgBuffType in pairs(template) do
			if (classOrName ~= "default" and classOrName ~= "modified" and classOrName ~= "state") then
				if (not ppClassIndex[classOrName]) then
					local unit = z:GetUnitID(classOrName)
					if (unit) then
						local _, unitclass = UnitClass(unit)
						local ppClassID = ppClassIndex[unitclass]
						local ppSpellID = ppSpellIndex[zomgBuffType]
						if (ppClassID and ppSpellID) then
							tinsert(AssignList, format("%s %s %s %s", self.player, ppClassID, classOrName, ppSpellID))
						end
					end
				end
			end
		end

		local offset = 1
		for offset = 1,#AssignList,5 do
			self:SendMessage("NASSIGN " .. table.concat(AssignList, "@", offset, min(offset + 4, #AssignList)))
		end
	end

	-- Symbol of Kings count
	self:SendMessage("SYMCOUNT "..(GetItemCount(21177) or 0))

	-- Aura
	s = ""
	local AuraInfo = self.AllPallys[self.player].AuraInfo
	for i = 1, PALLYPOWER_MAXAURAS do
		if not AuraInfo or not AuraInfo[i] then
			s = s.."nn"
		else
			s = s .. string.format("%x%x", AuraInfo[i].rank, AuraInfo[i].talent)
		end
	end
	s = s .. "@" .. self:GetAuraAssignment()

	self:SendMessage("ASELF "..s)
end

-- SendSymCount
function mod:SendSymCount()
	self:SendMessage("SYMCOUNT "..(GetItemCount(21177) or 0))
end

local lastZOMG
-- SendMessage
function mod:SendMessage(msg)
	local dist
	if (select(2, IsInInstance()) == "pvp") then
		dist = "BATTLEGROUND"
	elseif (GetNumRaidMembers() > 0) then
		dist = "RAID"
	elseif (GetNumPartyMembers() > 0) then
		dist = "PARTY"
	end
	if (dist) then
		if (_G.ChatThrottleLib) then
			if ((lastZOMG or 0) < GetTime() - 15) then
				lastZOMG = GetTime()
				_G.ChatThrottleLib:SendAddonMessage("NORMAL", ppPrefix, "ZOMG", dist)
			end
			_G.ChatThrottleLib:SendAddonMessage("NORMAL", ppPrefix, msg, dist)
		else
			if ((lastZOMG or 0) < GetTime() - 15) then
				lastZOMG = GetTime()
				SendAddonMessage(ppPrefix, "ZOMG", dist)
			end
			SendAddonMessage(ppPrefix, msg, dist)
		end
	end
end

-- CHAT_MSG_ADDON
function mod:CHAT_MSG_ADDON(prefix, message, distribution, sender)
	if (prefix == ppPrefix and sender ~= self.player) then
		if (not self.initialized) then
			self:ScanSpells()
			self:ScanInventory()
		end
		self:ProcessChat(sender, message)
	end
end

-- RAID_ROSTER_UPDATE
function mod:RAID_ROSTER_UPDATE()
	local inGroup = GetNumPartyMembers() > 0 or GetNumRaidMembers() > 0
	if (inGroup and not self.wasInGroup) then
		self:Announce()
	end
	if (not inGroup) then
		self.AllPallys = {}
	end
	self.wasInGroup = inGroup
end

-- Announce
function mod:Announce()
	self:SendMessage("ZOMG")								-- Let's other ZOMGBuffs users that this is not really PallyPower
	self:SendMessage("REQ")
	self:SendMessage("FREEASSIGN YES")
	self:SendSelf()
end

-- OnModuleEnable
function mod:OnModuleEnable()
	bm = ZOMGBlessingsManager

	self.player = UnitName("player")
	if (not PallyPower and bm) then
		self.AllPallys = {}
		self.player = UnitName("player")
		self:RegisterEvent("CHAT_MSG_ADDON")					-- For PallyPower support
		self:RegisterEvent("RAID_ROSTER_UPDATE")

		self:Announce()
		self.wasInGroup = GetNumPartyMembers() > 0 or GetNumRaidMembers() > 0
	end
end

-- OnModuleDisable
function mod:OnModuleDisable()
	self.AllPallys = nil
	self.player = nil
	self.wasInGroup = nil
end

bm = ZOMGBlessingsManager
