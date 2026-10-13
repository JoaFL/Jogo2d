local BehaviorObject = require("src.core.classes.BehaviorObject")
local Object = require("src.core.classes.Object")

---@class Component : BehaviorObject
---@field protected _gameObject GameObject
---@field protected _superClass BehaviorObject
local Component = BehaviorObject:extends()
Component._className = Enums.Classes.Component ---@protected

---@generic T
---@param class T|Object|BehaviorObject
---@overload fun(class: T): T
---@overload fun(class: T, extends: Object): T|Object
---@overload fun(class: T, extends: BehaviorObject): T|BehaviorObject
function Component.new(class, extends)
	-- if extends == Enums.Classes.Object then
	-- 	return Object.new(class or Component)
	-- elseif extends == Enums.Classes.BehaviorObject then
	-- 	return BehaviorObject.new(class or Component)
	-- end

	if class then
		return class.new(Component)
	end

	return Object.new(Component)
end

---@param gameObject GameObject
function Component:setGameObject(gameObject)
	self._gameObject = gameObject
end

function Component:getGameObject()
	return self._gameObject
end

return Component
