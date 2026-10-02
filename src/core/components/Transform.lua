local Component = require("src.core.components.Component")
local Vector2 = require("src.math.Vector2")

---@class Transform : Component
---@field position Vector2
---@field rotation number
---@field scale Vector2
---@field private extends function
local Transform = Component:extends()
Transform._className = Enums.Classes.Transform

function Transform.new()
	local self = Component.new(Transform)

	self.position = Vector2.new()
	self.rotation = 0
	self.scale = Vector2.new(1, 1)

	return self
end

return Transform
