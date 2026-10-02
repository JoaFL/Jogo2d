local BehaviorObject = require("src.core.classes.BehaviorObject")

---@class GameObject : BehaviorObject
---@field visible boolean Visible state
---@field protected _components Component[] Array of current components
---@field protected _children GameObject[] Array of current children
---@field protected _superClass BehaviorObject
local GameObject = BehaviorObject:extends()
GameObject._className = Enums.Classes.GameObject ---@protected

---@generic T
---@param class T? The class that will inherits the GameObject
---@return T|GameObject
function GameObject.new(class)
	local self = BehaviorObject.new(class or GameObject)

	self.visible = true
	self._components = {}

	return self
end

---TODO
function GameObject:addChildren(children) end

---@generic T
---@param component Component|T A component instance
---@return T
function GameObject:addComponent(component)
	if self:hasComponent(component) then
		error(string.format("%d Already has %s component", self.uniqueId, component:getClassName()))
	end

	table.insert(self._components, component)
	component:setGameObject(self)

	return component
end

---@param component Component
---@return boolean
function GameObject:hasComponent(component)
	for i = 1, #self._components do
		local comp = self._components[i]

		if comp:isA(component:getClassName()) then
			return true
		end
	end

	return false
end

---@param className Enums.Classes
---@return Component?
function GameObject:getComponent(className)
	for i = 1, #self._components do
		local comp = self._components[i]

		if comp:isA(className) then
			return comp
		end
	end

	return nil
end

return GameObject
