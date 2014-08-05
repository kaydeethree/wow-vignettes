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
  if IsQuestFlaggedCompleted(t[i][1]) then
   myChatFrame:AddMessage(
    t[i][1]..' '..t[i][2]..' @'..(t[i][3] or '?')..','..(t[i][4] or '?')
   );
  end
 end
end

ffr = {
-- unknown npcs
{32911, 'Ancient Clefthoof', },
{32913, 'Arranok\'s Ritual', },
{34519, 'Brotoculus', },
{32920, 'Deathtoll', },
{34382, 'Grand Warlock Duress', },
{34517, 'Gargantuan Frostbeak', },
{34851, 'Gruuk?', },
{33511, 'Sacrifice Pit', },
{32921, 'Skel\'tik the Baleful', },
{34865, 'Skok A', },
{34839, 'Skog B', },
{34522, 'Ug\'lok the Frozen', },

-- unknown objects
{33498, 'Bladespire Chef', },
{33447, 'Bladespire Craftsman', },
{33989, 'Blasting Charges - Cave A Cache', },
{33991, 'Blasting Charges - Cave B Cache', },
{33996, 'Blasting Charges - Cave C Cache', },
{33998, 'Blasting Charges - Cave D Cache', },
{33975, 'Blasting Charges - Rubble A', },
{33990, 'Blasting Charges - Rubble B', },
{33995, 'Blasting Charges - Rubble C', },
{33997, 'Blasting Charges - Rubble D', },
{34473, 'Envoy\'s Satchel', },
{33925, 'Frostwolf Cache 01', },
{33945, 'Frostwolf Cache 03', },
{33946, 'Frostwolf Cache 04A', },
{34931, 'Frostwolf Cache 04B', },
{33949, 'Frostwolf Cache 07', },
{33016, 'Frostwolf Supply Cache', },
{34713, 'Gronnstalker\'s Cache', },
{34841, 'Ice-Covered Supplies A', },
{34968, 'Ice-Covered Supplies B', },
{35282, 'Glowing Blue Mushroom', },
{34648, 'Gnawed Bone', },
{34907, 'Lagoon Pool/Giant Clam', },
{35347, 'Ogre Booty 000', },
{35367, 'Ogre Booty 001', },
{35368, 'Ogre Booty 002', },
{35369, 'Ogre Booty 003', },
{35370, 'Ogre Booty 004', },
{35371, 'Ogre Booty 005', },
{35373, 'Ogre Booty 006', },
{35567, 'Ogre Booty 007', },
{35568, 'Ogre Booty 008', },
{35569, 'Ogre Booty 009', },
{35570, 'Ogre Booty 010', },
{33532, 'Ogre Cache', },
{33930, 'Sabron Stash', },
{34652, 'Savage Clam', },
{33504, 'Shaman Fire Stone', },
{34937, 'Skaggit\'s Extra Stash', },
{34647, 'Snow-Covered Strongbox', },
{34557, 'Treasure Map A', },
{36464, 'Treasure Mab B', },
{36465, 'Treasure Map C', },
{36466, 'Treasure Map D', },
{36467, 'Treasure Map E', },
{36468, 'Treasure Map F', },
{33499, 'Time-Warped Ogre', },
{33649, 'Torched Iron Horde Scout', },
{36053, 'Unused Wood Pile', },

--[[ known npcs
{34497, 'Breathless', 27.8,50.3},
{32941, 'Canyon Icemother', 33.5,23.1},
{34843, 'Chillfang', 41.4,68.3},
{33014, 'Cindermaw', 41.8,46.6},
{34129, 'Coldstomp the Griever', 26,55},
{34131, 'Coldtusk', 54.2,67.7},
{34477, 'Cyclonic Fury', 67,78},
{33011, 'Frostwolf Veteran\'s Keepsake', 45,50},
{34130, 'Giantstalker Hunting Party', 58,32},
{34132, 'Scout Goreseeker', 76.5,63.3},
{33512, 'Gorg\'ak', 72.5,22.8},
{38425, 'Gruuk', 51.8,65.1},
{34708, 'Jehil the Climber', 61.8,26.6},
{32918, 'Giant-Slayer Kul', 54.7,22.3},
{33938, 'Primalist Mur\'og', 37.0,33.8},
{34470, 'Pale Fishmonger', 28.3,66.6},
{33843, 'Broodmother Reeg\'ak', 64,32},
{34133, 'The Beater', 26.9,31.9},
{34361, 'The Bone Crawler', 70,30},
{33440, 'Time-warped Brute Falling 1', 30,51},
{33497, 'Time-warped Brute Falling 2', 30,51},
{33439, 'Time-warped Brute Running', 30,51},
{33438, 'Time-warped Primalist', 30,51},
{34559, 'Yaga the Scarred', 40.6,27.6},
--]]

-- known objects
{33916, 'Arena Master\'s Warhorn', 23.2,25.0},
{34520, 'Burning Pearl', 42.4,19.6},
{33940, 'Crag-Leaper\'s Cache', 42.7,31.8},
{33531, 'Clumsy Cragmaul Brute', 50.2,18.7},
{34507, 'Frozen Frostwolf Axe', 24.2,48.6},
{34476, 'Frozen Treasure', 57.2,52.1},
{33948, 'Goren Leftovers', 66.7,26.4},
{33947, 'Grimfrost Treasure', 68.1,45.9},
{33017, 'Iron Horde Supplies', 69.0,69.0},
{34936, 'Lady Sena\'s Extra Stash', 74,53},
{33926, 'Lagoon Pool', 20,7},
{34642, 'Lucky Coin', 19.2,12.0},
{33502, 'Obsidian Petroglyph? (Carved Obsidian Idol)', 38.3,37.8},
{33525, 'Orc Couple', 54.8,35.5 , 63.4,14.7},
{34967, 'Raided Loot', 37.4,59.5},
{33500, 'Slave\'s Stash', 27.7,42.8},
{34641, 'Sealed Jug', 9.8,45.3},
{34649, 'Smoldering True Iron Deposit', 36.3,32.3},
{33501, 'Spectator\'s Chest', 24.2,27.1},
{33942, 'Supply Dump', 16.1,49.7},
{32803, 'Thunderlord Cache', 34.2,23.5},
{33505, 'Wiggling Egg', 64.4,65.8},
--]]
}

