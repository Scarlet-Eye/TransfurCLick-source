package;

import Sys;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import flixel.util.FlxTimer;
import lime.app.Application;

class LatexGameLove extends FlxState
{
	var wayF = 'assets/fonts/';
	var wayM = 'assets/music/';
	var wayI = 'assets/images/';
	var wayS = 'assets/sounds/';

	var BG = new FlxSprite();

	var BGS = new FlxSprite();
	var score = new FlxText();
	var buttonSeven = new FlxSprite();
	var sevenText = new FlxText();
	var logoHF = new FlxSprite();
	var exitT = new FlxText();
	var exitTC = new FlxText();
	var resT = new FlxText();
	var resTC = new FlxText();
	var bgShop = new FlxSprite();
	var blockShop = new FlxSprite();
	var textBlock = new FlxText();
	var textBlockLVL = new FlxText();
	var tableShop = new FlxSprite();
	var SHUDV = new FlxSprite();
	var SHUD = new FlxSprite();
	var SHUDTEXT = new FlxText();

	var LHUD = new FlxSprite();
	var latex = new FlxSprite();

	var latexTransition = new FlxSprite();
	var darkness = new FlxSprite();

	var achiv1 = new FlxSprite();

	var scoreGame = 0;
	var latexScale = 1.00;
	var latexScore = 0;

	var shop = true;
	var shopGame = 'false';

	var updateCharAndBG = 1;

	var achiv1Done = false;
	var achiv1Status = 1;

	var theEnd = false;

	var restartGame = null;

	override public function create()
	{
		super.create();

		BG = new FlxSprite(wayI + 'game/BGGame.png');
		BG.x = 0;
		BG.y = 0;
		add(BG);

		final ColinTransfur1 = new ColinTransfur1();
		add(ColinTransfur1);

		BGS = new FlxSprite(wayI + 'game/HUD/BGScore.png');
		BGS.x = -17;
		BGS.y = 40;
		BGS.scale.set(0.82, 1.18);
		add(BGS);

		SHUDV = new FlxSprite(wayI + 'game/HUD/shopHUDvis.png');
		SHUDV.x = 0;
		SHUDV.y = 0;
		SHUDV.alpha = 0.5;
		add(SHUDV);

		SHUD = new FlxSprite(wayI + 'game/HUD/shopHUD.png');
		SHUD.x = -8;
		SHUD.y = 366;
		add(SHUD);

		SHUDTEXT = new FlxText(0, 0, 0, 'THE SHOP IS NOT DONE');
		SHUDTEXT.setFormat(wayF + 'offBitBold.ttf', 30, FlxColor.RED);
		SHUDTEXT.screenCenter();
		SHUDTEXT.alpha = 0.0;
		add(SHUDTEXT);

		LHUD = new FlxSprite(wayI + 'game/HUD/latexHUD.png');
		LHUD.x = 0;
		LHUD.y = 0;
		add(LHUD);

		final ColinIconSystem = new ColinIconSystem();
		add(ColinIconSystem);

		latex.makeGraphic(10, 5, FlxColor.WHITE);
		latex.x = 374;
		latex.y = 451;
		add(latex);

		score = new FlxText(270, 0, 0, 'Score : $scoreGame');
		score.setFormat(wayF + 'lifehackSans.ttf', 25, FlxColor.WHITE);
		add(score);

		#if mobile
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

		#if (windows || html5)
		#if windows
		exitT = new FlxText(0, 0, 0, '[1]');
		exitT.setFormat(wayF + 'offBitBold.ttf', 15, FlxColor.RED);
		add(exitT);

		exitTC = new FlxText(0, exitT.y + 15, 0, 'Exit from TC');
		exitTC.setFormat(wayF + 'offBitBold.ttf', 15, FlxColor.RED);
		add(exitTC);
		#end

		resT = new FlxText(0, 35, 0, '[2]');
		resT.setFormat(wayF + 'offBitBold.ttf', 15, FlxColor.ORANGE);
		#if html5
		resT.y = 0;
		#end
		add(resT);

		resTC = new FlxText(0, resT.y + 15, 0, 'Restart TC');
		resTC.setFormat(wayF + 'offBitBold.ttf', 15, FlxColor.ORANGE);
		add(resTC);
		#end

		latexTransition = new FlxSprite(wayI + 'mainMenu/startScreen/lightLatex.png');
		latexTransition.x = 0;
		latexTransition.y = -1200;
		add(latexTransition);

		bgShop = new FlxSprite(wayI + 'game/shop/BG.png');
		bgShop.x = 0;
		bgShop.y = 0;
		bgShop.alpha = 0.0;
		add(bgShop);

		blockShop = new FlxSprite(wayI + 'game/shop/blockItem.png');
		blockShop.x = 20;
		blockShop.y = 20;
		blockShop.alpha = 0.0;
		add(blockShop);

		textBlock = new FlxText(70, 35, 0, 'WHITE-LATEX CREATURE');
		textBlock.setFormat(wayF + 'offBitBold.ttf', 18, FlxColor.BLACK);
		textBlock.alpha = 0.0;
		add(textBlock);

		textBlockLVL = new FlxText(285, 27, 0, 'LVL\n 1');
		textBlockLVL.setFormat(wayF + 'offBitBold.ttf', 18, FlxColor.BLACK);
		textBlockLVL.alpha = 0.0;
		add(textBlockLVL);

		tableShop = new FlxSprite(wayI + 'game/shop/table.png');
		tableShop.x = 0;
		tableShop.y = 0;
		tableShop.alpha = 0.0;
		add(tableShop);

		darkness.makeGraphic(642, 480, FlxColor.BLACK);
		darkness.x = 0;
		darkness.y = 0;
		darkness.alpha = 1.0;
		add(darkness);

		achiv1 = new FlxSprite(wayI + 'achievements/achievement1.png');
		achiv1.x = 465;
		achiv1.y = -60;
		add(achiv1);

		FlxG.sound.playMusic(wayM + 'gameMusic.ogg');

		FlxG.autoPause = false;
		#if (windows || html5)
		FlxG.mouse.visible = true;
		#end

		new FlxTimer().start(0.1, timerDarknessGoodBye, 1);
		new FlxTimer().start(3.1, timerResMove, 1);
	}

