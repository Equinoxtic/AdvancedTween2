--[[

	* AdvancedTween [Module]

	* A module based off of HaxeFlixel's FlxTween, replicated and recreated
	to a Roblox module to have more ease when it comes to creating tweens.

	Version: 1.0.0
	Date Created: 02/08/2025
	Date Updated: 02/08/2025

	Created By @Aeronoxtic

]]

local AdvancedTween = {};
AdvancedTween.__index = AdvancedTween;

local TweenService = game:GetService('TweenService');

local util = require(script.TweenUtility);
local Settings = require(script.Settings);

local _T = require(script.TweenProperties);

-- Create a new 'AdvancedTween'.
--
-- @param instance Instance               - The instance to tween.
-- @param values {[string] : any}         - The values of the instance to be tweened.
-- @param duration number                 - The duration of the tween.
-- @param tweenProperties TweenProperties - The properties of the tween. (i.e. Easing, StartDelay, etc.)
-- @return AdvancedTween
function AdvancedTween.New(instance : Instance, values : {[string] : any}, duration : number, tweenProperties : _T.TweenProperties)

	local self = setmetatable({

		_tween = TweenService:Create(
			instance,
			util.CreateTweenInfo(
				duration or 0.0,
				tweenProperties.Easing or 'Linear',
				tweenProperties.RepeatCount or 0,
				tweenProperties.Reverse or false,
				tweenProperties.StartDelay or 0.0
			),
			values
		) :: TweenBase;

		onComplete = tweenProperties.OnComplete or function()
			--[[ ... ]]
		end :: () -> ();

		_currentInstance = instance :: Instance;

	}, AdvancedTween);

	if (Settings.VerboseTweens) then
		print(string.format('Created Tween! - [ %s ]', instance.Name));
	end

	return self;

end

--[[
	Play the tween.
]]
function AdvancedTween:Play() : ()

	if (self._tween ~= nil) then

		if (Settings.VerboseTweens) then
			print(string.format('Playing Tween! - [ %s ]', self._currentInstance.Name));
		end

		self._tween:Play();
		self._tween.Completed:Connect(self.onComplete);

	end

end

--[[
	Pause the tween.
]]
function AdvancedTween:Pause() : ()

	if (Settings.VerboseTweens) then
		print(string.format('Paused Tween! - [ %s ]', self._currentInstance.Name));
	end

	if (self._tween ~= nil) then
		self._tween:Pause();
	end

end

--[[
	Cancel the tween.
]]
function AdvancedTween:Cancel() : ()

	if (Settings.VerboseTweens) then
		print(string.format('Cancelled Tween! - [ %s ]', self._currentInstance.Name));
	end

	if (self._tween ~= nil) then
		self._tween:Cancel();
	end

end

--[[
	Yield/Stop the code until the tween finishes playing.
]]
function AdvancedTween:Wait() : ()

	if (self._tween == nil) then
		return;
	end

	self._tween.Completed:Wait();

end

return AdvancedTween;
