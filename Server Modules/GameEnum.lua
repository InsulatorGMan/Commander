--#region Imports

local ReplicatedStorage = game:GetService('ReplicatedStorage')

-- #endregion

local GameEnum = {}

GameEnum.Assets = ReplicatedStorage:WaitForChild('Assets')

local Folder = ReplicatedStorage:WaitForChild('Events')

GameEnum.Events = {

    ['Vote'] = Folder:WaitForChild('Vote'),
    [''] = Folder:WaitorChild(''),
    
}

return GameEnum

--[[

    author: InsulatorGMan
    date: April 19th, 2023

]]