	public function new()
	{
		super();

		var transfurSave = new FlxSave();

		transfurSave.bind('transfurSave');
		transfurSave.flush();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		SHUD.updateHitbox();

		score.text = 'Score : $scoreGame';

		latex.scale.set(latexScale, 1.00);

		if (theEnd == false)
		{
			if (shopGame == 'false')
			{
				SHUD.x = -8;

				#if android
				buttonSeven.updateHitbox();

				for (touch in FlxG.touches.list)
				{
					if (touch.justPressed)
					{
						scoreGame = scoreGame + 1;

						latexScale = latexScale + 0.50;
						latex.x = latex.x + 2.5;
						latexScore = latexScore + 10;

						new FlxTimer().start(0.001, timerScaleScore, 1);

						if (shop == true)
						{
							if (touch.overlaps(SHUD))
							{
								shopGame = 'nope';
							}
						}

						if (touch.overlaps(buttonSeven))
						{
							FlxG.switchState(States.new);
						}
					}
				}
				#end
				#if (windows || html5)
				if (FlxG.mouse.justPressed)
				{
					scoreGame = scoreGame + 1;

					latexScale = latexScale + 0.50;
					latex.x = latex.x + 2.5;
					latexScore = latexScore + 10;

					new FlxTimer().start(0.001, timerScaleScore, 1);
					// Не баг, а фича которая вошла в игру(Если быстро кликаешь, то очки начинают подпрыгивать в такт с тобой):D
				}
				#end
				if (restartGame == false)
				{
					#if (windows || html5)
					if (FlxG.keys.anyJustPressed([FlxKey.TWO]))
					{
						restartGame = true;

						FlxTween.tween(latexTransition, {y: 0}, 2.0, {ease: FlxEase.cubeInOut});
						FlxTween.tween(darkness, {'alpha': 1.0}, 3.0, {ease: FlxEase.cubeInOut});

						FlxG.sound.play(wayS + 'transfurmation.ogg');

						new FlxTimer().start(3.5, timerRes, 1);
					}

					if (FlxG.keys.anyJustPressed([FlxKey.ONE]))
					{
						#if windows
						Sys.exit(0);
						#end
					}
					#end
				}
			}
			if (shopGame == '.')
			{
				FlxTween.tween(bgShop, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(blockShop, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(textBlock, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(textBlockLVL, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(tableShop, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});

				shopGame = 'true';
			}

			if (shopGame == 'true')
			{
				#if (windows || html5)
				if (FlxG.keys.anyJustPressed([FlxKey.ESCAPE]))
				{
					shopGame = 'false';

					FlxTween.tween(bgShop, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(blockShop, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(textBlock, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(textBlockLVL, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(tableShop, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(latexTransition, {y: -1200}, 2.0, {ease: FlxEase.cubeInOut});

					FlxG.sound.play(wayS + 'cancel.ogg');
				}
				#end
			}

			if (shop == true)
			{
			#if (windows || html5)
			if (FlxG.mouse.overlaps(SHUD))
			{
				if (FlxG.mouse.justPressed)
				{
					shopGame = 'nope';
					// shopGame = '.';

					// FlxTween.tween(latexTransition, {y: 0}, 2.0, {ease: FlxEase.cubeInOut});

					// FlxG.sound.play(wayS + 'load.ogg');
				}
			}
			#end

			if (shopGame == 'nope')
			{
				shop = false;
				shopGame = 'false';

				FlxTween.tween(SHUDTEXT, {'alpha': 1.0}, 1.0, {ease: FlxEase.cubeInOut});

				FlxG.camera.flash(FlxColor.RED, 1);
				FlxG.sound.play(wayS + 'error.ogg');

				new FlxTimer().start(1.0, timerText, 1);
				new FlxTimer().start(2.0, timerShopLol, 1);
			}
		}

			if (shopGame == '.')
			{
				SHUD.x = -300;
			}
		}

		if (theEnd == true)
		{
			// Катсцена и конец игры!
		}

		if (latexScore == 280 || latexScore > 280)
		{
			latexScale = 1.00;
			latexScore = 0;
			latex.x = 374;

			FlxG.sound.play(wayS + 'transfurmation.ogg');
		}

		if (scoreGame >= 10 && scoreGame <= 99)
		{
			BGS.x = -13;
			BGS.scale.set(1.00, 1.18);
		}

		if (achiv1Status == 1)
		{
			if (scoreGame > 100)
			{
				achiv1Status = 2;

				// (Первые шаги)
			}
		}

		if (scoreGame >= 100 && scoreGame <= 999)
		{
			BGS.x = -10;
			BGS.scale.set(1.18, 1.18);
		}

		if (achiv1Status == 2)
		{
			if (achiv1Done == false)
			{
				FlxG.sound.play(wayS + 'achievement.ogg');

				FlxTween.tween(achiv1, {y: 0}, 1.0, {ease: FlxEase.linear});

				new FlxTimer().start(4.0, timerGoodByeAchiv1, 1);

				achiv1Status = 0;
				achiv1Done = true;
			}
		}

		if (scoreGame == 500) {} // (Интерес)

		if (scoreGame >= 1000 && scoreGame <= 9999)
		{
			BGS.x = -7;
			BGS.scale.set(1.36, 1.18);
		} // Ты взялся за дело? (Настоящее дело)

		if (scoreGame == 3000) {} // Молодец! Продолжай в том-же духе ()

		if (updateCharAndBG == 1)
		{
			if (scoreGame == 7777) {} // Да ты БОГ! (БОГ)
		}

		if (scoreGame >= 10000 && scoreGame <= 99999)
		{
			BGS.x = -4;
			BGS.scale.set(1.54, 1.18);

			theEnd = true;
		} // ЛЕГЕНДА! Конец игры (ЛЕГЕНДА ФАН-ИГРЫ)

		#if (windows || html5)
		if (FlxG.keys.anyJustPressed([FlxKey.SEVEN]))
		{
			FlxG.switchState(States.new);
		}
		#end
	}

	function timerScaleScore(timer:FlxTimer)
	{
		FlxTween.tween(score, {'scale.x': 1.2, 'scale.y': 1.2}, 0.1, {ease: FlxEase.cubeInOut});
		FlxTween.tween(score, {'scale.x': 1.0, 'scale.y': 1.0}, 0.2, {ease: FlxEase.cubeInOut});
	}

	function timerDarknessGoodBye(timer:FlxTimer)
	{
		FlxTween.tween(darkness, {'alpha': 0.0}, 3.0, {ease: FlxEase.cubeInOut});
	}

	function timerGoodByeAchiv1(timer:FlxTimer)
	{
		FlxTween.tween(achiv1, {x: 640}, 2.0, {ease: FlxEase.cubeInOut});
	}

	function timerText(timer:FlxTimer)
	{
		FlxTween.tween(SHUDTEXT, {'alpha': 0.0}, 1.0, {ease: FlxEase.cubeInOut});
	}

	function timerShopLol(timer:FlxTimer)
	{
		shop = true;
	}

	function timerGoShop(timer:FlxTimer)
	{
		shopGame = 'true';
	}

	function timerNoShop(timer:FlxTimer)
	{
		shopGame = 'false';
	}

	function timerResMove(timer:FlxTimer)
	{
		restartGame = false;
	}

	function timerRes(timer:FlxTimer)
	{
		Application.current.window.title = 'TransfurClick';

		FlxG.switchState(MainTransfurMenu.new);
	}
}

class ColinTransfur1 extends FlxSprite
{
	var wayI = 'assets/images/';

	var spriteTransfur = new FlxSprite();

	var latexScore = 0;

	public function new(xPos:Int = 180, yPos:Int = 95)
	{
		super(xPos, yPos);

		spriteTransfur = loadGraphic(wayI + 'game/transfurAnim/whiteLatexPuddingTransfur.png', true, 300, 385);

		animation.add('whiteLatexPudding0000', [0], 1, true);
		animation.add('whiteLatexPudding0001', [0], 1, true);
		animation.add('whiteLatexPudding0002', [0], 1, true);
		animation.add('whiteLatexPudding0003', [0], 1, true);
		animation.add('whiteLatexPudding0004', [0], 1, true);
		animation.add('whiteLatexPudding0005', [0], 1, true);
		animation.add('whiteLatexPudding0006', [0], 1, true);
		animation.add('whiteLatexPudding0007', [0], 1, true);

		var anim = FlxAtlasFrames.fromSparrow(wayI + 'game/transfurAnim/whiteLatexPuddingTransfur.png',
			wayI + 'game/transfurAnim/whiteLatexPuddingTransfur.xml');
		frames = anim;

		animation.addByPrefix('transfurFrame1', 'whiteLatexPudding0000', 1, true);
		animation.addByPrefix('transfurFrame2', 'whiteLatexPudding0001', 1, true);
		animation.addByPrefix('transfurFrame3', 'whiteLatexPudding0002', 1, true);
		animation.addByPrefix('transfurFrame4', 'whiteLatexPudding0003', 1, true);
		animation.addByPrefix('transfurFrame5', 'whiteLatexPudding0004', 1, true);
		animation.addByPrefix('transfurFrame6', 'whiteLatexPudding0005', 1, true);
		animation.addByPrefix('transfurFrame7', 'whiteLatexPudding0006', 1, true);
		animation.addByPrefix('transfurFrame8', 'whiteLatexPudding0007', 1, true);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		#if android
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				latexScore = latexScore + 10;
			}
		}
		#end
		#if (windows || html5)
		if (FlxG.mouse.justPressed)
		{
			latexScore = latexScore + 10;
		}
		#end

		if (latexScore >= 0 && latexScore <= 20)
		{
			animation.play('transfurFrame1');
		}

		if (latexScore >= 30 && latexScore <= 50)
		{
			animation.play('transfurFrame2');
		}

		if (latexScore >= 60 && latexScore <= 80)
		{
			animation.play('transfurFrame3');
		}

		if (latexScore >= 90 && latexScore <= 120)
		{
			animation.play('transfurFrame4');
		}

		if (latexScore >= 130 && latexScore <= 160)
		{
			animation.play('transfurFrame5');
		}

		if (latexScore >= 170 && latexScore <= 200)
		{
			animation.play('transfurFrame6');
		}

		if (latexScore >= 210 && latexScore <= 240)
		{
			animation.play('transfurFrame7');
		}

		if (latexScore >= 250 && latexScore <= 270)
		{
			animation.play('transfurFrame8');
		}

		if (latexScore == 280 || latexScore > 280)
		{
			latexScore = 0;
		}
	}
}

class ColinIconSystem extends FlxSprite
{
	var wayI = 'assets/images/';

	var iColin = new FlxSprite();

	var latexScore = 0;

	var theEnd = false;

	public function new(xPos:Int = 520, yPos:Int = 350)
	{
		super(xPos, yPos);

		iColin = loadGraphic(wayI + 'icons/colin.png', true, 150, 175);
		iColin.scale.set(0.5, 0.5);

		animation.add('colinNormal', [0], 1, true);
		animation.add('colinTransfur', [1], 1, true);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (theEnd == false)
		{
			#if android
			for (touch in FlxG.touches.list)
			{
				if (touch.justPressed)
				{
					latexScore = latexScore + 10;
				}
			}
			#end
			#if (windows || html5)
			if (FlxG.mouse.justPressed)
			{
				latexScore = latexScore + 10;
			}
			#end
		}

		if (latexScore >= 0 && latexScore <= 130)
		{
			animation.play('colinNormal');
		}

		if (latexScore >= 140 && latexScore <= 270)
		{
			animation.play('colinTransfur');
		}

		if (latexScore == 280 || latexScore > 280)
		{
			latexScore = 0;
		}
	}
}
