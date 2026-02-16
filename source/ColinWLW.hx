package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class ColinWLW extends FlxSprite
{
	var colinWhiteWolf = new FlxSprite();

	var wayI = 'assets/images/';

	public function new(xPos:Int = -400, yPos:Int = 0)
	{
		super(xPos, yPos);

		colinWhiteWolf = loadGraphic(wayI + 'mainMenu/choiceMenu/colinWW.png', true, 640, 480);

		animation.add('colinWhiteWolf', [0, 1, 2, 1], 8, true);

		var anim = FlxAtlasFrames.fromSparrow(wayI + 'mainMenu/choiceMenu/colinWW.png', wayI + 'mainMenu/choiceMenu/colinWW.xml');
		frames = anim;

		animation.addByPrefix('ColinWhiteAnim', 'colinWhiteWolf', 8, true);
		animation.play('ColinWhiteAnim');

		new FlxTimer().start(0.1, timerHiWolf, 1);
	}

	function timerHiWolf(timer:FlxTimer)
	{
		FlxTween.tween(colinWhiteWolf, {x: 0}, 2.0, {ease: FlxEase.cubeInOut});
	}
}
