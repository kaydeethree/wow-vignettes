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
[0] = 'None',
[-1] = 'Garrison Resources',
[-2] = 'Apexis Crystals',
[-3] = 'Arakkoa Archaeology Fragments',
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
{true,  6720, 42, 33916, 108735, 'Arena Master\'s War Horn', 23.2,25.0},
{true,  6720, 42, 34520, 107457, 'Burning Pearl', 42.4,19.6}, -- Treasure Placeholder
{true,  6720, 42, 33940, 112187, 'Crag-Leaper\'s Cache', 42.7,31.8},
{true,  6720, 42, 33531, 112096, 'Clumsy Cragmaul Brute', 50.2,18.7},
{true,  6720, 42, 34473, 110536, 'Envoy\'s Satchel', 40.9,20.1},
{true,  6720, 42, 34841, -1, 'Forgotten Supplies', 43.7,55.6},
{true,  6720, 42, 34968, -1, 'Forgotten Supplies', 43.7,55.6},
{true,  6720, 42, 34507, 110689, 'Frozen Frostwolf Axe', 24.2,48.6},
{true,  6720, 42, 33948, 111543, 'Goren Leftovers', 66.7,26.4},
{true,  6720, 42, 33947, -1, 'Grimfrost Treasure', 68.1,45.9},
{true,  6720, 42, 33017, -1, 'Iron Horde Supplies', 68.9,69.1},
{false, 6720, 42, 34937, -1, 'Lady Sena\'s Other Materials Stash', 51.4,66.8},
{true,  6720, 42, 33926, 108739, 'Lagoon Pool', 21.7,9.6},
{true,  6720, 42, 34642, 111408, 'Lucky Coin', 19.2,12.0},
{true,  6720, 42, 33961, 0, 'Mysterious Flower, Frostfire Ridge', 71.6,69.6},
{true,  6720, 42, 33502, 112087, 'Obsidian Petroglyph', 38.3,37.8},
{true,  6720, 42, 34931, -1, 'Pale Loot Sack', 21.7,50.8},
{true,  6720, 42, 34967, -1, 'Raided Loot', 37.3,59.2},
{true,  6720, 42, 34641, 111407, 'Sealed Jug', 9.8,45.3},
{false, 6720, 42, 33977, 0, 'Shamanstone, Blessing of the Wolf', 27.1,36.5},
{true,  6720, 42, 33979, 0, 'Shamanstone, Buffeting Galefury', 65.2,79.1},
{false, 6720, 42, 33980, 0, 'Shamanstone, Ogrish Fortitude', 43.9,12.3},
{true,  6720, 42, 33978, 0, 'Shamanstone, Spirit of the Wolf', 17.5,56.7},
{true,  6720, 42, 33981, 0, 'Shamanstone, Touched by Fire', 37.0,33.2},
{true,  6720, 42, 33982, 0, 'Shamanstone, Touched by Ice', 60.4,13.7},
{true,  6720, 42, 33500, 43696, 'Slave\'s Stash', 27.7,42.8},
{false, 6720, 42, 34649, 109119, 'Smoldering True Iron Deposit', 36.3,32.3},
{true,  6720, 42, 33501, {63293, 107659}, 'Spectator\'s Chest', 24.2,27.1},
{true,  6720, 42, 33942, -1, 'Supply Dump', 16.1,49.7},
{true,  6720, 42, 33946, -1, 'Survivalist\'s Cache', 64.7,25.7},
{true,  6720, 42, 32803, 107658, 'Thunderlord Cache', 34.2,23.5},
{true,  6720, 42, 33440, 0, 'Time-Warped Bladespire Brute, Falling Lower', 30.5,50.8},
{true,  6720, 42, 33497, 0, 'Time-Warped Bladespire Brute, Falling Higher', 30.5,50.9},
{true,  6720, 42, 33439, 0, 'Time-Warped Bladespire Brute, Running', 30.3,50.6},
{true,  6720, 42, 33438, 107662, 'Time-Warped Bladespire Primalist', 30.3,51.2},
{true,  6720, 42, 33505, 112107, 'Wiggling Egg', 64.4,65.8},
{true,  6720, 42, 33525, {107270, 107273, 107277}, 'Young Orc Traveler', 54.8,35.5},
{true,  6720, 42, 33525, {107271, 107272, 107275}, 'Young Orc Woman', 63.4,14.7},

--Frostfire Ridge npcs
{true,  6720, 43, 34497, 111476, 'Breathless', 27.8,50.3},
{true,  6720, 43, 32941, 101436, 'Canyon Icemother', 33.5,23.1},
{true,  6720, 43, 34843, 111953, 'Chillfang', 41.4,68.3},
{false, 6720, 43, 33014, 111490, 'Cindermaw', 40.6,47.1},
{true,  6720, 43, 34129, 112066, 'Coldstomp the Griever', 25.9,55.2},
{false, 6720, 43, 34131, 111484, 'Coldtusk', 54.2,67.7},
{true,  6720, 43, 34477, 112086, 'Cyclonic Fury', 67,78},
{true,  6720, 43, 34130, -1, 'Giantstalker Hunting Party', 58.6,31.9},
{true,  6720, 43, 34132, 112094, 'Scout Goreseeker', 76.5,63.5},
{true,  6720, 43, 33512, 111545, 'Gorg\'ak the Lava Guzzler', 72.5,22.8},
{true,  6720, 43, 34865, 112077, 'Grutush the Pillager', 38.6,62.9},
{false, 6720, 43, 34825, 111948, 'Gruuk', 51.8,65.1},
{true,  6720, 43, 34839, 111955, 'Gurun', 47.1,55.2},
{true,  6720, 43, 34708, 112078, 'Jehil the Climber', 61.8,26.6},
{true,  6720, 43, 32918, 111530, 'Giant-Slayer Kul', 54.7,22.3},
{true,  6720, 43, 33938, 111576, 'Primalist Mur\'og', 37.0,33.8},
{true,  6720, 43, 34470, 111666, 'Pale Fishmonger', 28.3,66.6},
{true,  6720, 43, 33843, 111533, 'Broodmother Reeg\'ak', 65.6,31.4},
{true,  6720, 43, 34133, 111475, 'The Beater', 26.9,31.9},
{false, 6720, 43, 34361, 111534, 'The Bone Crawler', 70,30},
{true,  6720, 43, 34559, 111477, 'Yaga the Scarred', 40.6,27.6},

-- Frostfire Ridge events
{true,  6720, 44, 34476, 111554, 'Frozen Treasure', 57.2,52.1},
{true,  6720, 44, 33504, 107661, 'Firefury Stone and Firefury Giant', 71.7,47.0},
{false, 6720, 44, 33011, {106899, 106902}, 'Grizzled Frostwolf Veteran', 45.4,50.3},
{false, 6720, 44, 33511, 112110, 'Sacrifice Pit (Borrok the Devourer)', 62.8,42.4},

