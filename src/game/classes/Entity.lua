local GameObject = require("src.core.classes.GameObject")
local AnimatedSprite = require("src.rendering.components.AnimatedSprite")

---@class Entity : GameObject
---@field animatedSprite AnimatedSprite
local Entity = GameObject:extends()
Entity._className = Enums.Classes.Entity

---@generic T
---@param class T? The class that inherits Entity
---@return T|Entity
function Entity.new(class)
    local self = GameObject.new(class or Entity)
    
    self.animatedSprite = self:addComponent(AnimatedSprite.new())

    return self
end

---@param name string
---@param animation Animation
---@return Entity
function Entity:addAnimation(name, animation)
    self.animatedSprite:addAnimation(name, animation)

    return self
end

---@param name string
---@return Entity
function Entity:playAnimation(name)
    self.animatedSprite:play(name)

    return self
end

return Entity