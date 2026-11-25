local BehaviorObject = require("src.core.classes.BehaviorObject")
local Transform      = require("src.core.components.Transform")

---@class GameObject : BehaviorObject
---@field visible boolean Visible state
---@field protected _components Component[] Array of current components
---@field protected _children GameObject[] Array of current children
---@field protected _superClass BehaviorObject
---@field transform Transform
local GameObject = BehaviorObject:extends()
GameObject._className = Enums.Classes.GameObject ---@protected

---@generic T
---@param class T? The class that will inherits the GameObject
---@return T|GameObject
function GameObject.new(class)
	local self = BehaviorObject.new(class or GameObject)

	self.visible = true
	self._components = {}
	self.transform = Transform.new()

	return self
end

---TODO
function GameObject:addChildren(children) end

---@param dt number
function GameObject:update(dt)
	if not self.active then
		return
	end

	for i = 1, #self._components do
		local component = self._components[i]
		if component.active and component.update then
			component:update(dt)
		end
	end
end

function GameObject:draw()
	if not self.visible then
		return
	end

	for i = 1, #self._components do
		local component = self._components[i]
		if component.active and component.draw then
			component:draw()
		end
	end
end

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