smv = {
-- unknown npcs
{33057, 'Rotbelcher', },
{36568, 'Malgosh Shadowkeeper', },
{35732, 'Shinri', },
{36880, 'Sneevel', },
{36431, 'Soul-Twister Torek', },
{35847, 'Voidseer Kalurg', },

--[[ known npcs
{33061, 'Amaukwa', 37,35},
{35731, 'Ba\'ruun', 52.8,16.5},
{35281, 'Bahameye', 29,5},
{33064, 'Dark Emanation', 48.5,43.3},
{35555, 'Darktalon', 49.6,41.8},
{35725, 'Faebright', 61.7,61.6},
{33664, 'Gorum', 21.6,33.1},
{35448, 'Darkmaster Go\'vid', 40,80},
{35558, 'Hypnocroak', 39,46},
{35909, 'Insha\'tar', 57.4,48.6},
{33043, 'Killmaw', 40.8,44.6},
{33039, 'Ku\'targ\ the Voidseer', 32.5,35.1},
{33642, 'Mother Om\'ra', 44.0,57.7},
{33055, 'Podling Leafreader', 37.7,14.3},
{35553, 'Rai\'vosh ',48.8,22.7},
{34068, 'Rockhoof', 52.7,50.8},
{35523, 'Morva Soultwister', 38.6,70.4},
{35906, 'Mad "King" Sporeon', 45.0,20.8},
{35688, 'Enavra Varandi', 67.9,63.9},
{33640, 'Veloss', 21.7,20.8},
{33643, 'Venomshade', 54.8,70.2},
{33389, 'Yggdrel', 48,66},
--]]

--[[ known events
{33038, 'Embaari Defense Crystal', 42.9,40.3},
{34743, 'The Crystal Blade of Torvath', 61.7,67.9},
--]]

--[[ known objects
{35581, 'Alchemist\'s Satchel', 54.9,45.0},
{35584, 'Ancestral Greataxe', 52.8,48.4},
{33869, 'Armored Elekk Tusk', 41.4,27.9},
{33584, 'Ashes of A\'kumbo', 37.8,44.3},
{33867, 'Astrologer\'s Box', 49.3,37.6},
{33046, 'Beloved\'s Offering', 36.8,41.4},
{33613, 'Bubbling Cauldron',37.2,23.1 },
{33569, 'Carved Dinking Horn', 33.5,39.6},
{34174, 'Fantastic Fish', 26.5,5.7},
{33891, 'Giant Moonwillow Cone', 34.5,46.2},
{35798, 'Glowing Cave Blossom', 48.7,47.5},
{33614, 'Greka\'s Urn', 38.5,43.0},
{33564, 'Hanging Satchel', 47.1,46.0},
{33041, 'Iron Horde Cargo Shipment', 42.1,61.2},
{33567, 'Iron Horde Tribute', 37.5,59.2},
{33568, 'Kaliri Egg', 57.9,45.3},
{35530, 'Lunarfall Egg', 30.2,19.9},
{35603, 'Mikkal\'s Chest', 58.9,21.9},
{33570, 'Mushroom Covered Chest or Shadowmoon Exile Treasure', 52.9,24.9, 45.8,24.6},
{36507, 'Orc Skeleton', 67.0,33.5},
{33384, 'Peaceful Offering South', 44.5,63.6},
{33610, 'Peaceful Offering East', 45.2,60.5},
{33611, 'Peaceful Offering West', 43.8,60.6},
{33612, 'Peaceful Offering North', 44.5,59.1},
{35381, 'Pippers\' Buried Supplies 1', 30.0,18.3},
{35382, 'Pippers\' Buried Supplies 2', 30.9,17.7},
{35383, 'Pippers\' Buried Supplies 3', 28.9,15.6},
{35384, 'Pippers\' Buried Supplies 4', 30.7,20.6},
{33886, 'Ronokk\'s Belongings', 31.3,39.1},
{33572, 'Rotting Basket', 22.9,33.8},
{33573, 'Rovo\'s Dagger', 36.7,44.5},
{33571, 'Shadowmoon Sacrifical Dagger', 30.0,45.4},
{35289, 'Spark\'s Stolen Supplies', 30.9,12.8},
{35280, 'Stolen Treasure', 27.1,2.5},
{35677, 'Sunken Fishing Boat', 37.2,26.0},
{35279, 'Sunken Treasure', 28.8,7.2},
{33540, 'Uzko\'s Knickknacks', 35.9,40.9},
{33866, 'Veema\'s Herb Bag', 34.2,43.5},
{33566, 'Waterlogged Chest', 39.2,83.9},
--]]
}

