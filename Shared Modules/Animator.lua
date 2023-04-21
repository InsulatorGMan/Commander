--#region Imports

local ReplicatedStorage = game:GetService('ReplicatedStorage')

local GameEnum = ReplicatedStorage:WaitForChild('Modules'):WaitForChild('GameEnum')

--#endregion

local Animator = {}

Animator.Event = ReplicatedStorage:WaitForChild('Events').Animate

function Animator:LoadAnimation(Animation, AnimationController, AnimationParams)
    
    local Success, Fail = pcall(function() 
    
        if Animation:IsA('Animation') then
            
            local Anim = AnimationController:LoadAnimation(Animation)

            Anim.Looped = AnimationParams.Looped
            Anim:AdjustSpeed(AnimationParams.AdjustedSpeed)

            return Anim

        else

            error('Invalid Animation')

        end

    end)

    if not Success then
        
        warn('Animator Exception: ', Fail)

    end

end



return Animator

--[[

    author: InsulatorGMan
    date: April 20th, 2023

]]