local Scene = require "src.core.classes.Scene"
local BehaviorObject = require "src.core.classes.BehaviorObject"

---@class SceneManager : BehaviorObject
---@field currentScene Scene
local SceneManager = BehaviorObject:extends()
SceneManager.currentScene = nil

---@param scene Scene
function SceneManager:setCurrent(scene)
    self.currentScene = scene
end

function SceneManager:update(dt)
    if self.currentScene and self.active then
        self.currentScene:update(dt)
    end
end

function SceneManager:draw()
    if self.currentScene and self.active then
        self.currentScene:draw()
    end
end

return SceneManager