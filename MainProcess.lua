local Memory = require("memory/Memory")

local file_ROM = arg[1] or "rom.bin"

local ROM = Memory.FromFile(file_ROM, true)
