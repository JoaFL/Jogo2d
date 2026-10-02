---@alias Component StaticComponent

---@class Object
---@field uniqueId integer Unique indentificator
---@field protected _isDestroyed boolean Whether the Object is destroyed
---@field protected _className Enums.Classes The class name os the object
---@field protected _superClass Object The reference of the parent class
---@field protected __index Object
local Object = {}
Object.__index = Object
Object._className = Enums.Classes.Object ---@protected

local currentId = 0

---@protected
---@generic T
---@param class T? The class that will inherit the Object
---@return T
function Object.new(class)
	currentId = currentId + 1
	local self = setmetatable({}, class or Object)

	self.uniqueId = currentId
	self._isDestroyed = false

	return self
end

---Returns object's class name
---@return Enums.Classes
function Object:getClassName()
	return self._className
end

---Returns true if an object's class matches or inherits from a given class.
---@param className Enums.Classes
function Object:isA(className)
	local current = getmetatable(self)

	while current do
		if current._className == className then
			return true
		end
		current = current._superClass
	end

	return false
end

---Returns a new class that inherits current class
---@generic T
---@param self T
---@return T class new class
function Object.extends(self)
	if self["uniqueId"] then
		error("Expected a class, got an instance")
	end

	local class = setmetatable({}, { __index = self })
	class.__index = class
	class._superClass = self

	for key, value in pairs(self) do
		if key ~= "__index" and type(key) == "string" and string.sub(key, 1, 2) == "__" then
			class[key] = value
		end
	end

	return class
end

---Removes the object from the active scene.
function Object:destroy()
	self:onDestroy()
	self._isDestroyed = true
end

---Override for custom destruction behavior
function Object:onDestroy() end

---Override for custom initialization
function Object:init() end

return Object
