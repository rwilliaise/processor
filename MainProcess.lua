local Memory = require("memory/Memory")
local Parser = require("opcodes/Parser")

local file_ROM = arg[1] or "rom.bin"

local ROM = Memory.FromFile(file_ROM, true)
local RAM = Memory.new(65536)
local Registers = Memory.new(8) 

Parser.Init(Registers, ROM)
Parser.Loop()
 
