local Operators = {}

function Operators.Init(Registers)
	Operators.Registers = Registers
end

local function LoadToRegister()
	
end

local function jmp(parser) -- jump to address in rom
	local adr1 = parser.Read()
	print(adr1) -- temporary for debugging
	parser.Set(adr1 - 1) -- make it the next address to be read
end

local function Or(a,b)
	return bit32.bor(a,b)
end

local function Not(x)
	return bit32.bnot(x)
end

Operators[0x41] = jmp 
Operators[0x2] = And
Operators[0x3] = Or
Operators[0x4] = Not

return Operators
