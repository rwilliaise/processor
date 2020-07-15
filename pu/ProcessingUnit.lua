local const NEGATIVE  = 0x80
local const OVERFLOW  = 0x40
local const CONSTANT  = 0x20
local const BREAK	  = 0x10
local const DECIMAL	  = 0x08
local const INTERRPUT = 0x04
local const ZERO	  = 0x02
local const CARRY	  = 0x01

local Instruction = {}
Instruction.__index = Instruction

function Instruction.new(callback)
	return setmetatable({Callback = callback}, Instruction)
end

function Instruction:__call(...)
	local args = {...}
	local src = args[1] & 65536
	self.callback()
end

local Unit = {}
Unit.__index = Unit
Unit.Instructions = {} -- only 256!

--[[
	Base constructor. Takes in a single callback that handles reading and writing to
	an external memory.
]]
function Unit.new(Memory)
	return setmetatable(
		{
			A = 0, -- accumulator
			X = 0, -- x-index
			Y = 0, -- y-index

			SP = 0, -- stack pointer
			PC = 0, -- program counter

			Z = 0, -- status

			illegal = false, -- illegal opcode

			Bus = 0,
			Memory = Memory,
		}, Unit)
end

function Unit:NEGATIVE(x)
	if x then
		self.Z = self.Z | NEGATIVE
	else
		self.Z = self.Z & ~NEGATIVE
	end
end

function Unit:OVERFLOW(x)
	if x then
		self.Z = self.Z | OVERFLOW
	else
		self.Z = self.Z & ~OVERFLOW
	end
end

function Unit:CONSTANT(x)
	if x then
		self.Z = self.Z | CONSTANT
	else
		self.Z = self.Z & ~CONSTANT
	end
end

function Unit:BREAK(x)
	if x then
		self.Z = self.Z | BREAK
	else
		self.Z = self.Z & ~BREAK
	end
end

function Unit:DECIMAL(x)
	if x then
		self.Z = self.Z | DECIMAL
	else
		self.Z = self.Z & ~DECIMAL
	end
end

function Unit:INTERRPUT(x)
	if x then
		self.Z = self.Z | INTERRPUT
	else
		self.Z = self.Z & ~INTERRPUT
	end
end

function Unit:ZERO(x)
	if x then
		self.Z = self.Z | ZERO
	else
		self.Z = self.Z & ~ZERO
	end
end

function Unit:CARRY(x)
	if x then
		self.Z = self.Z | CARRY
	else
		self.Z = self.Z & ~CARRY
	end
end

function Unit:Cycle()

end

return Unit