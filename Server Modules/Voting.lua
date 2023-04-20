--#region Imports

local ServerScriptService = game:GetService('ServerScriptService')
local Players = game:GetService('Players')

local GameEnum = require(ServerScriptService.Modules.GameEnum)

--#endregion

local Voting = {}


function Voting:Prompt(Type, Time)

    while Time >= 0 do
    
        Time += 1

    end

end

return Voting

--[[

    author: InsulatorGMan
    date: April 20th, 2023

]]