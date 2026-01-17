package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxTimer;

class TheSharkMenu extends FlxSprite
{
	var latexTheShark = new FlxSprite();
	var buttonSix = new FlxSprite();

	var pressEnter = false;
	var horrorEXE = false;

	var wayI = 'assets/images/';

	public function new(xPos:Int = 0, yPos:Int = 0)
	{
		super(xPos, yPos);

		latexTheShark = loadGraphic(wayI + 'mainMenu/theShark.png', true, 640, 480);
		latexTheShark.alpha = 0.0;

		animation.add('latexShark', [0, 1, 2], 8, true);

		var anim = FlxAtlasFrames.fromSparrow(wayI + 'mainMenu/theShark.png', wayI + 'mainMenu/theShark.xml');
		frames = anim;

		animation.addByPrefix('SharkAnim', 'latexShark', 8, true);
		animation.play('SharkAnim');

		#if android
		// buttonSix = loadGraphic(wayI + 'buttonForMobile.png');
		// buttonSix.alpha = 0.0;
		#end

		new FlxTimer().start(4.0, timerFlash, 1);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (pressEnter == true)
		{
			#if android
			// buttonSix.x = 460;
			// buttonSix.y = 400;
			buttonSix.updateHitbox();

			for (touch in FlxG.touches.list)
			{
				if (touch.justPressed)
				{
					new FlxTimer().start(6.0, timerHiShark, 1);
					new FlxTimer().start(9.1, timerHiHORROR, 1);

					pressEnter = false;

					// if (touch.overlaps(buttonSix))
					// {
					// buttonSix.y = 900;

					// latexTheShark.alpha = 0.0;

					// horrorEXE = false;
					// }
				}
			}
			#end
			#if (windows || html5)
			if (FlxG.keys.anyJustPressed([FlxKey.ENTER]))
			{
				new FlxTimer().start(6.0, timerHiShark, 1);
				new FlxTimer().start(9.1, timerHiHORROR, 1);

				pressEnter = false;
			}
			#end
		}

		if (horrorEXE == true)
		{
			#if (windows || html5)
			if (FlxG.keys.anyJustPressed([FlxKey.SIX]))
			{
				latexTheShark.alpha = 0.0;

				horrorEXE = false;
			}
			#end
		}
	}

	function timerFlash(timer:FlxTimer)
	{
		pressEnter = true;
	}

	function timerHiShark(timer:FlxTimer)
	{
		latexTheShark.alpha = 1.0;
	}

	function timerHiHORROR(timer:FlxTimer)
	{
		horrorEXE = true;
	}
}
