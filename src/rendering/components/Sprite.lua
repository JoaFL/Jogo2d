local Component = require("src.core.components.Component")

---@class Sprite : Component
---@field private extends function
local Sprite = Component:extends()
Sprite._className = Enums.Classes.Sprite

function Sprite.new()
	local self = Component.new(Sprite)

	return self
end

return Sprite
