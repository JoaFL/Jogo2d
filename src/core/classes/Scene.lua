local BehaviorObject = require("src.core.classes.BehaviorObject")

---@class Scene : BehaviorObject
---@field gameObjects GameObject[]
local Scene = BehaviorObject:extends()

function Scene.new()
	local self = BehaviorObject.new(Scene)

	return self
end

return Scene