grg = {
-- unknown npcs
{34197, 'Bloodbloom the Colossus', },
{35996, 'Depthroot', },
{34231, 'Giant Snake', },
{36204, 'Gorger the Hungry', },
{34162, 'Icklarv', },
{34143, 'Kal\'rak the Drunk', },
{34127, 'Mother Bloodtusk', },
{34160, 'Nixxie the Goblin', },
{34243, 'Rak\'nar Muzzlebash', },
{34198, 'Roardan', },
{35910, 'Stomper Kreego', },
{36858, 'Steeltusk', },
{36837, 'Stompalupagus', },
{34168, 'Stormwave', },
{34191, 'Un\'glok Blackfinger', },
--]]

-- arena-only treasures
{36710, 'arena1', },
{36721, 'arena2', },
{36722, 'arena3', },
{36723, 'arena4', },
{36726, 'arena5', },
{36727, 'arena6', },
{36728, 'arena7', },
{36729, 'arena8', },
{36730, 'arena9', },
{36731, 'arena10', },
{36732, 'arena11', },
{36733, 'arena12', },
{36734, 'arena13', },
{36735, 'arena14', },
{36736, 'arena15', },
{36737, 'arena16', },
{36738, 'arena17', },
{36739, 'arena18', },
{36740, 'arena19', },
{36781, 'arena20', },
{36782, 'arena21', },
{36783, 'arena22', },
{36784, 'arena23', },
{36787, 'arena24', },
{36789, 'arena25', },
--]]

