local Component = require("src.core.components.Component")
local Projectile = require("src.game.classes.Projectile")
local Vector2 = require("src.math.Vector2")
local SceneManager = require("src.game.classes.SceneManager")

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
	self.shootCooldown = 0

	return self
end

---@param dt number
function PlayerController:update(dt)
	self.shootCooldown = math.max(0, self.shootCooldown - dt)

	local x = (love.keyboard.isDown("right", "d") and 1 or 0)
		- (love.keyboard.isDown("left", "a") and 1 or 0)
	local y = (love.keyboard.isDown("down", "s") and 1 or 0)
		- (love.keyboard.isDown("up", "w") and 1 or 0)

	if love.keyboard.isDown("e") and self.shootCooldown == 0 then
		local position = self._gameObject.transform.position
		local direction = Vector2.new(x, y)
		if direction:magnitude() == 0 then
			direction = Vector2.new(0, -1)
		end

		local projectile = Projectile.new(500, direction, position.x, position.y)
		local scene = SceneManager.currentScene
		if scene then
			scene:addObject(projectile)
		end

		self.shootCooldown = 0.15
	end

	if x == 0 and y == 0 then
		return
	end

	local magnitude = math.sqrt(x * x + y * y)
	local position = self._gameObject.transform.position
	position.x = position.x + x / magnitude * self.speed * dt
	position.y = position.y + y / magnitude * self.speed * dt
end

return PlayerController
