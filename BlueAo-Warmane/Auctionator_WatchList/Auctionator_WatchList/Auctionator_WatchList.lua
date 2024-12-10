local _, addon = ...
local ScrollingTable = LibStub("ScrollingTable");

local EventFrame = CreateFrame("Frame")
EventFrame:RegisterEvent("VARIABLES_LOADED");
EventFrame:RegisterEvent("AUCTION_HOUSE_SHOW");
EventFrame:RegisterEvent("AUCTION_HOUSE_CLOSED");




local WatchListTableColDef = {
    {["name"] = "", ["width"] = 1},	-- invisible column for storing the item index from the table
    {-- coloumn for Item Icon - need to store ID
        ["name"] = "",--"Icon", 
        ["width"] = 32,
        ["DoCellUpdate"] = function(rowFrame, cellFrame, data, cols, row, realrow, column, fShow, self, ...)
            
			-- icon handling
            if fShow then 
                local itemId = self:GetCell(realrow, column);
                local itemTexture = GetItemIcon(itemId); 
                cellFrame:SetBackdrop( { bgFile = itemTexture } );
            end
            
			-- tooltip handling
            local itemLink = self:GetCell(realrow, 3);
            cellFrame:SetScript("OnEnter", function() 
                                             GameTooltip:SetOwner(cellFrame, "ANCHOR_RIGHT");
                                             GameTooltip:SetHyperlink(itemLink);
                                             GameTooltip:Show();
                                           end);
            cellFrame:SetScript("OnLeave", function()
                                             GameTooltip:Hide();
                                             GameTooltip:SetOwner(UIParent, "ANCHOR_NONE");
                                           end);
        end,
    },
    {["name"] = "Item", ["width"] = 160},
    {["name"] = "Price", ["width"] = 100},
};

local WatchListOptionsTableColDef = {
    {["name"] = "", ["width"] = 1},	-- invisible column for storing the item index from the table
    {-- coloumn for Item Icon - need to store ID
        ["name"] = "",--"Icon", 
        ["width"] = 32,
        ["DoCellUpdate"] = function(rowFrame, cellFrame, data, cols, row, realrow, column, fShow, self, ...)
            
			-- icon handling
            if fShow then 
                local itemId = self:GetCell(realrow, column);
                local itemTexture = GetItemIcon(itemId); 
                cellFrame:SetBackdrop( { bgFile = itemTexture } );
            end
            
			-- tooltip handling
            local itemLink = self:GetCell(realrow, 3);
            cellFrame:SetScript("OnEnter", function() 
                                             GameTooltip:SetOwner(cellFrame, "ANCHOR_RIGHT");
                                             GameTooltip:SetHyperlink(itemLink);
                                             GameTooltip:Show();
                                           end);
            cellFrame:SetScript("OnLeave", function()
                                             GameTooltip:Hide();
                                             GameTooltip:SetOwner(UIParent, "ANCHOR_NONE");
                                           end);
        end,
    },
    {["name"] = "Item", ["width"] = 160},
    {["name"] = "Max Price", ["width"] = 100},
    --{["name"] = "Last scanned", ["width"] = 50},
    {["name"] = "", ["width"] = 1}	-- invisible column for price
};

-----------------------------------------

function AtrWatchList_EventHandler(self, event, ...)

	if (event == "VARIABLES_LOADED")			then	AtrWatchList_OnLoad(); 						end;
	if (event == "AUCTION_HOUSE_SHOW")			then	AtrWatchList_OnAuctionHouseShow(); 			end;
	if (event == "AUCTION_HOUSE_CLOSED")		then	AtrWatchList_OnAuctionHouseClosed(); 		end;

end
EventFrame:SetScript("OnEvent", AtrWatchList_EventHandler)

-----------------------------------------

WatchListDB = WatchListDB or {}

SLASH_AUCTIONATORWATCHLIST1 = "/awl"
SlashCmdList["AUCTIONATORWATCHLIST"] = function() OptionsFrame:Hide(); RefreshMainFrame(); MainFrame:Show(); end