-- mill-only treasures
{35965, 'mill3', },
{35966, 'mill4', },
{35967, 'mill5', },
{35968, 'mill6', },
{35971, 'mill7', },
{35979, 'mill9', },
{35980, 'mill10', },
{35981, 'mill11', },
{35984, 'mill13', },
{36001, 'mill14', },
{36003, 'mill15', },
{36019, 'mill17', },
{36430, 'mill18', },
{36713, 'mill19', },
{36714, 'mill20', },
{36715, 'mill21', },
{36716, 'mill22', },
{36717, 'mill23', },
{36718, 'mill24', },
{36720, 'mill25', },
--]]

-- open treasures
{34147, 'grg1', },
{34149, 'grg2', },
{34151, 'grg3', },
{34153, 'grg4', },
{34146, 'grg5', },
{34155, 'grg6', },
{34152, 'grg7', },
{34172, 'grg8', },
{34173, 'grg9', },
{34176, 'grg11', },
{34201, 'grg13', },
{34177, 'grg14', },
{34219, 'grg15', },
{34195, 'grg16', },
{34206, 'grg17', },
{34179, 'grg18', },
{34210, 'grg19', },
{34211, 'grg20', },
{34214, 'grg21', },
{34215, 'grg22', },
{34218, 'grg23', },
{37170, 'Femur of Improbability', },
{35709, 'Laughing Skull Cache', },
{36118, 'Pile of Rubble', },
--]]

--[[ known npcs
{35335, 'Bashiok', 40.2,79.0},
{36794, 'Sylldross', 63,62},
--]]

--[[ mill known treasures
{35701, 'Mill1A: Aged Stone Container?', 49.1,48.5},
{36712, 'Mill1B: Aged Stone Container?', 49.1,48.5},
{35952, 'Mill2: Aged Stone Container?', 49.1,48.5},
{35975, 'Mill: Remains of Explorer Engieer Toldirk Ashlamp', 46.0,93.6},
{35982, 'Mill: Botani Essence Seed', 42.0,81.6},
{36015, 'Mill: Mysterious Petrified Pod', 60.5,72.8},
--]]

--[[ open known treasures
{34241, 'Ockbar\'s Pack', 43.0,93.0},
--]]
}

