local Scene = require "src.core.classes.Scene"
local BehaviorObject = require "src.core.classes.BehaviorObject"

---@class SceneManager : BehaviorObject
---@field private _currentScene Scene
local SceneManager = BehaviorObject:extends()

function SceneManager.new()
    return BehaviorObject.new(SceneManager)
end

---@param scene Scene
function SceneManager:setCurrent(scene)
    self._currentScene = scene
end


function SceneManager:update(dt)
    if self._currentScene and self.active then
        self._currentScene:update(dt)
    end
end

function SceneManager:draw()
    if self._currentScene and self.active then
        self._currentScene:draw()
    end
end