-- Shadowmoon Valley objects
-- missing
-- anguish fortress - hut in nw corner (50-60 Garrison Resources)
-- gulvar - demonic cache in hut left of path up to shadow rise
-- anchorite's rise - vindicator's cache
-- darktide roost - smallest of three islands - scaly rylak egg - aged yolk
-- umbrafen - strange spore - umbrafen spore
{false, 6719, 42, 35581, 109124, 'Alchemist\'s Satchel', 54.9,45.0},
{false, 6719, 42, 35584, 113560, 'Ancestral Greataxe', 52.8,48.4},
{false, 6719, 42, 33869, 108902, 'Armored Elekk Tusk', 41.4,27.9},
{false, 6719, 42, 33584, 113531, 'Ashes of A\'kumbo', 37.8,44.3},
{false, 6719, 42, 33867, 109739, 'Astrologer\'s Box', 49.3,37.6},
{false, 6719, 42, 33046, 113547, 'Beloved\'s Offering', 36.8,41.4},
{false, 6719, 42, 33613, 108945, 'Bubbling Cauldron',37.2,23.1 },
{false, 6719, 42, 33569, 113545, 'Carved Dinking Horn', 33.5,39.6},
{false, 6719, 42, 33575, 108904, 'Demonic Cache', },
{false, 6719, 42, 34174, -1, 'Fantastic Fish', 26.5,5.7},
{false, 6719, 42, 33891, 108901, 'Giant Moonwillow Cone', 34.5,46.2},
{false, 6719, 42, 35798, 109130, 'Glowing Cave Blossom', 48.7,47.5},
{false, 6719, 42, 33614, 113408, 'Greka\'s Urn', 38.5,43.0},
{false, 6719, 42, 33564, 108900, 'Hanging Satchel', 47.1,46.0},
{false, 6719, 42, 33041, -1, 'Iron Horde Cargo Shipment', 42.1,61.2},
{false, 6719, 42, 33567, 108903, 'Iron Horde Tribute', 37.5,59.2},
{false, 6719, 42, 33568, 113571, 'Kaliri Egg', 57.9,45.3},
{false, 6719, 42, 35530, -1, 'Lunarfall Egg', 30.2,19.9},
{false, 6719, 42, 35603, 113215, 'Mikkal\'s Chest', 58.9,21.9},
{false, 6719, 42, 37254, 107457, 'Mushroom Covered Chest',52.9,24.9}, --Treasure Placeholder
{false, 6719, 42, 33962, 0, 'Mysterious Flower, Shadowmoon Valley', },
{false, 6719, 42, 36507, 116875, 'Orc Skeleton', 67.0,33.5},
{false, 6719, 42, 33384, 107650, 'Peaceful Offering South', 44.5,63.6},
{false, 6719, 42, 33610, 107650, 'Peaceful Offering East', 45.2,60.5},
{false, 6719, 42, 33611, 107650, 'Peaceful Offering West', 43.8,60.6},
{false, 6719, 42, 33612, 107650, 'Peaceful Offering North', 44.5,59.1},
{false, 6719, 42, 35381, -1, 'Pippers\' Buried Supplies 1', 30.0,18.3},
{false, 6719, 42, 35382, -1, 'Pippers\' Buried Supplies 2', 30.9,17.7},
{false, 6719, 42, 35383, -1, 'Pippers\' Buried Supplies 3', 28.9,15.6},
{false, 6719, 42, 35384, -1, 'Pippers\' Buried Supplies 4', 30.7,20.6},
{false, 6719, 42, 33886, 109081, 'Ronokk\'s Belongings', 31.3,39.1},
{false, 6719, 42, 33572, 113373, 'Rotting Basket', 22.9,33.8},
{false, 6719, 42, 33573, 113378, 'Rovo\'s Dagger', 36.7,44.5},
{false, 6719, 42, 33570, 113388, 'Shadowmoon Exile Treasure', 45.8,24.6},
{false, 6719, 42, 33571, 113563, 'Shadowmoon Sacrifical Dagger', 30.0,45.4},
{false, 6719, 42, 35289, -1, 'Spark\'s Stolen Supplies', 30.9,12.8},
{false, 6719, 42, 35280, -1, 'Stolen Treasure', 27.1,2.5},
{false, 6719, 42, 35600, 118104, 'Strange Spore', },
{false, 6719, 42, 35677, 110506, 'Sunken Fishing Boat', 37.2,26.0},
{false, 6719, 42, 35279, -1, 'Sunken Treasure', 28.8,7.2},
{false, 6719, 42, 33540, 113546, 'Uzko\'s Knickknacks', 35.9,40.9},
{false, 6719, 42, 33866, 109124, 'Veema\'s Herb Bag', 34.2,43.5},
{false, 6719, 42, 33574, 113375, 'Vindicator\'s Cache', },
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
{false, 6719, 43, 35847, 0, 'Voidseer Kalurg', 32.9,41.4},
{false, 6719, 43, 33043, 109078, 'Killmaw', 40.8,44.6},
{false, 6719, 43, 33055, 108907, 'Leaf-Reader Kurri', 37.7,14.3},
{false, 6719, 43, 33039, 109061, 'Ku\'targ the Voidseer', 32.5,35.1},
{false, 6719, 43, 33642, 113527, 'Mother Om\'ra', 44.0,57.7},
{false, 6719, 43, 35553, 113542, 'Rai\'vosh ',48.8,22.7},
{false, 6719, 43, 34068, 109077, 'Rockhoof', 52.7,50.8},
{false, 6719, 43, 36568, 0, 'Malgosh Shadowkeeper', 29.6,51.0},
{false, 6719, 43, 35732, 113543, 'Shinri', 61.2,49.4},
{false, 6719, 43, 36880, 118734, 'Sneevel', 27.6,43.5},
{false, 6719, 43, 35523, 113559, 'Morva Soultwister', 38.6,70.4},
{false, 6719, 43, 35906, 113561, 'Mad "King" Sporeon', 45.0,20.8},
{false, 6719, 43, 36431, -2, 'Soul-Twister Torek', 29.4,46.3},
{false, 6719, 43, 35688, 113556, 'Enavra Varandi', 67.9,63.9},
{false, 6719, 43, 33640, 108906, 'Veloss', 21.7,20.8},
{false, 6719, 43, 33643, 108957, 'Venomshade', 54.8,70.2},
{false, 6719, 43, 33389, 'Yggdrel', 48.1,65.6},

-- Shadowmoon Valley events
{false, 6719, 44, 33038, 113553, 'Embaari Defense Crystal', 42.9,40.3},
{false, 6719, 44, 34743, 111636, 'The Crystal Blade of Torvath', 61.7,67.9},