tld = {
-- unknown
{36942, 'Soulbinder Aedraa', },
{34184, 'Arakos Killed Boss', },
{34182, 'Arakos Looted Treasure', },
{34199, 'Anchorite\'s Sojurn', },
{34101, 'Aruumel\'s Worn Mace', },
{36937, 'Bladefury Treasure - Burning Blade Cache', },
{35219, 'Burning Front', },
{36849, 'Burning Missive A', },
{36850, 'Burning Missive B', },
{36851, 'Burning Missive C', },
{36852, 'Burning Missive D', },
{36853, 'Burning Missive E', },
{36854, 'Burning Missive F', },
{36855, 'Burning Missive G', },
{36856, 'Burning Missive H', },
{34165, 'Cro Fleshrender', },
{34142, 'Dr. Gloom', },
{34220, 'Echo of Murmur A', },
{34221, 'Echo of Murmur B', },
{34128, 'Four Friends complete A', },
{34134, 'Four Friends complete H', },
{34115, 'Four Friends found H', },
{34145, 'Frenzied Animus', },
{34483, 'Galzomar', },
{36829, 'Gift of the Ancients', },
{34116, 'Girl 1 found H', },
{34117, 'Girl 2 found H', },
{34189, 'Glimmerwing', },
{34118, 'Guy 1 found B', },
{34119, 'Guy 2 found B', },
{34185, 'Hammertooth', },
{34167, 'Hen-Mother Hami', },
{35220, 'Kharazos the Triumphant', },
{34208, 'Lo\'marg Jawcrusher', },
{36919, 'Murloc Boss', },
{34196, 'Ra\'kahn', },
{34671, 'Shirzir', },
{35244, 'Skagg', },
{34207, 'Sparkling Pool', },
{34171, 'Taladorantula', },
{34204, 'Wandering Vindicator - kill', },
{34205, 'Wandering Vindicator - loot', },
{34140, 'Yuuri\'s Gift', },
{33933, 'Deceptia\'s Smoldering Boots', },
--]]

--[[known npcs
{34668, 'Burning Front rare demon (Talonpriest Zorka?)', 56.7,62.5},
{35018, 'Felbark', 50.4,83.5},
{34114, 'Four Friends found A', },
{34929, 'Gennadian', 67.5,80.8},
{34110, 'Girl 1 found A', },
{34111, 'Girl 2 found A', },
{34112, 'Guy 1 found A', },
{34113, 'Guy 2 found A', },
{34498, 'Klikixx', 66.8,85.3},
{34589, 'No\'losh', 85.9,29.4},
{35491, 'Underseer Bloodmane', 63.8,20.7},
{34945, 'Underseer Bloodmane (Prize?)', 63.8,20.7},
{34148, 'Viperlash', 37.6,74.9},
{34135, 'Yazheera the Incinerator', 53.8,25.6},
--]]
}

