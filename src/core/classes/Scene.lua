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

		if gameObject.update and gameObject.active then
			gameObject:update(dt)
		end
	end
end

function Scene:draw()
	if not self.active then
		return
	end

	for i=1, #self.gameObjects do
		local gameObject = self.gameObjects[i]

		if gameObject.draw and gameObject.active then
			gameObject:draw()
		end
	end
end

---@param gameObject GameObject
function Scene:addObject(gameObject)
	table.insert(self.gameObjects, gameObject)
end

---@param className Enums.Classes
---@return Object?
function Scene:findFirstWhichIsA(className)
	for i=1, self.gameObjects do
		local gameObject = self.gameObjects[i]

		if gameObject:getClassName() == className then
			return gameObject
		end
	end
end

---@param className Enums.Classes
---@return Object[]
function Scene:getAllWhichIsA(className)
	local objects = {}
	for i=1, self.gameObjects do
		local gameObject = self.gameObjects[i]

		if gameObject:getClassName() == className then
			table.insert(gameObject, objects)
		end
	end

	return objects
end

---@param uniqueId integer
function Scene:removeObject(uniqueId)
	for i=1, #self.gameObjects do
		local gameObject = self.gameObjects[i]

		if gameObject.uniqueId == uniqueId then
			table.remove(self.gameObjects, i)
			gameObject:destroy()
			return
		end
	end
end

return Scene
