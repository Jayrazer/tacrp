function SWEP:Think()
    local owner = self:GetOwner()

    -- if owner:KeyReleased(IN_ATTACK) then
    --     if !self:GetValue("RunawayBurst") then
    --         self:SetBurstCount(0)
    --     end
    --     if self:GetCurrentFiremode() < 0 and !self:GetValue("RunawayBurst") and self:GetBurstCount() > 0 then
    --         self:SetNextPrimaryFire(CurTime() + self:GetValue("PostBurstDelay"))
    --     end
    -- end

    -- if self:GetValue("RunawayBurst") then
    --     if self:GetBurstCount() > -self:GetCurrentFiremode() then
    --         self:SetBurstCount(0)
    --         self:SetNextPrimaryFire(CurTime() + self:GetValue("PostBurstDelay"))
    --     elseif self:GetBurstCount() > 0 then
    --         self:PrimaryAttack()
    --     end
    -- end

    if owner:KeyReleased(IN_ATTACK) then
        if !self:GetValue("RunawayBurst") then
            self:SetBurstCount(0)
        end
        if -self:GetCurrentFiremode() < 0 and !self:GetValue("RunawayBurst") and self:GetBurstCount() > 0 then
            self:SetNextPrimaryFire(CurTime() + self:GetValue("PostBurstDelay"))
        end
    end

    if self:GetValue("RunawayBurst") then
        if self:GetBurstCount() >= -self:GetCurrentFiremode() and -self:GetCurrentFiremode() > 0 then
            self:SetBurstCount(0)
            self:SetNextPrimaryFire(CurTime() + self:GetValue("PostBurstDelay"))
        elseif self:GetBurstCount() > 0 and self:GetBurstCount() < -self:GetCurrentFiremode() then
            self:PrimaryAttack()
        end
    end

    -- Semi-automatic click buffering
    if (IsFirstTimePredicted() and !game.SinglePlayer()) or SERVER then
        if !self:GetCharge() and self:GetCurrentFiremode() == 1 and owner:KeyPressed(IN_ATTACK)
                and self:StillWaiting() and !self:GetReloading() and !self:GetCustomize() and self:Clip1() >= self:GetValue("AmmoPerShot")
                and (self:GetNextPrimaryFire() - CurTime()) < 0.1 then
            self:SetCharge(true)
        elseif self:GetCharge() and !self:StillWaiting() then
            self:SetCharge(false)
            self:PrimaryAttack()
        end
    end

    self:ThinkRecoil()

    self:ThinkSprint()

    self:ThinkGrenade()

    self:ThinkReload()

    self:ThinkSights()

    self:ThinkFreeAim()

    self:ThinkBlindFire()

    self:ProcessTimers()

    if self:GetNextIdle() < CurTime() then
        self:Idle()
    end

    if CLIENT then
        if !self.LoadedPreset then
            self.LoadedPreset = true

            if GetConVar("TacRP_autosave"):GetBool() then
                self:LoadPreset()
                self:DoDeployAnimation()
            end
        end
    end
end