soa = {
--unknown npcs
{36279, 'Poisonmaster Brtusk', },
{36943, 'Gaze', },
{36305, 'Gobblefin', },
{36887, 'Hermit Palefur', },
{36470, 'Rotcap', },
{36312, 'Sun Age Valarik', },
{36278, 'Talonbreaker', },
{36254, 'Tesska the Broken', },

--unknown objects
{36458, 'Abandoned Mining Pick', },
{36462, 'Admiral Taylor\'s Coffer', },
{36411, 'A Lost Ring', },
{36453, 'Coinbender\'s Payment', },
{36418, 'Dark Grimoire', },
{36459, 'Dislodged Saw Blade', },
{35334, 'The Egg of Varasha', },
{36395, 'Elixir of Shadow Sight 01', },
{36397, 'Elixir of Shadow Sight 02', },
{36398, 'Elixir of Shadow Sight 03', },
{36400, 'Elixir of Shadow Sight 05', },
{36401, 'Elixir of Shadow Sight 06', },
{36246, 'Fractured Sunstone', },
{36381, 'Gift of Anzu', },
{36386, 'Gift of Anzu (Crossbow)', },
{36388, 'Gift of Anzu (Wand)', },
{36389, 'Gift of Anzu (Mask)', },
{36390, 'Gift of Anzu (Knife)', },
{36392, 'Gift of Anzu (Axe)', },
{36444, 'Iron Horde Explosives', },
{36445, 'Iron Horde Spear', },
{36247, 'Lost Herb Satchel', },
{36416, 'Misplaced Scroll', },
{36244, 'Misplaced Scrolls', },
{36405, 'Offering to the Raven Mother 02', },
{36410, 'Offering to the Raven Mother 05', },
{36340, 'Ogron Plunder', },
{36402, 'Orcish Signaling Horn', },
{36243, 'Outcast\'s Basket A', },
{36447, 'Outcast\'s Basket B', },
{36446, 'Outcast\'s Pouch', },
{36415, 'Reagent Pouch', },
{36245, 'Relics of the Outcasts A', },
{36354, 'Relics of the Outcasts B', },
{36355, 'Relics of the Outcasts C', },
{36356, 'Relics of the Outcasts D', },
{36359, 'Relics of the Outcasts E', },
{36798, 'Rooby Roo', },
{36375, 'Sethekk Idol', },
{36450, 'Sethekk Ritual Brew', },
{36361, 'Shattered Hand Lockbox', },
{36362, 'Shattered Hand Supplies', },
{36363, 'Shattered Hand Spoils', },
{36456, 'Shredder Parts', },
{36433, 'Smuggled Apexis Artifacts', },
{36374, 'Statue of Anzu', },
{36421, 'Sun-Touched Cache A', },
{36424, 'Sun-Touched Cache C', },
{36463, 'Taylor\'s Coffer Key', },
{36364, 'Toxicfang Venom', },
{36455, 'Waterlogged Satchel', },

--[[ known npcs
{35599, 'Blade-Dancer Aeryx', 46.8,23.3},
{36283, 'Blightglow', 65.2,67.8},
{36291, 'Betsi Boombasket', 58.3,84.5},
{36129, 'Nas Dunberlin', 36.3,52.6},
{36303, 'Eyeless', 49.9,29.8},
{36297, 'Festerbloom', 55.2,35.6},
{36304, 'Gochar', 53.5,49.1},
{36306, 'Jiasska the Sporegorger', 56.4,94.8},
{36268, 'Kalos the Bloodbathed', 62.8,37.3},
{36479, 'Nightmaw', 49.3,37.5},
{36396, 'Mutafen', 53.0,89.3},
{36288, 'Oskiira the Vengeful', 64.9,54.4},
{36478, 'Shadowbark', 51.9,35.5},
{36276, 'Spawn of Sethe', 68.8,48.9},
{36267, 'Durkath Steelmaw', 46.4,28.5},
{36265, 'Stonespite', 33.6,21.9},
{36298, 'Sunderthorn', 58.5,45.1},
{36472, 'Swarmleaf', 53.0,53.0},
--]]

--[[ known objects
{35627, 'Basket of Arakkoa Goods', 40.2,60.3},
{35871, 'Beached Escape Pod and Nizzix\'s Chest', 60.9,88.0},
{36367, 'Campaign Contributions', 55.5,90.9},
{36454, 'Drypeak Mushrooms', 63.6,67.4},
{36399, 'Elixir of Shadow Sight, Bloodmane Valley', 49.1,62.6},
{36420, 'Garrison Resources', 37.2,47.5},
{36451, 'Garrison Workman\'s Hammer', 41.9,50.5},
{36360, 'Nest of the Ravenspeakers Relics of the Outcasts', 51.9,48.9},
{36403, 'Offering to the Raven Mother, Behind Swarmleaf', 53.3,55.5},
{36406, 'Offering to the Raven Mother, Bloodmane Valley North', 48.9,54.7},
{36407, 'Offering to the Raven Mother, Bloodmane Valley South', 51.9,64.6},
{36657, 'Roody\'s Roo', 37.4,50.6},
{36377, 'Rukhmar\'s Image', 44.3,12.0},
{36366, 'Sailor Zazzuk\'s 180-Proof Rum', 59.2,90.6},
{36365, 'Spray-O-Matic 5000 XT', 59.6,81.3},
{36422, 'Sun-Touched Cache, Apexis Excavation', 33.3,27.3},
--]]
}

