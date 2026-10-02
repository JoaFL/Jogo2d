local Object = require("src.core.classes.Object")

---@class Vector2 : Object
---@field x number
---@field y number
---@field protected __index Vector2
local Vector2 = Object:extends()

---@param x number?
---@param y number?
---@return Vector2
function Vector2.new(x, y)
	local self = Object.new(Vector2)

	self.x = x or 0
	self.y = y or 0

	return self
end

---Returns the Vector2 magnitude
---@return number
function Vector2:magnitude()
	return math.sqrt(self.x ^ 2 + self.y ^ 2)
end

---Returns a new Vector2 normalized
---@return Vector2
function Vector2:normalized()
	local mag = self:magnitude()

	return mag > 0 and Vector2.new(self.x / mag, self.y / mag) or Vector2.new()
end

---@param a number|Vector2
---@param b number|Vector2
---@param op fun(a: number, b:number): number
---@return Vector2
local function operation(a, b, op)
	if type(a) == "number" then
		return Vector2.new(op(a, b.x), op(a, b.y))
	elseif type(b) == "number" then
		return Vector2.new(op(a.x, b), op(a.y, b))
	end

	return Vector2.new(op(a.x, b.x), op(a.y, b.y))
end

---@private
function Vector2.__add(a, b)
	return operation(a, b, function(i, j)
		return i + j
	end)
end

---@private
function Vector2.__sub(a, b)
	return operation(a, b, function(i, j)
		return i - j
	end)
end

---@private
function Vector2.__mul(a, b)
	return operation(a, b, function(i, j)
		return i * j
	end)
end

---@private
function Vector2.__div(a, b)
	return operation(a, b, function(i, j)
		return i / j
	end)
end

---@private
function Vector2.__eq(a, b)
	return a.x == b.x and a.y == b.y
end

---@private
function Vector2:__unm()
	return Vector2.new(-self.x, -self.y)
end

---@private
function Vector2:__tostring()
	return string.format("(X = %.1f, Y = %.1f)", self.x, self.y)
end

return Vector2
