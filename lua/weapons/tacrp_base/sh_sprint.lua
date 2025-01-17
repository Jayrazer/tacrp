function SWEP:GetIsSprinting()
    local owner = self:GetOwner()

    if !owner:IsValid() or owner:IsNPC() or owner:IsNextBot() then
        return false
    end

    if TacRP.ConVars["sprint_counts_midair"]:GetBool() and owner:GetMoveType() != MOVETYPE_NOCLIP and !owner:IsOnGround() and !self:GetReloading() then
        return true
    end

    if owner.TacRP_SprintBlock then return false end
    if owner:GetNWBool("TacRPChargeState", false) then return true end
    if owner:GetNWBool("SlidingAbilityIsSliding", false) then return false end

    local curspeed = owner:GetVelocity():Length()
    local walkspeed = owner:GetWalkSpeed()

    if TTT2 and owner.isSprinting == true then
        return (owner.sprintProgress or 0) > 0 and owner:KeyDown(IN_SPEED) and !owner:Crouching() and curspeed > walkspeed and owner:OnGround()
    elseif engine.ActiveGamemode() == "terrortown" then
        return false -- assume no sprint addon. tis silly anyways
    end

    if !owner:KeyDown(IN_FORWARD) and !owner:KeyDown(IN_BACK) and !owner:KeyDown(IN_MOVELEFT) and !owner:KeyDown(IN_MOVERIGHT) then return false end
    if !owner:KeyDown(IN_SPEED) then return false end -- SetButtons does not seem to affect this?
    if curspeed <= 0 then return false end
    if !owner:OnGround() then return false end

    return true
end

function SWEP:CanStopSprinting()
    local owner = self:GetOwner()
    if !owner:IsValid() or owner:IsNPC() or owner:IsNextBot() then
        return false
    end

    if TacRP.ConVars["sprint_counts_midair"]:GetBool() and owner:GetMoveType() != MOVETYPE_NOCLIP and !owner:OnGround() and !self:GetReloading() then
        return false
    end

    if owner:GetNWBool("TacRPChargeState", false) then
        return false
    end

    return true
end

function SWEP:GetSprintDelta()
    return self:GetSprintAmount()
end

function SWEP:EnterSprint()
    if !self:CanShootInSprint() then
        self:ToggleBlindFire(TacRP.BLINDFIRE_NONE)
    end
    if !self:CanReloadInSprint() and self:GetReloading() then
        -- use clip1 to check for whether the up-in has happened. if so, do not cancel (can't have you cancel the animation *that* easily)
        -- this causes fringe cases related to maniuplating magazine sizes but shouldn't be abusable
        if self:Clip1() < self:GetMaxClip1() then
            self:CancelReload(true)
            -- self:Idle()
        end
    end
    self:ScopeToggle(0)

    self:SetShouldHoldType()
end

function SWEP:ExitSprint()
    local amt = self:GetSprintAmount()
    self:SetSprintLockTime(CurTime() + (self:GetValue("SprintToFireTime") * amt))

    self:SetShouldHoldType()
end

SWEP.LastWasSprinting = false

function SWEP:ThinkSprint()
    local sprinting = self:GetIsSprinting() or self:GetSafe()

    local amt = self:GetSprintAmount()

    if self.LastWasSprinting and !sprinting then
        self:ExitSprint()
    elseif !self.LastWasSprinting and sprinting then
        self:EnterSprint()
    end

    self.LastWasSprinting = sprinting

    if sprinting then
        amt = math.Approach(amt, 1, FrameTime() / self:GetValue("SprintToFireTime"))
    else
        amt = math.Approach(amt, 0, FrameTime() / self:GetValue("SprintToFireTime"))
    end

    self:SetSprintAmount(amt)
end

function SWEP:CanShootInSprint(base)
    if !TacRP.ConVars["sprint_lower"]:GetBool() then return true end
    if base then
        return self:GetBaseValue("ShootWhileSprint")
    else
        return self:GetValue("ShootWhileSprint")
    end
end

function SWEP:CanReloadInSprint(base)
    return TacRP.ConVars["sprint_reload"]:GetBool()
end