-- Gorgrond Arena-only treasures
{false, 6721, 42, 36721, -1, 'arena2', },
{false, 6721, 42, 36736, -1, 'arena15', },
{false, 6721, 42, 36737, -1, 'arena16', },
{false, 6721, 42, 36739, -1, 'arena18', },
{false, 6721, 42, 36781, -1, 'arena20', },
{false, 6721, 42, 36782, -1, 'arena21', },
{false, 6721, 42, 36783, -1, 'arena22', },
{false, 6721, 42, 36789, -1, 'arena25', },
{false, 6721, 42, 36730, -1, 'Arena: Aged Stone Container, Crushfang\'s End', 48.1,55.2},
{false, 6721, 42, 36784, -1, 'Arena: Aged Stone Container, Deeproot', 45.7,88.2},
{false, 6721, 42, 36723, -1, 'Arena: Aged Stone Container, Fissure of Fury', 43.2,45.7},
{false, 6721, 42, 36726, -1, 'Arena: Aged Stone Container, Gorgorek\'s Fall', 41.8,45.3},
{false, 6721, 42, 36734, -1, 'Arena: Aged Stone Container, Steamburst Cauldron', 51.3,40.6},
{false, 6721, 42, 36722, -1, 'Arena: Aged Stone Container, Valley of Destruction', 45.6,49.3},
{false, 6721, 42, 36787, -1, 'Arena: Ancient Ogre Cache, Blook\'s Overlook', 42.2,93.1},
{false, 6721, 42, 36740, -1, 'Arena: Ancient Ogre Cache, Iyun Weald', 61.5,58.5},
{false, 6721, 42, 36733, -1, 'Arena: Ancient Ogre Cache, Gronn Canyon', 45.5,43.0},
{false, 6721, 42, 36727, -1, 'Arena: Ancient Titan Chest, Brimstone Springs', 42.2,52.0},
{false, 6721, 42, 36731, -1, 'Arena: Ancient Titan Chest, Drywind Gorge', 43.3,51.7},
{false, 6721, 42, 36735, -1, 'Arena: Ancient Titan Chest, Gronn Canyon', 48.0,40.0},
{false, 6721, 42, 36738, -1, 'Arena: Ancient Titan Chest, Mistcreep Mire', 50.3,66.6},
{false, 6721, 42, 36710, -1, 'Arena: Ancient Titan Chest, Steamscar Rise', 49.4,50.9},
{false, 6721, 42, 36728, -1, 'Arena: Obsidian Crystal Formation, Brimstone Springs', 41.8,58.9},
{false, 6721, 42, 36729, -1, 'Arena: Obsidian Crystal Formation, Stonemaul Arena', 42.1,64.3},
{false, 6721, 42, 36732, -1, 'Arena: Obsidian Crystal Formation, Valley of Destruction', 44.2,46.6},

-- Gorgrond Mill-only treasures
{false, 6721, 42, 35965, -1, 'mill3', },
{false, 6721, 42, 35966, -1, 'mill4', },
{false, 6721, 42, 35967, -1, 'mill5', },
{false, 6721, 42, 35968, -1, 'mill6', },
{false, 6721, 42, 35971, -1, 'mill7', },
{false, 6721, 42, 35979, -1, 'mill9', },
{false, 6721, 42, 35980, -1, 'mill10', },
{false, 6721, 42, 35981, -1, 'mill11', },
{false, 6721, 42, 35984, -1, 'mill13', },
{false, 6721, 42, 36001, -1, 'mill14', },
{false, 6721, 42, 36003, -1, 'mill15', },
{false, 6721, 42, 36019, -1, 'mill17', },
{false, 6721, 42, 36714, -1, 'mill20', },
{false, 6721, 42, 36716, -1, 'mill22', },
{false, 6721, 42, 36718, -1, 'mill24', },
{false, 6721, 42, 36720, -1, 'mill25', },
{false, 6721, 42, 35701, -1, 'Mill1A: Aged Stone Container?, Dionor\'s Demise', 49.1,48.5},
{false, 6721, 42, 36712, -1, 'Mill1B: Aged Stone Container?, Dionor\'s Demise', 49.1,48.5},
{false, 6721, 42, 35952, -1, 'Mill2: Aged Stone Container?, Dionor\'s Demise', 49.1,48.5},
{false, 6721, 42, 36717, -1, 'Mill: Aged Stone Container, Valley of Destruction', 47.5,43.6},
{false, 6721, 42, 35982, -1, 'Mill: Botani Essence Seed', 42.0,81.6},
{false, 6721, 42, 36430, -1, 'Mill: Mysterious Petrified Pod, Iyun Weald', 63.3,57.2},
{false, 6721, 42, 36715, -1, 'Mill: Mysterious Petrified Pod, Overlook Ruins', 51.7,69.1},
{false, 6721, 42, 36015, -1, 'Mill: Mysterious Petrified Pod, Tangleheart', 60.5,72.8},
{false, 6721, 42, 35975, -1, 'Mill: Remains of Explorer Engieer Toldirk Ashlamp', 46.0,93.6},
{false, 6721, 42, 36713, -1, 'Mill: Unknown Petrified Egg', 53.0,79.1},

-- Gorgrond open treasures
{false, 6721, 42, 34147, 107457, 'grg1', },
{false, 6721, 42, 34149, 107457, 'grg2', },
{false, 6721, 42, 34151, 107457, 'grg3', },
{false, 6721, 42, 34153, 107457, 'grg4', },
{false, 6721, 42, 34146, 107457, 'grg5', },
{false, 6721, 42, 34155, 107457, 'grg6', },
{false, 6721, 42, 34152, 107457, 'grg7', },
{false, 6721, 42, 34172, 107457, 'grg8', },
{false, 6721, 42, 34173, 107457, 'grg9', },
{false, 6721, 42, 34176, 107457, 'grg11', },
{false, 6721, 42, 34201, 107457, 'grg13', },
{false, 6721, 42, 34177, 107457, 'grg14', },
{false, 6721, 42, 34219, 107457, 'grg15', },
{false, 6721, 42, 34195, 107457, 'grg16', },
{false, 6721, 42, 34206, 107457, 'grg17', },
{false, 6721, 42, 34179, 107457, 'grg18', },
{false, 6721, 42, 34210, 107457, 'grg19', },
{false, 6721, 42, 34211, 107457, 'grg20', },
{false, 6721, 42, 34214, 107457, 'grg21', },
{false, 6721, 42, 34215, 107457, 'grg22', },
{false, 6721, 42, 34218, 107457, 'grg23', },

