--[[
VignettesTracker (c) 2014 James 'Kaydeethree' Twyford
Available under the terms of GPLv2

valid commands: /ffr, /smv, /grg, /tld, /soa, /ngd, /unk, /mistagged, /all

set `found` to false to hide it from search results to limit spam in the chat
frame

set myChatFrame to a valid frame that can receive text. kd3 uses ChatFrame4
for this purpose (his data-gathering macros also print to that frame)

all of the vignettes are in one table, sorted first by zone, then by type,
then alphabetically. the unknown section is for vignettes in the data but not
in an obvious zone. mistagged vignettes show up after interacting with a
random object not related to the name of the quest, or for some other
unknown-to-kd3 reason.
--]]

local myChatFrame=ChatFrame4

local function onLoad(self)
 local f=MinimapZoneText
 if not TTF then
  TTF=CreateFrame('Frame')
 end
 TTF:SetScript('OnUpdate',function(s)
  local x,y=GetPlayerMapPosition('player')
  f:SetFormattedText('%2.1f,%2.1f%s',x*100,y*100,GetMinimapZoneText())
  end
  )
 MinimapZoneText:SetFontObject(GameTooltipTextSmall)
end
onLoad()

local vignetteType, zones, vignettes

local function go(zone)
 for i=1,#vignettes do
  if not vignettes[i][1] and vignettes[i][2] == zone and IsQuestFlaggedCompleted(vignettes[i][4]) then
  local t = vignettes[i];
  myChatFrame:AddMessage(
   vignetteType[t[3]].. ' '.. t[4]..' '..t[5]..' @'..(t[6] or '?')..','..(t[7] or '?')
  );
  end
 end
end

