SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "AMD-65"
SWEP.Category = "Tactical RP"

SWEP.SubCatTier = "3Security"
SWEP.SubCatType = "4Assault Rifle"

SWEP.Description = "Hungarian AK clone with integrated grip and wire stock. High damage, but lower range than most rifles."

SWEP.ViewModel = "models/weapons/tacint/v_amd65.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_amd65.mdl"

SWEP.Slot = 2

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        Damage_Max = 36,
        Damage_Min = 18,
        Range_Min = 800,
        Range_Max = 3200,
        ArmorPenetration = 0.675,

        RecoilKick = 7.5,

        RecoilSpreadPenalty = 0.0037,

        MoveSpeedMult = 0.85,
        ShootingSpeedMult = 0.75,
        SightedSpeedMult = 0.75,
        MeleeSpeedMult = 1,
        ReloadSpeedMult = 1,
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 24,
        Damage_Min = 12,
        Range_Min = 300,
        Range_Max = 1500,
        RPM = 500,

        RecoilSpreadPenalty = 0.005,
        RecoilMaximum = 10,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 3,
            [HITGROUP_CHEST] = 1.25,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 0.9,
            [HITGROUP_RIGHTARM] = 0.9,
            [HITGROUP_LEFTLEG] = 0.75,
            [HITGROUP_RIGHTLEG] = 0.75,
            [HITGROUP_GEAR] = 0.9
        },

        ReloadTimeMult = 1.25,

        MoveSpeedMult = 0.9,
        ShootingSpeedMult = 0.8,
        MeleeSpeedMult = 1,
        SightedSpeedMult = 0.6,
        ReloadSpeedMult = 0.75,
    },
    [TacRP.BALANCE_PVE] = {
        Damage_Max = 12,
        Damage_Min = 7,

        RecoilKick = 6,

        HipFireSpreadPenalty = 0.03,
        RecoilSpreadPenalty = 0.003,

        MoveSpeedMult = 0.85,
        ShootingSpeedMult = 0.75,
        SightedSpeedMult = 0.75,
        MeleeSpeedMult = 1,
        ReloadSpeedMult = 1,
    },
    [TacRP.BALANCE_OLDSCHOOL] = {
        RecoilMaximum = 20,
        RecoilSpreadPenalty = 0.0035,
    }
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.AssaultRifle

// "ballistics"

SWEP.Damage_Max = 30
SWEP.Damage_Min = 14
SWEP.Range_Min = 750 // distance for which to maintain maximum damage
SWEP.Range_Max = 3000 // distance at which we drop to minimum damage
SWEP.Penetration = 11 // units of metal this weapon can penetrate
SWEP.ArmorPenetration = 0.65
SWEP.ArmorBonus = 1.25

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1.25,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.75,
    [HITGROUP_RIGHTLEG] = 0.75,
    [HITGROUP_GEAR] = 0.9
}

// misc. shooting

SWEP.Firemodes = {
    2,
    1
}

SWEP.RPM = 600

SWEP.Spread = 0.006

SWEP.ShootTimeMult = 0.5

SWEP.MuzzleVelocity = 25000

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 10
SWEP.RecoilResetTime = 0.15 // time after you stop shooting for recoil to start dissipating
SWEP.RecoilDissipationRate = 13
SWEP.RecoilFirstShotMult = 1 // multiplier for the first shot's recoil amount

SWEP.RecoilVisualKick = 1.5

SWEP.RecoilKick = 7
SWEP.RecoilStability = 0.65
SWEP.RecoilAltMultiplier = 150

SWEP.RecoilSpreadPenalty = 0.0035
SWEP.HipFireSpreadPenalty = 0.04

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.9
SWEP.ShootingSpeedMult = 0.75
SWEP.SightedSpeedMult = 0.6

SWEP.ReloadSpeedMult = 0.5

SWEP.AimDownSightsTime = 0.32
SWEP.SprintToFireTime = 0.38

SWEP.Sway = 1.25
SWEP.ScopedSway = 0.15

SWEP.FreeAimMaxAngle = 4.5

// hold types

SWEP.HoldType = "smg"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -2, -5.5)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(3, -2, -5)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -2)

SWEP.SightAng = Angle(-0.265, -0.5, -1)
SWEP.SightPos = Vector(-4.475, -7.5, -3.2)