{false, 6721, 42, 35056, 107457, 'Horned Skull', 42.6,46.8 },
{false, 6721, 42, 36618, 107457, 'Iron Supply Chest', 43.7,42.5},
{false, 6721, 42, 33966, 0, 'Mysterious Flower, Gorgrond', 54.3,68.2},
{false, 6721, 42, 34241, 118227, 'Ockbar\'s Pack', 43.0,93.0},
{false, 6721, 42, 36605, 107457, 'Remains of Balldir Deeprock', 57.8,56.0},
{false, 6721, 42, 36654, 107457, 'Remains of Balik Orecrusher', 53.1,74.5},
{false, 6721, 42, 34940, 107457, 'Strange Looking Dagger', 53.0,80.0},
{false, 6721, 42, 36610, 107457, 'Suntouched Spear', 45.7,49.7},
{false, 6721, 42, 36203, 107457, 'Warm Goren Egg', 48.9,47.3},

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
--missing:
--duskfall island - ? - lightbearer 109192
--duskfall island - pleasurebot 8000 - parasitic starfish 110506
--teroclaw nests - ? - teroclaw hatchling 112699
{true,  6662, 42, 34236, 116131, 'Amethyl Crystal', 62.1,32.4},
{false, 6662, 42, 34260, 0, 'Aruuna Mining Cart A', }, --aruuna mine bottom floor
{false, 6662, 42, 36262, 0, 'Aruuna Mining Cart B', }, --aruuna mine bottom floor
{true,  6662, 42, 34259, 107457, 'Bonechewer Remnants', 33.3,76.8},
{true,  6662, 42, 34248, 116116, 'Charred Sword', 77.0,49.9}, 
{true,  6662, 42, 33931, 108743, 'Deceptia getting blown up', 58.8,12.1},
{true,  6662, 42, 33933, 108743, 'Deceptia\'s Smoldering Boots', 58.1,12.1},
{false, 6662, 42, 34253, 116118, 'Draenei Weapons', }, -- exarch's refuge
{true,  6662, 42, 34249, -1, 'Farmer\'s Bounty', 35.4,96.6},
{true,  6662, 42, 36829, 107457, 'Gift of the Ancients', 28.4,74.2},
{true,  6662, 42, 34251, 117571, 'Iron Box', 64.6,79.2},
{true,  6662, 42, 34233, 117568, 'Jug of Aged Ironwine', 65.5,11.4},
{false, 6662, 42, 34261, 107457, 'Keluu\'s Belongings', },
{true,  6662, 42, 34290, 116402, 'Ketya\'s Stash', 54.0,27.7},
{false, 6662, 42, 34258, 107457, 'Light of the Sea', }, --northern end of westernmost pier of Shattrath docks
{true,  6662, 42, 33960, 0, 'Mysterious Flower, Talador', 50.7,30.0},
{true,  6662, 42, 34263, 117572, 'Pure Crystal Dust', 78.2,14.7},
{true,  6662, 42, 34250, 116128, 'Relic of Aruuna', 75.8,44.7},
{false, 6662, 42, 34256, 116128, 'Relic of Telmor', }, --larger building of telmor
{false, 6662, 42, 34232, 116117, 'Rook\'s Tacklebox', }, --frostwolf overlook, base of the biggest waterfall
{true,  6662, 42, 34254, 117570, 'Soulbinder\'s Reliquary', 39.5,55.1},
{false, 6662, 42, 33649, -1, 'Torched Iron Horde Scout', }, -- northwest of small lake near aruuna
{false, 6662, 42, 34257, 116119, 'Treasure of Ango\'rosh', }, -- western side of ango'rosh ruins
{false, 6662, 42, 34140, 107457, 'Yuuri\'s Gift', }, --next to road west of telmor after taking yuuri's quest in tomb of lights
{true,  6662, 42, 34255, 116129, 'Webbed Sac', 65.4,88.6}, --also: curious deathweb egg behind dreadlord in deathweb hollow 117569

--Talador NPCs
{true,  6662, 43, 34668, 116122, 'Burning Front rare demon', 56.7,62.5},
{false, 6662, 43, 34220, 107457, 'Echo of Murmur A', },
{false, 6662, 43, 34221, 107457, 'Echo of Murmur B', },
{true,  6662, 43, 35018, 112373, 'Felbark', 50.4,83.5},
{true,  6662, 43, 34165, 116123, 'Cro Fleshrender', 37.4,70.4},
{true,  6662, 43, 34145, {113287, 113288}, 'Frenzied Golem', 46.4,54.8}, 
{true,  6662, 43, 34929, 116075, 'Gennadian', 67.5,80.8},
{true,  6662, 43, 34189, 116113, 'Glimmerwing', 32.7,63.2},
{true,  6662, 43, 34142, 112499, 'Dr. Gloom', 68.4,15.7},
{true,  6662, 42, 36919, 107457, 'A Restless Crate and Grrbrrgle', 22.2,74.2},
{true,  6662, 43, 34185, 116124, 'Hammertooth', 62.6,45.4},
{true,  6662, 43, 34167, 112369, 'Hen-Mother Hami', 76.3,52.2},
{true,  6662, 43, 34208, 116070, 'Lo\'marg Jawcrusher', 49.2,92.3},
{true,  6662, 43, 34498, 116125, 'Klikixx', 66.8,85.3},
{true,  6662, 43, 34859, 116077, 'No\'losh', 86.4,30.9},
{true,  6662, 43, 34196, 116112, 'Ra\'kahn', 59.5,60.0, },
{true,  6662, 43, 34671, 112370, 'Shirzir', 43.0,54.1},
{true,  6662, 43, 36858, 117562, 'Steeltusk', 67.7,35.8},
{true,  6662, 43, 34945, 112475, 'Underseer Bloodmane', 63.8,20.7},
{true,  6662, 43, 35491, 112475, 'Underseer Bloodmane', 63.8,20.7},
{true,  6662, 43, 34148, 112371, 'Viperlash', 37.6,74.9},
{false, 6662, 43, 34204, 112261, 'Wandering Vindicator - kill', 69.4,33.2},
{false, 6662, 43, 34205, 112261, 'Wandering Vindicator - loot', 69.4,33.2},
{true,  6662, 43, 34135, 112263, 'Yazheera the Incinerator', 53.8,25.6},

--Talador events
{true,  6662, 44, 34184, 117567, 'Aarko - Killed Surok Darkstorm', 36.5,96.1},
{true,  6662, 44, 34182, 117567, 'Aarko - Looted Treasure', 36.5,96.1},
{false, 6662, 44, 34128, 0, 'Four Friends complete A', },
{false, 6662, 44, 34134, 0, 'Four Friends complete H', },
{false, 6662, 44, 34114, 0, 'Four Friends found A', },
{false, 6662, 44, 34115, 0, 'Four Friends found H', },
{false, 6662, 44, 34110, 0, 'Girl 1 found A', },
{false, 6662, 44, 34116, 0, 'Girl 1 found H', },
{false, 6662, 44, 34111, 0, 'Girl 2 found A', },
{false, 6662, 44, 34117, 0, 'Girl 2 found H', },
{false, 6662, 44, 34112, 0, 'Guy 1 found A', },
{false, 6662, 44, 34118, 0, 'Guy 1 found H', },
{false, 6662, 44, 34113, 0, 'Guy 2 found A', },
{false, 6662, 44, 34119, 0, 'Guy 2 found H', },
{false, 6662, 44, 34199, 'Saving Anchorite\'s Sojourn', 77.6,57.1},

