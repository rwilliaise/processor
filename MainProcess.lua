local Memory = require("memory/Memory")

assert(arg[1], "No ROM filename provided!")

local ROM = Memory.FromFile(arg[1])
