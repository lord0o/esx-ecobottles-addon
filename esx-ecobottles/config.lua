Config = {}

Config.BottleRecieve = { 1, 6 } -- This is the math random ex. math.random(1, 6) this will give you 1 - 6 bottles when searching a bin.
Config.BandageRecieve = { 1, 2 } -- Math para bandage
Config.RubberbandRecieve = { 1, 4 } -- Math para rubberband
Config.ScrapmetalRecieve = { 1, 3 } -- Math para scrapmetal
Config.ScrapplasticRecieve = { 1, 3 } -- Math para scrapplastic
Config.BulletshellRecieve = { 1, 2 } -- Math para bulletshell
Config.GunpowderRecieve = { 1, 4 } -- Math para gunpowder

Config.BottleReward = { 10, 40 } -- This is the math random ex. math.random(1, 4) this will give a random payout between 1 - 4
--Config.WeaponBottle = { 1, 1} -- math de weapon

-- Here you add all the bins you are going to search.
Config.BinsAvailable = {
    "prop_bin_01a",--
	"prop_bin_02a",
	"prop_cs_bin_02",
    "prop_bin_03a",--
	"prop_bin_04a",
    "prop_bin_05a",--
    "prop_bin_06a",
	"prop_bin_07a",
	"prop_bin_07b",
	"prop_bin_07c",
	"prop_bin_07d",
	"prop_bin_08a",
	"prop_bin_08open",
	"prop_bin_09a",
	"prop_bin_010a",
	"prop_bin_011a",
	"prop_bin_010b",
	"prop_bin_012a",
	"prop_bin_013a",
	"prop_bin_014a",
	"prop_bin_014b",
	"prop_bin_beach_01a",
	"prop_bin_beach_01d",
	"prop_bin_delpiero_b",
	"prop_bin_delpiero",
	--"prop_dumpster_01a", -- Conflicto con esx_GarbageCrew
	"prop_dumpster_02a",
	"prop_dumpster_02b",
	"prop_dumpster_3a",
	"prop_dumpster_3step",
	"prop_dumpster_4a",
	"prop_dumpster_4b"
}

Config.ShitAvailable = {
    "prop_rub_binbag_03b",
	"prop_rub_binbag_05",
	"prop_rub_binbag_04",
	"prop_rub_binbag_03"--

}


-- This is where you add the locations where you sell the bottles.
Config.SellBottleLocations = {
    vector3(29.337753295898, -1770.3348388672, 29.607357025146),
    vector3(388.30194091797, -874.88238525391, 29.295169830322),
    vector3(26.877752304077, -1343.0764160156, 29.497024536133)
}