-- Spires of Arak objects
{false, 6722, 42, 36458, 116913, 'Abandoned Mining Pick', 40.6,55.0},
{false, 6722, 42, 36462, 107457, 'Admiral Taylor\'s Coffer', 36.2,54.5},
{false, 6722, 42, 36445, 107457, 'Assassin\'s Spear', 49.2,37.2},
{false, 6722, 42, 35627, 107457, 'Basket of Arakkoa Goods', 40.2,60.3},
{false, 6722, 42, 36367, 0, 'Campaign Contributions', 55.5,90.9},
{false, 6722, 42, 36454, 107457, 'Drypeak Mushrooms', 63.6,67.4},
{false, 6722, 42, 36395, 115463, 'Elixir of Shadow Sight, Skettis', 43.9,15.0},
{false, 6722, 42, 36397, 115463, 'Elixir of Shadow Sight, Veil Akraz', 43.8,24.6},
{false, 6722, 42, 36398, 115463, 'Elixir of Shadow Sight, Sethekk Hollow', 69.2,43.3},
{false, 6722, 42, 36399, 115463, 'Elixir of Shadow Sight, Bloodmane Valley', 49.1,62.6},
{false, 6722, 42, 36400, 115463, 'Elixir of Shadow Sight, Shadow\'s Vigil', 55.6,22.1},
{false, 6722, 42, 36401, 115463, 'Elixir of Shadow Sight, Bloodmane Pridelands', 53.1,84.5},
{false, 6722, 42, 36418, 116914, 'Ephial\'s Dark Grimoire', 36.6,57.9},
{false, 6722, 42, 35871, 107457, 'Escape Pod and Nizzix\'s Chest', 60.9,88.0},
{false, 6722, 42, 36246, 116919, 'Fractured Sunstone', 50.5,22.1},
{false, 6722, 42, 36420, -1, 'Garrison Resources', 37.2,47.5},
{false, 6722, 42, 36451, 116918, 'Garrison Workman\'s Hammer', 41.9,50.5},
{false, 6722, 42, 36247, 109124, 'Lost Herb Satchel', 50.8,28.7},
{false, 6722, 42, 36411, 116911, 'Lost Ring', 47.8,36.1},
{false, 6722, 42, 36416, 107457, 'Misplaced Scroll', 52,42},
{false, 6722, 42, 36244, -3, 'Misplaced Scrolls', 42.7,18.3},
{false, 6722, 42, 33964, 0, 'Mysterious Flower, Spires of Arak', 57.8,44.8},
{false, 6722, 42, 36403, 118267, 'Offering to the Raven Mother, Behind Swarmleaf', 53.3,55.5},
{false, 6722, 42, 36406, 118267, 'Offering to the Raven Mother, Bloodmane Valley North', 48.9,54.7},
{false, 6722, 42, 36407, 118267, 'Offering to the Raven Mother, Bloodmane Valley South', 51.9,64.6},
{false, 6722, 42, 36410, 118267, 'Offering to the Raven Mother, Bloodmane Valley East', 61.0,63.8},
{false, 6722, 42, 36243, 107457, 'Outcast\'s Belongings, Terokkar Pass', 36.8,17.2},
{false, 6722, 42, 36447, 107457, 'Outcast\'s Belongings, Veil Akraz', 42.2,21.7},
{false, 6722, 42, 36446, 107457, 'Outcast\'s Pouch', 46.9,34.0},
{false, 6722, 42, 36245, -3, 'Relics of the Outcasts, Skettis', 43.0,16.4},
{false, 6722, 42, 36354, -3, 'Relics of the Outcasts, Veil Terokk', 46.0,44.2},
{false, 6722, 42, 36355, -3, 'Relics of the Outcasts, Veil Akraz', 43.2,27.3},
{false, 6722, 42, 36356, -3, 'Relics of the Outcasts, Sethekk Hollow', 67.4,39.8},
{false, 6722, 42, 36359, -3, 'Relics of the Outcasts, Veil Zekk', 60.2,53.9},
{false, 6722, 42, 36360, -3, 'Relics of the Outcasts, Nest of the Ravenspeakers', 51.9,48.9},
{false, 6722, 42, 36657, 116887, 'Rooby\'s Roo', 37.4,50.6},
{false, 6722, 42, 36377, 107457, 'Rukhmar\'s Image', 44.3,12.0},
{false, 6722, 42, 36366, 116917, 'Sailor Zazzuk\'s 180-Proof Rum', 59.2,90.6},
{false, 6722, 42, 36362, -1, 'Shattered Hand Cache', 56.3,28.8},
{false, 6722, 42, 36444, 107457, 'Shattered Hand Explosives', 50.3,25.8},
{false, 6722, 42, 36363, 107457, 'Shattered Hand Spoils', 58.3,36.6},
{false, 6722, 42, 36456, -1, 'Shredder Parts', 60.9,84.6},
{false, 6722, 42, 36433, -3, 'Smuggled Apexis Artifacts', 56.3,45.3},
{false, 6722, 42, 36365, 107457, 'Spray-O-Matic 5000 XT', 59.6,81.3},
{false, 6722, 42, 36421, -3, 'Sun-Touched Cache, mid level', 34.1,27.5},
{false, 6722, 42, 36422, -3, 'Sun-Touched Cache, upper level', 33.3,27.3},
{false, 6722, 42, 36364, 107457, 'Toxicfang Venom', 54.4,32.5},
{false, 6722, 42, 36455, 0, 'Waterlogged Satchel', 66.5,56.6},