local MainFrame
local OptionsFrame
local DelayEsc = 0
function AtrWatchList_OnLoad()
	DEFAULT_CHAT_FRAME:AddMessage("You can open Auctionator WatchList window by typing /awl")

	MainFrame = CreateFrame("Frame", "MainFrame", UIParent)
	MainFrame:SetFrameStrata("HIGH")
	MainFrame:SetWidth(32+160+100+2+40)
	MainFrame:SetHeight(324+16)
	MainFrame:SetPoint("CENTER")
	MainFrame:Hide()
	MainFrame:SetBackdrop({
		bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],
		edgeFile = [[Interface\DialogFrame\UI-DialogBox-Border]], --Interface\DialogFrame\UI-DialogBox-Border
		edgeSize = 8,
	})
	MainFrame:SetBackdropColor(0.1, 0.1, 0.1, 1) --r, g, b, a
	MainFrame:SetScript("OnHide", function() 
									EventFrame:RegisterEvent("AUCTION_HOUSE_CLOSED")
									
									-- DelayEsc = 0
									-- MainFrame:SetScript("OnUpdate", EscEnableDelay)
									end)
	MainFrame:SetScript("OnUpdate", EscEnableDelay)

	--local highlight = {["r"] = 0, ["g"] = 0, ["b"] = 1, ["a"]= 1}
	--(cols, numRows, rowHeight, highlight, parent)
	local WatchListScrollingTable = ScrollingTable:CreateST(WatchListTableColDef, 8, 32, nil , MainFrame);
	WatchListScrollingTable.frame:SetPoint("TOPLEFT", MainFrame, "TOPLEFT", 4, -32-12)
	WatchListScrollingTable:EnableSelection(true)
	WatchListScrollingTable:Hide()
	MainFrame.WatchListScrollingTable = WatchListScrollingTable
	
	MainFrame:SetScript("OnShow", function(self) self.WatchListScrollingTable:Show() end)
		
	local MainFrameText = MainFrame:CreateFontString("MainFrameText", "TOOLTIP", "GameFontNormal")
	MainFrameText:SetPoint("TOPLEFT", MainFrame, "TOPLEFT", 8, -8)
	MainFrameText:SetText("You can open this by typing /awl.")
	
	-- - - -
	
	local closeButton = CreateFrame("Button", "CloseBtn", MainFrame, "GameMenuButtonTemplate")
    closeButton:SetPoint("TOPRIGHT", MainFrame, "TOPRIGHT", -4, -4)
    closeButton:SetSize(20, 20)  
	closeButton:SetText("X")
    closeButton:SetNormalFontObject("GameFontNormalSmall")   
	closeButton:SetHighlightFontObject("GameFontHighlightSmall")
    closeButton:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
    closeButton:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
    closeButton:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
	closeButton:SetScript("OnClick", function()
										MainFrame:Hide()
										MainFrame.WatchListScrollingTable:ClearSelection()
										end)	
	
	-- - - -
	
	local HideItemButton = CreateFrame("Button", "RemoveItemBtn", MainFrame, "GameMenuButtonTemplate")
	HideItemButton:SetPoint("BOTTOMLEFT", MainFrame, "BOTTOMLEFT", 4, 4)
    HideItemButton:SetSize(96, 20)  
	HideItemButton:SetText("Hide Item")
    HideItemButton:SetNormalFontObject("GameFontNormalSmall")   
	HideItemButton:SetHighlightFontObject("GameFontHighlightSmall")
    HideItemButton:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
    HideItemButton:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
    HideItemButton:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
	HideItemButton:SetScript("OnClick", HideItemButton_Click)	
	
	-- - - -
	
	local OptionsButton = CreateFrame("Button", "RemoveItemBtn", MainFrame, "GameMenuButtonTemplate")
	OptionsButton:SetPoint("BOTTOMRIGHT", MainFrame, "BOTTOMRIGHT", -4, 4)
    OptionsButton:SetSize(96, 20)  
	OptionsButton:SetText("Options")
    OptionsButton:SetNormalFontObject("GameFontNormalSmall")   
	OptionsButton:SetHighlightFontObject("GameFontHighlightSmall")
    OptionsButton:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
    OptionsButton:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
    OptionsButton:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
	OptionsButton:SetScript("OnClick", OptionsButton_Click)	



	-----------------------------------------
	-- Options
	-----------------------------------------
	
	
	
	OptionsFrame = CreateFrame("Frame", "OptionsFrame", UIParent)
	OptionsFrame:SetFrameStrata("HIGH")
	OptionsFrame:SetWidth(32+160+100+2+40)
	OptionsFrame:SetHeight(324+16)
	--OptionsFrame:SetPoint("CENTER")
	OptionsFrame:SetPoint("TOPLEFT", MainFrame, "TOPLEFT", 0, 0)
	OptionsFrame:SetBackdrop({
		bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],
		edgeFile = [[Interface\DialogFrame\UI-DialogBox-Border]], --Interface\DialogFrame\UI-DialogBox-Border
		edgeSize = 8,
	})
	OptionsFrame:SetBackdropColor(0.1, 0.1, 0.1, 1) --r, g, b, a
	
	--local highlight = {["r"] = 0, ["g"] = 0, ["b"] = 1, ["a"]= 1}
	--(cols, numRows, rowHeight, highlight, parent)
	local WatchListScrollingTableOptions = ScrollingTable:CreateST(WatchListOptionsTableColDef, 8, 32, nil , OptionsFrame);
	WatchListScrollingTableOptions.frame:SetPoint("TOPLEFT", OptionsFrame, "TOPLEFT", 4, -32-12)
	WatchListScrollingTableOptions:EnableSelection(true)
	WatchListScrollingTableOptions:Hide()
	OptionsFrame.WatchListScrollingTable = WatchListScrollingTableOptions
	OptionsFrame:Hide()
	OptionsFrame:SetScript("OnShow", function() WatchListScrollingTableOptions:Show() end)
	OptionsFrame:SetScript("OnHide", function(self) 
										self.AddItemFrame:Hide() 
										self.EditItemFrame:Hide() 
									 end)
	
	local OptionsFrameText = OptionsFrame:CreateFontString("OptionsFrameText", "TOOLTIP", "GameFontNormal")
	OptionsFrameText:SetPoint("TOPLEFT", OptionsFrame, "TOPLEFT", 8, -8)
	OptionsFrameText:SetText("Watch List items are added, edited and removed here.")
		
	-- - - -
	
	local closeOptionsButton = CreateFrame("Button", "CloseBtn", OptionsFrame, "GameMenuButtonTemplate")
    closeOptionsButton:SetPoint("TOPRIGHT", OptionsFrame, "TOPRIGHT", -4, -4)
    closeOptionsButton:SetSize(20, 20)  
	closeOptionsButton:SetText("<")
    closeOptionsButton:SetNormalFontObject("GameFontNormalSmall")   
	closeOptionsButton:SetHighlightFontObject("GameFontHighlightSmall")
    closeOptionsButton:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
    closeOptionsButton:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
    closeOptionsButton:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
	closeOptionsButton:SetScript("OnClick", function()
												RefreshMainFrame()
												OptionsFrame:Hide()
												MainFrame:Show()
												end)	
	
	-- - - -
	
	local AddItemButton = CreateFrame("Button", "AddItemBtn", OptionsFrame, "GameMenuButtonTemplate")
	AddItemButton:SetPoint("BOTTOMLEFT", OptionsFrame, "BOTTOMLEFT", 4, 4)
    AddItemButton:SetSize(96, 20)  
	AddItemButton:SetText("Add Item")
    AddItemButton:SetNormalFontObject("GameFontNormalSmall")   
	AddItemButton:SetHighlightFontObject("GameFontHighlightSmall")
    AddItemButton:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
    AddItemButton:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
    AddItemButton:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
	AddItemButton:SetScript("OnClick", AddItemButton_Click)	
	OptionsFrame.AddItemButton = AddItemButton
	
	-- - - -
	
	local AddItemFrame = CreateFrame("Button", "AddItemFrame", OptionsFrame)
	AddItemFrame:SetSize(200, 60)
	AddItemFrame:SetBackdrop({
		bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],
		edgeFile = [[Interface\DialogFrame\UI-DialogBox-Border]], --Interface\DialogFrame\UI-DialogBox-Border
		edgeSize = 8,
	})
	AddItemFrame:SetBackdropColor(0.1, 0.1, 0.1, 1) --r, g, b, a
	AddItemFrame:SetPoint("TOP", OptionsFrame, "BOTTOM", 0, 0)
	AddItemFrame:Hide()
	AddItemFrame:EnableMouse()
	OptionsFrame.AddItemFrame = AddItemFrame	
	AddItemFrame:SetScript("OnEnter", function(self) self:SetBackdropColor(0.5, 0.5, 0.5, 1) end)
	AddItemFrame:SetScript("OnLeave", function(self) self:SetBackdropColor(0.1, 0.1, 0.1, 1) end)
	AddItemFrame:SetScript("OnReceiveDrag", ItemDropped)
	AddItemFrame:SetScript("OnClick", ItemDropped)
	AddItemFrame:SetScript("OnShow", function(self)
											for x = #UISpecialFrames, 1, -1 do
												if (UISpecialFrames[x] == OptionsFrame:GetName()) then
													table.remove(UISpecialFrames, x)
													break
												end
											end
											table.insert(UISpecialFrames, self:GetName())
											end)
	AddItemFrame:SetScript("OnHide", function(self)
											for x = #UISpecialFrames, 1, -1 do
												if (UISpecialFrames[x] == self:GetName()) then
													table.remove(UISpecialFrames, x)
													break
												end
											end
											table.insert(UISpecialFrames, OptionsFrame:GetName())
											end)
	
	local AddItemText = AddItemFrame:CreateFontString("AddItemText", "TOOLTIP", "GameFontNormal")
	AddItemText:SetText("Drop the item here or\nenter item link in the box below")
	AddItemText:SetPoint("TOP", 0, -6)
	
	local AddItemEditBox = CreateFrame("EditBox", "ItemLinkBox", AddItemFrame, "InputBoxTemplate")
	AddItemEditBox:SetSize(160, 24) --Height is ignored visually
	AddItemEditBox:SetPoint("BOTTOM", 0, 4)
	AddItemEditBox:SetAutoFocus(false)
	AddItemEditBox:SetScript("OnShow", function(self) self:SetFocus() end)
	AddItemEditBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
	AddItemEditBox:SetScript("OnReceiveDrag", ItemDropped)
	AddItemEditBox:SetScript("OnMouseDown", ItemDropped)
	AddItemEditBox:SetScript("OnChar", function(self) self:SetText("") end)
	OptionsFrame.AddItemEditBox = AddItemEditBox

	-- - - -
	
	local EditItemButton = CreateFrame("Button", "EditItemBtn", OptionsFrame, "GameMenuButtonTemplate")
	EditItemButton:SetPoint("BOTTOM", OptionsFrame, "BOTTOM", 0, 4)
    EditItemButton:SetSize(96, 20)  
	EditItemButton:SetText("Edit Price")
    EditItemButton:SetNormalFontObject("GameFontNormalSmall")   
	EditItemButton:SetHighlightFontObject("GameFontHighlightSmall")
    EditItemButton:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
    EditItemButton:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
    EditItemButton:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
	EditItemButton:SetScript("OnClick", EditItemButton_Click)
	OptionsFrame.EditItemButton = EditItemButton
	
	local EditItemFrame = CreateFrame("Frame", "EditItemFrame", OptionsFrame)
	EditItemFrame:SetSize(32+160+100+2+40, 50)
	EditItemFrame:SetPoint("TOP", OptionsFrame, "BOTTOM", 0, 0)
	EditItemFrame:SetBackdrop({
		bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],
		edgeFile = [[Interface\DialogFrame\UI-DialogBox-Border]], --Interface\DialogFrame\UI-DialogBox-Border
		edgeSize = 8,
	})
	EditItemFrame:SetBackdropColor(0.1, 0.1, 0.1, 1) --r, g, b, a
	EditItemFrame:Hide()
	OptionsFrame.EditItemFrame = EditItemFrame
	EditItemFrame:SetScript("OnShow", function(self)
											for x = #UISpecialFrames, 1, -1 do
												if (UISpecialFrames[x] == OptionsFrame:GetName()) then
													table.remove(UISpecialFrames, x)
													break
												end
											end
											table.insert(UISpecialFrames, self:GetName())
											end)
	
	local iconFrame = CreateFrame("Frame", "ItemIcon", EditItemFrame)
	iconFrame:SetSize(40, 40)
	iconFrame:SetPoint("TOPLEFT", 4, -6)
	iconFrame:EnableMouse()
	iconFrame:SetScript("OnEnter", function(self)
									GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
									GameTooltip:SetHyperlink(OptionsFrame.EditItemFrame.itemLink)
									GameTooltip:Show() 
									end)
	iconFrame:SetScript("OnLeave", function() GameTooltip:Hide() end)
	
	local icon = iconFrame:CreateTexture()
	icon:SetAllPoints()
	OptionsFrame.EditItemFrame.icon = icon

	local nameText = iconFrame:CreateFontString("itemName", "TOOLTIP", "GameFontNormal")
	nameText:SetPoint("TOPLEFT", icon, "TOPRIGHT", 4, 0)
	OptionsFrame.EditItemFrame.itemName = nameText
	
	local priceFrame = CreateFrame("Frame", "PriceFrame", EditItemFrame, "MoneyInputFrameTemplate")
	priceFrame:SetPoint("BOTTOMLEFT", icon, "BOTTOMRIGHT", 8, 2)
	OptionsFrame.EditItemFrame.price = priceFrame
	EditItemFrame:SetScript("OnHide", function(self)
											for x = #UISpecialFrames, 1, -1 do
												if (UISpecialFrames[x] == self:GetName()) then
													table.remove(UISpecialFrames, x)
													break
												end
											end
											table.insert(UISpecialFrames, OptionsFrame:GetName())
											MoneyInputFrame_SetCopper(priceFrame, 0) 
											end)
	
	local closeEditItemButton = CreateFrame("Button", "CloseBtn", EditItemFrame, "GameMenuButtonTemplate")
    closeEditItemButton:SetPoint("TOPRIGHT", EditItemFrame, "TOPRIGHT", -4, -4)
    closeEditItemButton:SetSize(16, 16)  
	closeEditItemButton:SetText("x")
    closeEditItemButton:SetNormalFontObject("GameFontNormalSmall")   
	closeEditItemButton:SetHighlightFontObject("GameFontHighlightSmall")
    closeEditItemButton:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
    closeEditItemButton:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
    closeEditItemButton:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
	closeEditItemButton:SetScript("OnClick", function() EditItemFrame:Hide() end)

	local confirmEditItemButton = CreateFrame("Button", "CloseBtn", EditItemFrame, "GameMenuButtonTemplate")
    confirmEditItemButton:SetPoint("BOTTOMRIGHT", EditItemFrame, "BOTTOMRIGHT", -4, 4)
    confirmEditItemButton:SetSize(60, 16)  
	confirmEditItemButton:SetText("Accept")
    confirmEditItemButton:SetNormalFontObject("GameFontNormalSmall")   
	confirmEditItemButton:SetHighlightFontObject("GameFontHighlightSmall")
    confirmEditItemButton:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
    confirmEditItemButton:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
    confirmEditItemButton:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
	confirmEditItemButton:SetScript("OnClick", AcceptEdit_Click)
	
	-- - - -
	
	local RemoveItemButton = CreateFrame("Button", "AddItemBtn", OptionsFrame, "GameMenuButtonTemplate")
	RemoveItemButton:SetPoint("BOTTOMRIGHT", OptionsFrame, "BOTTOMRIGHT", -4, 4)
    RemoveItemButton:SetSize(96, 20)  
	RemoveItemButton:SetText("Remove Item")
    RemoveItemButton:SetNormalFontObject("GameFontNormalSmall")   
	RemoveItemButton:SetHighlightFontObject("GameFontHighlightSmall")
    RemoveItemButton:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
    RemoveItemButton:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
    RemoveItemButton:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
	RemoveItemButton:SetScript("OnClick", RemoveItemButton_Click)	
	OptionsFrame.RemoveItemButton = RemoveItemButton
	
