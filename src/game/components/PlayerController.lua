local Component = require("src.core.components.Component")
local PlayerProjectile = require("src.game.components.PlayerProjectile")
local Vector2          = require("src.math.Vector2")
local Scene            = require("src.core.classes.Scene")

---@class PlayerController : Component
---@field speed number
local PlayerController = Component:extends()
PlayerController._className = Enums.Classes.PlayerController

---@param speed number?
---@return PlayerController
function PlayerController.new(speed)
	local self = Component.new(PlayerController)
	---@cast self PlayerController

	self.speed = speed or 200

	return self
end

---@param dt number
function PlayerController:update(dt)
	local x = (love.keyboard.isDown("right", "d") and 1 or 0)
		- (love.keyboard.isDown("left", "a") and 1 or 0)
	local y = (love.keyboard.isDown("down", "s") and 1 or 0)
		- (love.keyboard.isDown("up", "w") and 1 or 0)

	if x == 0 and y == 0 then
		return
	end

	if love.keyboard.isDown("e") then
		local projectile = PlayerProjectile.new(500, Vector2.new(x, y))
		Scene
	end

	local magnitude = math.sqrt(x * x + y * y)
	local position = self._gameObject.transform.position
	position.x = position.x + x / magnitude * self.speed * dt
	position.y = position.y + y / magnitude * self.speed * dt
end

return PlayerController
