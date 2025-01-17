ATT.PrintName = "Roulette"
ATT.FullName = "Russian Roulette"
ATT.Icon = Material("entities/tacrp_att_acc_roulette.png", "mips smooth")
ATT.Description = "A lethal game of chance. Spin the cylinder while loaded to reset the odds."
ATT.Pros = {}
ATT.Cons = {"att.procon.onebullet"}
ATT.Category = {"ammo_roulette"}

ATT.SortOrder = -1

--ATT.Mult_ShootChance = 1 / 6
ATT.Override_ClipSize = 1
ATT.Override_AmmoPerShot = 1

ATT.Hook_PreReload = function(wep)
    if wep:StillWaiting(true) then return end
    if wep:Clip1() < 1 then return end
    if wep:Ammo1() <= 0 and !wep:GetValue("InfiniteAmmo") then return end

    if SERVER then
        wep:SetNWInt("TacRP_RouletteShot", math.random(1, wep:GetBaseValue("ClipSize")))
        wep:PlayAnimation("jam", 1, true, true)
        wep:SetNextPrimaryFire(CurTime() + 1)
        wep:GetOwner():DoAnimationEvent(ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM)
    end
    return true
end

ATT.Hook_EndReload = function(wep)
    if SERVER then
        wep:SetNWInt("TacRP_RouletteShot", math.random(1, wep:GetBaseValue("ClipSize")))
    end
end

ATT.Hook_PreShoot = function(wep)
    if SERVER and wep:GetNWInt("TacRP_RouletteShot", 0) == 0 then
        wep:SetNWInt("TacRP_RouletteShot", math.random(1, wep:GetBaseValue("ClipSize")))
    end

    if wep:GetNWInt("TacRP_RouletteShot") != wep:GetNthShot() % wep:GetBaseValue("ClipSize") + 1 then
        wep.Primary.Automatic = false
        if wep:GetBlindFire() then
            wep:PlayAnimation("blind_dryfire")
        else
            wep:PlayAnimation("dryfire")
        end
        wep:EmitSound(wep:GetValue("Sound_DryFire"), 75, 100, 1, CHAN_BODY)
        wep:SetBurstCount(0)
        wep:SetNthShot(wep:GetNthShot() + 1)
        wep:SetNextPrimaryFire(CurTime() + (60 / wep:GetValue("RPM")))
        wep:GetOwner():DoAnimationEvent(ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL)

        return true
    end
end

if engine.ActiveGamemode() == "terrortown" then
    ATT.Pros = {"att.procon.explosive"}
    ATT.ExplosiveEffect = "HelicopterMegaBomb"
    ATT.ExplosiveDamage = 60
    ATT.ExplosiveRadius = 256
end