end


-----------------------------------------

function AtrWatchList_OnAuctionHouseShow()

	--MainFrame:Hide()
	RemoveEsc()
	
end

-----------------------------------------

function AtrWatchList_OnAuctionHouseClosed()
	--EventFrame:UnregisterEvent("AUCTION_HOUSE_CLOSED");
	MainFrame:SetPoint("TOPLEFT", "AuctionFrame", "TOPRIGHT", 4, -8)
	
	RefreshMainFrame()
	
	if (table.getn(MainFrame.WatchListScrollingTable.LootInfo) > 0) then
		OptionsFrame:Hide()
		MainFrame:Show()
	end
	
	DelayEsc = 0
	MainFrame:SetScript("OnUpdate", EscEnableDelay)
		
end

-----------------------------------------

function RefreshMainFrame()

	local LootInfo = {}

	local IndexCount = 1
	for k,v in pairs(WatchListDB) do	
		if (Atr_GetAuctionBuyout(k) ~= nil) and (Atr_GetAuctionBuyout(k) < v) then
			table.insert(LootInfo, {1, k, GetItemLink(k), priceToMoneyString(Atr_GetAuctionBuyout(k))})
			IndexCount = IndexCount + 1
		end	
	end

	MainFrame.WatchListScrollingTable.LootInfo = LootInfo
	MainFrame.WatchListScrollingTable:SetData(LootInfo,true)
	
