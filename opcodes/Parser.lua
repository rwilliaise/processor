local Parser = {}
local Operator = require("Operator")

local pc = 0 -- program counter

-- store rom & stuff
function Parser.Init(Registers, ROM)
	Operator.Init(Registers)
	Parser.ROM = ROM
end

-- get a function from an opcode and run it
function Parser.Parse(opcode)
	local op = Operator[opcode]
	assert(op, "Opcode not found!")
	op(Parser) -- run the function we get from operator
end

-- get the next byte in the rom
function Parser.Read()
	assert(Parser.ROM, "Parser not initialized!")
	if Parser.ROM:Size() <= pc + 1 then error("!! WARNING !! Failed to read from ROM! This could be program breaking!") return end
	pc = pc + 1
	return Parser.ROM:Get(pc)
end

-- set program counter position
function Parser.Set(new_pc)
	pc = new_pc
end

-- start the clock loop thing
function Parser.Loop()
	assert(Parser.ROM, "Parser not initialized!")
	while pc + 1 < Parser.ROM:Size() do -- make sure next byte exists
		local opcode = Parser.Read() -- get next byte
		Parser.Parse(opcode) -- parse its opcode
	end
end

return Parser
