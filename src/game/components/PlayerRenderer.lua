local Component = require("src.core.components.Component")

---@class PlayerRenderer : Component
---@field width number
---@field height number
---@field color number[]
local PlayerRenderer = Component:extends()
PlayerRenderer._className = Enums.Classes.PlayerRenderer

---@param width number?
---@param height number?
---@param color number[]?
---@return PlayerRenderer
function PlayerRenderer.new(width, height, color)
	local self = Component.new(PlayerRenderer)
	---@cast self PlayerRenderer

	self.width = width or 32
	self.height = height or 32
	self.color = color or { 0.2, 0.65, 1, 1 }

	return self
end

function PlayerRenderer:draw()
	local position = self._gameObject.transform.position
	local red, green, blue, alpha = love.graphics.getColor()

	love.graphics.setColor(self.color[1], self.color[2], self.color[3], self.color[4] or 1)
	love.graphics.rectangle("fill", position.x, position.y, self.width, self.height)
	love.graphics.setColor(red, green, blue, alpha)
end

return PlayerRenderer
