local Operators = {}

local function And(a,b)
	return bit32.band(a,b)
end

local function Or(a,b)
	return bit32.bor(a,b)
end

local function Not(x)
	return bit32.bnot(x)
end

Operators[0x0] = And
Operators[0x1] = Or
Operators[0x2] = Not

return Operators
