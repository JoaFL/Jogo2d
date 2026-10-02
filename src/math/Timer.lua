local BehaviorObject = require("src.core.classes.BehaviorObject")

local Timer = BehaviorObject:extends()

function Timer.new()
	local self = BehaviorObject.new(Timer)

	return self
end

return Timer
