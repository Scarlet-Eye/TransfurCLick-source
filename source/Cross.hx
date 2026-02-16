import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.touch.FlxTouch;

class Cross
{
	public static function justPressedOn(sprite:FlxSprite):Bool
	{
		#if windows
		if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(sprite))
		{
			return true;
		}
		#end
		#if android
		if (FlxG.touches != null)
		{
			for (touch in FlxG.touches.list)
			{
				if (touch.justPressed && touch.overlaps(sprite))
				{
					return true;
				}
			}
		}
		#end
		return false;
	}
}
