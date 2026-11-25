local GameObject = require "src.core.classes.GameObject"
local AnimatedSprite = require "src.rendering.components.AnimatedSprite"

---@class Entity : GameObject
---@field animatedSprite AnimatedSprite
local Entity = GameObject:extends()

function Entity.new()
    local self = GameObject.new(Entity)
    
    self.animatedSprite = AnimatedSprite.new()

    return self
end

---@param up Animation
---@param down Animation
---@param left Animation
---@param right Animation
---@return Entity
function Entity:addAnimation(name, up, down, left, right)
    self.animatedSprite:addAnimation(name, up)
    self.animatedSprite:addAnimation(name, down)
    self.animatedSprite:addAnimation(name, left)
    self.animatedSprite:addAnimation(name, right)

    return self
end

function Entity:update(dt)
    
end

return Entity