ngd = {
--unknown npcs
{35778, 'Ancient Blademaster - TSH', },
{35735, 'Berserk Shredder', },
{36597, 'Berthora', },
{35923, 'Hunter Blacktooth', },
{34645, 'Warmaster Blugthol', },
{35943, 'Duretha', },
{35893, 'Flinthide', },
{35153, 'Fungal Praetorian', },
{35715, 'Gar\'lua the Wolfmother', },
{35717, 'Gnarlhoof the Rabid', },
{36159, 'Graveltooth', },
{35898, 'Gorepetal', },
{35714, 'Greatfeather', },
{35877, 'Windcaller Korast', },
{35836, 'The Lunker', },
{35875, 'Ophiis', },
{36229, 'Mr. Pinchy Sr.', },
{35712, 'Redclaw the Feral', },
{36600, 'Riptar', },
{35623, 'Explorer Rixak', },
{35900, 'Ru\'klaa', },
{35920, 'Tur\'aka', },
{35865, 'Void Ooze', },
{35931, 'Warsong Scout', },
{35932, 'Warsong Tactician', },
{35912, 'Swindler Whitesea', },

--unknown events
{34862, 'Light the Braziers', },

--unknown objects
{35759, 'Abandoned Cargo', },
{36072, 'Abu\'Gar\'s Favorite Lure', },
{36089, 'Abu\'Gar\'s Reel', },
{35711, 'Abu\'gar\'s Tenacity', },
{36077, 'Adventurer\'s Mace', },
{35969, 'Adventurer\'s Pack B', },
{35597, 'Adventurer\'s Pack A', },
{35765, 'Adventurer\'s Pack C', },
{36050, 'Adventurer\'s Pouch A', },
{36088, 'Adventurer\'s Pouch B', },
{35955, 'Adventurer\'s Sack', },
{35923, 'Adventurer\'s Stash', },
{35673, 'Appropriated Warsong Supplies', },
{36116, 'Bag of Herbs', },
{35986, 'Bone-Carved Dagger', },
{36174, 'Bounty of the Elements', },
{35696, 'Burning Blade Cache', },
{35661, 'Dreamflower', },
{36036, 'Elemental Manacles', },
{35954, 'Elemental Offering', },
{35692, 'Freshwater Clam', },
{35560, 'Fungus-Covered Chest', },
{36074, 'Gambler\'s Purse', },
{35987, 'Genedar Debris A', },
{35999, 'Genedar Debris B', },
{36002, 'Genedar Debris C', },
{36008, 'Genedar Debris D', },
{36011, 'Genedar Debris E', },
{36099, 'Goblin Keg', },
{35576, 'Goblin Pack A', },
{35590, 'Goblin Pack B', },
{35951, 'Goblin Stash', },
{35694, 'Golden Kaliri Egg - TSH', },
{36109, 'Goldtoe\'s Plunder', },
{36051, 'Grizzlemaw\'s Favorite Bone', },
{35622, 'Hidden Stash', },
{36082, 'Lost Pendant', },
{36052, 'Misplaced Artifacts', },
{35643, 'Mountain Climber\'s Pack', },
{36049, 'Ogre Beads', },
{36039, 'Ogre Hammer', },
{36020, 'Oshu\'gun Fragment', },
{36115, 'Pale Elixir', },
{36021, 'Pokhar\'s Thirteenth Axe', },
{36035, 'Polished Sabron Skull', },
{36102, 'Saberon Stash', },
{36846, 'Spirit\'s Gift', },
{36857, 'Smuggler\'s Cache', },
{35648, 'Steamwheedle Supplies A', },
{35646, 'Steamwheedle Bupplies B', },
{35616, 'Steamwheedle Supplies C', },
{35577, 'Steamwheedle Supplies D', },
{35583, 'Steamwheedle Supplies E', },
{35591, 'Steamwheedle Supplies F', },
{35662, 'Steamwheedle Supplies G', },
{36046, 'Telaar Defender Shield', },
{35579, 'Void-Infused Crystal', },
{35695, 'Warsong Cache', },
{36073, 'Warsong Helm', },
{35678, 'Warsong Lockbox', },
{35976, 'Warsong Supplies', },
{35682, 'Warsong Spear', },
{35593, 'Warsong Spoils', },
{36071, 'Waterlogged Satchel', },
}

