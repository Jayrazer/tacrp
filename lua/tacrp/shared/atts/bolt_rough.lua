ATT.PrintName = "Rugged"
ATT.FullName = "Rugged Bolt"
ATT.Icon = Material("entities/tacrp_att_bolt_rough.png", "mips smooth")
ATT.Description = "Recoil increases slower, but recovery rate is also slower."
ATT.Pros = {"stat.recoilpershot"}
ATT.Cons = {"stat.recoildissipation"}

ATT.Category = "bolt_automatic"

ATT.SortOrder = 4

ATT.Mult_RecoilDissipationRate = 0.75
-- ATT.Mult_RecoilSpreadPenalty = 0.825
ATT.Mult_RecoilPerShot = 0.9