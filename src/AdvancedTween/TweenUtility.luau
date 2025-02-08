local TweenUtility = {};

local EaseUtil = require(script.Parent.TweenEaseUtility);

function TweenUtility.CreateTweenInfo(duration: number, easing: string, repeatCount: number, reverses: boolean, startDelay: number) : TweenInfo

	return TweenInfo.new(
		duration,
		EaseUtil.GetEasingStyle(easing),
		EaseUtil.GetEasingDirection(easing),
		repeatCount,
		reverses,
		startDelay
	);

end

return TweenUtility
