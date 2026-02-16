package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class FinalRun extends FlxState
{
	var wayF = 'assets/fonts/';
	var wayM = 'assets/music/';
	var wayI = 'assets/images/';
	var wayS = 'assets/sounds/';

	var bgMenu = new FlxSprite();
	var speedBG:Int = 128;
	var colinW = new FlxSprite();
	var BVG = new FlxSprite();
	var BGS = new FlxSprite();
	var LRB = new FlxSprite();
	var SPACEB = new FlxSprite();
	var bit = new FlxText();
	var score = new FlxText();
	var run = new FlxText();
	var buttonLeft = new FlxSprite();
	var leftText = new FlxText();
	var buttonUp = new FlxSprite();
	var upText = new FlxText();
	var buttonDown = new FlxSprite();
	var downText = new FlxText();
	var buttonRight = new FlxSprite();
	var rightText = new FlxText();
	var buttonSpace = new FlxSprite();
	var spaceText = new FlxText();
	var buttonSeven = new FlxSprite();
	var sevenText = new FlxText();
	var logoHF = new FlxSprite();
	var cdMusic = new FlxSprite();
	var credMusicText = new FlxText();
	var darkness = new FlxSprite();

	var scoreGame = 10000;
	var scoreMinus = false;
	var latexScale = 1.00;
	var bpm = 0;

	var credMusic = 'KrysisWave';

	var musicGame = 'assets/music/final.ogg';

	override public function create()
	{
		super.create();

		bgMenu = new FlxSprite(wayI + 'mainMenu/BGMenu.png');
		bgMenu.x = 0;
		bgMenu.y = 0;
		bgMenu.alpha = 1.0;
		add(bgMenu);

		colinW = new FlxSprite();
		colinW.loadGraphic(wayI + 'game/run/colinInWater.png', true, 128, 220);
		colinW.animation.add('colinGoes', [0, 1, 2], 8, true);
		colinW.animation.play('colinGoes');
		colinW.x = 200;
		colinW.y = 200;
		add(colinW);

		BVG = new FlxSprite(wayI + 'mainMenu/choiceMenu/blackVG.png');
		BVG.x = 0;
		BVG.y = 0;
		BVG.scale.set(1.01, 1.0);
		add(BVG);

		BGS = new FlxSprite(wayI + 'game/HUD/BGScore.png');
		BGS.x = -17;
		BGS.y = 40;
		BGS.scale.set(0.82, 1.18);
		add(BGS);

		LRB = new FlxSprite();
		LRB.loadGraphic(wayI + 'game/HUD/leftAndRight.png', true, 220, 113);
		LRB.animation.add('rightB', [0], 1, true);
		LRB.animation.add('leftB', [1], 1, true);
		LRB.animation.play('rightB');
		LRB.x = 350;
		LRB.y = 100;
		add(LRB);

		SPACEB = new FlxSprite();
		SPACEB.loadGraphic(wayI + 'game/HUD/space.png', true, 210, 120);
		SPACEB.animation.add('spaceNormal', [0], 1, true);
		SPACEB.animation.add('destruct', [1], 1, true);
		SPACEB.animation.play('spaceNormal');
		SPACEB.x = 350;
		SPACEB.y = 200;
		add(SPACEB);

		bit = new FlxText(0, 455, 0, '$bpm');
		bit.setFormat(wayF + 'lifehackSans.ttf', 25, FlxColor.ORANGE);
		add(bit);

		score = new FlxText(270, 0, 0, 'Score : $scoreGame');
		score.setFormat(wayF + 'lifehackSans.ttf', 25, FlxColor.WHITE);
		add(score);

		run = new FlxText(275, 0, 0, 'RUN!!!');
		run.setFormat(wayF + 'lifehackSans.ttf', 25, FlxColor.WHITE);
		run.alpha = 0.0;
		add(run);

		#if mobile
		score.x = 268;
		run.x = 273;

		buttonLeft = new FlxSprite(wayI + 'buttonForMobile.png');
		buttonLeft.x = 0;
		buttonLeft.y = 318;
		buttonLeft.color = FlxColor.PINK;
		buttonLeft.alpha = 0.8;
		add(buttonLeft);

		leftText = new FlxText(buttonLeft.x + 30, buttonLeft.y + 25, 0, '<');
		leftText.setFormat(wayF + 'offBitBold.ttf', 35, FlxColor.PINK);
		leftText.alpha = 0.8;
		add(leftText);

		buttonUp = new FlxSprite(wayI + 'buttonForMobile.png');
		buttonUp.x = 81;
		buttonUp.y = 237;
		buttonUp.color = FlxColor.LIME;
		buttonUp.alpha = 0.8;
		add(buttonUp);

		upText = new FlxText(buttonUp.x + 30, buttonUp.y + 25, 0, 'v');
		upText.setFormat(wayF + 'offBitBold.ttf', 35, FlxColor.LIME);
		upText.flipY = true;
		upText.alpha = 0.8;
		add(upText);

		buttonDown = new FlxSprite(wayI + 'buttonForMobile.png');
		buttonDown.x = 81;
		buttonDown.y = 399;
		buttonDown.alpha = 0.8;
		buttonDown.color = FlxColor.CYAN;
		add(buttonDown);

		downText = new FlxText(buttonDown.x + 30, buttonDown.y + 25, 0, 'v');
		downText.setFormat(wayF + 'offBitBold.ttf', 35, FlxColor.CYAN);
		downText.alpha = 0.8;
		add(downText);

		buttonRight = new FlxSprite(wayI + 'buttonForMobile.png');
		buttonRight.x = 162;
		buttonRight.y = 318;
		buttonRight.alpha = 0.8;
		buttonRight.color = FlxColor.RED;
		add(buttonRight);

		rightText = new FlxText(buttonRight.x + 30, buttonRight.y + 25, 0, '>');
		rightText.setFormat(wayF + 'offBitBold.ttf', 35, FlxColor.RED);
		rightText.alpha = 0.8;
		add(rightText);

		buttonSpace = new FlxSprite(wayI + 'buttonForMobile.png');
		buttonSpace.x = 479;
		buttonSpace.y = 399;
		buttonSpace.alpha = 0.8;
		buttonSpace.scale.set(2.0, 1.0);
		add(buttonSpace);

		spaceText = new FlxText(buttonSpace.x + 28, buttonSpace.y + 25, 0, 'SPACE');
		spaceText.setFormat(wayF + 'offBitBold.ttf', 35, FlxColor.WHITE);
		spaceText.alpha = 0.8;
		add(spaceText);

		buttonSeven = new FlxSprite(wayI + 'buttonForMobile.png');
		buttonSeven.x = 0;
		buttonSeven.y = 0;
		buttonSeven.color = FlxColor.ORANGE;
		add(buttonSeven);

		sevenText = new FlxText(buttonSeven.x + 30, buttonSeven.y + 25, 0, '7');
		sevenText.setFormat(wayF + 'offBitBold.ttf', 35, FlxColor.ORANGE);
		add(sevenText);

		logoHF = new FlxSprite(wayI + 'default.png');
		logoHF.x = buttonSeven.x + 53;
		logoHF.y = buttonSeven.y + 10;
		add(logoHF);
		#end

		cdMusic = new FlxSprite(wayI + 'mainMenu/musicDrive.png');
		cdMusic.x = 400;
		cdMusic.y = 440;
		cdMusic.alpha = 1.0;
		add(cdMusic);

		FlxTween.angle(cdMusic, 0, 3600000, 50000, {ease: FlxEase.linear});

		credMusicText = new FlxText(0, 600, 0, 'Music by ' + credMusic);
		credMusicText.setFormat(wayF + 'offBitBold.ttf', 20, FlxColor.GRAY);
		credMusicText.x = cdMusic.x - 190;
		credMusicText.alpha = 1.0;
		add(credMusicText);

		darkness.makeGraphic(642, 480, FlxColor.BLACK);
		darkness.x = 0;
		darkness.y = 0;
		darkness.alpha = 1.0;
		add(darkness);

		FlxG.sound.playMusic(musicGame, 1.0, false);

		FlxG.autoPause = false;
		#if (windows || html5)
		FlxG.mouse.visible = true;
		#end

		var retry = new FlxTimer().start(5, timerRetryBG, 1);
		retry.loops = 1000000;
		new FlxTimer().start(0.1, timerDarknessGoodBye, 1);
		new FlxTimer().start(5.0, timerCredMusic, 1);
		new FlxTimer().start(18.0, timerMinusEpic, 1);
		new FlxTimer().start(24.5, timerMinus, 1);
		new FlxTimer().start(26.0, timerMinus, 1);
		new FlxTimer().start(27.6, timerMinus, 1);
		new FlxTimer().start(29.0, timerMinus, 1);
		new FlxTimer().start(94.5, timerFade, 1);
		new FlxTimer().start(30.8, timerRun, 1);
	}

	function bounceText(textB:FlxText)
	{
		FlxTween.tween(textB, {'scale.x': 1.2, 'scale.y': 1.2}, 0.25, {
			ease: FlxEase.cubeInOut,
			onComplete: function(_)
			{
				FlxTween.tween(textB, {'scale.x': 1.0, 'scale.y': 1.0}, 0.5, {
					ease: FlxEase.bounceOut,
				});
			}
		});
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		bgMenu.velocity.x = -speedBG;

		bit.text = '$bpm';
		bpm = bpm + 1;

		if (scoreMinus == true)
		{
			scoreGame = scoreGame - 13;
		}

		#if android
		buttonLeft.updateHitbox();
		buttonRight.updateHitbox();
		buttonSpace.updateHitbox();
		buttonSeven.updateHitbox();

		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				if (touch.overlaps(buttonLeft))
				{
					LRB.animation.play('rightB');
				}
				if (touch.overlaps(buttonRight))
				{
					LRB.animation.play('leftB');
				}

				if (touch.overlaps(buttonSeven))
				{
					FlxG.switchState(States.new);
				}
			}

			if (touch.pressed)
			{
				if (touch.overlaps(buttonSpace))
				{
					SPACEB.animation.play('destruct');
				}
			}

			if (touch.justReleased)
			{
				SPACEB.animation.play('spaceNormal');
			}
		}
		#end

		score.text = 'Score : $scoreGame';

		bounceText(run);

		if (scoreGame >= 0 && scoreGame <= 9)
		{
			BGS.x = -17;
			BGS.scale.set(0.82, 1.18);
		}

		if (scoreGame >= 10 && scoreGame <= 99)
		{
			BGS.x = -13;
			BGS.scale.set(1.00, 1.18);
		}

		if (scoreGame >= 100 && scoreGame <= 999)
		{
			BGS.x = -10;
			BGS.scale.set(1.18, 1.18);
		}

		if (scoreGame >= 1000 && scoreGame <= 9999)
		{
			BGS.x = -7;
			BGS.scale.set(1.36, 1.18);
		}

		if (scoreGame >= 10000 && scoreGame <= 99999)
		{
			BGS.x = -4;
			BGS.scale.set(1.54, 1.18);
		}

		// if (FlxG.sound.music != null)
		// {
		//	if (FlxG.sound.music.time >= 94500)
		//	{
		//		FlxG.sound.music.fadeOut(1.0);
		//	}
		// }

		#if (windows || html5)
		if (FlxG.keys.anyJustPressed([FlxKey.RIGHT]))
		{
			LRB.animation.play('leftB');
		}
		if (FlxG.keys.anyJustPressed([FlxKey.LEFT]))
		{
			LRB.animation.play('rightB');
		}
		if (FlxG.keys.anyPressed([FlxKey.SPACE]))
		{
			SPACEB.animation.play('destruct');
		}
		else
		{
			SPACEB.animation.play('spaceNormal');
		}

		if (FlxG.keys.anyJustPressed([FlxKey.SEVEN]))
		{
			FlxG.switchState(States.new);
		}
		#end
	}

	function timerDarknessGoodBye(timer:FlxTimer)
	{
		FlxTween.tween(darkness, {'alpha': 0.0}, 3.0, {ease: FlxEase.cubeInOut});
	}

	function timerRetryBG(timer:FlxTimer)
	{
		bgMenu.x = 0;
	}

	function timerCredMusic(timer:FlxTimer)
	{
		FlxTween.tween(credMusicText, {y: 448}, 2.0, {ease: FlxEase.cubeInOut});

		new FlxTimer().start(2.0, timerCredMusicGoodbye, 1);
	}

	function timerCredMusicGoodbye(timer:FlxTimer)
	{
		FlxTween.tween(cdMusic, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
		FlxTween.tween(credMusicText, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
	}

	function timerMinusEpic(timer:FlxTimer)
	{
		scoreMinus = true;
	}

	function timerMinus(timer:FlxTimer)
	{
		// scoreGame = scoreGame - 2500;
	}

	function timerRun(timer:FlxTimer)
	{
		FlxG.camera.flash(FlxColor.WHITE, 1);
		scoreMinus = false;
		scoreGame = 0;
		score.alpha = 0.0;
		run.alpha = 1.0;
	}

	function timerFade(timer:FlxTimer)
	{
		FlxG.sound.music.fadeOut(1.0);
	}
}
