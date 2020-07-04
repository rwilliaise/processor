local Memory = {}
Memory.__index = Memory
Memory.__metatable = {}

function Memory.new(Size)
	return setmetatable({Size = Size, Memory = {}}, Memory)
end

function Memory:SetAddress(Address, Value)
	if self.ReadOnly then error("Memory is read only!") return end
	if Address >= self.Size then error("Address out of range! " .. self.Size) return end 
	rawset(self.Memory, Address, bit32.band(Value, 255)) -- 8 bit values only
end

function Memory:SetReadOnly()
	if self.ReadOnly then
		error("Already readonly!")
		return
	end
	self.ReadOnly = true
end

function Memory:__newindex()
	error("Cannot set to memory manually!")
end

function Memory.FromFile(fileName, readonly)
	local File = assert(io.open(fileName, "rb"), "File not found!") -- read binary
	local OutBytes = {}
	while true do 
		local ByteBatch = File:read(16) -- read 16 bytes at a time
		if not ByteBatch then break end
		for Byte in string.gfind(ByteBatch, ".") do
			table.insert(OutBytes, Byte)
		end
	end
	local NewMemory = Memory.new(#OutBytes)
	for i = 1, #OutBytes do
		NewMemory:Set(i, OutBytes[i])
	end
	if readonly then
		NewMemory:SetReadOnly()
	end
	return NewMemory
end

function Memory:GetSize()
	return self.Size
end

function Memory:GetAddress(Address)
	if Address >= self.Size then error("Address out of range! " .. self.Size) return end
	return self.Memory[Address] or 0
end

Memory.Set = Memory.SetAddress
Memory.Get = Memory.GetAddress

return Memory
