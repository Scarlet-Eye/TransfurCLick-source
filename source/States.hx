package;

import Sys;
import additional.Paths;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

class States extends FlxState
{
	var hx1 = new FlxSprite();
	var hx2 = new FlxSprite();
	var hx3 = new FlxSprite();
	var logoHF = new FlxSprite();

	override public function create()
	{
		super.create();

		var latexTransition = new FlxSprite(Paths.image('mainMenu/startScreen/lightLatex.png'));
		latexTransition.x = 0;
		latexTransition.y = -1200;
		add(latexTransition);

		FlxTween.tween(latexTransition, {y: 0}, 2.0, {ease: FlxEase.cubeInOut});

		hx1 = new FlxSprite(Paths.image('states/TCMTM.png'));
		hx1.scale.set(0.2, 0.2);
		add(hx1);

		hx2 = new FlxSprite(Paths.image('states/TCLGL.png'));
		hx2.scale.set(0.2, 0.2);
		add(hx2);

		hx3 = new FlxSprite();
		hx3.loadGraphic(Paths.image('game/shop/testTube.png'));
		hx3.x = 10;
		hx3.y = 400;
		add(hx3);

		logoHF = new FlxSprite();
		logoHF.loadGraphic(Paths.image('startScreen/haxeFlixelLogoAnimated.png'), true, 100, 149);
		logoHF.animation.add('hfFrame1', [0], 1, true);
		logoHF.animation.add('hfFrame2', [1], 1, true);
		logoHF.animation.add('hfFrame3', [2], 1, true);
		logoHF.animation.add('hfFrame4', [3], 1, true);
		logoHF.animation.add('hfFrame5', [4], 1, true);
		logoHF.animation.add('hfWhiteFrame1', [5], 1, true);
		logoHF.animation.play('hfWhiteFrame1');
		logoHF.x = 5;
		logoHF.y = 80;
		logoHF.scale.set(0.70, 0.70);
		add(logoHF);

		var darkness = new FlxSprite();
		darkness.makeGraphic(642, 60, FlxColor.BLACK);
		darkness.x = 0;
		darkness.y = 0;
		darkness.alpha = 1.0;
		add(darkness);

		var state = new FlxText(190, 0, 0, 'States.hx');
		state.setFormat(Paths.font('offBitBold.ttf'), 60, FlxColor.ORANGE);
		add(state);

		#if (windows || html5)
		var hx1Text = new FlxText(253, 170, 0, '[1] - MainTransfurMenu.hx');
		#end
		#if android
		var hx1Text = new FlxText(253, 170, 0, 'TAP TO IMAGE - MainTransfurMenu.hx');
		#end
		hx1Text.setFormat(Paths.font('offBitBold.ttf'), 15, FlxColor.BLACK);
		add(hx1Text);

		#if (windows || html5)
		var hx2Text = new FlxText(403, 270, 0, '[2] - LatexGameLove.hx');
		#end
		#if android
		var hx2Text = new FlxText(403, 270, 0, 'TAP TO IMAGE - LatexGameLove.hx');
		#end
		hx2Text.setFormat(Paths.font('offBitBold.ttf'), 15, FlxColor.BLACK);
		add(hx2Text);

		#if (windows || html5)
		var hx3Text = new FlxText(13, 380, 0, '[3] - FinalRun.hx');
		#end
		#if android
		var hx3Text = new FlxText(13, 380, 0, 'TAP TO IMAGE - FinalRun.hx');
		#end
		hx3Text.setFormat(Paths.font('offBitBold.ttf'), 15, FlxColor.BLACK);
		add(hx3Text);

		#if (windows || html5)
		var hx4Text = new FlxText(2, 60, 0, '[4] - StartScreenNEW.hx');
		#end
		#if android
		var hx4Text = new FlxText(2, 60, 0, 'TAP TO IMAGE - StartScreenNEW.hx');
		#end
		hx4Text.setFormat(Paths.font('offBitBold.ttf'), 15, FlxColor.BLACK);
		add(hx4Text);

		FlxG.autoPause = false;
		#if (windows || html5)
		FlxG.mouse.visible = false;
		#end

		FlxG.sound.music.stop();
		FlxG.sound.play(Paths.sound('transfurmation.ogg'));
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		hx1.screenCenter();
		hx2.x = hx1.x + 150;
		hx2.y = hx1.y + 100;

		logoHF.updateHitbox();

		#if android
		hx1.updateHitbox();
		hx2.updateHitbox();
		hx3.updateHitbox();

		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				if (touch.overlaps(hx1))
				{
					FlxG.switchState(MainTransfurMenu.new);
				}
				if (touch.overlaps(hx2))
				{
					FlxG.switchState(LatexGameLove.new);
				}
				if (touch.overlaps(hx3))
				{
					FlxG.switchState(FinalRun.new);
				}
				if (touch.overlaps(logoHF))
				{
					FlxG.switchState(StartScreenNEW.new);
				}
			}
		}
		#end

		#if (windows || html5)
		if (FlxG.keys.anyJustPressed([FlxKey.ESCAPE]))
		{
			#if windows
			Sys.exit(0);
			#end
		}

		if (FlxG.keys.anyJustPressed([FlxKey.ONE]))
		{
			FlxG.switchState(MainTransfurMenu.new);
		}

		if (FlxG.keys.anyJustPressed([FlxKey.TWO]))
		{
			FlxG.switchState(LatexGameLove.new);
		}

		if (FlxG.keys.anyJustPressed([FlxKey.THREE]))
		{
			FlxG.switchState(FinalRun.new);
		}

		if (FlxG.keys.anyJustPressed([FlxKey.FOUR]))
		{
			FlxG.switchState(StartScreenNEW.new);
		}
		#end
	}
}
