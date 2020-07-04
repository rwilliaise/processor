local Operators = {}

function Operators.Init(Registers)
	Operators.Registers = Registers
end

local function LoadToRegister()
	
end

local function And(a,b)
	return bit32.band(a,b) -- There can't really be returns for these machine code instructions. We would have to set to a register or modify an existing register. I think instead of taking two values and bitwise and them, we should take register at address 0x0 and register at address 0x1 and bitwise and those instead. Then the output could easily go into 0x2 or just 0x0 again.
end

local function Or(a,b)
	return bit32.bor(a,b)
end

local function Not(x)
	return bit32.bnot(x)
end

Operators[0x2] = And
Operators[0x3] = Or
Operators[0x4] = Not

return Operators