-- Spires of Arak NPCs
{false, 6722, 43, 35599, 116839, 'Blade-Dancer Aeryx', 46.8,23.3},
{false, 6722, 43, 36283, 118205, 'Blightglow', 65.2,67.8},
{false, 6722, 43, 36291, 116907, 'Betsi Boombasket', 58.3,84.5},
{false, 6722, 43, 36279, 118199, 'Poisonmaster Bortusk', 59.5,37.5},
{false, 6722, 43, 36129, 116837, 'Nas Dunberlin', 36.3,52.6},
{false, 6722, 43, 36303, 107457, 'Eyeless', 49.9,29.8},
{false, 6722, 43, 36297, 118200, 'Festerbloom', 55.2,35.6},
{true,  6722, 43, 36943, 118696, 'Gaze', 24.9,25.6},
{false, 6722, 43, 36305, 116836, 'Gobblefin', 33.5,58.9},
{false, 6722, 43, 36304, 107457, 'Gochar', 53.5,49.1},
{false, 6722, 43, 36306, 118202, 'Jiasska the Sporegorger', 56.4,94.8},
{false, 6722, 43, 36268, 107457, 'Kalos the Bloodbathed', 62.8,37.3},
{false, 6722, 43, 36396, 118206, 'Mutafen', 53.0,89.3},
{false, 6722, 43, 36479, 107457, 'Nightmaw', 49.3,37.5},
{false, 6722, 43, 36288, 118204, 'Oskiira the Vengeful', 64.9,54.4},
{false, 6722, 43, 36887, 118279, 'Hermit Palefur', 59.3,14.8},
{false, 6722, 43, 36470, 118107, 'A Strange Mushroom and Rotcap', 38.4,27.8},
{false, 6722, 43, 36478, 118201, 'Shadowbark', 51.9,35.5},
{false, 6722, 43, 36267, 118198, 'Durkath Steelmaw', 46.4,28.5},
{false, 6722, 43, 36265, 116858, 'Stonespite', 33.6,21.9},
{false, 6722, 43, 36472, 116857, 'Swarmleaf', 53.0,53.0},
{false, 6722, 43, 36278, 116838, 'Talonbreaker', 54.6,63.2},
{false, 6722, 43, 36254, 116852, 'Tesska the Broken', 57.3,74.1},

-- Spires of Arak events
{false, 6722, 44, 36276, 118203, 'Spawn of Sethe and Sangrikass', 68.8,48.9},
{false, 6722, 44, 36298, 116855, 'Stingtail Nest and Sunderthorn', 58.5,45.1},
{false, 6722, 44, 35334, 118207, 'The Egg of Varasha', 29.6,41.6},

--Nagrand objects
{false, 6755, 42, 35759, 107457, 'Abandoned Cargo', 67.7,59.7},
{false, 6755, 42, 36072, 0, 'Abu\'Gar\'s Favorite Lure', },
{false, 6755, 42, 36089, 0, 'Abu\'Gar\'s Reel', },
{false, 6755, 42, 35711, 0, 'Abu\'gar\'s Tenacity', },
{false, 6755, 42, 36077, 0, 'Adventurer\'s Mace', },
{false, 6755, 42, 35597, 0, 'Adventurer\'s Pack A', },
{false, 6755, 42, 35969, 0, 'Adventurer\'s Pack B', },
{false, 6755, 42, 35765, 0, 'Adventurer\'s Pack C', },
{false, 6755, 42, 36050, 0, 'Adventurer\'s Pouch A', },
{false, 6755, 42, 36088, 0, 'Adventurer\'s Pouch B', },
{false, 6755, 42, 35955, 0, 'Adventurer\'s Sack', },
{false, 6755, 42, 35923, 0, 'Adventurer\'s Stash', },
{false, 6755, 42, 35673, 0, 'Appropriated Warsong Supplies', },
{false, 6755, 42, 36116, 0, 'Bag of Herbs', },
{false, 6755, 42, 35986, 0, 'Bone-Carved Dagger', },
{false, 6755, 42, 36174, 0, 'Bounty of the Elements', },
{false, 6755, 42, 35696, 0, 'Burning Blade Cache', },
{false, 6755, 42, 35661, 0, 'Dreamflower', },
{false, 6755, 42, 36036, 0, 'Elemental Manacles', },
{false, 6755, 42, 35954, 0, 'Elemental Offering', },
{false, 6755, 42, 35692, 0, 'Freshwater Clam', },
{false, 6755, 42, 35560, 0, 'Fungus-Covered Chest', },
{false, 6755, 42, 36074, 0, 'Gambler\'s Purse', },
{false, 6755, 42, 35987, 0, 'Genedar Debris A', },
{false, 6755, 42, 35999, 0, 'Genedar Debris B', },
{false, 6755, 42, 36002, 0, 'Genedar Debris C', },
{false, 6755, 42, 36008, 0, 'Genedar Debris D', },
{false, 6755, 42, 36011, 0, 'Genedar Debris E', },
{false, 6755, 42, 36099, 0, 'Goblin Keg', },
{false, 6755, 42, 35576, 0, 'Goblin Pack A', },
{false, 6755, 42, 35590, 0, 'Goblin Pack B', },
{false, 6755, 42, 35951, 0, 'Goblin Stash', },
{false, 6755, 42, 35694, 0, 'Golden Kaliri Egg - TSH', },
{false, 6755, 42, 36109, 0, 'Goldtoe\'s Plunder', },
{false, 6755, 42, 36051, 0, 'Grizzlemaw\'s Favorite Bone', },
{false, 6755, 42, 35622, 0, 'Hidden Stash', },
{false, 6755, 42, 36082, 0, 'Lost Pendant', },
{false, 6755, 42, 36052, 0, 'Misplaced Artifacts', },
{false, 6755, 42, 35643, 0, 'Mountain Climber\'s Pack', },
{false, 6755, 42, 34581, 0, 'Mysterious Flower, Nagrand', },
{false, 6755, 42, 36049, 0, 'Ogre Beads', },
{false, 6755, 42, 36039, 0, 'Ogre Hammer', },
{false, 6755, 42, 36020, 0, 'Oshu\'gun Fragment', },
{false, 6755, 42, 36115, 0, 'Pale Elixir', },
{false, 6755, 42, 36021, 0, 'Pokhar\'s Thirteenth Axe', },
{false, 6755, 42, 36035, 0, 'Polished Sabron Skull', },
{false, 6755, 42, 36102, 0, 'Saberon Stash', },
{false, 6755, 42, 36846, 0, 'Spirit\'s Gift', },
{false, 6755, 42, 36857, 0, 'Smuggler\'s Cache', },
{false, 6755, 42, 35648, 0, 'Steamwheedle Supplies A', },
{false, 6755, 42, 35646, 0, 'Steamwheedle Bupplies B', },
{false, 6755, 42, 35616, 0, 'Steamwheedle Supplies C', },
{false, 6755, 42, 35577, 0, 'Steamwheedle Supplies D', },
{false, 6755, 42, 35583, 0, 'Steamwheedle Supplies E', },
{false, 6755, 42, 35591, 0, 'Steamwheedle Supplies F', },
{false, 6755, 42, 35662, 0, 'Steamwheedle Supplies G', },
{false, 6755, 42, 36046, 0, 'Telaar Defender Shield', },
{false, 6755, 42, 35579, 0, 'Void-Infused Crystal', },
{false, 6755, 42, 35695, 0, 'Warsong Cache', },
{false, 6755, 42, 36073, 0, 'Warsong Helm', },
{false, 6755, 42, 35678, 0, 'Warsong Lockbox', },
{false, 6755, 42, 35976, 0, 'Warsong Supplies', },
{false, 6755, 42, 35682, 0, 'Warsong Spear', },
{false, 6755, 42, 35593, 0, 'Warsong Spoils', },
{false, 6755, 42, 36071, 0, 'Waterlogged Satchel', },

