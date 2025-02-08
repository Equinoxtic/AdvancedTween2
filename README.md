# AdvancedTween.lua / AdvancedTween2

* A slight rewrite and a separate repository for [AdvancedTween.lua](https://github.com/Equinoxtic/AdvancedTween.lua/blob/main/AdvancedTween.lua); One of the Roblox Modules I use.

* This module is based off of HaxeFlixel's [FlxTween](https://api.haxeflixel.com/flixel/tweens/FlxTween.html), replicated and recreated to a Roblox module to have more ease when it comes to creating Tweens.

## Usage

```lua
--[[
	Example Code of the AdvancedTween Module
	(Can be put in any type of script!)
]]

local AdvancedTween = require(AdvancedTween) -- Must be the path to AdvancedTween.

-- Create the tween with AdvancedTween.New(...)
local Tween = AdvancedTween.New(object, { Position = Vector3.new(150, 75, 150) }, 1.0, {
	Easing = 'SineInOut',
	StartDelay = 0.5,
	OnComplete = function()
		print("Tween Completed!");
	end
});

-- Play the tween with Tween:Play()
Tween:Play();
```
