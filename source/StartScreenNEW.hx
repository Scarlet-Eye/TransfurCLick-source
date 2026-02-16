package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class StartScreenNEW extends FlxState
{
	var wayI = 'assets/images/';
	var wayS = 'assets/sounds/';

	var colin = new FlxSprite();
	var blerb = new FlxSprite();
	var logoHF = new FlxSprite();
	var latexTransition = new FlxSprite();
	var darkness = new FlxSprite();

	var hfAnim = 0;

	override public function create()
	{
		super.create();

		colin = new FlxSprite();
		colin.loadGraphic(wayI + 'startScreen/colinForSS.png', true, 80, 135);
		colin.animation.add('colinRun', [0, 1, 2, 1], 8, true);
		colin.animation.add('colinTransfur', [3, 4, 5, 4], 8, true);
		colin.animation.play('colinRun');
		colin.x = -200;
		colin.y = 200;
		add(colin);

		blerb = new FlxSprite();
		blerb.loadGraphic(wayI + 'startScreen/lightLatexPuddingForSS.png', true, 80, 50);
		blerb.animation.add('blerbToColin', [0, 1, 2, 1], 8, true);
		blerb.animation.play('blerbToColin');
		blerb.x = -900;
		blerb.y = 287;
		add(blerb);

		logoHF = new FlxSprite();
		logoHF.loadGraphic(wayI + 'startScreen/haxeFlixelLogoAnimated.png', true, 100, 149);
		logoHF.animation.add('hfFrame1', [0], 1, true);
		logoHF.animation.add('hfFrame2', [1], 1, true);
		logoHF.animation.add('hfFrame3', [2], 1, true);
		logoHF.animation.add('hfFrame4', [3], 1, true);
		logoHF.animation.add('hfFrame5', [4], 1, true);
		logoHF.animation.add('hfWhiteFrame1', [5], 1, true);
		logoHF.animation.play('hfFrame1');
		logoHF.screenCenter();
		logoHF.alpha = 0.0;
		logoHF.color = FlxColor.WHITE;
		add(logoHF);

		latexTransition = new FlxSprite(wayI + 'mainMenu/startScreen/lightLatex.png');
		latexTransition.x = 0;
		latexTransition.y = -1200;
		add(latexTransition);

		darkness.makeGraphic(642, 480, FlxColor.BLACK);
		darkness.x = 0;
		darkness.y = 0;
		darkness.alpha = 0.0;
		add(darkness);

		FlxG.sound.play('flixel/sounds/flixel.ogg');

		FlxG.autoPause = false;
		#if (windows || html5)
		FlxG.mouse.visible = false;
		#end

		FlxTween.tween(colin, {x: 500}, 3.5, {ease: FlxEase.linear});
		FlxTween.tween(blerb, {x: 500}, 3.5, {ease: FlxEase.linear});

		var timerAnim = new FlxTimer().start(0.15, timerChangeAnim, 1);
		timerAnim.loops = 5;
		new FlxTimer().start(0.75, timerVisible, 1);

		new FlxTimer().start(2, timerWhiteSide, 1);
		new FlxTimer().start(3.5, timerWhiteSideHF, 1);
		new FlxTimer().start(5.0, timerBlack, 1);
		new FlxTimer().start(7.0, timerChangeState, 1);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (hfAnim == 1)
		{
			logoHF.animation.play('hfFrame1');

			logoHF.alpha = 1.0;
		}
		if (hfAnim == 2)
		{
			logoHF.animation.play('hfFrame2');
		}
		if (hfAnim == 3)
		{
			logoHF.animation.play('hfFrame3');
		}
		if (hfAnim == 4)
		{
			logoHF.animation.play('hfFrame4');
		}
		if (hfAnim == 5)
		{
			logoHF.animation.play('hfFrame5');
		}
		if (hfAnim == 6)
		{
			colin.animation.play('colinTransfur');
			blerb.alpha = 0.0;

			logoHF.animation.play('hfWhiteFrame1');

			logoHF.alpha = 1.0;
		}
	}

	function timerChangeAnim(timer:FlxTimer)
	{
		hfAnim = hfAnim + 1;
	}

	function timerVisible(timer:FlxTimer)
	{
		FlxTween.tween(logoHF, {'alpha': 0.0}, 1.8, {ease: FlxEase.linear});
	}

	function timerWhiteSide(timer:FlxTimer)
	{
		FlxTween.tween(latexTransition, {y: 0}, 2.0, {
			ease: FlxEase.cubeInOut,
			onComplete: function(_)
			{
				FlxTween.tween(latexTransition, {'alpha': 0.0}, 1.0, {
					ease: FlxEase.cubeInOut
				});
			}
		});

		FlxG.sound.play(wayS + 'transfurmation.ogg');
	}

	function timerWhiteSideHF(timer:FlxTimer)
	{
		hfAnim = 6;
	}

	function timerBlack(timer:FlxTimer)
	{
		FlxTween.tween(darkness, {'alpha': 1.0}, 1.0, {ease: FlxEase.cubeInOut});
	}

	function timerChangeState(timer:FlxTimer)
	{
		FlxG.switchState(MainTransfurMenu.new);
	}
}