SWEP.CorrectivePos = Vector(0.05, 0, 0.05)
SWEP.CorrectiveAng = Angle(0.64, 0.1, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK
SWEP.HolsterPos = Vector(5, 0, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

SWEP.ClipSize = 30
SWEP.Ammo = "ar2"

SWEP.ReloadTimeMult = 1
SWEP.DropMagazineModel = "models/weapons/tacint/magazines/ak47.mdl"
SWEP.DropMagazineImpact = "metal"

SWEP.ReloadUpInTime = 1.35
SWEP.DropMagazineTime = 0.45

// sounds

local path = "TacRP/weapons/amd65/"

SWEP.Sound_Shoot = "^" .. path .. "fire-1.wav"
SWEP.Sound_Shoot_Silenced = "TacRP/weapons/ak47/ak47_fire_silenced-1.wav"

SWEP.Vol_Shoot = 130
SWEP.ShootPitchVariance = 2.5 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
// ditto for shell
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_ak47"
SWEP.EjectEffect = 2

// anims

SWEP.AnimationTranslationTable = {
    ["fire_iron"] = "fire1_M",
    ["deploy"] = "deploy",
    ["fire1"] = "fire1_M",
    ["fire2"] = "fire2_M",
    ["fire3"] = "fire3_M",
    ["fire4"] = "fire4_M",
    ["fire5"] = "fire5_M",
    ["melee"] = {"melee1", "melee2"}
}

// attachments

SWEP.AttachmentElements = {
    ["foldstock"] = {
        BGs_VM = {
            {1, 1}
        },
        BGs_WM = {
            {1, 1}
        }
    },
    ["tactical"] = {
        BGs_VM = {
            {3, 1}
        },
    },
    ["optic"] = {
        BGs_VM = {
            {2, 1}
        },
    },
    ["akmount"] = {
        BGs_VM = {
            {2, 0}
        },
        AttPosMods = {
            [1] = {
                Pos_VM = Vector(-4.5, 0.65, 4),
                Pos_WM = Vector(-0.3, 1, 1),
            }
        },
        SortOrder = 2,
    },
}

SWEP.ProceduralIronFire = {
    vm_pos = Vector(0, -1.5, -0.4),
    vm_ang = Angle(0, 1, 0),
    t = 0.25,
    tmax = 0.25,
    bones = {
        {
            bone = "ValveBiped.bolt_cover",
            pos = Vector(0, 0, -3),
            t0 = 0.03,
            t1 = 0.2,
        },
    },
}


SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium", "optic_sniper", "optic_ak"},
        Bone = "ValveBiped._ROOT_AMD65",
        WMBone = "Box01",
        InstalledElements = {"optic"},
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        VMScale = 0.75,
        Pos_VM = Vector(-4.45, 0.225, 5),
        Pos_WM = Vector(0, 3, 0.5),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -90, 0),
    },
    [2] = {
        PrintName = "Muzzle",
        Category = "silencer",
        Bone = "ValveBiped._ROOT_AMD65",
        WMBone = "Box01",
        AttachSound = "TacRP/weapons/silencer_on.wav",
        DetachSound = "TacRP/weapons/silencer_off.wav",
        Pos_VM = Vector(-2.65, 0.25, 25.75),
        Pos_WM = Vector(0, 24.5, -1.25),
        Ang_VM = Angle(90, 0, 0),
        Ang_WM = Angle(0, -90, 0),
    },
    [3] = {
        PrintName = "Tactical",
        Category = "tactical",
        Bone = "ValveBiped._ROOT_AMD65",
        WMBone = "Box01",
        InstalledElements = {"tactical"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        Pos_VM = Vector(-2.5, -0.5, 13),
        Pos_WM = Vector(0, 19, -2),
        Ang_VM = Angle(90, 0, -90),
        Ang_WM = Angle(0, -90, 180),
    },
    [4] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_foldstock", "acc_sling", "acc_duffle", "perk_extendedmag"},
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
    },
    [5] = {
        PrintName = "Bolt",
        Category = {"bolt_automatic"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [6] = {
        PrintName = "Trigger",
        Category = {"trigger_auto"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [7] = {
        PrintName = "Ammo",
        Category = {"ammo_rifle"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [8] = {
        PrintName = "Perk",
        Category = {"perk", "perk_melee", "perk_shooting", "perk_reload"},
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
    },
}

local function addsound(name, spath)
    sound.Add({
        name = name,
        channel = 16,
        volume = 1.0,
        sound = spath
    })
end

addsound("TacInt_ak47.remove_clip", "TacRP/weapons/ak47/ak47_remove_clip.wav")
addsound("TacInt_ak47.insert_clip", "TacRP/weapons/ak47/ak47_insert_clip.wav")
addsound("TacInt_AMD65.Bolt_Back", path .. "bolt_back.wav")
addsound("TacInt_AMD65.Bolt_Release", path .. "bolt_release.wav")
addsound("TacInt_amd65.Rifle_catch", path .. "rifle_catch.wav")
addsound("TacInt_AMD65.Buttstock_Lockback", path .. "buttstock_lockback.wav")