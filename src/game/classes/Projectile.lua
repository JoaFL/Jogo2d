local GameObject = require("src.core.classes.GameObject")
local Vector2 = require("src.math.Vector2")
local SceneManager = require("src.game.classes.SceneManager")

---@class Projectile : GameObject
---@field speed number
---@field direction Vector2
---@field width number
---@field height number
---@field color number[]
---@field lifetime number
local Projectile = GameObject:extends()
Projectile._className = Enums.Classes.Projectile

---@param speed number?
---@param direction Vector2?
---@param x number?
---@param y number?
---@param width number?
---@param height number?
---@param color number[]?
---@return Projectile
function Projectile.new(speed, direction, x, y, width, height, color)
	local self = GameObject.new(Projectile)
	---@cast self Projectile

	self.speed = speed or 500
	self.direction = (direction or Vector2.new(0, -1)):normalized()
	self.transform.position = Vector2.new(x or 0, y or 0)
	self.width = width or 8
	self.height = height or 8
	self.color = color or { 1, 0.8, 0.2, 1 }
	self.lifetime = 3

	return self
end

---@param dt number
function Projectile:update(dt)
	if not self.active then
		return
	end

	self.lifetime = self.lifetime - dt
	if self.lifetime <= 0 then
		self.active = false
		self.visible = false

		local scene = SceneManager.currentScene
		if scene then
			scene:removeObject(self.uniqueId)
		end
		return
	end

	local position = self.transform.position
	position.x = position.x + self.direction.x * self.speed * dt
	position.y = position.y + self.direction.y * self.speed * dt
end

function Projectile:draw()
	if not self.visible then
		return
	end

	local position = self.transform.position
	local red, green, blue, alpha = love.graphics.getColor()

	love.graphics.setColor(self.color[1], self.color[2], self.color[3], self.color[4] or 1)
	love.graphics.rectangle("fill", position.x, position.y, self.width, self.height)
	love.graphics.setColor(red, green, blue, alpha)
end

return Projectile