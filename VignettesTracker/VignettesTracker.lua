--[[
VignettesTracker (c) 2014 James 'Kaydeethree' Twyford
Available under the terms of GPLv2

valid commands: /ffr, /smv, /grg, /tld, /soa, /ngd, /unk, /mistagged, /all

set `found` to true to hide it from search results to limit spam in the chat
frame

set myChatFrame to a valid frame that can receive text. kd3 uses ChatFrame4
for this purpose (his data-gathering macros also print to that frame)

all of the vignettes are in one table, sorted first by zone, then by type,
then alphabetically. the unknown section is for vignettes in the data but not
in an obvious zone or unused. mistagged vignettes show up after interacting
with a random object not related to the name of the quest, or for some other
unknown-to-kd3 reason.
--]]

local myChatFrame=ChatFrame4

local function onLoad(self)
 if not TTF then
  TTF=CreateFrame('Frame')
 end
 TTF:SetScript('OnUpdate',function(s)
  local x,y=GetPlayerMapPosition('player')
  MinimapZoneText:SetFormattedText('%2.1f,%2.1f%s',x*100,y*100,GetMinimapZoneText())
  end
  )
 MinimapZoneText:SetFontObject(GameTooltipTextSmall)
end
onLoad()

local vignetteType, zones, vignettes, items
function getItem(table)
 local item = ''
 if type(table) == 'table' then
  for i=1,#table do
   --item = item..select(2,GetItemInfo(table[j]))..' '
   item = item..table[i]..' '
  end
 else
  --item = items[table] or select(2,GetItemInfo(table))
  item = items[table] or table
 end
 return item
end

local function composeLine(t)
myChatFrame:AddMessage(vignetteType[t[3]]..' ' ..t[4]..' ' ..t[6]..
  ' '..getItem(t[5])..' @'..zones[t[2]]..':'..
  (t[7] or '?')..','..(t[8] or '?'));
end

local function go(zone)
 for i=1,#vignettes do
  if not vignettes[i][1] and (zone == -1 or vignettes[i][2] == zone)
     and IsQuestFlaggedCompleted(vignettes[i][4]) then
   composeLine(vignettes[i])
  end
 end
end

local function checkItems()
 for i=1,#vignettes do
  composeLine(vignettes[i])
 end
end

items = {
[0] = 'None or Gold',
[-823] = GetCurrencyLink(823), --Apexis Crystal
[-824] = GetCurrencyLink(824), --Garrison Resources
[-829] = GetCurrencyLink(829), --Arakkoa Archaeology Fragment
}
vignetteType = {
[42] = 'Treasure',
[43] = 'Creature',
[44] = 'Event',
[45] = 'Elite treasure',
[46] = 'Elite creature',
[47] = 'Elite event',
}
zones = {
[1] = 'Unknown',
[2] = 'Mistagged',
[5785] = 'Jade Forest',
[5805] = 'Valley of the Four Winds',
[5840] = 'Vale of Eternal Blossoms',
[5841] = 'Kun-Lai Summit',
[5842] = 'Townlong Steppes',
[6006] = 'Veiled Stair',
[6134] = 'Krasarang Wilds',
[6138] = 'Dread Wastes',
[6507] = 'Isle of Thunder',
[6662] = 'Talador',
[6719] = 'Shadowmoon Valley',
[6720] = 'Frostfire Ridge',
[6721] = 'Gorgrond',
[6722] = 'Spires of Arak',
[6755] = 'Nagrand',
[6757] = 'Timeless Isle',
}

