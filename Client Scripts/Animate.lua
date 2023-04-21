--#region Imports

local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Workspace = game:GetService('Workspace')

local Modules = ReplicatedStorage:WaitForChild('Modules') 

local Animator = Modules:WaitForChild('Animator')
local GameEnum = Modules:WaitForChild('GameEnum')

local Assets = GameEnum.Assets
local Events = GameEnum.Events

--#endregion

Workspace.Enemies.OnChildAdded:Connect(function(instance)

    if Assets.Enemies[instance.Name] then

        local Enemy = Assets.Enemies[instance.Name]

        if Enemy['Animations'] then

            if Enemy['Animations']['Walk'] then
                
                local item = require(Enemy['Stats'])

               local a =  Animator:LoadAnimation(Enemy['Animations']['Walk'], instance.Humanoid.Animator, {

                    ['Looped'] = item['AnimationSettings']['Looped'],
                    ['AdjustedSpeed'] = item['AnimationSettings']['AdjustedSpeed']

                })

                a:Play()

            end

        else
            
            print('Client Animator Exception: No Animations')

        end

    else
        
        print('Client Animator Exception: Could not find')
        
    end

end)

--[[

    author: InsulatorGMan
    date: April 21st, 2023

]]