-- Nagrand NPCs
{false, 6755, 43, 35778, 107457, 'Ancient Blademaster - TSH', },
{false, 6755, 43, 35735, 107457, 'Berserk Shredder', },
{false, 6755, 43, 35923, 118245, 'Hunter Blacktooth', 80.6,30.4},
{false, 6755, 43, 34645, 116805, 'Warmaster Blugthol', 82.8,76.0},
{false, 6755, 43, 35943, 116800, 'Outrider Duretha', 61.9,68.7},
{false, 6755, 43, 35893, 116807, 'Flinthide', 69.9,41.5},
{false, 6755, 43, 35715, 118246, 'Gar\'lua the Wolfmother', 52.2,55.8},
{false, 6755, 43, 35717, 116824, 'Gnarlhoof the Rabid', 66.8,56.2},
{false, 6755, 43, 36159, 107457, 'Graveltooth', 84.1,36.8},
{false, 6755, 43, 35898, 107457, 'Gorepetal', },
{false, 6755, 43, 35714, 107457, 'Greatfeather', 66.6,51.1},
{false, 6755, 43, 35877, 116808, 'Windcaller Korast', 70.6,29.2},
{false, 6755, 43, 35836, 107457, 'The Lunker', },
{false, 6755, 43, 35875, 116765, 'Ophiis', 42.8,49.2},
{false, 6755, 43, 36229, 27388, 'Mr. Pinchy Sr.', 45.5,18.2},
{false, 6755, 43, 35712, 118243, 'Redclaw the Feral', 73.5,58.1},
{false, 6755, 43, 35623, 107457, 'Explorer Rixak', },
{false, 6755, 43, 35900, 107457, 'Ru\'klaa', 57.8,83.7},
{false, 6755, 43, 35932, 116796, 'Malroc Stonesunder', 81.0,59.8},
{false, 6755, 43, 35920, 116814, 'Tur\'aka', 64.8,39.1},
{false, 6755, 43, 35865, 116815, 'Void Ooze/Netherspawn?', 47.6,70.7},
{false, 6755, 43, 35931, 116797, 'Scout Pokhar', 54.8,61.2},
{false, 6755, 43, 35912, 107457, 'Swindler Whitesea', },

--Nagrand events
{false, 6755, 44, 34862, 107457, 'Light the Braziers', },

--talador unseen


