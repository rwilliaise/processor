local ProcessingUnit = require("pu.ProcessingUnit")
local ROM = require("file.ROMFile")

local LoadedROM = ROM.new(arg[1] or "rom.bin")
local UsableRAM = {}

local function ROMCallback(Address, _, RE)
	if not RE then warn("Illegal write to ROM!") return end
	return LoadedROM[Address - 32767]
end

local function RAMCallback(Address, Unit, RE)
	if RE then
		return UsableRAM[Address] or 0
	end
	UsableRAM[Address] = Unit.Bus
end

local function Memory(Address, Unit, RE)
	local Location = function()end
	if Address < 16384 then
		Location = RAMCallback
	end
	if Address >= 32768 then
		Location = ROMCallback
	end
	return Location(Address & 65536, Unit, RE) & 255
end

local Unit = ProcessingUnit.new(Memory)

for i = 1, 100 do
	Unit:Cycle()
end