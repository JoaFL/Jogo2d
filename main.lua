_G.Enums = require("src.data.Enums")
local Player = require("src.game.classes.Player")

local Transform = require("src.core.components.Transform")
local Vector2 = require("src.math.Vector2")
local GameObject = require("src.core.classes.GameObject")
local Scene = require("src.core.classes.Scene")
local SceneManager = require("src.game.classes.SceneManager")

local go
local scene
---@cast go Player

function love.load()
	local a = Vector2.new(10, -5)
	go = Player.new(10, 10, 100)
	scene = Scene.new()
	scene:addObject(go)
	SceneManager:setCurrent(scene)

	-- print(go:isA("Sprite"))
	-- print(-a)
	-- print(go.active)
	-- go:setAttribute("position", {x=10, y=10})
	-- print(go:getAttribute("position"))

	return
end

---@param dt number
function love.update(dt)
	SceneManager:update(dt)
	return
end

function love.draw()
	love.graphics.print("Hello World!", 10, 10)
	SceneManager:draw()
	return
end
