ATT.PrintName = "Slugs"
ATT.Icon = Material("entities/tacrp_att_acc_slugs.png", "mips smooth")
ATT.Description = "Shells that fire a single accurate slug."
ATT.Pros = {"Accuracy"}
ATT.Cons = {"Power"}

ATT.InstalledElements = {"smallmag"}

ATT.Category = "ammo_shotgun" // can be "string" or {"list", "of", "strings"}

ATT.SortOrder = 1

ATT.Mult_Damage_Min = 6.5
ATT.Mult_Damage_Max = 6.5

ATT.Num = 1

ATT.Mult_Spread = 0.33

ATT.Override_MuzzleEffect = "muzzleflash_slug"