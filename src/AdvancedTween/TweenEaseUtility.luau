local EasingUtility = {};

local EasingFunctions = require(script.Parent.EasingFunctions);

function EasingUtility.GetEasingStyle(easeKey : string) : Enum.EasingStyle
	return EasingFunctions[easeKey].style;
end

function EasingUtility.GetEasingDirection(easeKey : string) : Enum.EasingDirection
	return EasingFunctions[easeKey].direction;
end

return EasingUtility;
