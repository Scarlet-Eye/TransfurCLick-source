package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class ColinBLW extends FlxSprite
{
	var colinBlackWolf = new FlxSprite();

	var wayI = 'assets/images/';

	public function new(xPos:Int = 400, yPos:Int = 0)
	{
		super(xPos, yPos);

		colinBlackWolf = loadGraphic(wayI + 'mainMenu/choiceMenu/colinBW.png', true, 640, 480);

		animation.add('colinBlackWolf', [0, 1, 2], 8, true);

		var anim = FlxAtlasFrames.fromSparrow(wayI + 'mainMenu/choiceMenu/colinBW.png', wayI + 'mainMenu/choiceMenu/colinBW.xml');
		frames = anim;

		animation.addByPrefix('ColinBlackAnim', 'colinBlackWolf', 8, true);
		animation.play('ColinBlackAnim');

		new FlxTimer().start(0.1, timerHiWolf, 1);
	}

	function timerHiWolf(timer:FlxTimer)
	{
		FlxTween.tween(colinBlackWolf, {x: 0}, 2.0, {ease: FlxEase.cubeInOut});
	}
}
