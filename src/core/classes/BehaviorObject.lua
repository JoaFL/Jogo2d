local Object = require("src.core.classes.Object")

---@class BehaviorObject : Object
---@field active boolean Active state
---@field protected _superClass Object The reference of the parent class
local BehaviorObject = Object:extends()
BehaviorObject._className = Enums.Classes.BehaviorObject ---@protected

---@generic T
---@param class T? The class that will inherits the BehaviorObject
---@return T|BehaviorObject
function BehaviorObject.new(class)
	local self = Object.new(class or BehaviorObject)

	self.active = true

	return self
end

---Override for custom update behavior
---Called every frame
---@param dt number Delta time
function BehaviorObject:update(dt) end

return BehaviorObject
