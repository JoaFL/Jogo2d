local Object = require("src.core.classes.GameObject")

---@class StaticComponent : Object
---@field protected _gameObject GameObject|nil
---@field protected _superClass Object
local StaticComponent = Object:extends()
StaticComponent._className = Enums.Classes.Component ---@protected

function StaticComponent.new(class)
	return Object.new(class or StaticComponent)
end

---@param gameObject GameObject|nil
function StaticComponent:setGameObject(gameObject)
	self._gameObject = gameObject
end

function StaticComponent:getGameObject()
	return self._gameObject
end

return StaticComponent