--Unknown location/unused vignettes
{false, 1, 42, 32913, 0, 'Arranok\'s Ritual', },
{false, 1, 42, 35964, 0, 'Aruumel\'s Mace', },
{false, 1, 42, 34101, 0, 'Aruumel\'s Worn Mace', },
{false, 1, 42, 34252, 0, 'Barrel of Fish'},
{false, 1, 42, 36937, 0, 'Bladefury Treasure - Burning Blade Cache', },
{false, 1, 42, 33498, 0, 'Bladespire Chef', },
{false, 1, 42, 33447, 0, 'Bladespire Craftsman', },
{false, 1, 42, 33989, 0, 'Blasting Charges - Cave A Cache', },
{false, 1, 42, 33991, 0, 'Blasting Charges - Cave B Cache', },
{false, 1, 42, 33996, 0, 'Blasting Charges - Cave C Cache', },
{false, 1, 42, 33998, 0, 'Blasting Charges - Cave D Cache', },
{false, 1, 42, 33975, 0, 'Blasting Charges - Rubble A', },
{false, 1, 42, 33990, 0, 'Blasting Charges - Rubble B', },
{false, 1, 42, 33995, 0, 'Blasting Charges - Rubble C', },
{false, 1, 42, 33997, 0, 'Blasting Charges - Rubble D', },
{false, 1, 42, 36658, 0, 'Botani Stockpile', },
{false, 1, 42, 35219, 0, 'Burning Front (unused?)', },
{false, 1, 42, 36849, 0, 'Burning Missive A', },
{false, 1, 42, 36850, 0, 'Burning Missive B', },
{false, 1, 42, 36851, 0, 'Burning Missive C', },
{false, 1, 42, 36852, 0, 'Burning Missive D', },
{false, 1, 42, 36853, 0, 'Burning Missive E', },
{false, 1, 42, 36854, 0, 'Burning Missive F', },
{false, 1, 42, 36855, 0, 'Burning Missive G', },
{false, 1, 42, 36856, 0, 'Burning Missive H', },
{false, 1, 42, 34471, 0, 'Bright Coin', },
{false, 1, 42, 33565, 0, 'Chimaera Scale', },
{false, 1, 42, 36453, 0, 'Coinbender\'s Payment', },
{false, 1, 42, 36604, 0, 'Dark Iron Emergency Pack', },
{false, 1, 42, 33575, 0, 'Demonic Cache', },
{false, 1, 42, 36625, 0, 'Discarded Pack', },
{false, 1, 42, 36459, 0, 'Dislodged Saw Blade', },
{false, 1, 42, 34580, 0, 'Draenor Flowerpicker', },
{false, 1, 42, 34581, 0, 'Draenor Flowerpicker Note Found', },
{false, 1, 42, 36879, 0, 'Dusty Lockbox', },
{false, 1, 42, 37170, 0, 'Femur of Improbability', },
{false, 1, 42, 34238, 0, 'Foreman\'s Lunchbox', },
{false, 1, 42, 33925, 0, 'Frostwolf Cache 01', },
{false, 1, 42, 33945, 0, 'Frostwolf Cache 03', },
{false, 1, 42, 33949, 0, 'Frostwolf Cache 07', },
{false, 1, 42, 33016, 0, 'Frostwolf Supply Cache', },
{false, 1, 42, 35580, 0, 'Giant Beehive', },
{false, 1, 42, 36381, 0, 'Gift of Anzu', },
{false, 1, 42, 36386, 0, 'Gift of Anzu (Crossbow)', },
{false, 1, 42, 36388, 0, 'Gift of Anzu (Wand)', },
{false, 1, 42, 36389, 0, 'Gift of Anzu (Mask)', },
{false, 1, 42, 36390, 0, 'Gift of Anzu (Knife)', },
{false, 1, 42, 36392, 0, 'Gift of Anzu (Axe)', },
{false, 1, 42, 35282, 0, 'Glowing Blue Mushroom', },
{false, 1, 42, 34648, 0, 'Gnawed Bone', },
{false, 1, 42, 36621, 0, 'Gnome Canister', },
{false, 1, 42, 36834, 0, 'Gorgrond Ogre Gateway', },
{false, 1, 42, 34713, 0, 'Gronnstalker\'s Cache', },
{false, 1, 42, 35162, 0, 'Grovestrider Nest', },
{false, 1, 42, 36628, 0, 'Hammer of Glory', },
{false, 1, 42, 33885, 0, 'Harbor Treasure', },
{false, 1, 42, 36509, 0, 'Hydra Treasure Pile', },
{false, 1, 42, 34222, 0, 'Iron Horde Blacksmith', },
{false, 1, 42, 34225, 0, 'Iron Horde Slacker', },
{false, 1, 42, 34223, 0, 'Iron Horde Stable Master', },
{false, 1, 42, 36596, 0, 'Iron Horde Weapon Stash', },
{false, 1, 42, 36863, 0, 'Iron Horde Munitions', },
{false, 1, 42, 34907, 0, 'Lagoon Pool/Giant Clam?', },
{false, 1, 42, 34936, 0, 'Lady Sena\'s Extra Stash?', },
{false, 1, 42, 35709, 0, 'Laughing Skull Cache', },
{false, 1, 42, 34235, 0, 'Luminous Shell', },
{false, 1, 42, 33887, 0, 'Mini-War Machine A', },
{false, 1, 42, 33888, 0, 'Mini-War Machine B', },
{false, 1, 42, 33889, 0, 'Mini-War Machine C', },
{false, 1, 42, 33890, 0, 'Mini-War Machine D', },
{false, 1, 42, 36405, 0, 'Offering to the Raven Mother 02', },
{false, 1, 42, 35347, 0, 'Ogre Booty 000', },
{false, 1, 42, 35367, 0, 'Ogre Booty 001', },
{false, 1, 42, 35368, 0, 'Ogre Booty 002', },
{false, 1, 42, 35369, 0, 'Ogre Booty 003', },
{false, 1, 42, 35370, 0, 'Ogre Booty 004', },
{false, 1, 42, 35371, 0, 'Ogre Booty 005', },
{false, 1, 42, 35373, 0, 'Ogre Booty 006', },
{false, 1, 42, 35567, 0, 'Ogre Booty 007', },
{false, 1, 42, 35568, 0, 'Ogre Booty 008', },
{false, 1, 42, 35569, 0, 'Ogre Booty 009', },
{false, 1, 42, 35570, 0, 'Ogre Booty 010', },
{false, 1, 42, 33532, 0, 'Ogre Cache', },
{false, 1, 42, 36885, 0, 'Ogre Waygate A', },
{false, 1, 42, 36886, 0, 'Ogre Waygate B', },
{false, 1, 42, 36903, 0, 'Ogre Waygate C', },
{false, 1, 42, 36904, 0, 'Ogre Waygate D', },
{false, 1, 42, 36905, 0, 'Ogre Waygate E', },
{false, 1, 42, 36906, 0, 'Ogre Waygate F', },
{false, 1, 42, 36340, 0, 'Ogron Plunder', },
{false, 1, 42, 36402, 0, 'Orcish Signaling Horn', },
{false, 1, 42, 36506, 0, 'Orc Super Caster Loot', },
{false, 1, 42, 36118, 0, 'Pile of Rubble', },
{false, 1, 42, 36415, 0, 'Reagent Pouch', },
{false, 1, 42, 36798, 0, 'Rooby Roo', },
{false, 1, 42, 34276, 0, 'Rusted Lockbox', },
{false, 1, 42, 36521, 0, 'Rylak Egg', },
{false, 1, 42, 33930, 0, 'Sabron Stash', },
{false, 1, 42, 35919, 0, 'Sacrifice', },
{false, 1, 42, 36631, 0, 'Sasha\'s Stash', },
{false, 1, 42, 34652, 0, 'Savage Clam', },
{false, 1, 42, 36375, 0, 'Sethekk Idol', },
{false, 1, 42, 36450, 0, 'Sethekk Ritual Brew', },
{false, 1, 42, 33883, 0, 'Shadowmoon Treasure #2', },
{false, 1, 42, 36651, 0, 'SHarvest Crystal', },
{false, 1, 42, 36361, 0, 'Shattered Hand Lockbox', },
{false, 1, 42, 36634, 0, 'Sniper\'s Crossbow', },
{false, 1, 42, 34647, 0, 'Snow-Covered Strongbox', },
{false, 1, 42, 34207, 0, 'Sparkling Pool', },
{false, 1, 42, 36374, 0, 'Statue of Anzu', },
{false, 1, 42, 35600, 0, 'Strange Spore A', },
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
{false, 1, 42, 34239, 0, 'Treasure of Tuurem', },
{false, 1, 42, 36053, 0, 'Unused Wood Pile', },
{false, 1, 42, 33574, 0, 'Vindicator\'s Cache', },
{false, 1, 42, 34760, 0, 'Warchest of Kull\'krosh', },

{false, 1, 43, 36902, 0, 'Aeda Brightdawn', },
{false, 1, 43, 32911, 0, 'Ancient Clefthoof', },
{false, 1, 43, 34191, 0, 'Un\'glok Blackfinger', },
{false, 1, 43, 34197, 0, 'Bloodbloom the Colossus', },
{false, 1, 43, 34224, 0, 'Bloodcleave', },
{false, 1, 43, 34127, 0, 'Mother Bloodtusk', },
{false, 1, 43, 34519, 0, 'Brotoculus', },
{false, 1, 43, 32920, 0, 'Deathtoll', },
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
{false, 1, 43, 34243, 0, 'Rak\'nar Muzzlebash', },
{false, 1, 43, 34160, 0, 'Nixxie the Goblin', },
{false, 1, 43, 34198, 0, 'Roardan', },
{false, 1, 43, 33057, 0, 'Rotbelcher', },
{false, 1, 43, 35244, 0, 'Skagg', },
{false, 1, 43, 32921, 0, 'Skel\'tik the Baleful', },
{false, 1, 43, 34168, 0, 'Stormwave', },
{false, 1, 43, 34171, 0, 'Taladorantula', },
{false, 1, 43, 36877, 0, 'Torommok', },
{false, 1, 43, 34522, 0, 'Ug\'lok the Frozen', },
{false, 1, 43, 36312, 0, 'Sun Age Valarik', },
{false, 1, 43, 36901, 0, 'Vivianne', },

--Mistagged vignettes
{false, 2, 43, 34170, 0, 'Moltnar', },
{false, 2, 43, 35908, 0, 'Stoneshard Broodmother', },
{false, 2, 43, 36942, 0, 'Soulbinder Aedraa', },
{false, 2, 42, 34521, 0, 'Glowing Obsidian Shard (Frostfire Ridge)', },
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
