local Component = require("src.core.components.Component")
local Vector2 = require("src.math.Vector2")

---@class PlayerProjectile : Component
---@field speed number
---@field direction Vector2
local PlayerProjectile = Component:extends()
PlayerProjectile._className = Enums.Classes.PlayerProjectile

---@param speed number?
---@param direction Vector2?
---@return PlayerProjectile
function PlayerProjectile.new(speed, direction)
	local self = Component.new(PlayerProjectile)
	---@cast self PlayerProjectile

	self.speed = speed or 500
	self.direction = (direction or Vector2.new(0, -1)):normalized()

	return self
end

---@param dt number
function PlayerProjectile:update(dt)
	if not self.active then
		return
	end

	local position = self._gameObject.transform.position
	position.x = position.x + self.direction.x * self.speed * dt
	position.y = position.y + self.direction.y * self.speed * dt
end

return PlayerProjectile