end

-----------------------------------------

function GetItemID(itemLink)

	local itemString = select(3, string.find(itemLink, "^|c%x+|H(.+)|h%[.*%]"))
	local _, itemID = strsplit(":", itemString)
	
	return itemID

end

function GetItemLink(itemID)

	local itemName, itemLink = GetItemInfo(itemID) 
	
	return itemLink

end

-----------------------------------------

local goldicon		= "|TInterface\\MoneyFrame\\UI-GoldIcon:12:12:4:0|t"
local silvericon	= "|TInterface\\MoneyFrame\\UI-SilverIcon:12:12:4:0|t"
local coppericon	= "|TInterface\\MoneyFrame\\UI-CopperIcon:12:12:4:0|t"

function priceToMoneyString (valuePass)
	local CoinAmount = valuePass	

	local gold = math.floor (CoinAmount/10000)
	CoinAmount = CoinAmount - gold*10000
	
	local silver = math.floor (CoinAmount/100)
	CoinAmount = CoinAmount - silver*100
	
	local copper = CoinAmount
		
	local MoneyString = "";

	if (gold ~= 0) then
		MoneyString = gold..goldicon.."  ";
	end


	if (MoneyString ~= "") then
		MoneyString = MoneyString..format("%02i%s  ", silver, silvericon);
	elseif (silver ~= 0) then
		MoneyString = MoneyString..silver..silvericon.."  ";
	end

	if (MoneyString ~= "") then
		MoneyString = MoneyString..format("%02i%s", copper, coppericon);
	elseif (copper ~= 0) then
		MoneyString = MoneyString..copper..coppericon;
	end

	return MoneyString;

