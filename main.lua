_G.Enums = require("src.data.Enums")
local Player = require("src.game.classes.Player")

local Transform = require("src.core.components.Transform")
local Vector2 = require("src.math.Vector2")
local GameObject = require("src.core.classes.GameObject")

local go
---@cast go Player

function love.load()
	local a = Vector2.new(10, -5)
	go = Player.new(10, 10, 100)

	-- print(go:isA("Sprite"))
	-- print(-a)
	-- print(go.active)
	-- go:setAttribute("position", {x=10, y=10})
	-- print(go:getAttribute("position"))

	return
end

---@param dt number
function love.update(dt)
	go:update(dt)
	return
end

function love.draw()
	love.graphics.print("Hello World!", 10, 10)
	go:draw()
	return
end
