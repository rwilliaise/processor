local ROM = {}

function ROM.new(filepath)
	local file = assert(io.open(filepath, "rb"), filepath .. " not found!")
	local bytes = file:read("*all")
	local out = {}
	for _, v in pairs(bytes:gfind(".")) do
		table.insert(out, v:byte())
	end
	return out
end

return ROM