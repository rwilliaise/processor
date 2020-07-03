local Memory = {}
Memory.__index = Memory

function Memory.new(Size)
	return setmetatable({Size = Size, Memory = {}}, Memory)
end

function Memory:SetAddress(Address, Value)
	if self.ReadOnly then error("Memory is read only!") return end
	if Address >= self.Size then error("Address out of range! " .. self.Size) return end 
	self.Memory[Address] = Value
end

function Memory:SetReadOnly()
	if self.ReadOnly then
		error("Already readonly!")
		return
	end
	self.ReadOnly = true
end

function Memory.FromFile(fileName, readonly)
	-- TODO: pls do this!	
end

function Memory:GetAddress(Address)
	if Address >= self.Size then error("Address out of range! " .. self.Size) return end
	return self.Memory[Address] or 0
end

return Memory