vignetteType = {
[42] = 'Treasure',
[43] = 'Creature',
[44] = 'Event',
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

vignettes = { -- {found, zone, icon, questID, 'Vignette name', xCoord, yCoord}
-- Frostfire Ridge objects
{false, 6720, 42, 33498, 'Bladespire Chef', },
{false, 6720, 42, 33447, 'Bladespire Craftsman', },
{false, 6720, 42, 33989, 'Blasting Charges - Cave A Cache', },
{false, 6720, 42, 33991, 'Blasting Charges - Cave B Cache', },
{false, 6720, 42, 33996, 'Blasting Charges - Cave C Cache', },
{false, 6720, 42, 33998, 'Blasting Charges - Cave D Cache', },
{false, 6720, 42, 33975, 'Blasting Charges - Rubble A', },
{false, 6720, 42, 33990, 'Blasting Charges - Rubble B', },
{false, 6720, 42, 33995, 'Blasting Charges - Rubble C', },
{false, 6720, 42, 33997, 'Blasting Charges - Rubble D', },
{false, 6720, 42, 33925, 'Frostwolf Cache 01', },
{false, 6720, 42, 33945, 'Frostwolf Cache 03', },
{false, 6720, 42, 33949, 'Frostwolf Cache 07', },
{false, 6720, 42, 33016, 'Frostwolf Supply Cache', },
{false, 6720, 42, 34713, 'Gronnstalker\'s Cache', },
{false, 6720, 42, 35282, 'Glowing Blue Mushroom', },
{false, 6720, 42, 34648, 'Gnawed Bone', },
{false, 6720, 42, 34907, 'Lagoon Pool/Giant Clam?', },
{false, 6720, 42, 34936, 'Lady Sena\'s Extra Stash?', },
{false, 6720, 42, 35347, 'Ogre Booty 000', },
{false, 6720, 42, 35367, 'Ogre Booty 001', },
{false, 6720, 42, 35368, 'Ogre Booty 002', },
{false, 6720, 42, 35369, 'Ogre Booty 003', },
{false, 6720, 42, 35370, 'Ogre Booty 004', },
{false, 6720, 42, 35371, 'Ogre Booty 005', },
{false, 6720, 42, 35373, 'Ogre Booty 006', },
{false, 6720, 42, 35567, 'Ogre Booty 007', },
{false, 6720, 42, 35568, 'Ogre Booty 008', },
{false, 6720, 42, 35569, 'Ogre Booty 009', },
{false, 6720, 42, 35570, 'Ogre Booty 010', },
{false, 6720, 42, 33532, 'Ogre Cache', },
{false, 6720, 42, 33930, 'Sabron Stash', },
{false, 6720, 42, 34652, 'Savage Clam', },
{false, 6720, 42, 34647, 'Snow-Covered Strongbox', },
{false, 6720, 42, 34557, 'Treasure Map A', },
{false, 6720, 42, 36464, 'Treasure Mab B', },
{false, 6720, 42, 36465, 'Treasure Map C', },
{false, 6720, 42, 36466, 'Treasure Map D', },
{false, 6720, 42, 36467, 'Treasure Map E', },
{false, 6720, 42, 36468, 'Treasure Map F', },
{false, 6720, 42, 33499, 'Time-Warped Ogre', },
{false, 6720, 42, 33649, 'Torched Iron Horde Scout', },
{false, 6720, 42, 36053, 'Unused Wood Pile', },

{false, 6720, 42, 33916, 'Arena Master\'s War Horn', 23.2,25.0},
{false, 6720, 42, 34520, 'Burning Pearl', 42.4,19.6},
{false, 6720, 42, 33940, 'Crag-Leaper\'s Cache', 42.7,31.8},
{false, 6720, 42, 33531, 'Clumsy Cragmaul Brute', 50.2,18.7},
{false, 6720, 42, 34473, 'Envoy\'s Satchel', 40.9,20.1},
{false, 6720, 42, 34841, 'Forgotten Supplies', 43.7,55.6},
{false, 6720, 42, 34968, 'Forgotten Supplies', 43.7,55.6},
{false, 6720, 42, 34507, 'Frozen Frostwolf Axe', 24.2,48.6},
{false, 6720, 42, 33948, 'Goren Leftovers', 66.7,26.4},
{false, 6720, 42, 33947, 'Grimfrost Treasure', 68.1,45.9},
{false, 6720, 42, 33017, 'Iron Horde Supplies', 68.9,69.1},
{false, 6720, 42, 34937, 'Lady Sena\'s Other Materials Stash', 51.4,66.8},
{false, 6720, 42, 33926, 'Lagoon Pool', 21.7,9.6},
{false, 6720, 42, 34642, 'Lucky Coin', 19.2,12.0},
{false, 6720, 42, 33961, 'Mysterious Flower, Frostfire Ridge', 71.6,69.6},
{false, 6720, 42, 33502, 'Obsidian Petroglyph', 38.3,37.8},
{false, 6720, 42, 34931, 'Pale Loot Sack', 21.7,50.8},
{false, 6720, 42, 34967, 'Raided Loot', 37.3,59.2},
{false, 6720, 42, 34641, 'Sealed Jug', 9.8,45.3},
{false, 6720, 42, 33977, 'Shamanstone, Blessing of the Wolf', 27.1,36.5},
{false, 6720, 42, 33979, 'Shamanstone, Buffeting Galefury', 65.2,79.1},
{false, 6720, 42, 33980, 'Shamanstone, Ogrish Fortitude', 43.9,12.3},
{false, 6720, 42, 33978, 'Shamanstone, Spirit of the Wolf', 17.5,56.7},
{false, 6720, 42, 33981, 'Shamanstone, Touched by Fire', 37.0,33.2},
{false, 6720, 42, 33982, 'Shamanstone, Touched by Ice', 60.4,13.7},
{false, 6720, 42, 33500, 'Slave\'s Stash', 27.7,42.8},
{false, 6720, 42, 34649, 'Smoldering True Iron Deposit', 36.3,32.3},
{false, 6720, 42, 33501, 'Spectator\'s Chest', 24.2,27.1},
{false, 6720, 42, 33942, 'Supply Dump', 16.1,49.7},
{false, 6720, 42, 33946, 'Survivalist\'s Cache', 64.7,25.7},
{false, 6720, 42, 32803, 'Thunderlord Cache', 34.2,23.5},
{false, 6720, 42, 33440, 'Time-Warped Bladespire Brute, Falling Lower', 30.5,50.8},
{false, 6720, 42, 33497, 'Time-Warped Bladespire Brute, Falling Higher', 30.5,50.9},
{false, 6720, 42, 33439, 'Time-Warped Bladespire Brute, Running', 30.3,50.6},
{false, 6720, 42, 33438, 'Time-Warped Bladespire Primalist', 30.3,51.2},
{false, 6720, 42, 33505, 'Wiggling Egg', 64.4,65.8},
{false, 6720, 42, 33525, 'Young Orc Traveler', 54.8,35.5},
{false, 6720, 42, 33525, 'Young Orc Woman', 63.4,14.7},

--Frostfire Ridge npcs
{false, 6720, 43, 32911, 'Ancient Clefthoof', },
{false, 6720, 43, 32913, 'Arranok\'s Ritual', },
{false, 6720, 43, 34519, 'Brotoculus', },
{false, 6720, 43, 32920, 'Deathtoll', },
{false, 6720, 43, 34382, 'Grand Warlock Duress', },
{false, 6720, 43, 34517, 'Gargantuan Frostbeak', },
{false, 6720, 43, 34851, 'Gruuk?', },
{false, 6720, 43, 32921, 'Skel\'tik the Baleful', },
{false, 6720, 43, 34522, 'Ug\'lok the Frozen', },

{false, 6720, 43, 34497, 'Breathless', 27.8,50.3},
{false, 6720, 43, 32941, 'Canyon Icemother', 33.5,23.1},
{false, 6720, 43, 34843, 'Chillfang', 41.4,68.3},
{false, 6720, 43, 33014, 'Cindermaw', 40.6,47.1},
{false, 6720, 43, 34129, 'Coldstomp the Griever', 25.9,55.2},
{false, 6720, 43, 34131, 'Coldtusk', 54.2,67.7},
{false, 6720, 43, 34477, 'Cyclonic Fury', 67,78},
{false, 6720, 43, 34130, 'Giantstalker Hunting Party', 58,32},
{false, 6720, 43, 34132, 'Scout Goreseeker', 76.5,63.5},
{false, 6720, 43, 33512, 'Gorg\'ak the Lava Guzzler', 72.5,22.8},
{false, 6720, 43, 34865, 'Grutush the Pillager', 38.6,62.9},
{false, 6720, 43, 34825, 'Gruuk', 51.8,65.1},
{false, 6720, 43, 34839, 'Gurun', 47.1,55.2},
{false, 6720, 43, 34708, 'Jehil the Climber', 61.8,26.6},
{false, 6720, 43, 32918, 'Giant-Slayer Kul', 54.7,22.3},
{false, 6720, 43, 33938, 'Primalist Mur\'og', 37.0,33.8},
{false, 6720, 43, 34470, 'Pale Fishmonger', 28.3,66.6},
{false, 6720, 43, 33843, 'Broodmother Reeg\'ak', 65.6,31.4},
{false, 6720, 43, 34133, 'The Beater', 26.9,31.9},
{false, 6720, 43, 34361, 'The Bone Crawler', 70,30},
{false, 6720, 43, 34559, 'Yaga the Scarred', 40.6,27.6},

-- Frostfire Ridge events
{false, 6720, 44, 34476, 'Frozen Treasure', 57.2,52.1},
{false, 6720, 44, 33504, 'Firefury Stone and Firefury Giant', 71.7,47.0},
{false, 6720, 44, 33011, 'Grizzled Frostwolf Veteran', 45.4,50.3},
{false, 6720, 44, 33511, 'Sacrifice Pit', },

-- Shadowmoon Valley objects
{false, 6719, 42, 35581, 'Alchemist\'s Satchel', 54.9,45.0},
{false, 6719, 42, 35584, 'Ancestral Greataxe', 52.8,48.4},
{false, 6719, 42, 33869, 'Armored Elekk Tusk', 41.4,27.9},
{false, 6719, 42, 33584, 'Ashes of A\'kumbo', 37.8,44.3},
{false, 6719, 42, 33867, 'Astrologer\'s Box', 49.3,37.6},
{false, 6719, 42, 33046, 'Beloved\'s Offering', 36.8,41.4},
{false, 6719, 42, 33613, 'Bubbling Cauldron',37.2,23.1 },
{false, 6719, 42, 33569, 'Carved Dinking Horn', 33.5,39.6},
{false, 6719, 42, 34174, 'Fantastic Fish', 26.5,5.7},
{false, 6719, 42, 33891, 'Giant Moonwillow Cone', 34.5,46.2},
{false, 6719, 42, 35798, 'Glowing Cave Blossom', 48.7,47.5},
{false, 6719, 42, 33614, 'Greka\'s Urn', 38.5,43.0},
{false, 6719, 42, 33564, 'Hanging Satchel', 47.1,46.0},
{false, 6719, 42, 33041, 'Iron Horde Cargo Shipment', 42.1,61.2},
{false, 6719, 42, 33567, 'Iron Horde Tribute', 37.5,59.2},
{false, 6719, 42, 33568, 'Kaliri Egg', 57.9,45.3},
{false, 6719, 42, 35530, 'Lunarfall Egg', 30.2,19.9},
{false, 6719, 42, 35603, 'Mikkal\'s Chest', 58.9,21.9},
{false, 6719, 42, 33570, 'Mushroom Covered Chest or Shadowmoon Exile Treasure', 52.9,24.9, 45.8,24.6},
{false, 6719, 42, 33962, 'Mysterious Flower, Shadowmoon Valley', },
{false, 6719, 42, 36507, 'Orc Skeleton', 67.0,33.5},
{false, 6719, 42, 33384, 'Peaceful Offering South', 44.5,63.6},
{false, 6719, 42, 33610, 'Peaceful Offering East', 45.2,60.5},
{false, 6719, 42, 33611, 'Peaceful Offering West', 43.8,60.6},
{false, 6719, 42, 33612, 'Peaceful Offering North', 44.5,59.1},
{false, 6719, 42, 35381, 'Pippers\' Buried Supplies 1', 30.0,18.3},
{false, 6719, 42, 35382, 'Pippers\' Buried Supplies 2', 30.9,17.7},
{false, 6719, 42, 35383, 'Pippers\' Buried Supplies 3', 28.9,15.6},
{false, 6719, 42, 35384, 'Pippers\' Buried Supplies 4', 30.7,20.6},
{false, 6719, 42, 33886, 'Ronokk\'s Belongings', 31.3,39.1},
{false, 6719, 42, 33572, 'Rotting Basket', 22.9,33.8},
{false, 6719, 42, 33573, 'Rovo\'s Dagger', 36.7,44.5},
{false, 6719, 42, 33571, 'Shadowmoon Sacrifical Dagger', 30.0,45.4},
{false, 6719, 42, 35289, 'Spark\'s Stolen Supplies', 30.9,12.8},
{false, 6719, 42, 35280, 'Stolen Treasure', 27.1,2.5},
{false, 6719, 42, 35677, 'Sunken Fishing Boat', 37.2,26.0},
{false, 6719, 42, 35279, 'Sunken Treasure', 28.8,7.2},
{false, 6719, 42, 33540, 'Uzko\'s Knickknacks', 35.9,40.9},
{false, 6719, 42, 33866, 'Veema\'s Herb Bag', 34.2,43.5},
{false, 6719, 42, 33566, 'Waterlogged Chest', 39.2,83.9},

--Shadowmoon Valley NPCs
{false, 6719, 43, 33061, 'Amaukwa', 37,35},
{false, 6719, 43, 35731, 'Ba\'ruun', 52.8,16.5},
{false, 6719, 43, 35281, 'Bahameye', 29,5},
{false, 6719, 43, 33064, 'Dark Emanation', 48.5,43.3},
{false, 6719, 43, 35555, 'Darktalon', 49.6,41.8},
{false, 6719, 43, 35725, 'Faebright', 61.7,61.6},
{false, 6719, 43, 33664, 'Gorum', 21.6,33.1},
{false, 6719, 43, 35448, 'Darkmaster Go\'vid', 40,80},
{false, 6719, 43, 35558, 'Hypnocroak', 37.4,49.0},
{false, 6719, 43, 35909, 'Insha\'tar', 57.4,48.6},
{false, 6719, 43, 35847, 'Voidseer Kalurg', },
{false, 6719, 43, 33043, 'Killmaw', 40.8,44.6},
{false, 6719, 43, 33055, 'Leaf-Reader Kurri', 37.7,14.3},
{false, 6719, 43, 33039, 'Ku\'targ the Voidseer', 32.5,35.1},
{false, 6719, 43, 33642, 'Mother Om\'ra', 44.0,57.7},
{false, 6719, 43, 35553, 'Rai\'vosh ',48.8,22.7},
{false, 6719, 43, 34068, 'Rockhoof', 52.7,50.8},
{false, 6719, 43, 33057, 'Rotbelcher', },
{false, 6719, 43, 36568, 'Malgosh Shadowkeeper', },
{false, 6719, 43, 35732, 'Shinri', 61.2,49.4},
{false, 6719, 43, 36880, 'Sneevel', },
{false, 6719, 43, 35523, 'Morva Soultwister', 38.6,70.4},
{false, 6719, 43, 35906, 'Mad "King" Sporeon', 45.0,20.8},
{false, 6719, 43, 36431, 'Soul-Twister Torek', },
{false, 6719, 43, 35688, 'Enavra Varandi', 67.9,63.9},
{false, 6719, 43, 33640, 'Veloss', 21.7,20.8},
{false, 6719, 43, 33643, 'Venomshade', 54.8,70.2},
{false, 6719, 43, 33389, 'Yggdrel', 48,66},

-- Shadowmoon Valley events
{false, 6719, 44, 33038, 'Embaari Defense Crystal', 42.9,40.3},
{false, 6719, 44, 34743, 'The Crystal Blade of Torvath', 61.7,67.9},

-- Gorgrond Arena-only treasures
{false, 6721, 42, 36721, 'arena2', },
{false, 6721, 42, 36736, 'arena15', },
{false, 6721, 42, 36737, 'arena16', },
{false, 6721, 42, 36739, 'arena18', },
{false, 6721, 42, 36781, 'arena20', },
{false, 6721, 42, 36782, 'arena21', },
{false, 6721, 42, 36783, 'arena22', },
{false, 6721, 42, 36789, 'arena25', },
{false, 6721, 42, 36730, 'Arena: Aged Stone Container, Crushfang\'s End', 48.1,55.2},
{false, 6721, 42, 36784, 'Arena: Aged Stone Container, Deeproot', 45.7,88.2},
{false, 6721, 42, 36723, 'Arena: Aged Stone Container, Fissure of Fury', 43.2,45.7},
{false, 6721, 42, 36726, 'Arena: Aged Stone Container, Gorgorek\'s Fall', 41.8,45.3},
{false, 6721, 42, 36734, 'Arena: Aged Stone Container, Steamburst Cauldron', 51.3,40.6},
{false, 6721, 42, 36722, 'Arena: Aged Stone Container, Valley of Destruction', 45.6,49.3},
{false, 6721, 42, 36787, 'Arena: Ancient Ogre Cache, Blook\'s Overlook', 42.2,93.1},
{false, 6721, 42, 36740, 'Arena: Ancient Ogre Cache, Iyun Weald', 61.5,58.5},
{false, 6721, 42, 36733, 'Arena: Ancient Ogre Cache, Gronn Canyon', 45.5,43.0},
{false, 6721, 42, 36727, 'Arena: Ancient Titan Chest, Brimstone Springs', 42.2,52.0},
{false, 6721, 42, 36731, 'Arena: Ancient Titan Chest, Drywind Gorge', 43.3,51.7},
{false, 6721, 42, 36735, 'Arena: Ancient Titan Chest, Gronn Canyon', 48.0,40.0},
{false, 6721, 42, 36738, 'Arena: Ancient Titan Chest, Mistcreep Mire', 50.3,66.6},
{false, 6721, 42, 36710, 'Arena: Ancient Titan Chest, Steamscar Rise', 49.4,50.9},
{false, 6721, 42, 36728, 'Arena: Obsidian Crystal Formation, Brimstone Springs', 41.8,58.9},
{false, 6721, 42, 36729, 'Arena: Obsidian Crystal Formation, Stonemaul Arena', 42.1,64.3},
{false, 6721, 42, 36732, 'Arena: Obsidian Crystal Formation, Valley of Destruction', 44.2,46.6},

-- Gorgrond Mill-only treasures
{false, 6721, 42, 35965, 'mill3', },
{false, 6721, 42, 35966, 'mill4', },
{false, 6721, 42, 35967, 'mill5', },
{false, 6721, 42, 35968, 'mill6', },
{false, 6721, 42, 35971, 'mill7', },
{false, 6721, 42, 35979, 'mill9', },
{false, 6721, 42, 35980, 'mill10', },
{false, 6721, 42, 35981, 'mill11', },
{false, 6721, 42, 35984, 'mill13', },
{false, 6721, 42, 36001, 'mill14', },
{false, 6721, 42, 36003, 'mill15', },
{false, 6721, 42, 36019, 'mill17', },
{false, 6721, 42, 36714, 'mill20', },
{false, 6721, 42, 36716, 'mill22', },
{false, 6721, 42, 36718, 'mill24', },
{false, 6721, 42, 36720, 'mill25', },
{false, 6721, 42, 35701, 'Mill1A: Aged Stone Container?, Dionor\'s Demise', 49.1,48.5},
{false, 6721, 42, 36712, 'Mill1B: Aged Stone Container?, Dionor\'s Demise', 49.1,48.5},
{false, 6721, 42, 35952, 'Mill2: Aged Stone Container?, Dionor\'s Demise', 49.1,48.5},
{false, 6721, 42, 36717, 'Mill: Aged Stone Container, Valley of Destruction', 47.5,43.6},
{false, 6721, 42, 35982, 'Mill: Botani Essence Seed', 42.0,81.6},
{false, 6721, 42, 36430, 'Mill: Mysterious Petrified Pod, Iyun Weald', 63.3,57.2},
{false, 6721, 42, 36715, 'Mill: Mysterious Petrified Pod, Overlook Ruins', 51.7,69.1},
{false, 6721, 42, 36015, 'Mill: Mysterious Petrified Pod, Tangleheart', 60.5,72.8},
{false, 6721, 42, 35975, 'Mill: Remains of Explorer Engieer Toldirk Ashlamp', 46.0,93.6},
{false, 6721, 42, 36713, 'Mill: Unknown Petrified Egg', 53.0,79.1},

-- Gorgrond open treasures
{false, 6721, 42, 34147, 'grg1', },
{false, 6721, 42, 34149, 'grg2', },
{false, 6721, 42, 34151, 'grg3', },
{false, 6721, 42, 34153, 'grg4', },
{false, 6721, 42, 34146, 'grg5', },
{false, 6721, 42, 34155, 'grg6', },
{false, 6721, 42, 34152, 'grg7', },
{false, 6721, 42, 34172, 'grg8', },
{false, 6721, 42, 34173, 'grg9', },
{false, 6721, 42, 34176, 'grg11', },
{false, 6721, 42, 34201, 'grg13', },
{false, 6721, 42, 34177, 'grg14', },
{false, 6721, 42, 34219, 'grg15', },
{false, 6721, 42, 34195, 'grg16', },
{false, 6721, 42, 34206, 'grg17', },
{false, 6721, 42, 34179, 'grg18', },
{false, 6721, 42, 34210, 'grg19', },
{false, 6721, 42, 34211, 'grg20', },
{false, 6721, 42, 34214, 'grg21', },
{false, 6721, 42, 34215, 'grg22', },
{false, 6721, 42, 34218, 'grg23', },
{false, 6721, 42, 34224, 'Boodcleave', },
{false, 6721, 42, 34412, 'Gnarljaw', },
{false, 6721, 42, 34222, 'Iron Horde Blacksmith', },
{false, 6721, 42, 34225, 'Iron Horde Slacker', },
{false, 6721, 42, 34223, 'Iron Horde Stable Master', },
{false, 6721, 42, 34411, 'King Slime', },
{false, 6721, 42, 35709, 'Laughing Skull Cache', },
{false, 6721, 42, 33966, 'Mysterious Flower, Gorgrond', },
{false, 6721, 42, 37170, 'Femur of Improbability', },
{false, 6721, 42, 36118, 'Pile of Rubble', },
{false, 6721, 42, 35056, 'Horned Skull', 42.6,46.8 },
{false, 6721, 42, 36618, 'Iron Supply Chest', 43.7,42.5},
{false, 6721, 42, 34241, 'Ockbar\'s Pack', 43.0,93.0},
{false, 6721, 42, 36605, 'Remains of Balldir Deeprock', 57.8,56.0},
{false, 6721, 42, 36654, 'Remains of Balik Orecrusher', 53.1,74.5},
{false, 6721, 42, 34940, 'Strange Looking Dagger', 53.0,80.0},
{false, 6721, 42, 36610, 'Suntouched Spear', 45.7,49.7},
{false, 6721, 42, 36203, 'Warm Goren Egg', 48.9,47.3},

-- Gorgrond NPCs
{false, 6721, 43, 34726, 'Mother Araneae', 53.5,78.3},
{false, 6721, 43, 35335, 'Bashiok', 40.2,79.0},
{false, 6721, 43, 36597, 'Berthora', 39.4,74.6},
{false, 6721, 43, 34197, 'Bloodbloom the Colossus', },
{false, 6721, 43, 34127, 'Mother Bloodtusk', },
{false, 6721, 43, 35503, 'Char the Burning', 53.5,44.7},
{false, 6721, 43, 35996, 'Depthroot', },
{false, 6721, 43, 00000, 'Gelgor of the Blue Flame', 41.9,45.4},
{false, 6721, 43, 34231, 'Giant Snake', },
{false, 6721, 43, 36204, 'Gorger', 46.2,50.9},
{false, 6721, 43, 36186, 'Greldrok the Cunning', 46.8,43.1},
{false, 6721, 43, 34162, 'Icklarv', },
{false, 6721, 43, 34143, 'Kal\'rak the Drunk', },
{false, 6721, 43, 35910, 'Stomper Kreego', 38.2,66.3},
{false, 6721, 43, 36178, 'Mandrakor', 50.8,53.2},
{false, 6721, 43, 34160, 'Nixxie the Goblin', },
{false, 6721, 43, 34243, 'Rak\'nar Muzzlebash', },
{false, 6721, 43, 36600, 'Riptar', 37.6,81.5},
{false, 6721, 43, 34198, 'Roardan', },
{false, 6721, 43, 36393, 'Rolkor', 47.7,41.2},
{false, 6721, 43, 00000, 'Hive Queen Skrikka', 52.4,70.1},
{false, 6721, 43, 36858, 'Steeltusk', },
{false, 6721, 43, 36837, 'Stompalupagus', 54.8,71.1},
{false, 6721, 43, 34168, 'Stormwave', },
{false, 6721, 43, 36394, 'Sulfurious', 40.2,60.6},
{false, 6721, 43, 36656, 'Sunclaw', 44.8,92.1},
{false, 6721, 43, 36794, 'Sylldross', 62.9,61.4},
{false, 6721, 43, 34191, 'Un\'glok Blackfinger', },

-- Talador misc
{false, 6662, 42, 34199, 'Anchorite\'s Sojurn', },
{false, 6662, 42, 34101, 'Aruumel\'s Worn Mace', },
{false, 6662, 42, 36937, 'Bladefury Treasure - Burning Blade Cache', },
{false, 6662, 42, 35219, 'Burning Front', },
{false, 6662, 42, 36849, 'Burning Missive A', },
{false, 6662, 42, 36850, 'Burning Missive B', },
{false, 6662, 42, 36851, 'Burning Missive C', },
{false, 6662, 42, 36852, 'Burning Missive D', },
{false, 6662, 42, 36853, 'Burning Missive E', },
{false, 6662, 42, 36854, 'Burning Missive F', },
{false, 6662, 42, 36855, 'Burning Missive G', },
{false, 6662, 42, 36856, 'Burning Missive H', },
{false, 6662, 42, 34220, 'Echo of Murmur A', },
{false, 6662, 42, 34221, 'Echo of Murmur B', },
{false, 6662, 42, 34128, 'Four Friends complete A', },
{false, 6662, 42, 34134, 'Four Friends complete H', },
{false, 6662, 42, 34115, 'Four Friends found H', },
{false, 6662, 42, 34116, 'Girl 1 found H', },
{false, 6662, 42, 34117, 'Girl 2 found H', },
{false, 6662, 42, 34118, 'Guy 1 found B', },
{false, 6662, 42, 34119, 'Guy 2 found B', },
{false, 6662, 42, 35220, 'Kharazos the Triumphant', },
{false, 6662, 42, 35244, 'Skagg', },
{false, 6662, 42, 34207, 'Sparkling Pool', },
{false, 6662, 42, 34171, 'Taladorantula', },
{false, 6662, 42, 34204, 'Wandering Vindicator - kill', 70.0,33.2},
{false, 6662, 42, 34205, 'Wandering Vindicator - loot', 70.0,33.2},
{false, 6662, 42, 34140, 'Yuuri\'s Gift', },

--Talador objects
{false, 6662, 42, 34259, 'Bonechewer Remnants', 33.3,76.8},
{false, 6662, 42, 33931, 'Deceptia getting blown up', 58.8,12.1},
{false, 6662, 42, 33933, 'Deceptia\'s Smoldering Boots', 58.1,12.1},
{false, 6662, 42, 34249, 'Farmer\'s Bounty', 35.4,96.6},
{false, 6662, 42, 36829, 'Gift of the Ancients', 28.4,74.2},
{false, 6662, 42, 34251, 'Iron Box', 64.6,79.2},
{false, 6662, 42, 34233, 'Jug of Aged Ironwine', 65.5,11.4},
{false, 6662, 42, 34290, 'Ketya\'s Stash', 54.0,27.7},
{false, 6662, 42, 33960, 'Mysterious Flower, Talador', 50.7,30.0},
{false, 6662, 42, 34263, 'Pure Crystal Dust', 78.2,14.7},
{false, 6662, 42, 34254, 'Soulbinder\'s Reliquary', 39.5,55.1},
{false, 6662, 42, 34255, 'Webbed Sac', 65.4,88.6},

--Talador NPCs
{false, 6662, 43, 34668, 'Burning Front rare demon', 56.7,62.5},
{false, 6662, 43, 35018, 'Felbark', 50.4,83.5},
{false, 6662, 43, 34165, 'Cro Fleshrender', 37.4,70.4},
{false, 6662, 43, 34145, 'Frenzied Golem', 46.4,54.8}, 
{false, 6662, 43, 34483, 'Galzomar', },
{false, 6662, 43, 34929, 'Gennadian', 67.5,80.8},
{false, 6662, 43, 34189, 'Glimmerwing', 32.7,63.2},
{false, 6662, 43, 34142, 'Dr. Gloom', 68.2,16.0},
{false, 6662, 42, 36919, 'A Restless Crate and Grrbrrgle', 22.2,74.2},
{false, 6662, 43, 34185, 'Hammertooth', 62.6,45.4},
{false, 6662, 43, 34167, 'Hen-Mother Hami', 77,50},
{false, 6662, 43, 34208, 'Lo\'marg Jawcrusher', 49.2,92.3},
{false, 6662, 43, 34498, 'Klikixx', 66.8,85.3},
{false, 6662, 43, 34589, 'No\'losh', 85.9,29.4},
{false, 6662, 43, 34196, 'Ra\'kahn', 59.5,60.0, },
{false, 6662, 43, 34671, 'Shirzir', 43.0,54.1},
{false, 6662, 43, 35491, 'Underseer Bloodmane', 63.8,20.7},
{false, 6662, 43, 34945, 'Underseer Bloodmane (Prize?)', 63.8,20.7},
{false, 6662, 43, 34148, 'Viperlash', 37.6,74.9},
{false, 6662, 43, 34135, 'Yazheera the Incinerator', 53.8,25.6},

--Talador events
{true, 6662, 44, 34184, 'Aarko - Killed Surok Darkstorm', 36.5,96.1},
{true, 6662, 44, 34182, 'Aarko - Looted Treasure', 36.5,96.1},
{false, 6662, 43, 34114, 'Four Friends found A', },
{false, 6662, 43, 34110, 'Girl 1 found A', },
{false, 6662, 43, 34111, 'Girl 2 found A', },
{false, 6662, 43, 34112, 'Guy 1 found A', },
{false, 6662, 43, 34113, 'Guy 2 found A', },

-- Spires of Arak objects
{false, 6722, 42, 36453, 'Coinbender\'s Payment', },
{false, 6722, 42, 36459, 'Dislodged Saw Blade', },
{false, 6722, 42, 36381, 'Gift of Anzu', },
{false, 6722, 42, 36386, 'Gift of Anzu (Crossbow)', },
{false, 6722, 42, 36388, 'Gift of Anzu (Wand)', },
{false, 6722, 42, 36389, 'Gift of Anzu (Mask)', },
{false, 6722, 42, 36390, 'Gift of Anzu (Knife)', },
{false, 6722, 42, 36392, 'Gift of Anzu (Axe)', },
{false, 6722, 42, 36416, 'Misplaced Scroll', 52,42},
{false, 6722, 42, 33964, 'Mysterious Flower, Spires of Arak', },
{false, 6722, 42, 36405, 'Offering to the Raven Mother 02', },
{false, 6722, 42, 36340, 'Ogron Plunder', },
{false, 6722, 42, 36402, 'Orcish Signaling Horn', },
{false, 6722, 42, 36446, 'Outcast\'s Pouch', 46.9,34.0},
{false, 6722, 42, 36415, 'Reagent Pouch', },
{false, 6722, 42, 36798, 'Rooby Roo', },
{false, 6722, 42, 36375, 'Sethekk Idol', },
{false, 6722, 42, 36450, 'Sethekk Ritual Brew', },
{false, 6722, 42, 36361, 'Shattered Hand Lockbox', },
{false, 6722, 42, 36374, 'Statue of Anzu', },
{false, 6722, 42, 36424, 'Sun-Touched Cache C', },
{false, 6722, 42, 36463, 'Taylor\'s Coffer Key (unused?)', },

{false, 6722, 42, 36458, 'Abandoned Mining Pick', 40.6,55.0},
{false, 6722, 42, 36462, 'Admiral Taylor\'s Coffer', 36.2,54.5},
{false, 6722, 42, 36445, 'Assassin\'s Spear', 49.2,37.2},
{false, 6722, 42, 35627, 'Basket of Arakkoa Goods', 40.2,60.3},
{false, 6722, 42, 36367, 'Campaign Contributions', 55.5,90.9},
{false, 6722, 42, 36454, 'Drypeak Mushrooms', 63.6,67.4},
{false, 6722, 42, 36418, 'Ephial\'s Dark Grimoire', 36.6,57.9},
{false, 6722, 42, 36395, 'Elixir of Shadow Sight, Skettis', 43.9,15.0},
{false, 6722, 42, 36397, 'Elixir of Shadow Sight, Veil Akraz', 43.8,24.6},
{false, 6722, 42, 36398, 'Elixir of Shadow Sight, Sethekk Hollow', 69.2,43.3},
{false, 6722, 42, 36399, 'Elixir of Shadow Sight, Bloodmane Valley', 49.1,62.6},
{false, 6722, 42, 36400, 'Elixir of Shadow Sight, Shadow\'s Vigil', 55.6,22.1},
{false, 6722, 42, 36401, 'Elixir of Shadow Sight, Bloodmane Pridelands', 53.1,84.5},
{false, 6722, 42, 35871, 'Escape Pod and Nizzix\'s Chest', 60.9,88.0},
{false, 6722, 42, 36246, 'Fractured Sunstone', 50.5,22.1},
{false, 6722, 42, 36420, 'Garrison Resources', 37.2,47.5},
{false, 6722, 42, 36451, 'Garrison Workman\'s Hammer', 41.9,50.5},
{false, 6722, 42, 36247, 'Lost Herb Satchel', 50.8,28.7},
{false, 6722, 42, 36411, 'Lost Ring', 47.8,36.1},
{false, 6722, 42, 36244, 'Misplaced Scrolls', 42.7,18.3},
{false, 6722, 42, 36403, 'Offering to the Raven Mother, Behind Swarmleaf', 53.3,55.5},
{false, 6722, 42, 36406, 'Offering to the Raven Mother, Bloodmane Valley North', 48.9,54.7},
{false, 6722, 42, 36407, 'Offering to the Raven Mother, Bloodmane Valley South', 51.9,64.6},
{false, 6722, 42, 36410, 'Offering to the Raven Mother, Bloodmane Valley East', 61.0,63.8},
{false, 6722, 42, 36243, 'Outcast\'s Belongings, Terokkar Pass', 36.8,17.2},
{false, 6722, 42, 36447, 'Outcast\'s Belongings, Veil Akraz', 42.2,21.7},
{false, 6722, 42, 36245, 'Relics of the Outcasts, Skettis', 43.0,16.4},
{false, 6722, 42, 36354, 'Relics of the Outcasts, Veil Terokk', 46.0,44.2},
{false, 6722, 42, 36355, 'Relics of the Outcasts, Veil Akraz', 43.2,27.3},
{false, 6722, 42, 36356, 'Relics of the Outcasts, Sethekk Hollow', 67.4,39.8},
{false, 6722, 42, 36359, 'Relics of the Outcasts, Veil Zekk', 60.2,53.9},
{false, 6722, 42, 36360, 'Relics of the Outcasts, Nest of the Ravenspeakers', 51.9,48.9},
{false, 6722, 42, 36657, 'Roody\'s Roo', 37.4,50.6},
{false, 6722, 42, 36377, 'Rukhmar\'s Image', 44.3,12.0},
{false, 6722, 42, 36366, 'Sailor Zazzuk\'s 180-Proof Rum', 59.2,90.6},
{false, 6722, 42, 36362, 'Shattered Hand Cache', 56.3,28.8},
{false, 6722, 42, 36444, 'Shattered Hand Explosives', 50.3,25.8},
{false, 6722, 42, 36363, 'Shattered Hand Spoils', 58.3,36.6},
{false, 6722, 42, 36456, 'Shredder Parts', 60.9,84.6},
{false, 6722, 42, 36433, 'Smuggled Apexis Artifacts', 56.3,45.3},
{false, 6722, 42, 36365, 'Spray-O-Matic 5000 XT', 59.6,81.3},
{false, 6722, 42, 36421, 'Sun-Touched Cache, mid level', 34.1,27.5},
{false, 6722, 42, 36422, 'Sun-Touched Cache, upper level', 33.3,27.3},
{false, 6722, 42, 36364, 'Toxicfang Venom', 54.4,32.5},
{false, 6722, 42, 36455, 'Waterlogged Satchel', 66.5,56.6},

-- Spires of Arak NPCs
{false, 6722, 43, 36312, 'Sun Age Valarik', },
{false, 6722, 43, 35599, 'Blade-Dancer Aeryx', 46.8,23.3},
{false, 6722, 43, 36283, 'Blightglow', 65.2,67.8},
{false, 6722, 43, 36291, 'Betsi Boombasket', 58.3,84.5},
{false, 6722, 43, 36279, 'Poisonmaster Bortusk', 59.5,37.5},
{false, 6722, 43, 36129, 'Nas Dunberlin', 36.3,52.6},
{false, 6722, 43, 36303, 'Eyeless', 49.9,29.8},
{false, 6722, 43, 36297, 'Festerbloom', 55.2,35.6},
{false, 6722, 43, 36943, 'Gaze', 24.9,25.6},
{false, 6722, 43, 36305, 'Gobblefin', 33.5,58.9},
{false, 6722, 43, 36304, 'Gochar', 53.5,49.1},
{false, 6722, 43, 36306, 'Jiasska the Sporegorger', 56.4,94.8},
{false, 6722, 43, 36268, 'Kalos the Bloodbathed', 62.8,37.3},
{false, 6722, 43, 36396, 'Mutafen', 53.0,89.3},
{false, 6722, 43, 36479, 'Nightmaw', 49.3,37.5},
{false, 6722, 43, 36288, 'Oskiira the Vengeful', 64.9,54.4},
{false, 6722, 43, 36887, 'Hermit Palefur', 59.3,14.8},
{false, 6722, 43, 36470, 'Rotcap', 38.4,27.8},
{false, 6722, 43, 36478, 'Shadowbark', 51.9,35.5},
{false, 6722, 43, 36267, 'Durkath Steelmaw', 46.4,28.5},
{false, 6722, 43, 36265, 'Stonespite', 33.6,21.9},
{false, 6722, 43, 36472, 'Swarmleaf', 53.0,53.0},
{false, 6722, 43, 36278, 'Talonbreaker', 54.6,63.2},
{false, 6722, 43, 36254, 'Tesska the Broken', 57.3,74.1},

-- Spires of Arak events
{false, 6722, 44, 36276, 'Spawn of Sethe and Sangrikass', 68.8,48.9},
{false, 6722, 44, 36298, 'Stingtail Nest and Sunderthorn', 58.5,45.1},
{false, 6722, 44, 35334, 'The Egg of Varasha', 29.6,41.6},

--Nagrand objects
{false, 6755, 42, 35759, 'Abandoned Cargo', 67.7,59.7},
{false, 6755, 42, 36072, 'Abu\'Gar\'s Favorite Lure', },
{false, 6755, 42, 36089, 'Abu\'Gar\'s Reel', },
{false, 6755, 42, 35711, 'Abu\'gar\'s Tenacity', },
{false, 6755, 42, 36077, 'Adventurer\'s Mace', },
{false, 6755, 42, 35597, 'Adventurer\'s Pack A', },
{false, 6755, 42, 35969, 'Adventurer\'s Pack B', },
{false, 6755, 42, 35765, 'Adventurer\'s Pack C', },
{false, 6755, 42, 36050, 'Adventurer\'s Pouch A', },
{false, 6755, 42, 36088, 'Adventurer\'s Pouch B', },
{false, 6755, 42, 35955, 'Adventurer\'s Sack', },
{false, 6755, 42, 35923, 'Adventurer\'s Stash', },
{false, 6755, 42, 35673, 'Appropriated Warsong Supplies', },
{false, 6755, 42, 36116, 'Bag of Herbs', },
{false, 6755, 42, 35986, 'Bone-Carved Dagger', },
{false, 6755, 42, 36174, 'Bounty of the Elements', },
{false, 6755, 42, 35696, 'Burning Blade Cache', },
{false, 6755, 42, 35661, 'Dreamflower', },
{false, 6755, 42, 36036, 'Elemental Manacles', },
{false, 6755, 42, 35954, 'Elemental Offering', },
{false, 6755, 42, 35692, 'Freshwater Clam', },
{false, 6755, 42, 35560, 'Fungus-Covered Chest', },
{false, 6755, 42, 36074, 'Gambler\'s Purse', },
{false, 6755, 42, 35987, 'Genedar Debris A', },
{false, 6755, 42, 35999, 'Genedar Debris B', },
{false, 6755, 42, 36002, 'Genedar Debris C', },
{false, 6755, 42, 36008, 'Genedar Debris D', },
{false, 6755, 42, 36011, 'Genedar Debris E', },
{false, 6755, 42, 36099, 'Goblin Keg', },
{false, 6755, 42, 35576, 'Goblin Pack A', },
{false, 6755, 42, 35590, 'Goblin Pack B', },
{false, 6755, 42, 35951, 'Goblin Stash', },
{false, 6755, 42, 35694, 'Golden Kaliri Egg - TSH', },
{false, 6755, 42, 36109, 'Goldtoe\'s Plunder', },
{false, 6755, 42, 36051, 'Grizzlemaw\'s Favorite Bone', },
{false, 6755, 42, 35622, 'Hidden Stash', },
{false, 6755, 42, 36082, 'Lost Pendant', },
{false, 6755, 42, 36052, 'Misplaced Artifacts', },
{false, 6755, 42, 35643, 'Mountain Climber\'s Pack', },
{false, 6755, 42, 34581, 'Mysterious Flower, Nagrand', },
{false, 6755, 42, 36049, 'Ogre Beads', },
{false, 6755, 42, 36039, 'Ogre Hammer', },
{false, 6755, 42, 36020, 'Oshu\'gun Fragment', },
{false, 6755, 42, 36115, 'Pale Elixir', },
{false, 6755, 42, 36021, 'Pokhar\'s Thirteenth Axe', },
{false, 6755, 42, 36035, 'Polished Sabron Skull', },
{false, 6755, 42, 36102, 'Saberon Stash', },
{false, 6755, 42, 36846, 'Spirit\'s Gift', },
{false, 6755, 42, 36857, 'Smuggler\'s Cache', },
{false, 6755, 42, 35648, 'Steamwheedle Supplies A', },
{false, 6755, 42, 35646, 'Steamwheedle Bupplies B', },
{false, 6755, 42, 35616, 'Steamwheedle Supplies C', },
{false, 6755, 42, 35577, 'Steamwheedle Supplies D', },
{false, 6755, 42, 35583, 'Steamwheedle Supplies E', },
{false, 6755, 42, 35591, 'Steamwheedle Supplies F', },
{false, 6755, 42, 35662, 'Steamwheedle Supplies G', },
{false, 6755, 42, 36046, 'Telaar Defender Shield', },
{false, 6755, 42, 35579, 'Void-Infused Crystal', },
{false, 6755, 42, 35695, 'Warsong Cache', },
{false, 6755, 42, 36073, 'Warsong Helm', },
{false, 6755, 42, 35678, 'Warsong Lockbox', },
{false, 6755, 42, 35976, 'Warsong Supplies', },
{false, 6755, 42, 35682, 'Warsong Spear', },
{false, 6755, 42, 35593, 'Warsong Spoils', },
{false, 6755, 42, 36071, 'Waterlogged Satchel', },

-- Nagrand NPCs
{false, 6755, 43, 35778, 'Ancient Blademaster - TSH', },
{false, 6755, 43, 35735, 'Berserk Shredder', },
{false, 6755, 43, 35923, 'Hunter Blacktooth', },
{false, 6755, 43, 34645, 'Warmaster Blugthol', },
{false, 6755, 43, 35943, 'Outrider Duretha', },
{false, 6755, 43, 35893, 'Flinthide', },
{false, 6755, 43, 35153, 'Fungal Praetorian', },
{false, 6755, 43, 35715, 'Gar\'lua the Wolfmother', },
{false, 6755, 43, 35717, 'Gnarlhoof the Rabid', },
{false, 6755, 43, 36159, 'Graveltooth', },
{false, 6755, 43, 35898, 'Gorepetal', },
{false, 6755, 43, 35714, 'Greatfeather', },
{false, 6755, 43, 35877, 'Windcaller Korast', },
{false, 6755, 43, 35836, 'The Lunker', },
{false, 6755, 43, 35875, 'Ophiis', },
{false, 6755, 43, 36229, 'Mr. Pinchy Sr.', },
{false, 6755, 43, 35712, 'Redclaw the Feral', 73.5,58.1},
{false, 6755, 43, 35623, 'Explorer Rixak', },
{false, 6755, 43, 35900, 'Ru\'klaa', },
{false, 6755, 43, 35932, 'Malroc Stonesunder', 81.0,59.8},
{false, 6755, 43, 35920, 'Tur\'aka', },
{false, 6755, 43, 35865, 'Void Ooze', },
{false, 6755, 43, 35931, 'Warsong Scout', },
{false, 6755, 43, 35912, 'Swindler Whitesea', },

--Nagrand events
{false, 6755, 44, 34862, 'Light the Braziers', },

--Unknown location vignettes
{false, 1, 42, 34236, 'Amethyl Crystal', },
{false, 1, 42, 35964, 'Aruumel\'s Mace', },
{false, 1, 42, 34260, 'Aruuna Mining Cart A', },
{false, 1, 42, 36262, 'Aruuna Mining Cart B', },
{false, 1, 42, 34252, 'Barrel of Fish'},
{false, 1, 42, 36658, 'Botani Stockpile', },
{false, 1, 42, 34471, 'Bright Coin', },
{false, 1, 42, 34248, 'Charred Sword', },
{false, 1, 42, 33565, 'Chimaera Scale', },
{false, 1, 42, 36604, 'Dark Iron Emergency Pack', },
{false, 1, 42, 33575, 'Demonic Cache', },
{false, 1, 42, 36625, 'Discarded Pack', },
{false, 1, 42, 34253, 'Draenei Weapons', },
{false, 1, 42, 34580, 'Draenor Flowerpicker', },
{false, 1, 42, 34581, 'Draenor Flowerpicker Note Found', },
{false, 1, 42, 36879, 'Dusty Lockbox', },
{false, 1, 42, 34238, 'Foreman\'s Lunchbox', },
{false, 1, 42, 35580, 'Giant Beehive', },
{false, 1, 42, 36621, 'Gnome Canister', },
{false, 1, 42, 35162, 'Grovestrider Nest', },
{false, 1, 42, 36628, 'Hammer of Glory', },
{false, 1, 42, 33885, 'Harbor Treasure', },
{false, 1, 42, 36509, 'Hydra Treasure Pile', },
{false, 1, 42, 36596, 'Iron Horde Weapon Stash', },
{false, 1, 42, 36863, 'Iron Horde Munitions', },
{false, 1, 42, 34261, 'Keluu\'s Belongings', },
{false, 1, 42, 34258, 'Light of the Sea', },
{false, 1, 42, 34235, 'Luminous Shell', },
{false, 1, 42, 33887, 'Mini-War Machine A', },
{false, 1, 42, 33888, 'Mini-War Machine B', },
{false, 1, 42, 33889, 'Mini-War Machine C', },
{false, 1, 42, 33890, 'Mini-War Machine D', },
{false, 1, 42, 36834, 'Gorgrond Ogre Gateway', },
{false, 1, 42, 36885, 'Ogre Waygate A', },
{false, 1, 42, 36886, 'Ogre Waygate B', },
{false, 1, 42, 36903, 'Ogre Waygate C', },
{false, 1, 42, 36904, 'Ogre Waygate D', },
{false, 1, 42, 36905, 'Ogre Waygate E', },
{false, 1, 42, 36906, 'Ogre Waygate F', },
{false, 1, 42, 36506, 'Orc Super Caster Loot', },
{false, 1, 42, 34250, 'Relic of Aruuna', },
{false, 1, 42, 34256, 'Relic of Telmor', },
{false, 1, 42, 34232, 'Rook\'s Tacklebox', },
{false, 1, 42, 34276, 'Rusted Lockbox', },
{false, 1, 42, 36521, 'Rylak Egg', },
{false, 1, 42, 35919, 'Sacrifice', },
{false, 1, 42, 36631, 'Sasha\'s Stash', },
{false, 1, 42, 33883, 'Shadowmoon Treasure #2', },
{false, 1, 42, 36651, 'SHarvest Crystal', },
{false, 1, 42, 36634, 'Sniper\'s Crossbow', },
{false, 1, 42, 35600, 'Strange Spore', },
{false, 1, 42, 33965, 'Tanaan Flowerpicker', },
{false, 1, 42, 36878, 'The Light of Karabor', },
{false, 1, 42, 34257, 'Treasure of Ango\'rosh', },
{false, 1, 42, 34239, 'Treasure of Tuurem', },
{false, 1, 42, 33574, 'Vindicator\'s Cache', },
{false, 1, 42, 34760, 'Warchest of Kull\'krosh', },
{false, 1, 42, 36902, 'Aeda Brightdawn', },
{false, 1, 42, 36889, 'Defender Kaluum', },
{false, 1, 42, 36899, 'Defender Illona', },
{false, 1, 42, 36898, 'Delvar Ironfirst', },
{false, 1, 42, 36936, 'Leorajh', },
{false, 1, 42, 36900, 'Talonpriest Ishaal', },
{false, 1, 42, 36877, 'Torommok', },
{false, 1, 42, 36901, 'Vivianne', },

--Mistagged vignettes
{false, 2, 43, 34170, 'Moltnar', },
{false, 2, 43, 35908, 'Stoneshard Broodmother', },
{false, 2, 43, 36942, 'Soulbinder Aedraa', },
{false, 2, 42, 34521, 'Glowing Obsidian Shard (Frostfire Ridge)', },
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

SLASH_GRGVIGN1 = '/grg'
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
 SlashCmdList.FFRVIGN()
 SlashCmdList.SMVVIGN()
 SlashCmdList.GRGVIGN()
 SlashCmdList.TLDVIGN()
 SlashCmdList.SOAVIGN()
 SlashCmdList.NGDVIGN()
 SlashCmdList.UNKVIGN()
-- SlashCmdList.MISVIGN()
end