end

-----------------------------------------

function HideItemButton_Click()

		local RowIndex = MainFrame.WatchListScrollingTable:GetSelection()
		if (RowIndex ~= nil) then				
			tremove(MainFrame.WatchListScrollingTable.LootInfo, RowIndex)
			MainFrame.WatchListScrollingTable:SetData(MainFrame.WatchListScrollingTable.LootInfo, true)	
			if (table.getn(MainFrame.WatchListScrollingTable.LootInfo) < 1) then
				MainFrame:Hide()
			end
		else
			DEFAULT_CHAT_FRAME:AddMessage("Auctionator WatchList: You need to select an item first.")
		end

end

-----------------------------------------

function OptionsButton_Click()

	RefreshOptionsScrollingTable()
	if (OptionsFrame.WatchListScrollingTable.ItemWatchList ~= nil)  then
		OptionsFrame.EditItemButton:Show()
	else
		OptionsFrame.EditItemButton:Hide()
	end

	MainFrame:Hide()
	OptionsFrame:Show()

end


-----------------------------------------

function AddItemButton_Click()

	if OptionsFrame.AddItemFrame:IsVisible() then
		OptionsFrame.AddItemFrame:Hide()
	else
		OptionsFrame.AddItemFrame:Show()
	end
	OptionsFrame.EditItemFrame:Hide()