unk = {
{34236, 'Amethyl Crystal', },
{35964, 'Aruumel\'s Mace', },
{34260, 'Aruuna Mining Cart A', },
{36262, 'Aruuna Mining Cart B', },
{34252, 'Barrel of Fish'},
{34259, 'Bonechewer Remnants', },
{36658, 'Botani Stockpile', },
{34471, 'Bright Coin', },
{34248, 'Charred Sword', },
{33565, 'Chimaera Scale', },
{34254, 'Councillor\'s Chest', },
{36604, 'Dark Iron Emergency Pack', },
{36605, 'Dark Iron Remains', },
{33575, 'Demonic Cache', },
{36625, 'Discarded Pack', },
{34253, 'Draenei Weapons', },
{36879, 'Dusty Lockbox', },
{34249, 'Farmer\'s Bounty', },
{34238, 'Foreman\'s Lunchbox', },
{35580, 'Giant Beehive', },
{34521, 'Glowing Obsidian Shard', },
{36621, 'Gnome Canister', },
{36203, 'Goren Egg', },
{36610, 'Gorge Spear', },
{35162, 'Grovestrider Nest', },
{36628, 'Hammer of Glory', },
{33885, 'Harbor Treasure', },
{36509, 'Hydra Treasure Pile', },
{34251, 'Iron Box', },
{36596, 'Iron Horde Weapon Stash', },
{36863, 'Iron Horde Munitions', },
{36618, 'Iron Supply Chest', },
{34233, 'Jug of Aged Ironwine', },
{34261, 'Keluu\'s Belongings', },
{34290, 'Ketya\'s Stash', },
{34258, 'Light of the Sea', },
{36654, 'Lost Dwarf', },
{34235, 'Luminous Shell', },
{33887, 'Mini-War Machine A', },
{33888, 'Mini-War Machine B', },
{33889, 'Mini-War Machine C', },
{33890, 'Mini-War Machine D', },
{36834, 'Gorgrond Ogre Gateway', },
{36885, 'Ogre Waygate A', },
{36886, 'Ogre Waygate B', },
{36903, 'Ogre Waygate C', },
{36904, 'Ogre Waygate D', },
{36905, 'Ogre Waygate E', },
{36906, 'Ogre Waygate F', },
{36506, 'Orc Super Caster Loot', },
{34263, 'Pure Crystal Dust', },
{34250, 'Relic of Aruuna', },
{34256, 'Relic of Telmor', },
{34232, 'Rook\'s Tacklebox', },
{34276, 'Rusted Lockbox', },
{36521, 'Rylak Egg', },
{35919, 'Sacrifice', },
{36631, 'Sasha\'s Stash', },
{33883, 'Shadowmoon Treasure #2', },
{36651, 'SHarvest Crystal', },
{36634, 'Sniper\'s Crossbow', },
{34940, 'Spider Dagger', },
{35600, 'Strange Spore', },
{36878, 'The Light of Karabor', },
{34257, 'Treasure of Ango\'rosh', },
{34239, 'Treasure of Tuurem', },
{33574, 'Vindicator\'s Cache', },
{34760, 'Warchest of Kull\'krosh', },
{34255, 'Webbed Sac', },
{36902, 'Aeda Brightdawn', },
{36889, 'Defender Kaluum', },
{36898, 'Delvar Ironfirst', },
{36936, 'Leorajh', },
{36900, 'Talonpriest Ishaal', },
{36877, 'Torommok', },
{36901, 'Vivianne', },
}

mistagged = {
{36186, 'Greldrok the Cunning', },
{36178, 'Mandrakor the Night Hunter', },
{34170, 'Moltnar', },
{35908, 'Stoneshard Broodmother', },
{36656, 'Sunclaw', },
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
 SlashCmdList.MISVIGN()
end

