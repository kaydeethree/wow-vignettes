--[[
VignettesTracker (c) 2014 James 'Kaydeethree' Twyford
Available under the terms of GPLv2

valid commands: /ffr, /smv, /grg, /tld, /soa, /ngd, /unk, /mistagged, /all

items in the zone tables follow this pattern:
{found, questID, 'In-game name of vignette', xCoord, yCoord},

set `found` to true to hide it from search results to limit spam in the chat
frame

set myChatFrame to a valid frame that can receive text. kd3 uses ChatFrame4
for this purpose (his data-gathering macros also print to that frame)

there is a table for each main zone, plus an 'unknown' table, and a mistagged
table. items in mistagged show up after interacting with a vignette that does
not relate to the name of the quest, or for some other unknown to kd3 reason.
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

local ffr,smv,grg,tld,soa,ngd,unk,mistagged

local function go(t)
 for i=1,#t do
  if not t[i][1] and IsQuestFlaggedCompleted(t[i][2]) then
  myChatFrame:AddMessage(
   t[i][2]..' '..t[i][3]..' @'..(t[i][4] or '?')..','..(t[i][5] or '?')
  );
  end
 end
end

ffr = {
-- npcs
{false, 32911, 'Ancient Clefthoof', },
{false, 32913, 'Arranok\'s Ritual', },
{false, 34519, 'Brotoculus', },
{false, 32920, 'Deathtoll', },
{false, 34382, 'Grand Warlock Duress', },
{false, 34517, 'Gargantuan Frostbeak', },
{false, 34851, 'Gruuk?', },
{false, 33511, 'Sacrifice Pit', },
{false, 32921, 'Skel\'tik the Baleful', },
{false, 34522, 'Ug\'lok the Frozen', },

{false, 34497, 'Breathless', 27.8,50.3},
{false, 32941, 'Canyon Icemother', 33.5,23.1},
{false, 34843, 'Chillfang', 41.4,68.3},
{false, 33014, 'Cindermaw', 40.6,47.1},
{false, 34129, 'Coldstomp the Griever', 25.9,55.2},
{false, 34131, 'Coldtusk', 54.2,67.7},
{false, 34477, 'Cyclonic Fury', 67,78},
{false, 33504, 'Firefury Stone and Firefury Giant', 71.7,47.0},
{false, 33011, 'Frostwolf Veteran\'s Keepsake', 45,50},
{false, 34130, 'Giantstalker Hunting Party', 58,32},
{false, 34132, 'Scout Goreseeker', 76.5,63.5},
{false, 33512, 'Gorg\'ak the Lava Guzzler', 72.5,22.8},
{false, 34865, 'Grutush the Pillager', 38.6,62.9},
{false, 34825, 'Gruuk', 51.8,65.1},
{false, 34839, 'Gurun', 47.1,55.2},
{false, 34708, 'Jehil the Climber', 61.8,26.6},
{false, 32918, 'Giant-Slayer Kul', 54.7,22.3},
{false, 33938, 'Primalist Mur\'og', 37.0,33.8},
{false, 34470, 'Pale Fishmonger', 28.3,66.6},
{false, 33843, 'Broodmother Reeg\'ak', 65.6,31.4},
{false, 34133, 'The Beater', 26.9,31.9},
{false, 34361, 'The Bone Crawler', 70,30},
{false, 33440, 'Time-Warped Bladespire Brute, Falling Lower', 30.5,50.8},
{false, 33497, 'Time-Warped Bladespire Brute, Falling Higher', 30.5,50.9},
{false, 33439, 'Time-Warped Bladespire Brute, Running', 30.3,50.6},
{false, 33438, 'Time-Warped Bladespire Primalist', 30.3,51.2},
{false, 34559, 'Yaga the Scarred', 40.6,27.6},

-- objects
{false, 33498, 'Bladespire Chef', },
{false, 33447, 'Bladespire Craftsman', },
{false, 33989, 'Blasting Charges - Cave A Cache', },
{false, 33991, 'Blasting Charges - Cave B Cache', },
{false, 33996, 'Blasting Charges - Cave C Cache', },
{false, 33998, 'Blasting Charges - Cave D Cache', },
{false, 33975, 'Blasting Charges - Rubble A', },
{false, 33990, 'Blasting Charges - Rubble B', },
{false, 33995, 'Blasting Charges - Rubble C', },
{false, 33997, 'Blasting Charges - Rubble D', },
{false, 33925, 'Frostwolf Cache 01', },
{false, 33945, 'Frostwolf Cache 03', },
{false, 33949, 'Frostwolf Cache 07', },
{false, 33016, 'Frostwolf Supply Cache', },
{false, 34713, 'Gronnstalker\'s Cache', },
{false, 35282, 'Glowing Blue Mushroom', },
{false, 34648, 'Gnawed Bone', },
{false, 34907, 'Lagoon Pool/Giant Clam?', },
{false, 35347, 'Ogre Booty 000', },
{false, 35367, 'Ogre Booty 001', },
{false, 35368, 'Ogre Booty 002', },
{false, 35369, 'Ogre Booty 003', },
{false, 35370, 'Ogre Booty 004', },
{false, 35371, 'Ogre Booty 005', },
{false, 35373, 'Ogre Booty 006', },
{false, 35567, 'Ogre Booty 007', },
{false, 35568, 'Ogre Booty 008', },
{false, 35569, 'Ogre Booty 009', },
{false, 35570, 'Ogre Booty 010', },
{false, 33532, 'Ogre Cache', },
{false, 33930, 'Sabron Stash', },
{false, 34652, 'Savage Clam', },
{false, 34647, 'Snow-Covered Strongbox', },
{false, 34557, 'Treasure Map A', },
{false, 36464, 'Treasure Mab B', },
{false, 36465, 'Treasure Map C', },
{false, 36466, 'Treasure Map D', },
{false, 36467, 'Treasure Map E', },
{false, 36468, 'Treasure Map F', },
{false, 33499, 'Time-Warped Ogre', },
{false, 33649, 'Torched Iron Horde Scout', },
{false, 36053, 'Unused Wood Pile', },

{false, 33916, 'Arena Master\'s War Horn', 23.2,25.0},
{false, 34520, 'Burning Pearl', 42.4,19.6},
{false, 33940, 'Crag-Leaper\'s Cache', 42.7,31.8},
{false, 33531, 'Clumsy Cragmaul Brute', 50.2,18.7},
{false, 34473, 'Envoy\'s Satchel', 40.9,20.1},
{false, 34841, 'Forgotten Supplies', 43.7,55.6},
{false, 34968, 'Forgotten Supplies', 43.7,55.6},
{false, 34507, 'Frozen Frostwolf Axe', 24.2,48.6},
{false, 34476, 'Frozen Treasure', 57.2,52.1},
{false, 33948, 'Goren Leftovers', 66.7,26.4},
{false, 33947, 'Grimfrost Treasure', 68.1,45.9},
{false, 33017, 'Iron Horde Supplies', 68.9,69.1},
{false, 34936, 'Lady Sena\'s Extra Stash?', 74,53},
{false, 34937, 'Lady Sena\'s Other Materials Stash', 51.4,66.8},
{false, 33926, 'Lagoon Pool', 21.7,9.6},
{false, 34642, 'Lucky Coin', 19.2,12.0},
{false, 33961, 'Mysterious Flower, Frostfire Ridge', 71.6,69.6},
{false, 33502, 'Obsidian Petroglyph', 38.3,37.8},
{false, 33525, 'Orc Couple', 54.8,35.5 , 63.4,14.7},
{false, 34931, 'Pale Loot Sack', 21.7,50.8},
{false, 34967, 'Raided Loot', 37.3,59.2},
{false, 33977, 'Shamanstone, Blessing of the Wolf', 27.1,36.5},
{false, 33979, 'Shamanstone, Buffeting Galefury', 65.2,79.1},
{false, 33980, 'Shamanstone, Ogrish Fortitude', 43.9,12.3},
{false, 33978, 'Shamanstone, Spirit of the Wolf', 17.5,56.7},
{false, 33981, 'Shamanstone, Touched by Fire', 37.0,33.2},
{false, 33982, 'Shamanstone, Touched by Ice', 60.4,13.7},
{false, 33500, 'Slave\'s Stash', 27.7,42.8},
{false, 34641, 'Sealed Jug', 9.8,45.3},
{false, 34649, 'Smoldering True Iron Deposit', 36.3,32.3},
{false, 33501, 'Spectator\'s Chest', 24.2,27.1},
{false, 33942, 'Supply Dump', 16.1,49.7},
{false, 33946, 'Survivalist\'s Cache', 64.7,25.7},
{false, 32803, 'Thunderlord Cache', 34.2,23.5},
{false, 33505, 'Wiggling Egg', 64.4,65.8},
}

smv = {
-- npcs
{false, 33061, 'Amaukwa', 37,35},
{false, 35731, 'Ba\'ruun', 52.8,16.5},
{false, 35281, 'Bahameye', 29,5},
{false, 33064, 'Dark Emanation', 48.5,43.3},
{false, 35555, 'Darktalon', 49.6,41.8},
{false, 35725, 'Faebright', 61.7,61.6},
{false, 33664, 'Gorum', 21.6,33.1},
{false, 35448, 'Darkmaster Go\'vid', 40,80},
{false, 35558, 'Hypnocroak', 37.4,49.0},
{false, 35909, 'Insha\'tar', 57.4,48.6},
{false, 35847, 'Voidseer Kalurg', },
{false, 33043, 'Killmaw', 40.8,44.6},
{false, 33055, 'Leaf-Reader Kurri', 37.7,14.3},
{false, 33039, 'Ku\'targ\ the Voidseer', 32.5,35.1},
{false, 33642, 'Mother Om\'ra', 44.0,57.7},
{false, 35553, 'Rai\'vosh ',48.8,22.7},
{false, 34068, 'Rockhoof', 52.7,50.8},
{false, 33057, 'Rotbelcher', },
{false, 36568, 'Malgosh Shadowkeeper', },
{false, 35732, 'Shinri', 61.2,49.4},
{false, 36880, 'Sneevel', },
{false, 35523, 'Morva Soultwister', 38.6,70.4},
{false, 35906, 'Mad "King" Sporeon', 45.0,20.8},
{false, 36431, 'Soul-Twister Torek', },
{false, 35688, 'Enavra Varandi', 67.9,63.9},
{false, 33640, 'Veloss', 21.7,20.8},
{false, 33643, 'Venomshade', 54.8,70.2},
{false, 33389, 'Yggdrel', 48,66},

-- events
{false, 33038, 'Embaari Defense Crystal', 42.9,40.3},
{false, 34743, 'The Crystal Blade of Torvath', 61.7,67.9},

-- objects
{false, 35581, 'Alchemist\'s Satchel', 54.9,45.0},
{false, 35584, 'Ancestral Greataxe', 52.8,48.4},
{false, 33869, 'Armored Elekk Tusk', 41.4,27.9},
{false, 33584, 'Ashes of A\'kumbo', 37.8,44.3},
{false, 33867, 'Astrologer\'s Box', 49.3,37.6},
{false, 33046, 'Beloved\'s Offering', 36.8,41.4},
{false, 33613, 'Bubbling Cauldron',37.2,23.1 },
{false, 33569, 'Carved Dinking Horn', 33.5,39.6},
{false, 34174, 'Fantastic Fish', 26.5,5.7},
{false, 33891, 'Giant Moonwillow Cone', 34.5,46.2},
{false, 35798, 'Glowing Cave Blossom', 48.7,47.5},
{false, 33614, 'Greka\'s Urn', 38.5,43.0},
{false, 33564, 'Hanging Satchel', 47.1,46.0},
{false, 33041, 'Iron Horde Cargo Shipment', 42.1,61.2},
{false, 33567, 'Iron Horde Tribute', 37.5,59.2},
{false, 33568, 'Kaliri Egg', 57.9,45.3},
{false, 35530, 'Lunarfall Egg', 30.2,19.9},
{false, 35603, 'Mikkal\'s Chest', 58.9,21.9},
{false, 33570, 'Mushroom Covered Chest or Shadowmoon Exile Treasure', 52.9,24.9, 45.8,24.6},
{false, 33962, 'Mysterious Flower, Shadowmoon Valley', },
{false, 36507, 'Orc Skeleton', 67.0,33.5},
{false, 33384, 'Peaceful Offering South', 44.5,63.6},
{false, 33610, 'Peaceful Offering East', 45.2,60.5},
{false, 33611, 'Peaceful Offering West', 43.8,60.6},
{false, 33612, 'Peaceful Offering North', 44.5,59.1},
{false, 35381, 'Pippers\' Buried Supplies 1', 30.0,18.3},
{false, 35382, 'Pippers\' Buried Supplies 2', 30.9,17.7},
{false, 35383, 'Pippers\' Buried Supplies 3', 28.9,15.6},
{false, 35384, 'Pippers\' Buried Supplies 4', 30.7,20.6},
{false, 33886, 'Ronokk\'s Belongings', 31.3,39.1},
{false, 33572, 'Rotting Basket', 22.9,33.8},
{false, 33573, 'Rovo\'s Dagger', 36.7,44.5},
{false, 33571, 'Shadowmoon Sacrifical Dagger', 30.0,45.4},
{false, 35289, 'Spark\'s Stolen Supplies', 30.9,12.8},
{false, 35280, 'Stolen Treasure', 27.1,2.5},
{false, 35677, 'Sunken Fishing Boat', 37.2,26.0},
{false, 35279, 'Sunken Treasure', 28.8,7.2},
{false, 33540, 'Uzko\'s Knickknacks', 35.9,40.9},
{false, 33866, 'Veema\'s Herb Bag', 34.2,43.5},
{false, 33566, 'Waterlogged Chest', 39.2,83.9},
}

grg = {
-- npcs
{false, 34726, 'Mother Araneae', 53.5,78.3},
{false, 35335, 'Bashiok', 40.2,79.0},
{false, 36597, 'Berthora', 39.4,74.6},
{false, 34197, 'Bloodbloom the Colossus', },
{false, 34127, 'Mother Bloodtusk', },
{false, 35503, 'Char the Burning', 53.5,44.7},
{false, 35996, 'Depthroot', },
{false, 00000, 'Gelgor of the Blue Flame', 41.9,45.4},
{false, 34231, 'Giant Snake', },
{false, 36204, 'Gorger', 46.2,50.9},
{false, 36186, 'Greldrok the Cunning', 46.8,43.1},
{false, 34162, 'Icklarv', },
{false, 34143, 'Kal\'rak the Drunk', },
{false, 35910, 'Stomper Kreego', 38.2,66.3},
{false, 36178, 'Mandrakor', 50.8,53.2},
{false, 34160, 'Nixxie the Goblin', },
{false, 34243, 'Rak\'nar Muzzlebash', },
{false, 36600, 'Riptar', 37.6,81.5},
{false, 34198, 'Roardan', },
{false, 36393, 'Rolkor', 47.7,41.2},
{false, 00000, 'Hive Queen Skrikka', 52.4,70.1},
{false, 36858, 'Steeltusk', },
{false, 36837, 'Stompalupagus', 54.8,71.1},
{false, 34168, 'Stormwave', },
{false, 36394, 'Sulfurious', 40.2,60.6},
{false, 36656, 'Sunclaw', 44.8,92.1},
{false, 36794, 'Sylldross', 62.9,61.4},
{false, 34191, 'Un\'glok Blackfinger', },

-- arena-only treasures
{false, 36721, 'arena2', },
{false, 36736, 'arena15', },
{false, 36737, 'arena16', },
{false, 36739, 'arena18', },
{false, 36781, 'arena20', },
{false, 36782, 'arena21', },
{false, 36783, 'arena22', },
{false, 36789, 'arena25', },
{false, 36730, 'Arena: Aged Stone Container, Crushfang\'s End', 48.1,55.2},
{false, 36784, 'Arena: Aged Stone Container, Deeproot', 45.7,88.2},
{false, 36723, 'Arena: Aged Stone Container, Fissure of Fury', 43.2,45.7},
{false, 36726, 'Arena: Aged Stone Container, Gorgorek\'s Fall', 41.8,45.3},
{false, 36734, 'Arena: Aged Stone Container, Steamburst Cauldron', 51.3,40.6},
{false, 36722, 'Arena: Aged Stone Container, Valley of Destruction', 45.6,49.3},
{false, 36787, 'Arena: Ancient Ogre Cache, Blook\'s Overlook', 42.2,93.1},
{false, 36740, 'Arena: Ancient Ogre Cache, Iyun Weald', 61.5,58.5},
{false, 36733, 'Arena: Ancient Ogre Cache, Gronn Canyon', 45.5,43.0},
{false, 36727, 'Arena: Ancient Titan Chest, Brimstone Springs', 42.2,52.0},
{false, 36731, 'Arena: Ancient Titan Chest, Drywind Gorge', 43.3,51.7},
{false, 36735, 'Arena: Ancient Titan Chest, Gronn Canyon', 48.0,40.0},
{false, 36738, 'Arena: Ancient Titan Chest, Mistcreep Mire', 50.3,66.6},
{false, 36710, 'Arena: Ancient Titan Chest, Steamscar Rise', 49.4,50.9},
{false, 36728, 'Arena: Obsidian Crystal Formation, Brimstone Springs', 41.8,58.9},
{false, 36729, 'Arena: Obsidian Crystal Formation, Stonemaul Arena', 42.1,64.3},
{false, 36732, 'Arena: Obsidian Crystal Formation, Valley of Destruction', 44.2,46.6},

-- mill-only treasures
{false, 35965, 'mill3', },
{false, 35966, 'mill4', },
{false, 35967, 'mill5', },
{false, 35968, 'mill6', },
{false, 35971, 'mill7', },
{false, 35979, 'mill9', },
{false, 35980, 'mill10', },
{false, 35981, 'mill11', },
{false, 35984, 'mill13', },
{false, 36001, 'mill14', },
{false, 36003, 'mill15', },
{false, 36019, 'mill17', },
{false, 36714, 'mill20', },
{false, 36716, 'mill22', },
{false, 36718, 'mill24', },
{false, 36720, 'mill25', },
{false, 35701, 'Mill1A: Aged Stone Container?, Dionor\'s Demise', 49.1,48.5},
{false, 36712, 'Mill1B: Aged Stone Container?, Dionor\'s Demise', 49.1,48.5},
{false, 35952, 'Mill2: Aged Stone Container?, Dionor\'s Demise', 49.1,48.5},
{false, 36717, 'Mill: Aged Stone Container, Valley of Destruction', 47.5,43.6},
{false, 35982, 'Mill: Botani Essence Seed', 42.0,81.6},
{false, 36430, 'Mill: Mysterious Petrified Pod, Iyun Weald', 63.3,57.2},
{false, 36715, 'Mill: Mysterious Petrified Pod, Overlook Ruins', 51.7,69.1},
{false, 36015, 'Mill: Mysterious Petrified Pod, Tangleheart', 60.5,72.8},
{false, 35975, 'Mill: Remains of Explorer Engieer Toldirk Ashlamp', 46.0,93.6},
{false, 36713, 'Mill: Unknown Petrified Egg', 53.0,79.1},

-- open treasures
{false, 34147, 'grg1', },
{false, 34149, 'grg2', },
{false, 34151, 'grg3', },
{false, 34153, 'grg4', },
{false, 34146, 'grg5', },
{false, 34155, 'grg6', },
{false, 34152, 'grg7', },
{false, 34172, 'grg8', },
{false, 34173, 'grg9', },
{false, 34176, 'grg11', },
{false, 34201, 'grg13', },
{false, 34177, 'grg14', },
{false, 34219, 'grg15', },
{false, 34195, 'grg16', },
{false, 34206, 'grg17', },
{false, 34179, 'grg18', },
{false, 34210, 'grg19', },
{false, 34211, 'grg20', },
{false, 34214, 'grg21', },
{false, 34215, 'grg22', },
{false, 34218, 'grg23', },
{false, 34224, 'Boodcleave', },
{false, 34412, 'Gnarljaw', },
{false, 34222, 'Iron Horde Blacksmith', },
{false, 34225, 'Iron Horde Slacker', },
{false, 34223, 'Iron Horde Stable Master', },
{false, 34411, 'King Slime', },
{false, 35709, 'Laughing Skull Cache', },
{false, 33966, 'Mysterious Flower, Gorgrond', },
{false, 37170, 'Femur of Improbability', },
{false, 36118, 'Pile of Rubble', },
{false, 35056, 'Horned Skull', 42.6,46.8 },
{false, 36618, 'Iron Supply Chest', 43.7,42.5},
{false, 34241, 'Ockbar\'s Pack', 43.0,93.0},
{false, 36605, 'Remains of Balldir Deeprock', 57.8,56.0},
{false, 36654, 'Remains of Balik Orecrusher', 53.1,74.5},
{false, 34940, 'Strange Looking Dagger', 53.0,80.0},
{false, 36610, 'Suntouched Spear', 45.7,49.7},
{false, 36203, 'Warm Goren Egg', 48.9,47.3},
}

tld = {
-- unknown
{false, 34184, 'Arakos Killed Boss', },
{false, 34182, 'Arakos Looted Treasure', },
{false, 34199, 'Anchorite\'s Sojurn', },
{false, 34101, 'Aruumel\'s Worn Mace', },
{false, 36937, 'Bladefury Treasure - Burning Blade Cache', },
{false, 35219, 'Burning Front', },
{false, 36849, 'Burning Missive A', },
{false, 36850, 'Burning Missive B', },
{false, 36851, 'Burning Missive C', },
{false, 36852, 'Burning Missive D', },
{false, 36853, 'Burning Missive E', },
{false, 36854, 'Burning Missive F', },
{false, 36855, 'Burning Missive G', },
{false, 36856, 'Burning Missive H', },
{false, 34165, 'Cro Fleshrender', },
{false, 34142, 'Dr. Gloom', },
{false, 34220, 'Echo of Murmur A', },
{false, 34221, 'Echo of Murmur B', },
{false, 34128, 'Four Friends complete A', },
{false, 34134, 'Four Friends complete H', },
{false, 34115, 'Four Friends found H', },
{false, 34145, 'Frenzied Animus', },
{false, 34483, 'Galzomar', },
{false, 36829, 'Gift of the Ancients', },
{false, 34116, 'Girl 1 found H', },
{false, 34117, 'Girl 2 found H', },
{false, 34189, 'Glimmerwing', },
{false, 34118, 'Guy 1 found B', },
{false, 34119, 'Guy 2 found B', },
{false, 34185, 'Hammertooth', },
{false, 34167, 'Hen-Mother Hami', },
{false, 35220, 'Kharazos the Triumphant', },
{false, 34208, 'Lo\'marg Jawcrusher', },
{false, 36919, 'Murloc Boss', },
{false, 33960, 'Mysterious Flower, Talador', },
{false, 34196, 'Ra\'kahn', },
{false, 34671, 'Shirzir', },
{false, 35244, 'Skagg', },
{false, 34207, 'Sparkling Pool', },
{false, 34171, 'Taladorantula', },
{false, 34204, 'Wandering Vindicator - kill', },
{false, 34205, 'Wandering Vindicator - loot', },
{false, 34140, 'Yuuri\'s Gift', },
{false, 33933, 'Deceptia\'s Smoldering Boots', },

{false, 34668, 'Burning Front rare demon (Talonpriest Zorka?)', 56.7,62.5},
{false, 35018, 'Felbark', 50.4,83.5},
{false, 34114, 'Four Friends found A', },
{false, 34929, 'Gennadian', 67.5,80.8},
{false, 34110, 'Girl 1 found A', },
{false, 34111, 'Girl 2 found A', },
{false, 34112, 'Guy 1 found A', },
{false, 34113, 'Guy 2 found A', },
{false, 34498, 'Klikixx', 66.8,85.3},
{false, 34589, 'No\'losh', 85.9,29.4},
{false, 35491, 'Underseer Bloodmane', 63.8,20.7},
{false, 34945, 'Underseer Bloodmane (Prize?)', 63.8,20.7},
{false, 34148, 'Viperlash', 37.6,74.9},
{false, 34135, 'Yazheera the Incinerator', 53.8,25.6},

{false, 34263, 'Pure Crystal Dust', 78.2,14.7},
}

soa = {
-- npcs
{false, 36943, 'Gaze', },
{false, 36312, 'Sun Age Valarik', },
{false, 35599, 'Blade-Dancer Aeryx', 46.8,23.3},
{false, 36283, 'Blightglow', 65.2,67.8},
{false, 36291, 'Betsi Boombasket', 58.3,84.5},
{false, 36279, 'Poisonmaster Bortusk', 59.5,37.5},
{false, 36129, 'Nas Dunberlin', 36.3,52.6},
{false, 36303, 'Eyeless', 49.9,29.8},
{false, 36297, 'Festerbloom', 55.2,35.6},
{false, 36305, 'Gobblefin', 33.5,58.9},
{false, 36304, 'Gochar', 53.5,49.1},
{false, 36306, 'Jiasska the Sporegorger', 56.4,94.8},
{false, 36268, 'Kalos the Bloodbathed', 62.8,37.3},
{false, 36396, 'Mutafen', 53.0,89.3},
{false, 36479, 'Nightmaw', 49.3,37.5},
{false, 36288, 'Oskiira the Vengeful', 64.9,54.4},
{false, 36887, 'Hermit Palefur', 59.3,14.8},
{false, 36470, 'Rotcap', 38.4,27.8},
{false, 36478, 'Shadowbark', 51.9,35.5},
{false, 36276, 'Spawn of Sethe and Sangrikass', 68.8,48.9},
{false, 36267, 'Durkath Steelmaw', 46.4,28.5},
{false, 36265, 'Stonespite', 33.6,21.9},
{false, 36298, 'Sunderthorn', 58.5,45.1},
{false, 36472, 'Swarmleaf', 53.0,53.0},
{false, 36278, 'Talonbreaker', 54.6,63.2},
{false, 36254, 'Tesska the Broken', 57.3,74.1},

-- objects
{false, 36453, 'Coinbender\'s Payment', },
{false, 36459, 'Dislodged Saw Blade', },
{false, 35334, 'The Egg of Varasha', 29.6,41.6},
{false, 36381, 'Gift of Anzu', },
{false, 36386, 'Gift of Anzu (Crossbow)', },
{false, 36388, 'Gift of Anzu (Wand)', },
{false, 36389, 'Gift of Anzu (Mask)', },
{false, 36390, 'Gift of Anzu (Knife)', },
{false, 36392, 'Gift of Anzu (Axe)', },
{false, 36416, 'Misplaced Scroll', 52,42},
{false, 33964, 'Mysterious Flower, Spires of Arak', },
{false, 36405, 'Offering to the Raven Mother 02', },
{false, 36340, 'Ogron Plunder', },
{false, 36402, 'Orcish Signaling Horn', },
{false, 36446, 'Outcast\'s Pouch', 46.9,34.0},
{false, 36415, 'Reagent Pouch', },
{false, 36798, 'Rooby Roo', },
{false, 36375, 'Sethekk Idol', },
{false, 36450, 'Sethekk Ritual Brew', },
{false, 36361, 'Shattered Hand Lockbox', },
{false, 36374, 'Statue of Anzu', },
{false, 36424, 'Sun-Touched Cache C', },
{false, 36463, 'Taylor\'s Coffer Key (unused?)', },

{false, 36458, 'Abandoned Mining Pick', 40.6,55.0},
{false, 36462, 'Admiral Taylor\'s Coffer', 36.2,54.5},
{false, 36445, 'Assassin\'s Spear', 49.2,37.2},
{false, 35627, 'Basket of Arakkoa Goods', 40.2,60.3},
{false, 36367, 'Campaign Contributions', 55.5,90.9},
{false, 36454, 'Drypeak Mushrooms', 63.6,67.4},
{false, 36418, 'Ephial\'s Dark Grimoire', 36.6,57.9},
{false, 36395, 'Elixir of Shadow Sight, Skettis', 43.9,15.0},
{false, 36397, 'Elixir of Shadow Sight, Veil Akraz', 43.8,24.6},
{false, 36398, 'Elixir of Shadow Sight, Sethekk Hollow', 69.2,43.3},
{false, 36399, 'Elixir of Shadow Sight, Bloodmane Valley', 49.1,62.6},
{false, 36400, 'Elixir of Shadow Sight, Shadow\'s Vigil', 55.6,22.1},
{false, 36401, 'Elixir of Shadow Sight, Bloodmane Pridelands', 53.1,84.5},
{false, 35871, 'Escape Pod and Nizzix\'s Chest', 60.9,88.0},
{false, 36246, 'Fractured Sunstone', 50.5,22.1},
{false, 36420, 'Garrison Resources', 37.2,47.5},
{false, 36451, 'Garrison Workman\'s Hammer', 41.9,50.5},
{false, 36247, 'Lost Herb Satchel', 50.8,28.7},
{false, 36411, 'Lost Ring', 47.8,36.1},
{false, 36244, 'Misplaced Scrolls', 42.7,18.3},
{false, 36403, 'Offering to the Raven Mother, Behind Swarmleaf', 53.3,55.5},
{false, 36406, 'Offering to the Raven Mother, Bloodmane Valley North', 48.9,54.7},
{false, 36407, 'Offering to the Raven Mother, Bloodmane Valley South', 51.9,64.6},
{false, 36410, 'Offering to the Raven Mother, Bloodmane Valley East', 61.0,63.8},
{false, 36243, 'Outcast\'s Belongings, Terokkar Pass', 36.8,17.2},
{false, 36447, 'Outcast\'s Belongings, Veil Akraz', 42.2,21.7},
{false, 36245, 'Relics of the Outcasts, Skettis', 43.0,16.4},
{false, 36354, 'Relics of the Outcasts, Veil Terokk', 46.0,44.2},
{false, 36355, 'Relics of the Outcasts, Veil Akraz', 43.2,27.3},
{false, 36356, 'Relics of the Outcasts, Sethekk Hollow', 67.4,39.8},
{false, 36359, 'Relics of the Outcasts, Veil Zekk', 60.2,53.9},
{false, 36360, 'Relics of the Outcasts, Nest of the Ravenspeakers', 51.9,48.9},
{false, 36657, 'Roody\'s Roo', 37.4,50.6},
{false, 36377, 'Rukhmar\'s Image', 44.3,12.0},
{false, 36366, 'Sailor Zazzuk\'s 180-Proof Rum', 59.2,90.6},
{false, 36362, 'Shattered Hand Cache', 56.3,28.8},
{false, 36444, 'Shattered Hand Explosives', 50.3,25.8},
{false, 36363, 'Shattered Hand Spoils', 58.3,36.6},
{false, 36456, 'Shredder Parts', 60.9,84.6},
{false, 36433, 'Smuggled Apexis Artifacts', 56.3,45.3},
{false, 36365, 'Spray-O-Matic 5000 XT', 59.6,81.3},
{false, 36421, 'Sun-Touched Cache, mid level', 34.1,27.5},
{false, 36422, 'Sun-Touched Cache, upper level', 33.3,27.3},
{false, 36364, 'Toxicfang Venom', 54.4,32.5},
{false, 36455, 'Waterlogged Satchel', 66.5,56.6},
}

ngd = {
--npcs
{false, 35778, 'Ancient Blademaster - TSH', },
{false, 35735, 'Berserk Shredder', },
{false, 35923, 'Hunter Blacktooth', },
{false, 34645, 'Warmaster Blugthol', },
{false, 35943, 'Outrider Duretha', },
{false, 35893, 'Flinthide', },
{false, 35153, 'Fungal Praetorian', },
{false, 35715, 'Gar\'lua the Wolfmother', },
{false, 35717, 'Gnarlhoof the Rabid', },
{false, 36159, 'Graveltooth', },
{false, 35898, 'Gorepetal', },
{false, 35714, 'Greatfeather', },
{false, 35877, 'Windcaller Korast', },
{false, 35836, 'The Lunker', },
{false, 35875, 'Ophiis', },
{false, 36229, 'Mr. Pinchy Sr.', },
{false, 35712, 'Redclaw the Feral', 73.5,58.1},
{false, 35623, 'Explorer Rixak', },
{false, 35900, 'Ru\'klaa', },
{false, 35932, 'Malroc Stonesunder', 81.0,59.8},
{false, 35920, 'Tur\'aka', },
{false, 35865, 'Void Ooze', },
{false, 35931, 'Warsong Scout', },
{false, 35912, 'Swindler Whitesea', },

--events
{false, 34862, 'Light the Braziers', },

--objects
{false, 35759, 'Abandoned Cargo', 67.7,59.7},
{false, 36072, 'Abu\'Gar\'s Favorite Lure', },
{false, 36089, 'Abu\'Gar\'s Reel', },
{false, 35711, 'Abu\'gar\'s Tenacity', },
{false, 36077, 'Adventurer\'s Mace', },
{false, 35597, 'Adventurer\'s Pack A', },
{false, 35969, 'Adventurer\'s Pack B', },
{false, 35765, 'Adventurer\'s Pack C', },
{false, 36050, 'Adventurer\'s Pouch A', },
{false, 36088, 'Adventurer\'s Pouch B', },
{false, 35955, 'Adventurer\'s Sack', },
{false, 35923, 'Adventurer\'s Stash', },
{false, 35673, 'Appropriated Warsong Supplies', },
{false, 36116, 'Bag of Herbs', },
{false, 35986, 'Bone-Carved Dagger', },
{false, 36174, 'Bounty of the Elements', },
{false, 35696, 'Burning Blade Cache', },
{false, 35661, 'Dreamflower', },
{false, 36036, 'Elemental Manacles', },
{false, 35954, 'Elemental Offering', },
{false, 35692, 'Freshwater Clam', },
{false, 35560, 'Fungus-Covered Chest', },
{false, 36074, 'Gambler\'s Purse', },
{false, 35987, 'Genedar Debris A', },
{false, 35999, 'Genedar Debris B', },
{false, 36002, 'Genedar Debris C', },
{false, 36008, 'Genedar Debris D', },
{false, 36011, 'Genedar Debris E', },
{false, 36099, 'Goblin Keg', },
{false, 35576, 'Goblin Pack A', },
{false, 35590, 'Goblin Pack B', },
{false, 35951, 'Goblin Stash', },
{false, 35694, 'Golden Kaliri Egg - TSH', },
{false, 36109, 'Goldtoe\'s Plunder', },
{false, 36051, 'Grizzlemaw\'s Favorite Bone', },
{false, 35622, 'Hidden Stash', },
{false, 36082, 'Lost Pendant', },
{false, 36052, 'Misplaced Artifacts', },
{false, 35643, 'Mountain Climber\'s Pack', },
{false, 34581, 'Mysterious Flower, Nagrand', },
{false, 36049, 'Ogre Beads', },
{false, 36039, 'Ogre Hammer', },
{false, 36020, 'Oshu\'gun Fragment', },
{false, 36115, 'Pale Elixir', },
{false, 36021, 'Pokhar\'s Thirteenth Axe', },
{false, 36035, 'Polished Sabron Skull', },
{false, 36102, 'Saberon Stash', },
{false, 36846, 'Spirit\'s Gift', },
{false, 36857, 'Smuggler\'s Cache', },
{false, 35648, 'Steamwheedle Supplies A', },
{false, 35646, 'Steamwheedle Bupplies B', },
{false, 35616, 'Steamwheedle Supplies C', },
{false, 35577, 'Steamwheedle Supplies D', },
{false, 35583, 'Steamwheedle Supplies E', },
{false, 35591, 'Steamwheedle Supplies F', },
{false, 35662, 'Steamwheedle Supplies G', },
{false, 36046, 'Telaar Defender Shield', },
{false, 35579, 'Void-Infused Crystal', },
{false, 35695, 'Warsong Cache', },
{false, 36073, 'Warsong Helm', },
{false, 35678, 'Warsong Lockbox', },
{false, 35976, 'Warsong Supplies', },
{false, 35682, 'Warsong Spear', },
{false, 35593, 'Warsong Spoils', },
{false, 36071, 'Waterlogged Satchel', },
}

unk = {
{false, 34236, 'Amethyl Crystal', },
{false, 35964, 'Aruumel\'s Mace', },
{false, 34260, 'Aruuna Mining Cart A', },
{false, 36262, 'Aruuna Mining Cart B', },
{false, 34252, 'Barrel of Fish'},
{false, 34259, 'Bonechewer Remnants', },
{false, 36658, 'Botani Stockpile', },
{false, 34471, 'Bright Coin', },
{false, 34248, 'Charred Sword', },
{false, 33565, 'Chimaera Scale', },
{false, 34254, 'Councillor\'s Chest', },
{false, 36604, 'Dark Iron Emergency Pack', },
{false, 33575, 'Demonic Cache', },
{false, 36625, 'Discarded Pack', },
{false, 34253, 'Draenei Weapons', },
{false, 34580, 'Draenor Flowerpicker', },
{false, 34581, 'Draenor Flowerpicker Note Found', },
{false, 36879, 'Dusty Lockbox', },
{false, 34249, 'Farmer\'s Bounty', },
{false, 34238, 'Foreman\'s Lunchbox', },
{false, 35580, 'Giant Beehive', },
{false, 36621, 'Gnome Canister', },
{false, 35162, 'Grovestrider Nest', },
{false, 36628, 'Hammer of Glory', },
{false, 33885, 'Harbor Treasure', },
{false, 36509, 'Hydra Treasure Pile', },
{false, 34251, 'Iron Box', },
{false, 36596, 'Iron Horde Weapon Stash', },
{false, 36863, 'Iron Horde Munitions', },
{false, 34233, 'Jug of Aged Ironwine', },
{false, 34261, 'Keluu\'s Belongings', },
{false, 34290, 'Ketya\'s Stash', },
{false, 34258, 'Light of the Sea', },
{false, 34235, 'Luminous Shell', },
{false, 33887, 'Mini-War Machine A', },
{false, 33888, 'Mini-War Machine B', },
{false, 33889, 'Mini-War Machine C', },
{false, 33890, 'Mini-War Machine D', },
{false, 36834, 'Gorgrond Ogre Gateway', },
{false, 36885, 'Ogre Waygate A', },
{false, 36886, 'Ogre Waygate B', },
{false, 36903, 'Ogre Waygate C', },
{false, 36904, 'Ogre Waygate D', },
{false, 36905, 'Ogre Waygate E', },
{false, 36906, 'Ogre Waygate F', },
{false, 36506, 'Orc Super Caster Loot', },
{false, 34250, 'Relic of Aruuna', },
{false, 34256, 'Relic of Telmor', },
{false, 34232, 'Rook\'s Tacklebox', },
{false, 34276, 'Rusted Lockbox', },
{false, 36521, 'Rylak Egg', },
{false, 35919, 'Sacrifice', },
{false, 36631, 'Sasha\'s Stash', },
{false, 33883, 'Shadowmoon Treasure #2', },
{false, 36651, 'SHarvest Crystal', },
{false, 36634, 'Sniper\'s Crossbow', },
{false, 35600, 'Strange Spore', },
{false, 33965, 'Tanaan Flowerpicker', },
{false, 36878, 'The Light of Karabor', },
{false, 34257, 'Treasure of Ango\'rosh', },
{false, 34239, 'Treasure of Tuurem', },
{false, 33574, 'Vindicator\'s Cache', },
{false, 34760, 'Warchest of Kull\'krosh', },
{false, 34255, 'Webbed Sac', },
{false, 36902, 'Aeda Brightdawn', },
{false, 36889, 'Defender Kaluum', },
{false, 36899, 'Defender Illona', },
{false, 36898, 'Delvar Ironfirst', },
{false, 36936, 'Leorajh', },
{false, 36900, 'Talonpriest Ishaal', },
{false, 36877, 'Torommok', },
{false, 36901, 'Vivianne', },
}

mistagged = {
{false, 34170, 'Moltnar', },
{false, 35908, 'Stoneshard Broodmother', },
{false, 36942, 'Soulbinder Aedraa', },
{false, 34521, 'Glowing Obsidian Shard (Frostfire Ridge)', },
}

SLASH_FFRVIGN1='/ffr'
function SlashCmdList.FFRVIGN(msg, editbox)
 myChatFrame:AddMessage('Frostfire vignette check',1,0,0)
 go(ffr)
end

SLASH_SMVVIGN1='/smv'
function SlashCmdList.SMVVIGN(msg, editbox)
 myChatFrame:AddMessage('SMV vignette check',1,0,0)
 go(smv)
end

SLASH_GRGVIGN1 = '/grg'
function SlashCmdList.GRGVIGN(msg, editbox)
 myChatFrame:AddMessage('Gorgrond vignette check',1,0,0)
 go(grg)
end

SLASH_TLDVIGN1='/tld'
function SlashCmdList.TLDVIGN(msg, editbox)
 myChatFrame:AddMessage('Talador vignette check',1,0,0)
 go(tld)
end

SLASH_SOAVIGN1='/soa'
function SlashCmdList.SOAVIGN(msg, editbox)
 myChatFrame:AddMessage('Spires vignette check',1,0,0)
 go(soa)
end

SLASH_NGDVIGN1='/ngd'
function SlashCmdList.NGDVIGN(msg, editbox)
 myChatFrame:AddMessage('Nagrand vignette check',1,0,0)
 go(ngd)
end

SLASH_UNKVIGN1='/unk'
function SlashCmdList.UNKVIGN(msg, editbox)
 myChatFrame:AddMessage('Unknown vignette check',1,0,0)
 go(unk)
end

SLASH_MISVIGN1='/mistagged'
function SlashCmdList.MISVIGN(msg, editbox)
 myChatFrame:AddMessage('Mistagged vignette check',1,0,0)
 go(mistagged)
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

