--[[
	For simple instruction creation.
]]
local Instruction = {}
Instruction.__index = Instruction
local Instructions = {}
local UNIT

function Instruction.SetUnit(Unit)
	UNIT = Unit
end

function Instruction.new(callback, addr)
	return setmetatable({AddrMode = addr, Callback = callback}, Instruction)
end

function Instruction.GetInstructions()
	return Instructions
end

function Instruction:__call(...)
	self.callback(self.addr())
end

local function ADDR_ACC()
	return 0
end

local function ADDR_IMM()

end

for i = 0, 255 do
	Instructions[i] = nil
end