vignettes = { -- {found, zone, icon, questID, itemID, 'Vignette name', xCoord, yCoord}
-- Frostfire Ridge objects
{false, 6720, 42, 33916, 108735, 'Arena Master\'s War Horn', 22.9,25.8}, --?
{false, 6720, 42, 33916, 108735, 'Arena Master\'s War Horn', 23.2,25.0},
{false, 6720, 42, 34520, 107457, 'Burning Pearl', 42.4,19.6}, -- Treasure Placeholder
{false, 6720, 42, 33940, 112187, 'Crag-Leaper\'s Cache', 42.7,31.7}, 
{false, 6720, 42, 33531, 112096, 'Clumsy Cragmaul Brute', 50.2,18.7}, --also fallen ogre
{false, 6720, 42, 33532, 0, 'Cragmaul Cache', 39.7,17.2},
{false, 6720, 42, 35370, 0, 'Doorog\'s Secret Stash', 26.6,39.5},
{false, 6720, 42, 34473, 110536, 'Envoy\'s Satchel', 40.9,20.1},
{false, 6720, 42, 34841, -824, 'Forgotten Supplies', 43.7,55.6},
{false, 6720, 42, 34968, -824, 'Forgotten Supplies', 43.7,55.6},
{false, 6720, 42, 34507, 110689, 'Frozen Frostwolf Axe', 24.2,48.6},
{false, 6720, 42, 33948, 111543, 'Goren Leftovers', 66.7,26.4},
{false, 6720, 42, 33947, -824, 'Grimfrost Treasure', 68.1,45.9},
{false, 6720, 42, 33017, -824, 'Iron Horde Supplies', 68.9,69.1},
{false, 6720, 42, 34937, -824, 'Lady Sena\'s Other Materials Stash', 51.4,66.8},
{false, 6720, 42, 33926, 108739, 'Lagoon Pool', 21.7,9.6},
{false, 6720, 42, 34642, 111408, 'Lucky Coin', 19.2,12.0},
{false, 6720, 42, 33961, 0, 'Mysterious Flower, Frostfire Ridge', 71.6,69.6},
{false, 6720, 42, 33502, 112087, 'Obsidian Petroglyph', 38.3,37.8}, --Carved Obsidian Idol
{false, 6720, 42, 34931, -824, 'Pale Loot Sack', 21.7,50.8},
{false, 6720, 42, 34967, -824, 'Raided Loot', 37.3,59.2},
{false, 6720, 42, 34641, 111407, 'Sealed Jug', 9.8,45.3},
{false, 6720, 42, 33977, 0, 'Shamanstone, Blessing of the Wolf', 27.1,36.5},
{false, 6720, 42, 33979, 0, 'Shamanstone, Buffeting Galefury', 65.2,79.1},
{false, 6720, 42, 33980, 0, 'Shamanstone, Ogrish Fortitude', 43.9,12.3},
{false, 6720, 42, 33978, 0, 'Shamanstone, Spirit of the Wolf', 17.5,56.7},
{false, 6720, 42, 33981, 0, 'Shamanstone, Touched by Fire', 37.0,33.2},
{false, 6720, 42, 33982, 0, 'Shamanstone, Touched by Ice', 60.4,13.7},
{false, 6720, 42, 33500, 43696, 'Slave\'s Stash', 27.7,42.8}, --or 28.1,44.6?
{false, 6720, 42, 34649, 109119, 'Smoldering True Iron Deposit', 36.3,32.3},
{false, 6720, 42, 33501, {63293, 107659}, 'Spectator\'s Chest', 24.2,27.1},
{false, 6720, 42, 33942, -824, 'Supply Dump', 16.1,49.7},
{false, 6720, 42, 33946, -824, 'Survivalist\'s Cache', 64.7,25.7},
{false, 6720, 42, 32803, 107658, 'Thunderlord Cache', 34.2,23.5},
{false, 6720, 42, 33440, 0, 'Time-Warped Bladespire Brute, Falling Lower', 30.5,50.8},
{false, 6720, 42, 33497, 0, 'Time-Warped Bladespire Brute, Falling Higher', 30.5,50.9},
{false, 6720, 42, 33439, 0, 'Time-Warped Bladespire Brute, Running', 30.3,50.6},
{false, 6720, 42, 33438, 107662, 'Time-Warped Bladespire Primalist', 30.3,51.2},
{false, 6720, 42, 33505, 112107, 'Wiggling Egg', 64.4,65.8},
{false, 6720, 42, 33525, {107270, 107273, 107277}, 'Young Orc Traveler', 54.8,35.5},
{false, 6720, 42, 33525, {107271, 107272, 107275}, 'Young Orc Woman', 63.4,14.7},

{false, 6720, 42, 33989, 0, 'Blasting Charges - Cave A Cache', 29.8,50.4}, --forgotten bladespire cache
{false, 6720, 42, 33991, 0, 'Blasting Charges - Cave B Cache', 19.9,16.1}, --forgotten saberon cache
{false, 6720, 42, 33996, 0, 'Blasting Charges - Cave C Cache', 68.1,82.1}, --forgotten thunderlord cache
{false, 6720, 42, 33998, 0, 'Blasting Charges - Cave D Cache', 43.1,37.8}, --forgotten frostwolf cache
{false, 6720, 42, 33925, 0, 'Frostwolf Cache 01', 20.1,56.2},
{false, 6720, 42, 33945, 0, 'Frostwolf Cache 03', 18.4,32.3},
{false, 6720, 42, 33949, 0, 'Frostwolf Cache 07', 38.0,47.4},
{false, 6720, 42, 33016, 0, 'Frostwolf Supply Cache', 57.2,52.2}, --frozen treasure -or- 40.0,53.0 (outpost supplies)
{false, 6720, 42, 34648, 0, 'Gnawed Bone', 25.5,20.4},
{false, 6720, 42, 34713, 0, 'Gronnstalker\'s Cache', 48.4,32.9},
{false, 6720, 42, 36863, 0, 'Iron Horde Munitions', 56.7,71.9},
{false, 6720, 42, 34936, 0, 'Lady Sena\'s Extra Stash?', 45.7,67.2},
{false, 6720, 42, 35347, 0, 'Ogre Booty 000', 26.5,35.2},
{false, 6720, 42, 35367, 0, 'Ogre Booty 001', 26.4,36.1}, --Gorr'thogg's Personal Reserve
{false, 6720, 42, 35368, 0, 'Ogre Booty 002', 28.4,34.5}, 
{false, 6720, 42, 35369, 0, 'Ogre Booty 003', 27.8,39.2},
{false, 6720, 42, 35370, 0, 'Ogre Booty 004', 26.6,39.5},
{false, 6720, 42, 35371, 0, 'Ogre Booty 005', 27.6,33.8},
{false, 6720, 42, 35373, 0, 'Ogre Booty 006', 28.2,37.6},
{false, 6720, 42, 35567, 0, 'Ogre Booty 007', 28.0,34.2},
{false, 6720, 42, 35568, 0, 'Ogre Booty 008', 30.7,38.7},
{false, 6720, 42, 35569, 0, 'Ogre Booty 009', 30.1,39.3},
{false, 6720, 42, 35570, 0, 'Ogre Booty 010', 27.3,38.8},
{false, 6720, 42, 33930, 0, 'Sabron Stash', 38.2,63.5}, --or 38.3,62.1 (stolen weapons)
{false, 6720, 42, 34652, 0, 'Savage Clam', 9.8,45.3},
{false, 6720, 42, 34647, 0, 'Snow-Covered Strongbox', 24.0,13.0},
{false, 6720, 42, 36053, 0, 'Unused Wood Pile', 48.6,63.9},

--Frostfire Ridge npcs
{false, 6720, 43, 34497, 111476, 'Breathless', 27.8,50.3},
{false, 6720, 43, 32941, 101436, 'Canyon Icemother', 33.5,23.1},
{false, 6720, 43, 34843, 111953, 'Chillfang', 41.4,68.3},
{false, 6720, 43, 33014, 111490, 'Cindermaw', 40.6,47.1},
{false, 6720, 43, 34129, 112066, 'Coldstomp the Griever', 25.9,55.2},
{false, 6720, 43, 34131, 111484, 'Coldtusk', 54.2,67.7},
{false, 6720, 43, 34477, 112086, 'Cyclonic Fury', 67,78},
{false, 6720, 43, 34130, -824, 'Giantstalker Hunting Party', 58.6,31.9},
{false, 6720, 43, 34132, 112094, 'Scout Goreseeker', 76.5,63.5},
{false, 6720, 43, 33512, 111545, 'Gorg\'ak the Lava Guzzler', 72.5,22.8},
{false, 6720, 43, 34865, 112077, 'Grutush the Pillager', 38.6,62.9},
{false, 6720, 43, 34825, 111948, 'Gruuk', 51.8,65.1},
{false, 6720, 43, 34839, 111955, 'Gurun', 47.1,55.2},
{false, 6720, 43, 34708, 112078, 'Jehil the Climber', 61.8,26.6},
{false, 6720, 43, 32918, 111530, 'Giant-Slayer Kul', 54.7,22.3},
{false, 6720, 43, 33938, 111576, 'Primalist Mur\'og', 37.0,33.8},
{false, 6720, 43, 34470, 111666, 'Pale Fishmonger', 28.3,66.6},
{false, 6720, 43, 33843, 111533, 'Broodmother Reeg\'ak', 65.6,31.4},
{false, 6720, 43, 34133, 111475, 'The Beater', 26.9,31.9},
{false, 6720, 43, 34361, 111534, 'The Bone Crawler', 72.4,33.1},
{false, 6720, 43, 34559, 111477, 'Yaga the Scarred', 40.6,27.6},
{false, 6720, 43, 37382, -823, 'Hoarfrost', 68.1,19.1},
{false, 6720, 43, 37387, -823, 'Moltnoma', 42.5,21.9},
{false, 6720, 43, 37381, -823, 'Mother of Goren', 72.5,22.8},
{false, 6720, 43, 37385, -823, 'Slogtusk the Corpse Eater', 44.6,15.2},
{false, 6720, 43, 37384, -823, 'Tor\'goroth', 43.6,9.3},
{false, 6720, 43, 37389, -823, 'Ug\'lok the Frozen', 40.3,12.1},

-- Frostfire Ridge events
{false, 6720, 44, 34476, 111554, 'Frozen Treasure', 57.2,52.1},
{false, 6720, 44, 33504, 107661, 'Firefury Stone and Firefury Giant', 71.7,47.0},
{false, 6720, 44, 33011, {106899, 106902}, 'Grizzled Frostwolf Veteran', 45.4,50.3},
{false, 6720, 44, 33511, 112110, 'Sacrifice Pit (Borrok the Devourer)', 62.8,42.4},

-- Shadowmoon Valley objects
{false, 6719, 42, 35581, 109124, 'Alchemist\'s Satchel', 54.9,45.0},
{false, 6719, 42, 35584, 113560, 'Ancestral Greataxe', 52.8,48.4},
{false, 6719, 42, 33869, 108902, 'Armored Elekk Tusk', 41.4,27.9},
{false, 6719, 42, 33584, 113531, 'Ashes of A\'kumbo', 37.8,44.3},
{false, 6719, 42, 33867, 109739, 'Astrologer\'s Box', 49.3,37.6},
{false, 6719, 42, 33046, 113547, 'Beloved\'s Offering', 36.8,41.4},
{false, 6719, 42, 33613, 108945, 'Bubbling Cauldron', 37.2,23.1},
{false, 6719, 42, 33885, -824, 'Cargo of the Raven Queen', 84.6,44.8},
{false, 6719, 42, 33569, 113545, 'Carved Dinking Horn', 33.5,39.6},
{false, 6719, 42, 33575, 108904, 'Demonic Cache', 20.4,30.6},
{false, 6719, 42, 34174, -824, 'Fantastic Fish', 26.5,5.7},
{false, 6719, 42, 33891, 108901, 'Giant Moonwillow Cone', 34.5,46.2},
{false, 6719, 42, 35798, 109130, 'Glowing Cave Blossom', 48.7,47.5},
{false, 6719, 42, 33614, 113408, 'Greka\'s Urn', 38.5,43.0},
{false, 6719, 42, 33564, 108900, 'Hanging Satchel', 47.1,46.0},
{false, 6719, 42, 33041, -824, 'Iron Horde Cargo Shipment', 42.1,61.2},
{false, 6719, 42, 33567, 108903, 'Iron Horde Tribute', 37.5,59.2},
{false, 6719, 42, 33568, 113571, 'Kaliri Egg', 57.9,45.3},
{false, 6719, 42, 35530, -824, 'Lunarfall Egg', 30.2,19.9},
{false, 6719, 42, 35603, 113215, 'Mikkal\'s Chest', 58.9,21.9},
{false, 6719, 42, 37254, 107457, 'Mushroom Covered Chest',52.9,24.9}, --Treasure Placeholder
{false, 6719, 42, 33962, 0, 'Mysterious Flower, Shadowmoon Valley', },
{false, 6719, 42, 36507, 116875, 'Orc Skeleton', 67.0,33.5},
{false, 6719, 42, 33384, 107650, 'Peaceful Offering South', 44.5,63.6},
{false, 6719, 42, 33610, 107650, 'Peaceful Offering East', 45.2,60.5},
{false, 6719, 42, 33611, 107650, 'Peaceful Offering West', 43.8,60.6},
{false, 6719, 42, 33612, 107650, 'Peaceful Offering North', 44.5,59.1},
{false, 6719, 42, 35381, -824, 'Pippers\' Buried Supplies 1', 30.0,18.3},
{false, 6719, 42, 35382, -824, 'Pippers\' Buried Supplies 2', 30.9,17.7},
{false, 6719, 42, 35383, -824, 'Pippers\' Buried Supplies 3', 28.9,15.6},
{false, 6719, 42, 35384, -824, 'Pippers\' Buried Supplies 4', 30.7,20.6},
{false, 6719, 42, 33886, 109081, 'Ronokk\'s Belongings', 31.3,39.1},
{false, 6719, 42, 33572, 113373, 'Rotting Basket', 22.9,33.8},
{false, 6719, 42, 33573, 113378, 'Rovo\'s Dagger', 36.7,44.5},
{false, 6719, 42, 33565, 44722, 'Scaly Rylak Egg', 67.0,84.2},
{false, 6719, 42, 33570, 113388, 'Shadowmoon Exile Treasure', 45.8,24.6},
{false, 6719, 42, 33571, 113563, 'Shadowmoon Sacrifical Dagger', 30.0,45.4},
{false, 6719, 42, 33571, -824, 'Shadowmoon Treasure', 28.2,39.3},
{false, 6719, 42, 35289, -824, 'Spark\'s Stolen Supplies', 30.9,12.8},
{false, 6719, 42, 35280, -824, 'Stolen Treasure', 27.1,2.5},
{false, 6719, 42, 35600, 118104, 'Strange Spore', 55.8,20.0},
{false, 6719, 42, 35677, 110506, 'Sunken Fishing Boat', 37.2,26.0},
{false, 6719, 42, 35279, -824, 'Sunken Treasure', 28.8,7.2},
{false, 6719, 42, 35580, 117550, 'Swamplighter Hive', 55.3,74.9},
{false, 6719, 42, 33540, 113546, 'Uzko\'s Knickknacks', 35.9,40.9},
{false, 6719, 42, 33866, 109124, 'Veema\'s Herb Bag', 34.2,43.5},
{false, 6719, 42, 33574, 113375, 'Vindicator\'s Cache', 51.1,79.1},
{false, 6719, 42, 33566, 113372, 'Waterlogged Chest', 39.2,83.9},

--Shadowmoon Valley NPCs
{false, 6719, 43, 33061, 109060, 'Amaukwa', 37,35},
{false, 6719, 43, 35731, 113540, 'Ba\'ruun', 52.8,16.5},
{false, 6719, 43, 35281, 111666, 'Bahameye', 29,5},
{false, 6719, 43, 33064, 109075, 'Dark Emanation', 48.5,43.3},
{false, 6719, 43, 35555, 113541, 'Darktalon', 49.6,41.8},
{false, 6719, 43, 35725, 113557, 'Faebright', 61.7,61.6},
{false, 6719, 43, 33664, 113082, 'Gorum', 21.6,33.1},
{false, 6719, 43, 35448, 113548, 'Darkmaster Go\'vid', 40,80},
{false, 6719, 43, 35558, 113631, 'Hypnocroak', 37.4,49.0},
{false, 6719, 43, 35909, 113571, 'Insha\'tar', 57.4,48.6},
{false, 6719, 43, 35847, 0, 'Voidseer Kalurg', 32.7,41.4},
{false, 6719, 43, 33043, 109078, 'Killmaw', 40.8,44.6},
{false, 6719, 43, 33055, 108907, 'Leaf-Reader Kurri', 37.7,14.3},
{false, 6719, 43, 33039, 109061, 'Ku\'targ the Voidseer', 32.5,35.1},
{false, 6719, 43, 33642, 113527, 'Mother Om\'ra', 44.0,57.7},
{false, 6719, 43, 35553, 113542, 'Rai\'vosh ',48.8,22.7},
{false, 6719, 43, 34068, 109077, 'Rockhoof', 52.7,50.8},
{false, 6719, 43, 35732, 113543, 'Shinri', 61.2,49.4},
{false, 6719, 43, 36880, 118734, 'Sneevel', 27.6,43.5},
{false, 6719, 43, 35523, 113559, 'Morva Soultwister', 38.6,70.4},
{false, 6719, 43, 35906, 113561, 'Mad "King" Sporeon', 45.0,20.8},
{false, 6719, 43, 35688, 113556, 'Enavra Varandi', 67.9,63.9},
{false, 6719, 43, 33640, 108906, 'Veloss', 21.7,20.8},
{false, 6719, 43, 33643, 108957, 'Venomshade', 54.8,70.2},
{false, 6719, 43, 33389, 113570, 'Yggdrel', 48.1,65.6},
{false, 6719, 43, 37355, -823, 'Lady Temptessa', 48.1,77.6},
{false, 6719, 43, 36568, -823, 'Malgosh Shadowkeeper', 29.6,51.0},
{false, 6719, 43, 36431, -823, 'Soul-Twister Torek', 29.4,46.3},

-- Shadowmoon Valley events
{false, 6719, 44, 33038, 113553, 'Embaari Defense Crystal', 42.9,40.3},
{false, 6719, 44, 34743, 111636, 'The Crystal Blade of Torvath', 61.7,67.9},

-- Gorgrond Arena-only treasures
{false, 6721, 42, 36730, -824, 'Arena: Aged Stone Container, Crushfang\'s End', 48.1,55.2},
{false, 6721, 42, 36784, -824, 'Arena: Aged Stone Container, Deeproot', 45.7,88.2},
{false, 6721, 42, 36723, -824, 'Arena: Aged Stone Container, Fissure of Fury', 43.2,45.7},
{false, 6721, 42, 36726, -824, 'Arena: Aged Stone Container, Gorgorek\'s Fall', 41.8,45.3},
{false, 6721, 42, 36734, -824, 'Arena: Aged Stone Container, Steamburst Cauldron', 51.3,40.6},
{false, 6721, 42, 36722, -824, 'Arena: Aged Stone Container, Valley of Destruction', 45.6,49.3},
{false, 6721, 42, 36736, -824, 'Arena: Aged Stone Container', 46.1,63.0},
{false, 6721, 42, 36739, -824, 'arena: Aged Stone Container', 58.1,51.5},
{false, 6721, 42, 36781, -824, 'arena: Aged Stone Container', 59.6,72.7},
{false, 6721, 42, 36787, -824, 'Arena: Ancient Ogre Cache, Blook\'s Overlook', 42.2,93.1},
{false, 6721, 42, 36733, -824, 'Arena: Ancient Ogre Cache, Gronn Canyon', 45.5,43.0},
{false, 6721, 42, 36740, -824, 'Arena: Ancient Ogre Cache, Iyun Weald', 61.5,58.5},
{false, 6721, 42, 36737, -824, 'arena: Ancient Ogre Cache', 45.1,69.9},
{false, 6721, 42, 36782, -824, 'arena: Ancient Ogre Cache', 54.3,73.1},
{false, 6721, 42, 36789, -824, 'arena: Ancient Ogre Cache', 41.5,86.5},
{false, 6721, 42, 36727, -824, 'Arena: Ancient Titan Chest, Brimstone Springs', 42.2,52.0},
{false, 6721, 42, 36731, -824, 'Arena: Ancient Titan Chest, Drywind Gorge', 43.3,51.7},
{false, 6721, 42, 36735, -824, 'Arena: Ancient Titan Chest, Gronn Canyon', 48.0,40.0},
{false, 6721, 42, 36738, -824, 'Arena: Ancient Titan Chest, Mistcreep Mire', 50.3,66.6},
{false, 6721, 42, 36710, -824, 'Arena: Ancient Titan Chest, Steamscar Rise', 49.4,50.9},
{false, 6721, 42, 36783, -824, 'arena: Ancient Titan Chest', 49.1,82.5},
{false, 6721, 42, 36728, -824, 'Arena: Obsidian Crystal Formation, Brimstone Springs', 41.8,58.9},
{false, 6721, 42, 36729, -824, 'Arena: Obsidian Crystal Formation, Stonemaul Arena', 42.1,64.3},
{false, 6721, 42, 36732, -824, 'Arena: Obsidian Crystal Formation, Valley of Destruction', 44.2,46.6},
{false, 6721, 42, 36721, -824, 'arena: Obsidian Crystal Formation', 48.1,46.4},

-- Gorgrond Mill-only treasures
{false, 6721, 42, 36003, -824, 'mill: Aged Stone Container, Brimstone Springs', 42.3,54.8},
{false, 6721, 42, 35952, -824, 'Mill: Aged Stone Container, Dionor\'s Demise', 49.1,48.5},
{false, 6721, 42, 36717, -824, 'Mill: Aged Stone Container, Valley of Destruction', 47.5,43.6},
{false, 6721, 42, 36720, -824, 'mill: Ancient Titan Chest, Fissure of Fury', 42.1,46.1},
{false, 6721, 42, 35701, -824, 'Mill: Ancient Titan Chest, Steamscar Rise', 53.3,46.8},
{false, 6721, 42, 35984, -824, 'mill: Ancient Titan Chest, Steamscar Rise', 50.2,53.8},
{false, 6721, 42, 35982, -824, 'Mill: Botani Essence Seed', 42.0,81.6},
{false, 6721, 42, 35968, -824, 'mill: Forgotten Ogre Cache', 49.7,78.8},
{false, 6721, 42, 36716, -824, 'mill: Forgotten Skull Cache, Brimstone Springs', 39.3,56.3},
{false, 6721, 42, 35971, -824, 'mill: Forgotten Skull Cache', 47.0,69.0},
{false, 6721, 42, 36019, -824, 'mill: Forgotten Skull Cache', 45.8,89.3},
{false, 6721, 42, 35980, -824, 'mill: Mysterious Petrified Pod, Fertile Ground', 41.1,77.3},
{false, 6721, 42, 36430, -824, 'Mill: Mysterious Petrified Pod, Iyun Weald', 63.3,57.2},
{false, 6721, 42, 36715, -824, 'Mill: Mysterious Petrified Pod, Overlook Ruins', 51.7,69.1},
{false, 6721, 42, 36015, -824, 'Mill: Mysterious Petrified Pod, Tangleheart', 60.5,72.8},
{false, 6721, 42, 35965, -824, 'mill: Mysterious Petrified Pod', 56.7,57.3},
{false, 6721, 42, 36714, -824, 'mill: Mysterious Petrified Pod', 47.6,76.8},
{false, 6721, 42, 35979, -824, 'mill: Obsidian Crystal Formation', 40.9,67.3},
{false, 6721, 42, 35975, -824, 'Mill: Remains of Explorer Engieer Toldirk Ashlamp', 46.0,93.6},
{false, 6721, 42, 35966, -824, 'mill: Remains of Grimnir Ashpick', 51.8,61.5},
{false, 6721, 42, 36718, -824, 'mill: Unknown Petrified Egg, Crushfang\'s End', 47.2,51.8},
{false, 6721, 42, 36713, -824, 'Mill: Unknown Petrified Egg, Forgotten Caves', 53.0,79.1},
{false, 6721, 42, 35967, -824, 'mill: Unknown Petrified Egg', 51.6,72.3},
{false, 6721, 42, 35981, -824, 'mill: Unknown Petrified Egg', 45.3,82.0},
{false, 6721, 42, 36001, -824, 'mill: Unknown Petrified Egg', 42.9,43.5},

-- Gorgrond open treasures
{false, 6721, 42, 36506, 0, 'Brokor\'s Sack', 41.7,53.0},
{false, 6721, 42, 36625, 0, 'Discarded Pack', 42.4,83.4},
{false, 6721, 42, 36658, 0, 'Evermorn Supply Cache', 41.8,78.0},
{false, 6721, 42, 36621, 0, 'Explorer Canister', 40.4,76.6},
{false, 6721, 42, 36170, 0, 'Femur of Improbability', 40.0,72.2},
{false, 6721, 42, 36651, 0, 'Harvestestable Precious Crystal', 46.1,50.0},
{false, 6721, 42, 35056, 107457, 'Horned Skull', 42.6,46.8 },
{false, 6721, 42, 36618, 107457, 'Iron Supply Chest', 43.7,42.5},
{false, 6721, 42, 33966, 0, 'Mysterious Flower, Gorgrond', 54.3,68.2},
{false, 6721, 42, 35709, 0, 'Laughing Skull Cache', 44.2,74.3},
{false, 6721, 42, 34241, 118227, 'Ockbar\'s Pack', 43.0,93.0},
{false, 6721, 42, 36509, 0, 'Odd Skull', 52.5,67.0},
{false, 6721, 42, 36521, 0, 'Petrified Rylak Egg', 46.2,43.0},
{false, 6721, 42, 36118, 0, 'Pile of Rubble', 43.5,69.7},
{false, 6721, 42, 36654, 107457, 'Remains of Balik Orecrusher', 53.1,74.5},
{false, 6721, 42, 36605, 107457, 'Remains of Balldir Deeprock', 57.8,56.0},
{false, 6721, 42, 36631, 0, 'Sasha\'s Secret Stash', 39.0,68.0},
{false, 6721, 42, 36634, 0, 'Sniper\'s Crossbow', 45.0,42.6},
{false, 6721, 42, 36604, 0, 'Stashed Emergency Rucksack', 48.1,93.4},
{false, 6721, 42, 34940, 107457, 'Strange Looking Dagger', 53.0,80.0},
{false, 6721, 42, 36610, 107457, 'Suntouched Spear', 45.7,49.7},
{false, 6721, 42, 36628, 0, 'Vindicator\'s Hammer', 59.3,63.8},
{false, 6721, 42, 36203, 107457, 'Warm Goren Egg', 48.9,47.3},
{false, 6721, 42, 36596, 0, 'Weapons Cache', 49.3,43.6},

-- Gorgrond NPCs
{false, 6721, 43, 34726, 118208, 'Mother Araneae', 53.5,78.3},
{false, 6721, 43, 35335, 118222, 'Bashiok', 40.2,79.0},
{false, 6721, 43, 36597, 118232, 'Berthora', 39.4,74.6},
{false, 6721, 43, 35503, 118212, 'Char the Burning', 53.5,44.7},
{false, 6721, 43, 35153, {113543, 113454}, 'Fungal Praetorian', 58.4,63.0},
{false, 6721, 43, 0, 118230, 'Gelgor of the Blue Flame', 41.9,45.4},
{false, 6721, 43, 36204, 118229, 'Gorger', 46.2,50.9},
{false, 6721, 43, 36186, 118210, 'Greldrok the Cunning', 46.8,43.1},
{false, 6721, 43, 34143, 0, 'Kal\'rak the Drunk', },
{false, 6721, 43, 35910, 118224, 'Stomper Kreego', 38.2,66.3},
{false, 6721, 43, 36178, 0, 'Mandrakor', 50.8,53.2},
{false, 6721, 43, 36600, 118231, 'Riptar', 37.6,81.5},
{false, 6721, 43, 36393, 118211, 'Rolkor', 47.7,41.2},
{false, 6721, 43, 0, 118209, 'Hive Queen Skrikka', 52.4,70.1},
{false, 6721, 43, 36837, 0, 'Stompalupagus', 54.8,71.1},
{false, 6721, 43, 36394, 114227, 'Sulfurious', 40.2,60.6},
{false, 6721, 43, 36656, 118223, 'Sunclaw', 44.8,92.1},
{false, 6721, 43, 36794, 118213, 'Sylldross', 62.9,61.4},

--Talador objects
{false, 6662, 42, 34236, 116131, 'Amethyl Crystal', 62.1,32.4},
{false, 6662, 42, 34260, 109118, 'Aruuna Mining Cart', 81.8,34.9},
{false, 6662, 42, 34252, -824, 'Barrel of Fish', 62.4,48.0},
{false, 6662, 42, 34259, 107457, 'Bonechewer Remnants', 33.3,76.8},
{false, 6662, 42, 34471, 116127, 'Bright Coin', 73.5,51.4},
{false, 6662, 42, 34248, 116116, 'Charred Sword', 77.0,49.9}, 
{false, 6662, 42, 34239, 117569, 'Curious Deathweb Egg', 66.5,86.9},
{false, 6662, 42, 33931, 108743, 'Deceptia getting blown up', 58.8,12.1},
{false, 6662, 42, 33933, 108743, 'Deceptia\'s Smoldering Boots', 58.1,12.1},
{false, 6662, 42, 34253, 116118, 'Draenei Weapons', 55.3,66.7},
{false, 6662, 42, 34249, -824, 'Farmer\'s Bounty', 35.4,96.6},
{false, 6662, 42, 34238, 116120, 'Foreman\'s Lunchbox', 57.4,28.7},
{false, 6662, 42, 36829, 107457, 'Gift of the Ancients', 28.4,74.2},
{false, 6662, 42, 34251, 117571, 'Iron Box', 64.6,79.2},
{false, 6662, 42, 33649, -824, 'Iron Scout', 75.1,36.1},
{false, 6662, 42, 34233, 117568, 'Jug of Aged Ironwine', 65.5,11.4},
{false, 6662, 42, 34261, -824, 'Keluu\'s Belongings', 75.7,41.4},
{false, 6662, 42, 34290, 116402, 'Ketya\'s Stash', 54.0,27.7},
{false, 6662, 42, 35964, 109192, 'Lightbearer (Aruumel\'s Mace)', 68.8,56.2},
{false, 6662, 42, 34101, 109192, 'Lightbearer (Aruumel\'s Worn Mace)', 68.8,56.2},
{false, 6662, 42, 34258, 107457, 'Light of the Sea', 38.2,12.4},
{false, 6662, 42, 34235, 116132, 'Luminous Shell', 52.6,29.5},
{false, 6662, 42, 33960, 0, 'Mysterious Flower, Talador', 50.7,30.0},
{false, 6662, 42, 34263, 117572, 'Pure Crystal Dust', 78.2,14.7},
{false, 6662, 42, 34250, 116128, 'Relic of Aruuna', 75.8,44.7},
{false, 6662, 42, 34256, 116128, 'Relic of Telmor', 47.0,91.7},
{false, 6662, 42, 34232, 116117, 'Rook\'s Tacklebox', 64.9,13.3},
{false, 6662, 42, 34276, -824, 'Rusted Lockbox', 66.0,85.1},
{false, 6662, 42, 34254, 117570, 'Soulbinder\'s Reliquary', 39.5,55.1},
{false, 6662, 42, 35162, 112699, 'Teroclaw Nest', },
{false, 6662, 42, 34257, 116119, 'Treasure of Ango\'rosh', 38.3,84.5},
{false, 6662, 42, 34255, 116129, 'Webbed Sac', 65.4,88.6}, 
{false, 6662, 42, 34140, 107457, 'Yuuri\'s Gift', }, --next to road west of telmor after taking yuuri's quest in tomb of lights

--Talador NPCs
{false, 6662, 43, 34668, 116122, 'Burning Front rare demon', 56.7,62.5},
{false, 6662, 43, 34220, 107457, 'Echo of Murmur A', },
{false, 6662, 43, 34221, 107457, 'Echo of Murmur B', },
{false, 6662, 43, 35018, 112373, 'Felbark', 50.4,83.5},
{false, 6662, 43, 34165, 116123, 'Cro Fleshrender', 37.4,70.4},
{false, 6662, 43, 34145, {113287, 113288}, 'Frenzied Golem', 46.4,54.8}, 
{false, 6662, 43, 34929, 116075, 'Gennadian', 67.5,80.8},
{false, 6662, 43, 34189, 116113, 'Glimmerwing', 32.7,63.2},
{false, 6662, 43, 34142, 112499, 'Dr. Gloom', 68.4,15.7},
{false, 6662, 42, 36919, 107457, 'A Restless Crate and Grrbrrgle', 22.2,74.2},
{false, 6662, 43, 34185, 116124, 'Hammertooth', 62.6,45.4},
{false, 6662, 43, 34167, 112369, 'Hen-Mother Hami', 76.3,52.2},
{false, 6662, 43, 34208, 116070, 'Lo\'marg Jawcrusher', 49.2,92.3},
{false, 6662, 43, 34498, 116125, 'Klikixx', 66.8,85.3},
{false, 6662, 43, 34859, 116077, 'No\'losh', 86.4,30.9},
{false, 6662, 43, 34196, 116112, 'Ra\'kahn', 59.5,60.0, },
{false, 6662, 43, 34671, 112370, 'Shirzir', 43.0,54.1},
{false, 6662, 43, 36858, 117562, 'Steeltusk', 67.7,35.8},
{false, 6662, 43, 34171, 116126, 'Taladorantula', 59.0,87.6}, --kill children to get her to spawn
{false, 6662, 43, 34945, 112475, 'Underseer Bloodmane', 63.8,20.7},
{false, 6662, 43, 35491, 112475, 'Underseer Bloodmane', 63.8,20.7},
{false, 6662, 43, 34148, 112371, 'Viperlash', 37.6,74.9},
{false, 6662, 43, 34204, 112261, 'Wandering Vindicator - kill', 69.4,33.2},
{false, 6662, 43, 34205, 112261, 'Wandering Vindicator - loot', 69.4,33.2},
{false, 6662, 43, 34135, 112263, 'Yazheera the Incinerator', 53.8,25.6},

{false, 6662, 43, 37338, -823, 'Avatar of Sothrecar', 45,36},
{false, 6662, 43, 37346, -823, 'Lady Demlash', 33.8,37.5},
{false, 6662, 43, 37348, -823, 'Kurlosh Doomfang', 37.5,37.5},
{false, 6662, 43, 37431, -823, 'Felfire Consort', 47.6,32.2},
{false, 6662, 43, 37339, -823, 'Bombardier Gu\'gok', 44.2,39.9},
{false, 6662, 44, 37342, -823, 'Legion Vanguard', 38.0,20.8},
{false, 6662, 43, 37349, -823, 'Matron of Sin', 38.8,49.8},
{false, 6662, 43, 37350, -823, 'Vigilant Paarthos', 37.3,42.4},
{false, 6662, 43, 0, -823, 'Sargerei War Council', 43.7,27.4},
{false, 6662, 43, 37347, -823, 'Shadowflame Terrorwalker', 41.0,42.1},
{false, 6662, 43, 37343, -823, 'Xothear, the Destroyer', 37.6,14.7},

--Talador events
{false, 6662, 44, 34184, 117567, 'Aarko - Killed Surok Darkstorm', 36.5,96.1},
{false, 6662, 44, 34182, 117567, 'Aarko - Looted Treasure', 36.5,96.1},
{false, 6662, 44, 34128, 0, 'Four Friends complete A', },
{false, 6662, 44, 34134, 0, 'Four Friends complete H', },
{false, 6662, 44, 34114, 0, 'Four Friends found A', },
{false, 6662, 44, 34115, 0, 'Four Friends found Horde', },
{false, 6662, 44, 34110, 0, 'Girl 1 found A', },
{false, 6662, 44, 34116, 0, 'Norana Quelldawn', },
{false, 6662, 44, 34111, 0, 'Girl 2 found A', },
{false, 6662, 44, 34117, 0, 'Riasa Songbrook', },
{false, 6662, 44, 34112, 0, 'Guy 1 found A', },
{false, 6662, 44, 34118, 0, 'Baran Silverblade', },
{false, 6662, 44, 34113, 0, 'Guy 2 found A', },
{false, 6662, 44, 34119, 0, 'Orian Sylvanleaf', },
{false, 6662, 44, 34199, 'Saving Anchorite\'s Sojourn', 77.6,57.1},

-- Spires of Arak objects
{false, 6722, 42, 36458, 116913, 'Abandoned Mining Pick', 40.6,55.0},
{false, 6722, 42, 36462, 107457, 'Admiral Taylor\'s Coffer', 36.2,54.5},
{false, 6722, 42, 36445, 107457, 'Assassin\'s Spear', 49.2,37.2},
{false, 6722, 42, 35627, 107457, 'Basket of Arakkoa Goods', 40.2,60.3},
{false, 6722, 42, 36367, 0, 'Campaign Contributions', 55.5,90.9},
{false, 6722, 42, 36453, 115463, 'Coinbender\'s Payment', 68.4,89.0},
{false, 6722, 42, 36459, 0, 'Dislodged Saw Blade', 43.8,61.6},
{false, 6722, 42, 36454, 107457, 'Drypeak Mushrooms', 63.6,67.4},
{false, 6722, 42, 36395, 115463, 'Elixir of Shadow Sight, Skettis', 43.9,15.0},
{false, 6722, 42, 36397, 115463, 'Elixir of Shadow Sight, Veil Akraz', 43.8,24.6},
{false, 6722, 42, 36398, 115463, 'Elixir of Shadow Sight, Sethekk Hollow', 69.2,43.3},
{false, 6722, 42, 36399, 115463, 'Elixir of Shadow Sight, Bloodmane Valley', 49.1,62.6},
{false, 6722, 42, 36400, 115463, 'Elixir of Shadow Sight, Shadow\'s Vigil', 55.6,22.1},
{false, 6722, 42, 36401, 115463, 'Elixir of Shadow Sight, Bloodmane Pridelands', 53.1,84.5},
{false, 6722, 42, 36418, 116914, 'Ephial\'s Dark Grimoire', 36.6,57.9},
{false, 6722, 42, 35481, 107457, 'Escape Pod and Nizzix\'s Chest', 60.9,88.0},
{false, 6722, 42, 36246, 116919, 'Fractured Sunstone', 50.5,22.1},
{false, 6722, 42, 36420, -824, 'Garrison Resources', 37.2,47.5},
{false, 6722, 42, 36451, 116918, 'Garrison Workman\'s Hammer', 41.9,50.5},
{false, 6722, 42, 36381, 118240, 'Gift of Anzu, Sword Str/Agi', 61.1,55.4},
{false, 6722, 42, 36386, 118237, 'Gift of Anzu, Crossbow', 48.6,44.5},
{false, 6722, 42, 36388, 118242, 'Gift of Anzu, Wand', 42.4,26.7},
{false, 6722, 42, 36389, 118238, 'Gift of Anzu, Polearm', 46.9,40.5},
{false, 6722, 42, 36390, 118241, 'Gift of Anzu, Sword Int', 57.0,78.9},
{false, 6722, 42, 36392, 118239, 'Gift of Anzu, Staff', 52.0,19.6},
{false, 6722, 42, 36247, 109124, 'Lost Herb Satchel', 50.8,28.7},
{false, 6722, 42, 36411, 116911, 'Lost Ring', 47.8,36.1},
{false, 6722, 42, 36416, 107457, 'Misplaced Scroll', 52.5,42.8},
{false, 6722, 42, 36244, -829, 'Misplaced Scrolls', 42.7,18.3},
{false, 6722, 42, 33964, 0, 'Mysterious Flower, Spires of Arak', 57.8,44.8},
{false, 6722, 42, 36403, 118267, 'Offering to the Raven Mother, Behind Swarmleaf', 53.3,55.5},
{false, 6722, 42, 36405, 118267, 'Offering to the Raven Mother 02', 48.4,52.6},
{false, 6722, 42, 36406, 118267, 'Offering to the Raven Mother, Bloodmane Valley North', 48.9,54.7},
{false, 6722, 42, 36407, 118267, 'Offering to the Raven Mother, Bloodmane Valley South', 51.9,64.6},
{false, 6722, 42, 36410, 118267, 'Offering to the Raven Mother, Bloodmane Valley East', 61.0,63.8},
{false, 6722, 42, 36340, {116921, 116922}, 'Ogron Plunder', 58.7,60.2},
{false, 6722, 42, 36402, 107457, 'Orcish Signaling Horn', 36.3,39.3},
{false, 6722, 42, 36243, 107457, 'Outcast\'s Belongings, Terokkar Pass', 36.8,17.2},
{false, 6722, 42, 36447, 107457, 'Outcast\'s Belongings, Veil Akraz', 42.2,21.7},
{false, 6722, 42, 36446, 107457, 'Outcast\'s Pouch', 46.9,34.0},
{false, 6722, 42, 36415, 0, 'Reagent Pouch', 37.2,35.3},
{false, 6722, 42, 36245, -829, 'Relics of the Outcasts, Skettis', 43.0,16.4},
{false, 6722, 42, 36354, -829, 'Relics of the Outcasts, Veil Terokk', 46.0,44.2},
{false, 6722, 42, 36355, -829, 'Relics of the Outcasts, Veil Akraz', 43.2,27.3},
{false, 6722, 42, 36356, -829, 'Relics of the Outcasts, Sethekk Hollow', 67.4,39.8},
{false, 6722, 42, 36359, -829, 'Relics of the Outcasts, Veil Zekk', 60.2,53.9},
{false, 6722, 42, 36360, -829, 'Relics of the Outcasts, Nest of the Ravenspeakers', 51.9,48.9},
{false, 6722, 42, 36657, 116887, 'Rooby\'s Roo', 37.4,50.6},
{false, 6722, 42, 36377, 107457, 'Rukhmar\'s Image', 44.3,12.0},
{false, 6722, 42, 36366, 116917, 'Sailor Zazzuk\'s 180-Proof Rum', 59.2,90.6},
{false, 6722, 42, 36450, {117437, 109223}, 'Sethekk Ritual Brew', 71.6,48.6},
{false, 6722, 42, 36362, -824, 'Shattered Hand Cache', 56.3,28.8},
{false, 6722, 42, 36444, 107457, 'Shattered Hand Explosives', 50.3,25.8},
{false, 6722, 42, 36361, 0, 'Shattered Hand Lockbox', 47.9,30.7},
{false, 6722, 42, 36363, 107457, 'Shattered Hand Spoils', 58.3,36.6},
{false, 6722, 42, 36456, -824, 'Shredder Parts', 60.9,84.6},
{false, 6722, 42, 36433, -829, 'Smuggled Apexis Artifacts', 56.3,45.3},
{false, 6722, 42, 36365, 107457, 'Spray-O-Matic 5000 XT', 59.6,81.3},
{false, 6722, 42, 36421, -829, 'Sun-Touched Cache, mid level', 34.1,27.5},
{false, 6722, 42, 36422, -829, 'Sun-Touched Cache, upper level', 33.3,27.3},
{false, 6722, 42, 36364, 107457, 'Toxicfang Venom', 54.4,32.5},
{false, 6722, 42, 36455, 0, 'Waterlogged Satchel', 66.5,56.6},

-- Spires of Arak NPCs
{false, 6722, 43, 35599, 116839, 'Blade-Dancer Aeryx', 46.8,23.3},
{false, 6722, 43, 36283, 118205, 'Blightglow', 65.2,67.8},
{false, 6722, 43, 36291, 116907, 'Betsi Boombasket', 58.3,84.5},
{false, 6722, 43, 36279, 118199, 'Poisonmaster Bortusk', 59.5,37.5},
{false, 6722, 43, 36129, 116837, 'Nas Dunberlin', 36.3,52.6},
{false, 6722, 43, 36303, 107457, 'Eyeless', 49.9,29.8},
{false, 6722, 43, 36297, 118200, 'Festerbloom', 54.8,39.7},
{false, 6722, 43, 36943, 118696, 'Gaze', 24.9,25.6},
{false, 6722, 43, 36305, 116836, 'Gobblefin', 33.5,58.9},
{false, 6722, 43, 36304, 107457, 'Gochar', 53.5,49.1},
{false, 6722, 43, 36306, 118202, 'Jiasska the Sporegorger', 56.4,94.8},
{false, 6722, 43, 36268, 107457, 'Kalos the Bloodbathed', 62.8,37.3},
{false, 6722, 43, 36396, 118206, 'Mutafen', 53.0,89.3},
{false, 6722, 43, 36479, 107457, 'Nightmaw', 49.3,37.5},
{false, 6722, 43, 36288, 118204, 'Oskiira the Vengeful', 64.9,54.4},
{false, 6722, 43, 36887, 118279, 'Hermit Palefur', 59.3,14.8},
{false, 6722, 43, 36470, 118107, 'Rotcap', 38.4,27.8},
{false, 6722, 43, 36478, 118201, 'Shadowbark', 51.9,35.5},
{false, 6722, 43, 36267, 118198, 'Durkath Steelmaw', 46.4,28.5},
{false, 6722, 43, 36265, 116858, 'Stonespite', 33.6,21.9},
{false, 6722, 43, 36472, 116857, 'Swarmleaf', 52.9,55.0},
{false, 6722, 43, 36278, 116838, 'Talonbreaker', 54.6,63.2},
{false, 6722, 43, 36254, 116852, 'Tesska the Broken', 57.3,74.1},

-- Spires of Arak events
{false, 6722, 44, 36276, 118203, 'Spawn of Sethe and Sangrikass', 68.8,48.9},
{false, 6722, 44, 36298, 116855, 'Stingtail Nest and Sunderthorn', 59.0,45.1},
{false, 6722, 44, 35334, 118207, 'The Egg of Varasha', 29.6,41.6},

--Nagrand objects
{false, 6755, 42, 35759, 107457, 'Abandoned Cargo', 67.7,59.7},
{false, 6755, 42, 35836, 116836, 'Abandoned Fishing Rod', 75.3,10.9}, -- Spawns "Fangler" fish 82975
{false, 6755, 42, 36072, 114243, 'Abu\'Gar\'s Favorite Lure', 38.3,49.4}, -- Quest item
{false, 6755, 42, 36089, 114245, 'Abu\'Gar\'s Finest Reel', 85.4,38.7}, -- Quest item
{false, 6755, 42, 35711, 114242, 'Abu\'gar\'s Vitality', 65.8,61.1}, -- Quest item
{false, 6755, 42, 36077, 116635, 'Adventurer\'s Mace', 75.8,62.0},
{false, 6755, 42, 35597, 0, 'Adventurer\'s Pack A', 70.0,52.4}, --4279
{false, 6755, 42, 35969, 0, 'Adventurer\'s Pack B', 82.3,56.6}, --4303
{false, 6755, 42, 35765, 0, 'Adventurer\'s Pack C', 45.6,52.0}, --4308
{false, 6755, 42, 36050, 0, 'Adventurer\'s Pouch A', 56.6,72.9}, --4323
{false, 6755, 42, 36088, 0, 'Adventurer\'s Pouch B', 53.4,64.3}, --4331
{false, 6755, 42, 35955, 116723, 'Adventurer\'s Sack', 73.9,14.0},
{false, 6755, 42, 35923, 0, 'Adventurer\'s Staff', 81.5,13.1}, --4305
{false, 6755, 42, 35951, -824, 'A Pile of Dirt', 73.1,10.8},
{false, 6755, 42, 35673, 0, 'Appropriated Warsong Supplies', 73.1,75.5},
{false, 6755, 42, 36116, 0, 'Bag of Herbs', 62.5,67.1},
{false, 6755, 42, 35986, 116760, 'Bone-Carved Dagger', 77.3,28.1},
{false, 6755, 42, 36174, 0, 'Bounty of the Elements', 77.1,16.6},
{false, 6755, 42, 35661, 118262, 'Brilliant Dreampetal', 81.1,37.3}, --dreamflower
{false, 6755, 42, 35696, 0, 'Burning Blade Cache', 85.4,53.5}, -- Can't be looted?
{false, 6755, 42, 35954, 0, 'Elemental Offering', 67.0,19.5},
{false, 6755, 42, 36036, 0, 'Elemental Shackles', 78.9,15.6},
{false, 6755, 42, 36020, 117981, 'Fragment of Oshu\'gun', 45.9,66.3},
{false, 6755, 42, 35692, 0, 'Freshwater Clam', 73.0,21.5},
{false, 6755, 42, 35660, 0, 'Fungus-Covered Chest', 88.9,18.2},
{false, 6755, 42, 36074, 118236, 'Gambler\'s Purse', 75.3,47.1},
{false, 6755, 42, 35987, 0, 'Genedar Debris A', 43.2,57.5}, --4311
{false, 6755, 42, 35999, 0, 'Genedar Debris B', 48.1,60.1}, --4312
{false, 6755, 42, 36002, 0, 'Genedar Debris C', 44.7,67.6}, --4313
{false, 6755, 42, 36008, 0, 'Genedar Debris D', 48.6,72.8}, --4314
{false, 6755, 42, 36011, 0, 'Genedar Debris E', 55.4,68.2}, --4315
{false, 6755, 42, 35576, 0, 'Goblin Pack A', 47.2,74.2}, --4280
{false, 6755, 42, 35590, 0, 'Goblin Pack B', 73.0,62.1}, --4284
{false, 6755, 42, 35694, 118266, 'Golden Kaliri Egg', 58.3,52.5},
{false, 6755, 42, 36109, 0, 'Goldtoe\'s Plunder', 38.3,58.7},
{false, 6755, 42, 36051, 0, 'Grizzlemaw\'s Favorite Bone', 87.1,72.9},
{false, 6755, 42, 35622, 0, 'Hidden Stash', 87.6,45.0},
{false, 6755, 42, 36039, 0, 'Highmaul Sledge', 67.4,49.1}, --ogre hammer
{false, 6755, 42, 36099, 0, 'Important Exploration Supplies', 75.2,65.6}, --4332
{false, 6755, 42, 36082, 116687, 'Lost Pendant', 61.8,57.5},
{false, 6755, 42, 36052, 0, '"Misplaced" Artifacts', 66.7,47.8}, -- Can't be looted?
{false, 6755, 42, 35643, 0, 'Mountain Climber\'s Pack', 70.5,13.9},
{false, 6755, 42, 34581, 0, 'Mysterious Flower, Nagrand', },
{false, 6755, 42, 36049, 0, 'Ogre Beads', 81.0,79.8},
{false, 6755, 42, 36115, 118278, 'Pale Elixir', 57.8,62.0},
{false, 6755, 42, 36021, 116688, 'Pokkar\'s Thirteenth Axe', 58.3,59.3},
{false, 6755, 42, 36035, 118254, 'Polished Sabron Skull', 72.7,60.9},
{false, 6755, 42, 36102, 106733, 'Saberon Stash', 75.2,64.9},
{false, 6755, 42, 36857, 0, 'Smuggler\'s Cache', 89.1,33.1},
{false, 6755, 42, 37435, 0, 'Spirit Coffer', 40.4,68.5},
{false, 6755, 42, 36846, 0, 'Spirit\'s Gift', 35.5,57.2},
{false, 6755, 42, 35577, 0, 'Steamwheedle Supplies A', 50.1,82.3},
{false, 6755, 42, 35583, 0, 'Steamwheedle Supplies B', 52.7,80.1},
{false, 6755, 42, 35591, 0, 'Steamwheedle Supplies C', 77.8,51.9},
{false, 6755, 42, 35616, 0, 'Steamwheedle Supplies D', 88.3,42.6},
{false, 6755, 42, 35646, 0, 'Steamwheedle Bupplies E', 70.6,18.6},
{false, 6755, 42, 35648, 0, 'Steamwheedle Supplies F', 64.6,17.6},
{false, 6755, 42, 35662, 0, 'Steamwheedle Supplies G', 87.6,20.3},
{false, 6755, 42, 36046, 118253, 'Telaar Defender Shield', 64.7,65.8},
{false, 6755, 42, 34760, 0, 'Treausre of Kull\'krosh', 37.7,70.7},
{false, 6755, 42, 35579, 118264, 'Void-Infused Crystal', 50.0,66.5},
{false, 6755, 42, 35695, 0, 'Warsong Cache', 51.7,60.3},
{false, 6755, 42, 36073, 118250, 'Warsong Helm', 52.4,44.4},
{false, 6755, 42, 35678, 0, 'Warsong Lockbox', 73.0,70.4},
{false, 6755, 42, 35682, 118678, 'Warsong Spear', 76.1, 69.9},
{false, 6755, 42, 35593, 0, 'Warsong Spoils', 80.6,60.5},
{false, 6755, 42, 35976, 0, 'Warsong Supplies', 89.4,65.9},
{false, 6755, 42, 36071, 118235, 'Watertight Bag', 64.8,35.7},

-- Nagrand NPCs
{false, 6755, 43, 35778, 116832, 'Ancient Blademaster - TSH', 84.7,53.6}, -- Spawned from Blademaster Sword
{false, 6755, 43, 35735, 116823, 'Berserk Shredder', 77.0,64.4}, -- Activate "Goblin Explosive Plunger" to enter the cave
{false, 6755, 43, 35923, 118245, 'Hunter Blacktooth', 80.6,30.4},
{false, 6755, 43, 37399, -823, 'Karosh Blackwind', 45.9, 34.8},
{false, 6755, 43, 34645, 116805, 'Warmaster Blugthol', 82.8,76.0},
{false, 6755, 43, 35943, 116800, 'Outrider Duretha', 61.9,68.7},
{false, 6755, 43, 35893, 116807, 'Flinthide', 69.8,41.9},
{false, 6755, 43, 35715, 118246, 'Gar\'lua the Wolfmother', 52.2,55.8},
{false, 6755, 43, 34725, 116798, 'Gaz\'orda', 43.8,77.7}, -- cave entrance at 42.2,78.6
{false, 6755, 43, 35717, 116824, 'Gnarlhoof the Rabid', 66.7,56.3},
{false, 6755, 43, 36159, 118689, 'Graveltooth', 84.1,36.8},
{false, 6755, 43, 35898, 116916, 'Gorepetal', 94.1,26.5}, -- Spawns from a Pristine Lily in a cave? (i couldn't access the cave, it was blocked)
{false, 6755, 43, 35714, 116795, 'Greatfeather', 66.7,51.3},
{false, 6755, 43, 37400, -823, 'Brutag Grimblade', 43.2, 36.3},
{false, 6755, 43, 35784, 118687, 'Grizzlemaw', 86.2,71.4},
{false, 6755, 43, 34727, {116809, 118244}, 'Captain Ironbeard', 34.4,76.8},
{false, 6755, 43, 35877, 116808, 'Windcaller Korast', 70.6,29.2},
{false, 6755, 43, 35865, 116815, 'Netherspawn', 47.6,70.7},
{false, 6755, 43, 35623, 118679, 'Explorer Nozzand', 89,41},
{false, 6755, 43, 35875, 116765, 'Ophiis', 42.8,49.2},
{false, 6755, 43, 36229, 118690, 'Mr. Pinchy Sr.', 45.7,15.1},
{false, 6755, 43, 35931, 116797, 'Scout Pokhar', 54.8,61.2},
{false, 6755, 43, 35712, 118243, 'Redclaw the Feral', 73.5,58.1},
--{false, 6755, 43, 35623, 107457, 'Explorer Rixak', }, -- this is explorer nozzand
{false, 6755, 43, 35900, 118688, 'Ru\'klaa', 58.0,84.0},
{false, 6755, 43, 36128, {116806, 111557}, 'Soulfang', 75.5,65.4},
{false, 6755, 43, 35932, 116796, 'Malroc Stonesunder', 81.0,59.8},
{false, 6755, 43, 35920, 116814, 'Tur\'aka', 64.8,39.1},
{false, 6755, 43, 35912, 116834, 'Swindler Whitesea', 60.9,47.7}, -- "Sean Whitesea" 83542, spawns from Abandoned Chest with 2 Highwaymen 83556

{false, 6755, 43, 37408, -823, 'Lernaea', 51.0,86.0}, -- Rare World Boss with 43 million health

--Nagrand events
{false, 6755, 44, 34862, 116799, 'Light the Braziers', 86.7,55.5}, -- summons "hyperious" 78161
-- Not real events, but I wanted to mark the gliders on the map, you need them to get to a lot of objects
{false, 6755, 44, 0, 0, 'SW Steamwheedle Exploration Glider', 58.5,76.3}, -- Access from the ground via rocket, path starts from 59.9,67.2
{false, 6755, 44, 0, 0, 'SE1 Steamwheedle Exploration Glider', 76.2,73.0}, -- Accessed from the east
{false, 6755, 44, 0, 0, 'SE2 Steamwheedle Exploration Glider', 75.7,64.7}, -- Accessed from the same area as above Glider
{false, 6755, 44, 0, 0, 'NE1 Steamwheedle Exploration Glider', 87.3,41.0}, -- Glider path starts at 85.4,51.3
{false, 6755, 44, 0, 0, 'NE2 Steamwheedle Exploration Glider',  83.8,33.7},
-- Elemental Plateau accessed frmo the ground via path at 82.1,31.3
{false, 6755, 44, 0, 0, 'NW Steamwheedle Exploration Glider', 72.3,12.9}, -- You have to jump to platforms marked by checkered flags from the elemental plateau waterfall, actual glider at 67.6,14.2

--Unknown location/unused vignettes

{false, 1, 42, 36072, 114243, 'Abu\'Gar\'s Favorite Lure', },
{false, 1, 42, 36089, 114245, 'Abu\'Gar\'s Reel', },
{false, 1, 42, 35711, 114242, 'Abu\'gar\'s Tenacity', },
{false, 1, 42, 32913, 0, 'Arranok\'s Ritual', },
{false, 1, 42, 36262, 0, 'Aruuna Mining Cart B', },
{false, 1, 42, 36937, 0, 'Bladefury Treasure - Burning Blade Cache', },
{false, 1, 42, 33498, 0, 'Bladespire Chef', },
{false, 1, 42, 33447, 0, 'Bladespire Craftsman', },
{false, 1, 42, 33975, 0, 'Blasting Charges - Rubble A', },
{false, 1, 42, 33990, 0, 'Blasting Charges - Rubble B', },
{false, 1, 42, 33995, 0, 'Blasting Charges - Rubble C', },
{false, 1, 42, 33997, 0, 'Blasting Charges - Rubble D', },
{false, 1, 42, 35219, 0, 'Burning Front (unused?)', },
{false, 1, 42, 36849, 0, 'Burning Missive A', },
{false, 1, 42, 36850, 0, 'Burning Missive B', },
{false, 1, 42, 36851, 0, 'Burning Missive C', },
{false, 1, 42, 36852, 0, 'Burning Missive D', },
{false, 1, 42, 36853, 0, 'Burning Missive E', },
{false, 1, 42, 36854, 0, 'Burning Missive F', },
{false, 1, 42, 36855, 0, 'Burning Missive G', },
{false, 1, 42, 36856, 0, 'Burning Missive H', },
--{false, 1, 42, 33565, 0, 'Chimaera Scale', }, --dup
{false, 1, 42, 34580, 0, 'Draenor Flowerpicker', },
{false, 1, 42, 34581, 0, 'Draenor Flowerpicker Note Found', },
{false, 1, 42, 36879, 0, 'Dusty Lockbox', },
{false, 1, 42, 35282, 0, 'Glowing Blue Mushroom', },
{false, 1, 42, 36099, 0, 'Goblin Keg', },
{false, 1, 42, 36834, 0, 'Gorgrond Ogre Gateway', },
{false, 1, 42, 34147, 107457, 'grg1', },
{false, 1, 42, 34149, 107457, 'grg2', },
{false, 1, 42, 34151, 107457, 'grg3', },
{false, 1, 42, 34153, 107457, 'grg4', },
{false, 1, 42, 34146, 107457, 'grg5', },
{false, 1, 42, 34155, 107457, 'grg6', },
{false, 1, 42, 34152, 107457, 'grg7', },
{false, 1, 42, 34172, 107457, 'grg8', },
{false, 1, 42, 34173, 107457, 'grg9', },
{false, 1, 42, 34176, 107457, 'grg11', },
{false, 1, 42, 34201, 107457, 'grg13', },
{false, 1, 42, 34177, 107457, 'grg14', },
{false, 1, 42, 34219, 107457, 'grg15', },
{false, 1, 42, 34195, 107457, 'grg16', },
{false, 1, 42, 34206, 107457, 'grg17', },
{false, 1, 42, 34179, 107457, 'grg18', },
{false, 1, 42, 34210, 107457, 'grg19', },
{false, 1, 42, 34211, 107457, 'grg20', },
{false, 1, 42, 34214, 107457, 'grg21', },
{false, 1, 42, 34215, 107457, 'grg22', },
{false, 1, 42, 34218, 107457, 'grg23', },
--{false, 1, 42, 33885, 0, 'Harbor Treasure', }, --dup
{false, 1, 42, 34222, 0, 'Iron Horde Blacksmith', },
{false, 1, 42, 34225, 0, 'Iron Horde Slacker', },
{false, 1, 42, 34223, 0, 'Iron Horde Stable Master', },
{false, 1, 42, 34907, 0, 'Lagoon Pool/Giant Clam?', },
{false, 1, 42, 33887, 0, 'Mini-War Machine A', },
{false, 1, 42, 33888, 0, 'Mini-War Machine B', },
{false, 1, 42, 33889, 0, 'Mini-War Machine C', },
{false, 1, 42, 33890, 0, 'Mini-War Machine D', },
{false, 1, 42, 33532, 0, 'Ogre Cache', },
{false, 1, 42, 36885, 0, 'Ogre Waygate A', },
{false, 1, 42, 36886, 0, 'Ogre Waygate B', },
{false, 1, 42, 36903, 0, 'Ogre Waygate C', },
{false, 1, 42, 36904, 0, 'Ogre Waygate D', },
{false, 1, 42, 36905, 0, 'Ogre Waygate E', },
{false, 1, 42, 36906, 0, 'Ogre Waygate F', },
{false, 1, 42, 36798, 0, 'Rooby Roo', },
{false, 1, 42, 35919, 0, 'Sacrifice', },
{false, 1, 42, 36375, 0, 'Sethekk Idol', },
{false, 1, 42, 33883, 0, 'Shadowmoon Treasure #2', },
{false, 1, 42, 34207, 0, 'Sparkling Pool', },
{false, 1, 42, 36374, 0, 'Statue of Anzu', },
{false, 1, 42, 37249, 0, 'Strange Spore B', },
{false, 1, 42, 36424, 0, 'Sun-Touched Cache C', },
{false, 1, 42, 33965, 0, 'Tanaan Flowerpicker', },
{false, 1, 42, 36463, 0, 'Taylor\'s Coffer Key (unused?)', },
{false, 1, 42, 36878, 0, 'The Light of Karabor', },
{false, 1, 42, 33499, 0, 'Time-Warped Ogre', },
{false, 1, 42, 34557, 0, 'Treasure Map A', },
{false, 1, 42, 36464, 0, 'Treasure Mab B', },
{false, 1, 42, 36465, 0, 'Treasure Map C', },
{false, 1, 42, 36466, 0, 'Treasure Map D', },
{false, 1, 42, 36467, 0, 'Treasure Map E', },
{false, 1, 42, 36468, 0, 'Treasure Map F', },

{false, 1, 43, 36902, 0, 'Aeda Brightdawn', },
{false, 1, 43, 32911, 0, 'Ancient Clefthoof', },
{false, 1, 43, 34191, 0, 'Un\'glok Blackfinger', },
{false, 1, 43, 34197, 0, 'Bloodbloom the Colossus', },
{false, 1, 43, 34224, 0, 'Bloodcleave', },
{false, 1, 43, 34127, 0, 'Mother Bloodtusk', },
{false, 1, 43, 34519, 0, 'Brotoculus', },
{false, 1, 43, 37471, 0, 'Dahrok Boneshatter', },
{false, 1, 43, 32920, 0, 'Deathtoll', },
{false, 1, 43, 37473, 0, 'Krahl Deathwind', },
{false, 1, 43, 35996, 0, 'Depthroot', },
{false, 1, 43, 34382, 0, 'Grand Warlock Duress', },
{false, 1, 43, 34517, 0, 'Gargantuan Frostbeak', },
{false, 1, 43, 34483, 0, 'Galzomar (unused?)', },
{false, 1, 43, 34231, 0, 'Giant Snake', },
{false, 1, 43, 34412, 0, 'Gnarljaw', },
{false, 1, 43, 34851, 0, 'Gruuk?', },
{false, 1, 43, 37312, 0, 'Haakun, The All-Consuming', },
{false, 1, 43, 34162, 0, 'Icklarv', },
{false, 1, 43, 36899, 0, 'Defender Illona', },
{false, 1, 43, 36898, 0, 'Delvar Ironfirst', },
{false, 1, 43, 36900, 0, 'Talonpriest Ishaal', },
{false, 1, 43, 37141, 0, 'Talonpriest Ishaal', },
{false, 1, 43, 36889, 0, 'Defender Kaluum', },
{false, 1, 43, 35220, 0, 'Kharazos the Triumphant (unused?)', },
{false, 1, 43, 34411, 0, 'King Slime', },
{false, 1, 43, 36936, 0, 'Leorajh', },
{false, 1, 43, 37493, 0, 'Morphed Sentient', },
{false, 1, 43, 34243, 0, 'Rak\'nar Muzzlebash', },
{false, 1, 43, 34160, 0, 'Nixxie the Goblin', },
{false, 1, 43, 34198, 0, 'Roardan', },
{false, 1, 43, 33057, 0, 'Rotbelcher', },
{false, 1, 43, 35244, 0, 'Skagg', },
{false, 1, 43, 32921, 0, 'Skel\'tik the Baleful', },
{false, 1, 43, 37472, 0, 'Gortag Steelgrip', },
{false, 1, 43, 34168, 0, 'Stormwave', },
{false, 1, 43, 36877, 0, 'Torommok', },
{false, 1, 43, 34522, 0, 'Ug\'lok the Frozen', },
{false, 1, 43, 36312, 0, 'Sun Age Valarik', },
{false, 1, 43, 36901, 0, 'Vivianne', },

--daily vignettes
{false, 1, 43, 37371, -823, 'Alkali', },
{false, 1, 43, 37337, -823, 'Strategist Ankor', },
{false, 1, 43, 37410, -823, 'Avalanche', },
{false, 1, 43, 37399, -823, 'Karosh Blackwind', },
{false, 1, 43, 37377, -823, 'Hunter Bal\'ra', },
{false, 1, 43, 37367, -823, 'Inventor Blammo', },
{false, 1, 43, 37396, -823, 'Bonebreaker', },
{false, 1, 43, 37362, -823, 'Defector Dazgo', },
{false, 1, 43, 37351, -823, 'Demidos', },
{false, 1, 43, 37370, -823, 'Depthroot', },
{false, 1, 43, 37401, -823, 'Ragore Driftstalker', },
{false, 1, 43, 37366, -823, 'Durp the Hated', },
{false, 1, 43, 37406, -823, 'Echidna', },
{false, 1, 43, 37360, -823, 'Formless Nightmare', },
{false, 1, 43, 37380, -823, 'Giblette the Cowardly', },
{false, 1, 43, 37393, -823, 'Giga Sentinel', },
{false, 1, 43, 37390, -823, 'Gluttonous Giant', },
{false, 1, 43, 37413, -823, 'Gnarljaw', },
{false, 1, 43, 37388, -823, 'Gorivax', },
{false, 1, 43, 37373, -823, 'Firestarter Grash', },
{false, 1, 43, 37400, -823, 'Brutag Grimblade', },
{false, 1, 43, 37340, -823, 'Gug\'tol', },
{false, 1, 43, 37352, -823, 'Quartermaster Hershak', },
{false, 1, 43, 37403, -823, 'Earthshaker Holar', },
{false, 1, 43, 37365, -823, 'Horgg', },
{false, 1, 43, 37386, -823, 'Jabberjaw', },
{false, 1, 43, 37404, -823, 'Kaga the Ironbender', },
{false, 1, 43, 37364, -823, 'Morgo Kain', },
{false, 1, 43, 37361, -823, 'Kenos the Unraveller', },
{false, 1, 43, 37407, -823, 'Keravnos', },
{false, 1, 43, 37412, -823, 'King Slime', },
{false, 1, 43, 37345, -823, 'Lord Korinak', },
{false, 1, 43, 37398, -823, 'Krud the Eviscerator', },
{false, 1, 43, 37408, -823, 'Lernaea', },
{false, 1, 43, 37363, -823, 'Maniacal Madgard', },
{false, 1, 43, 37391, -823, 'Mecha Plunderer', },
{false, 1, 43, 37353, -823, 'Master Sergeant Milgra', },
{false, 1, 43, 37376, -823, 'Mogamago', },
{false, 1, 43, 37409, -823, 'Nagidna', },
{false, 1, 43, 37354, -823, 'Shadowspeaker Niir', },
{false, 1, 43, 37402, -823, 'Ogom the Mangler', },
{false, 1, 43, 37344, -823, 'Orumo the Observer', },
{false, 1, 43, 37397, -823, 'Pit-Slayer', },
{false, 1, 43, 37369, -823, 'Protectors of the Grove', },
{false, 1, 43, 37368, -823, 'Blademaster Ro\'gor', },
{false, 1, 43, 37392, -823, 'Shadow Hulk', },
{false, 1, 43, 37357, -823, 'Malgosh Shadowkeeper', },
{false, 1, 43, 37411, -823, 'Silvermaw', },
{false, 1, 43, 37394, -823, 'Solar Magnifier', },
{false, 1, 43, 37383, -823, 'Son of Goramal', },
{false, 1, 43, 37395, -823, 'Durg Spinecrusher', },
{false, 1, 43, 37374, -823, 'Swift Onyx Flayer', },
{false, 1, 43, 37358, -823, 'Soul-Twister Torek', },
{false, 1, 43, 37405, -823, 'Typhon', },
{false, 1, 43, 37359, -823, 'Voidreaver Urnae', },
{false, 1, 43, 37378, -823, 'Valkor', },
{false, 1, 43, 37372, -823, 'Venolasix', },
{false, 1, 43, 37379, -823, 'Vrok the Ancient', },
{false, 1, 43, 37375, -823, 'Grove Warden Yal', },

--Mistagged vignettes
{false, 2, 43, 34170, 0, 'Moltnar (Gorgrond)', },
{false, 2, 43, 35908, 0, 'Stoneshard Broodmother (Nagrand)', },
{false, 2, 43, 36942, 0, 'Soulbinder Aedraa (Talador)', 45.2,90.4},
{false, 2, 42, 34521, 0, 'Glowing Obsidian Shard (Frostfire Ridge)', 51.0,22.9},
}

SLASH_FFRVIGN1='/ffr'
function SlashCmdList.FFRVIGN(msg, editbox)
 myChatFrame:AddMessage('Frostfire vignette check',1,0,0)
 go(6720)
end

SLASH_SMVVIGN1='/smv'
function SlashCmdList.SMVVIGN(msg, editbox)
 myChatFrame:AddMessage('SMV vignette check',1,0,0)
 go(6719)
end

SLASH_GRGVIGN1='/grg'
function SlashCmdList.GRGVIGN(msg, editbox)
 myChatFrame:AddMessage('Gorgrond vignette check',1,0,0)
 go(6721)
end

SLASH_TLDVIGN1='/tld'
function SlashCmdList.TLDVIGN(msg, editbox)
 myChatFrame:AddMessage('Talador vignette check',1,0,0)
 go(6662)
end

SLASH_SOAVIGN1='/soa'
function SlashCmdList.SOAVIGN(msg, editbox)
 myChatFrame:AddMessage('Spires vignette check',1,0,0)
 go(6722)
end

SLASH_NGDVIGN1='/ngd'
function SlashCmdList.NGDVIGN(msg, editbox)
 myChatFrame:AddMessage('Nagrand vignette check',1,0,0)
 go(6755)
end

SLASH_UNKVIGN1='/unk'
function SlashCmdList.UNKVIGN(msg, editbox)
 myChatFrame:AddMessage('Unknown vignette check',1,0,0)
 go(1)
end

SLASH_MISVIGN1='/mistagged'
function SlashCmdList.MISVIGN(msg, editbox)
 myChatFrame:AddMessage('Mistagged vignette check',1,0,0)
 go(2)
end

SLASH_ALLVIGN1='/all'
function SlashCmdList.ALLVIGN(msg, editbox)
 myChatFrame:AddMessage('All zones',1,0,0)
 go(-1)
end

SLASH_CHECKITEMS1='/checkitems'
function SlashCmdList.CHECKITEMS(msg, editbox)
 checkItems()
end
