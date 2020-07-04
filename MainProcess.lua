local Memory = require("memory/Memory")

local file_ROM = arg[1] or "rom.bin"

local ROM = Memory.FromFile(file_ROM, true)
local RAM = Memory.new(1024) -- we may need more addresses eventually

-- TODO: opcodes
