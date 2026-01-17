package;

import Sys;
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
	var wayF = 'assets/fonts/';
	var wayM = 'assets/music/';
	var wayI = 'assets/images/';
	var wayS = 'assets/sounds/';

	var hx1 = new FlxSprite();
	var hx2 = new FlxSprite();

	override public function create()
	{
		super.create();

		var latexTransition = new FlxSprite(wayI + 'mainMenu/startScreen/lightLatex.png');
		latexTransition.x = 0;
		latexTransition.y = -1200;
		add(latexTransition);

		FlxTween.tween(latexTransition, {y: 0}, 2.0, {ease: FlxEase.cubeInOut});

		hx1 = new FlxSprite(wayI + 'states/TCMTM.png');
		hx1.scale.set(0.2, 0.2);
		add(hx1);

		hx2 = new FlxSprite(wayI + 'states/TCLGL.png');
		hx2.scale.set(0.2, 0.2);
		add(hx2);

		var darkness = new FlxSprite();
		darkness.makeGraphic(642, 60, FlxColor.BLACK);
		darkness.x = 0;
		darkness.y = 0;
		darkness.alpha = 1.0;
		add(darkness);

		var state = new FlxText(190, 0, 0, 'States.hx');
		state.setFormat(wayF + 'offBitBold.ttf', 60, FlxColor.ORANGE);
		add(state);

		#if (windows || html5)
		var hx1Text = new FlxText(253, 170, 0, '[1] - MainTransfurMenu.hx');
		#end
		#if android
		var hx1Text = new FlxText(253, 170, 0, 'TAP TO IMAGE - MainTransfurMenu.hx');
		#end
		hx1Text.setFormat(wayF + 'offBitBold.ttf', 15, FlxColor.BLACK);
		add(hx1Text);

		#if (windows || html5)
		var hx2Text = new FlxText(403, 270, 0, '[2] - LatexGameLove.hx');
		#end
		#if android
		var hx2Text = new FlxText(403, 270, 0, 'TAP TO IMAGE - LatexGameLove.hx');
		#end
		hx2Text.setFormat(wayF + 'offBitBold.ttf', 15, FlxColor.BLACK);
		add(hx2Text);

		FlxG.autoPause = false;
		#if (windows || html5)
		FlxG.mouse.visible = false;
		#end

		FlxG.sound.play(wayS + 'transfurmation.ogg');
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		hx1.screenCenter();
		hx2.x = hx1.x + 150;
		hx2.y = hx1.y + 100;

		#if android
		hx1.updateHitbox();
		hx2.updateHitbox();

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
		#end
	}
}
