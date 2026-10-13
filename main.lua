_G.Enums = require("src.data.Enums")

local Transform = require("src.core.components.Transform")
local Vector2 = require("src.math.Vector2")
local GameObject = require("src.core.classes.GameObject")

local go

function love.load()
	local a = Vector2.new(10, -5)
	go = GameObject.new()

	print(go:isA("Sprite"))
	print(-a)
	print(go.active)
	go:setAttribute("position", {x=10, y=10})
	print(go:getAttribute("position"))

	return
end

---@param dt number
function love.update(dt)
	return
end

function love.draw()
	return
end
