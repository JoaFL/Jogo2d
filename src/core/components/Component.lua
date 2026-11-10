local BehaviorObject = require("src.core.classes.BehaviorObject")

---@class Component : BehaviorObject
---@field protected _gameObject GameObject
---@field protected _superClass BehaviorObject
local Component = BehaviorObject:extends()
Component._className = Enums.Classes.Component ---@protected

---@param class BehaviorObject
---@return Component|BehaviorObject
function Component.new(class)
	local self = BehaviorObject.new(class or Component)

	return self
end

---@param gameObject GameObject
function Component:setGameObject(gameObject)
	self._gameObject = gameObject
end

function Component:getGameObject()
	return self._gameObject
end

return Component