end

-----------------------------------------

function ItemDropped()

	local infoType, itemID, itemLink = GetCursorInfo()
	if (infoType == nil) then return end --exit when clicking editbox
	
	if (infoType ~= "item") then
		DEFAULT_CHAT_FRAME:AddMessage("Auctionator WatchList: That is not a valid item.")
		ClearCursor()
		return
	end	
	
	ClearCursor()
	ValidateItem(itemLink)

end

-----------------------------------------

function ValidateItem(itemLink)
	
	OptionsFrame.AddItemFrame:Hide()
	OptionsFrame.EditItemFrame.itemLink = itemLink
	OptionsFrame.EditItemFrame.itemName:SetText(itemLink)
	local itemID = GetItemID(itemLink)
	OptionsFrame.EditItemFrame.icon:SetTexture(GetItemIcon(itemID))
	if WatchListDB[itemID] ~= nil then
		MoneyInputFrame_SetCopper(OptionsFrame.EditItemFrame.price, WatchListDB[itemID])
	end
	OptionsFrame.EditItemFrame:Show()
	OptionsFrame.EditItemFrame.price.gold:SetFocus()

end

-----------------------------------------

local origChatFrame_ChatEdit_InsertLink = ChatEdit_InsertLink
ChatEdit_InsertLink = function(...)
	local text = ...
 
	if (OptionsFrame.AddItemEditBox:HasFocus()) then
		local itemName, itemLink
		if ( strfind(text, "item:", 1, true) ) then
			itemName, itemLink = GetItemInfo(text);
			ValidateItem(itemLink)
		end	
	end
	
	return origChatFrame_ChatEdit_InsertLink(...)
