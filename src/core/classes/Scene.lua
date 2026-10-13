local BehaviorObject = require("src.core.classes.BehaviorObject")

---@class Scene : BehaviorObject
---@field objects (Object | BehaviorObject | GameObject)[]
local Scene = BehaviorObject:extends()

function Scene.new()
	local self = BehaviorObject.new(Scene)

	self.objects = {}

	return self
end

function Scene:update(dt)
	for i=1, #self.objects do
		local go = self.objects[i]

		if go.update then
			go:update(dt)
		end
	end
end

---@param object Object | GameObject | BehaviorObject
function Scene:addObject(object)
	table.insert(self.objects, object)
end

function Scene:getObject()
	
end

function Scene:removeObject()
	
end

return Scene
