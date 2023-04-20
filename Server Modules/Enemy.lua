--#region Imports

local ServerScriptService = game:GetService('ServerScriptService')

local GameEnum = require(ServerScriptService:WaitForChild('Modules').GameEnum)

--#endregion

local Enemy = {}


function Enemy:New(Params: table)
    
    local Success, Fail = pcall(function()
        
        if Params then
            
            local EnemyFolder = GameEnum.Assets:WaitForChild('Enemies')

            if EnemyFolder[Params.Name] then
                
                local Folder = EnemyFolder[Params.Name]

                local Stats = require(Folder:WaitForChild('Stats'))
                local ReplicatedEnemy = Folder:WaitForChild('Model'):Clone()

                ReplicatedEnemy.Humanoid.MaxHealth = Stats.Health
                ReplicatedEnemy.Humanoid.Health = Stats.Health            
                ReplicatedEnemy.Humanoid.WalkSpeed = Stats.WalsSpeed

                ReplicatedEnemy.PrimaryPart = ReplicatedEnemy.HumanoidRootPart
                ReplicatedEnemy:PivotTo(Params.Waypoints['1'])

                ReplicatedEnemy.Parent = workspace.Enemies

                Enemy.WalkPath(Params.Waypoints, ReplicatedEnemy.Humanoid)

                return ReplicatedEnemy

            else

                error('Enemy: '..Params.Name..' does not exist')

            end

        else

            error('No parameters provided')

        end

    end)

    if not Success then 

        warn('Enemy Module Exception:  ', Fail)

        return false

    end

end

function Enemy.WalkPath(Path: Folder, Humanoid: Humanoid)
    
    local Success, Fail = pcall(function()
    
        if Path:IsA('Folder') then

            coroutine.wrap(function()
            
                for i, v in ipairs(Path:GetChildren()) do

                    if Path[i]:IsA('Part') then

                        Humanoid:MoveTo(Path[i].Position)
                        Humanoid.MoveToFinished:Wait()

                    end

                end

            end)

        else

            error('Path is not a folder')

        end
    
    end)

    if not Success then

        warn('Enemy Module Exception: ', Fail)

    end

end

return Enemy

--[[

    author: InsulatorGMan
    date: April 19th, 2023

]]