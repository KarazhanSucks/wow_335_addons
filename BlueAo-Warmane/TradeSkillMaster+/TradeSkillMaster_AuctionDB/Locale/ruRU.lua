-- ------------------------------------------------------------------------------ --
--                           TradeSkillMaster_AuctionDB                           --
--           http://www.curse.com/addons/wow/tradeskillmaster_auctiondb           --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

-- TradeSkillMaster_AuctionDB Locale - ruRU
-- Please use the localization app on CurseForge to update this
-- http://wow.curseforge.com/addons/TradeSkillMaster_AuctionDB/localization/

local L = LibStub("AceLocale-3.0"):NewLocale("TradeSkillMaster_AuctionDB", "ruRU")
if not L then return end

L["A full auction house scan will scan every item on the auction house but is far slower than a GetAll scan. Expect this scan to take several minutes or longer."] = "Полный скан Аукциона просканирует каждый товар, но намного дольше, чем GetAll скан. Ждите, это займёт несколько минут или более."
L["A GetAll scan is the fastest in-game method for scanning every item on the auction house. However, there are many possible bugs on Blizzard's end with it including the chance for it to disconnect you from the game. Also, it has a 15 minute cooldown."] = "GetAll скан - самый быстрый внутриигровой способ сканирования. Однако, из-за из-за ошибок со стороны Blizzard's, существует вероятность отключения от сервера. Кроме того, он имеет 15-минутный перерыв."
L["Any items in the AuctionDB database that contain the search phrase in their names will be displayed."] = "Будут отображены все товары из базы данных AuctionDB, содержащие искомую фразу в названии."
L["Are you sure you want to clear your AuctionDB data?"] = "Вы действительно хотите очистить базу AuctionDB?"
L["Ascending"] = "Возрастание"
L["AuctionDB - Market Value"] = "AuctionDB - Рыночная стоимость"
L["AuctionDB - Minimum Buyout"] = "AuctionDB - Минимальный выкуп"
L["Can't run a GetAll scan right now."] = "Сейчас невозможно запустить GetAll скан."
L["Descending"] = "Убывание"
-- L["Display lowest buyout value seen in the last scan in tooltip."] = ""
L["Display market value in tooltip."] = "Показывать рыночную цену в подсказке."
-- L["Display number of items seen in the last scan in tooltip."] = ""
-- L["Display total number of items ever seen in tooltip."] = ""
L["Done Scanning"] = "Сканирование завершено"
-- L["Download the FREE TSM desktop application which will automatically update your TSM_AuctionDB prices using Blizzard's online APIs (and does MUCH more). Visit %s for more info and never scan the AH again! This is the best way to update your AuctionDB prices."] = ""
L["Enable display of AuctionDB data in tooltip."] = "Показывать данные AuctionDB в подсказке."
L["GetAll scan did not run successfully due to issues on Blizzard's end. Using the TSM application for your scans is recommended."] = "GetAll скан завершился неудачно из-за проблем со стороны Blizzard. Рекомендуется использовать для сканирования TSM."
L["Hide poor quality items"] = "Скрыть товары низкого качества"
L["If checked, poor quality items won't be shown in the search results."] = "Не показывать товары низкого качества в результатах поиска."
L["If checked, the lowest buyout value seen in the last scan of the item will be displayed."] = "Если выбрано, будет показана минимальная цена выкупа товара с последнего скана"
L["If checked, the market value of the item will be displayed"] = "Если выбрано, будет показана рыночная цена товара"
-- L["If checked, the number of items seen in the last scan will be displayed."] = ""
-- L["If checked, the total number of items ever seen will be displayed."] = ""
-- L["Imported %s scans worth of new auction data!"] = ""
L["Invalid value entered. You must enter a number between 5 and 500 inclusive."] = "Введено неверное значение. Значение должно быть числом от 5 до 500 включительно."
L["Item Link"] = "Ссылка на товар"
L["Item MinLevel"] = "Мин.уровень товара"
L["Items per page"] = "Товаров на страницу"
L["Items %s - %s (%s total)"] = "Товаров %s - %s (%s всего)"
L["Item SubType Filter"] = "Фильтр по подтипу товара"
L["Item Type Filter"] = "Фильтр по типу товара"
L["It is strongly recommended that you reload your ui (type '/reload') after running a GetAll scan. Otherwise, any other scans (Post/Cancel/Search/etc) will be much slower than normal."] = "Настоятельно рекомендуем перезагрузить ваш интерфейс (наберите в чате '/reload') после выполнения GetAll скана. Иначе, любые другие сканы (Выставить/Отменить/Поиск/т.д.) будут намного медленнее, чем обычно."
L["Last Scanned"] = "Последний скан"
-- L["Last updated from in-game scan %s ago."] = ""
-- L["Last updated from the TSM Application %s ago."] = ""
L["Market Value"] = "Рыночная цена"
L["Market Value:"] = "Рыночная цена:"
-- L["Market Value x%s:"] = ""
L["Min Buyout:"] = "Мин. выкуп:"
-- L["Min Buyout x%s:"] = ""
L["Minimum Buyout"] = "Минимальный выкуп"
L["Next Page"] = "Далее"
L["No items found"] = "Ничего не найдено"
L["No scans found."] = "Нет сканов."
L["Not Ready"] = "Не готово"
L["Not Scanned"] = "Не сканировалось"
L["Num(Yours)"] = "Число(Ваших)"
L["Options"] = "Опции"
L["Previous Page"] = "Назад"
L["Processing data..."] = "Обработка данных..."
L["Ready"] = "Готово"
L["Ready in %s min and %s sec"] = "Готовность через %s мин %s сек"
L["Refreshes the current search results."] = "Обновляет текущие результаты поиска."
L["Removed %s from AuctionDB."] = "Удалено %s из AuctionDB."
L["Reset Data"] = "Сбросить данные"
L["Resets AuctionDB's scan data"] = "Сбрасывает данные сканирования модуля AuctionDB"
-- L["Result Order:"] = ""
L["Run Full Scan"] = "Полный скан"
L["Run GetAll Scan"] = "GetAll скан"
L["Running query..."] = "Осуществляется запрос..."
L["%s ago"] = "%s назад"
L["Scanning page %s/%s"] = "Сканирование страницы %s/%s"
L["Scanning the auction house in game is no longer necessary!"] = "Сканирование аукциона в игре больше не требуется!"
L["Search"] = "Поиск"
L["Search Options"] = "Опции поиска"
L["Seen Last Scan:"] = "Найдено посл. раз:"
L["Select how you would like the search results to be sorted. After changing this option, you may need to refresh your search results by hitting the \"Refresh\" button."] = "Выберите каким образом сортировать результаты поиска. После изменения данной настройки, вам может понадобиться обновление поисковых результатов с помощью кнопки \"Обновить\"."
L["Select whether to sort search results in ascending or descending order."] = "Выберите, следует ли отсортировать результаты поиска в порядке возрастания или убывания."
L["Shift-Right-Click to clear all data for this item from AuctionDB."] = "Shift+ПКМ для очистки всех данных об этом товаре из AuctionDB."
L["Sort items by"] = "Сортировать по"
L["This determines how many items are shown per page in results area of the \"Search\" tab of the AuctionDB page in the main TSM window. You may enter a number between 5 and 500 inclusive. If the page lags, you may want to decrease this number."] = "Определяет сколько товаров показывать на одну страницу в области результатов вкладки \"Поиск\" раздела AuctionDB главного окна TSM. Можно ввести значение от 5 до 500 включительно. Если страница лагает, может потребоваться уменьшить это значение."
L["Total Seen Count:"] = "Всего найдено:"
L["Use the search box and category filters above to search the AuctionDB data."] = "Используйте поисковое поле и фильтры по категориям выше для поиска по данным AuctionDB."
L["You can filter the results by item subtype by using this dropdown. For example, if you want to search for all herbs, you would select \"Trade Goods\" in the item type dropdown and \"Herbs\" in this dropdown."] = "Результаты можно отфильтровать по подтипу товара с помощью этого выпадающего списка. Например, если требуется найти все травы, нужно выбрать \"Хозяйственные товары\" в списке типа товара и \"Трава\" в данном списке."
L["You can filter the results by item type by using this dropdown. For example, if you want to search for all herbs, you would select \"Trade Goods\" in this dropdown and \"Herbs\" as the subtype filter."] = "Результаты можно отфильтровать по типу товара с помощью этого выпадающего списка. Например, если требуется найти все травы, нужно выбрать \"Хозяйственные товары\" в данном списке и \"Трава\" в списке подтипа товара."
L["You can use this page to lookup an item or group of items in the AuctionDB database. Note that this does not perform a live search of the AH."] = "Эту страницу можно использовать для поиска товаров или групп товаров в базе данных AuctionDB. Учтите, что это не \"живой\" поиск по АД."
 