ATT.PrintName = "Magnum Buck"
ATT.FullName = "Magnum Buckshot"
ATT.Icon = Material("entities/tacrp_att_acc_magnum.png", "mips smooth")
ATT.Description = "High yield powder improves damage retention past point blank."
ATT.Pros = {"stat.range_min", "stat.muzzlevelocity"}
ATT.Cons = {"stat.recoil", "rating.mobility"}

ATT.Category = {"ammo_shotgun", "ammo_shotgun2"}

ATT.SortOrder = 3

ATT.Add_Range_Min = 250

ATT.Mult_RecoilKick = 1.5
ATT.Mult_MuzzleVelocity = 1.5

ATT.Add_Spread = 0.005
ATT.Add_ShotgunPelletSpread = 0.005

ATT.Mult_RecoilSpreadPenalty = 1.25

ATT.Mult_ShootingSpeedMult = 0.8