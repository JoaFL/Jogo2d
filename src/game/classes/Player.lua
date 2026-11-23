local GameObject = require("src.core.classes.GameObject")
local PlayerController = require("src.game.components.PlayerController")
local PlayerRenderer = require("src.game.components.PlayerRenderer")
local Vector2 = require("src.math.Vector2")

---@class Player : GameObject
---@field controller PlayerController
---@field renderer PlayerRenderer
local Player = GameObject:extends()
Player._className = Enums.Classes.Player

---@param x number?
---@param y number?
---@param speed number?
---@return Player
function Player.new(x, y, speed)
	local self = GameObject.new(Player)
	---@cast self Player

	self.transform.position = Vector2.new(x or 0, y or 0)
	self.controller = self:addComponent(PlayerController.new(speed))
	self.renderer = self:addComponent(PlayerRenderer.new())

	return self
end

---@param dt number
function Player:update(dt)
	if self.active and self.controller.active then
		self.controller:update(dt)
	end
end

function Player:draw()
	if self.visible and self.renderer.active then
		self.renderer:draw()
	end
end

return Player
