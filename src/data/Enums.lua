local Enums = {}

---@enum Enums.Classes
Enums.Classes = {
	Object = "Object",
	BehaviorObject = "BehaviorObject",
	GameObject = "GameObject",
	Component = "Component",
	Transform = "Transform",
	Sprite = "Sprite",
	Tag = "Tag",
	Vector2 = "Vector2",
	AnimatedSprite = "AnimatedSprite",
	Player = "Player",
	PlayerController = "PlayerController",
	PlayerRenderer = "PlayerRenderer",
	PlayerProjectile = "PlayerProjectile"
}

---@enum Enums.ColorsFromRGB
Enums.ColorsFromRGB = {
	red = { 255, 0, 0 },
	green = { 0, 255, 0 },
	blue = { 0, 0, 255 },
}

return Enums