end

-----------------------------------------

function AcceptEdit_Click()

	local ItemID = GetItemID(OptionsFrame.EditItemFrame.itemLink)
	local PriceInCopper = MoneyInputFrame_GetCopper(OptionsFrame.EditItemFrame.price)

	WatchListDB[ItemID] = PriceInCopper
	OptionsFrame.EditItemFrame:Hide()
	OptionsFrame.EditItemButton:Show()
	RefreshOptionsScrollingTable()

end

-----------------------------------------

function RefreshOptionsScrollingTable()

	local ItemWatchList = {}
	local IndexCount = 1
	for k,v in pairs(WatchListDB) do
		table.insert(ItemWatchList, {IndexCount, k, GetItemLink(k), priceToMoneyString(v), v})
		IndexCount = IndexCount + 1
	end
	OptionsFrame.WatchListScrollingTable.ItemWatchList = ItemWatchList
	OptionsFrame.WatchListScrollingTable:SetData(ItemWatchList, true)

end

-----------------------------------------

function EditItemButton_Click()
	
	local RowIndex = OptionsFrame.WatchListScrollingTable:GetSelection()
	
	if (RowIndex ~= nil) then	
		local itemID = OptionsFrame.WatchListScrollingTable:GetCell(RowIndex, 2)
		local itemLink = OptionsFrame.WatchListScrollingTable:GetCell(RowIndex, 3)
		local PriceInCopper = OptionsFrame.WatchListScrollingTable:GetCell(RowIndex, 5)
		
		OptionsFrame.AddItemFrame:Hide()
		OptionsFrame.EditItemFrame.itemLink = itemLink
		OptionsFrame.EditItemFrame.itemName:SetText(itemLink)
		OptionsFrame.EditItemFrame.icon:SetTexture(GetItemIcon(itemID))
		MoneyInputFrame_SetCopper(OptionsFrame.EditItemFrame.price, PriceInCopper)
		OptionsFrame.EditItemFrame:Show()
		OptionsFrame.EditItemFrame.price.gold:SetFocus()
	else
		DEFAULT_CHAT_FRAME:AddMessage("Auctionator WatchList: You need to select an item first.")
	end

end

-----------------------------------------

function RemoveItemButton_Click()
	
	local RowIndex = OptionsFrame.WatchListScrollingTable:GetSelection()
	
	if (RowIndex ~= nil) then	
		local itemID = OptionsFrame.WatchListScrollingTable:GetCell(RowIndex, 2)
		local itemLink = OptionsFrame.WatchListScrollingTable:GetCell(RowIndex, 3)
		local PriceInCopper = OptionsFrame.WatchListScrollingTable:GetCell(RowIndex, 5)
		
		OptionsFrame.AddItemFrame:Hide()
		OptionsFrame.EditItemFrame:Hide()
		
		WatchListDB[itemID] = nil
		RefreshOptionsScrollingTable()
	else
		DEFAULT_CHAT_FRAME:AddMessage("Auctionator WatchList: You need to select an item first.")
	end
	
end

-----------------------------------------

function EscEnableDelay()

	DelayEsc = DelayEsc + 1
	if DelayEsc > 1 then
		-- - - - Enable closing frames with Esc
		table.insert(UISpecialFrames, MainFrame:GetName()) --close with escape
		table.insert(UISpecialFrames, OptionsFrame:GetName()) --close with escape
		MainFrame:SetScript("OnUpdate", nil)
	end

end

-----------------------------------------

function RemoveEsc()

	-- - - - Disable closing frames with Esc due to bug, Esc on closing AH also closes MainFrame
	local RemoveCounter = 0
	for x = #UISpecialFrames, 1, -1 do
		if (UISpecialFrames[x] == OptionsFrame:GetName()) or (UISpecialFrames[x] == MainFrame:GetName()) then
			table.remove(UISpecialFrames, x)
			RemoveCounter = RemoveCounter + 1
		end
		if RemoveCounter == 2 then return end
	end
	
end