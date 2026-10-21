local BehaviorObject = require("src.core.classes.BehaviorObject")

---@class Scene : BehaviorObject
---@field gameObjects GameObject[]
local Scene = BehaviorObject:extends()

function Scene.new()
	local self = BehaviorObject.new(Scene)

	self.gameObjects = {}

	return self
end

function Scene:update(dt)
	if not self.active then
		return
	end

	for i=1, #self.gameObjects do
		local gameObject = self.gameObjects[i]

		if go.update then
			go:update(dt)
		end
	end
end

---@param gameObject GameObject
function Scene:addObject(gameObject)
	table.insert(self.gameObjects, gameObject)
end

---@param className Enums.Classes
---@return Object?
function Scene:findObjectWhichIsA(className)
	for i=1, self.gameObjects do
		local object = self.gameObjects[i]

		if object:getClassName() == className then
			return object
		end
	end
end

---@param uniqueId integer
function Scene:removeObject(uniqueId)
	for i=1, #self.gameObjects do
		local go = self.gameObjects[i]
		

	end
end

return Scene
