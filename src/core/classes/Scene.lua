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
	for i=1, #self.gameObjects do
		local go = self.gameObjects[i]

		if go.update then
			go:update(dt)
		end
	end
end

---@param gameObject GameObject
function Scene:addObject(gameObject)
	table.insert(self.gameObjects, gameObject)
end

function Scene:getObject()
	
end

function Scene:removeObject()
	
end

return Scene
