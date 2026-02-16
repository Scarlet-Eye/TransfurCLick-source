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
	var BG2 = new FlxSprite();
	var colinTransfur1 = new FlxSprite();
	var colinTransfur2 = new FlxSprite();

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
	var iconBSF = new FlxSprite();
	var textBlock = new FlxText();
	var textBlockDop = new FlxText();
	var textBlockLVL = new FlxText();
	var blockShop2 = new FlxSprite();
	var iconBSF2 = new FlxSprite();
	var textBlock2 = new FlxText();
	var textBlock2Dop = new FlxText();
	var textBlockLVL2 = new FlxText();
	var tableShop = new FlxSprite();
	var SHUDV = new FlxSprite();
	var SHUD = new FlxSprite();
	var buttonEscape = new FlxSprite();
	var escapeText = new FlxText();
	var buttonEscapeS = new FlxSprite();
	var escapeTextS = new FlxText();
	var savBG = new FlxSprite();
	var blockSave = new FlxSprite();
	var bSav = new FlxSprite();
	var bLoad = new FlxSprite();
	var bDel = new FlxSprite();
	var iconsSAV = new FlxSprite();
	var SAVTEXTGLAV = new FlxText();
	var SAVTEXTSTATIC = new FlxText();
	var savesTOP = '';
	var SAVESWELLDONE = new FlxText();
	var SHUDTEXT = new FlxText();
	var SAVHUDV = new FlxSprite();
	var SAVHUD = new FlxSprite();

	var LHUD = new FlxSprite();
	var iColin = new FlxSprite();
	var latex = new FlxSprite();

	var latexTransition = new FlxSprite();
	var darkness = new FlxSprite();

	var achiv1 = new FlxSprite();

	var scoreGame = 0;
	var allScore = 0;
	var scoreClick = 1;
	var latexScale = 1.00;
	var latexScore = 0;

	var shop = true;
	var shopGame = 'false';

	var updateCharAndBG = 1;

	var achiv1Done = false;
	var achiv1Status = 1;

	var theEnd = false;

	var restartGame = null;

	var lvlOneWLC = true;
	var lvlTwoWLC = false;
	var wlcNUM = 1;
	var lvlOneL = true;
	var lvlTwoL = false;
	var LNUM = 1;

	var save = new FlxSave();

	var savesLOL = false;
	var savesGame = 'false';

	override public function create()
	{
		super.create();

		BG = new FlxSprite(wayI + 'game/BGGame.png');
		BG.x = 0;
		BG.y = 0;
		add(BG);

		BG2 = new FlxSprite(wayI + 'game/BGGame2.png');
		BG2.x = 0;
		BG2.y = 0;
		BG2.alpha = 0.0;
		add(BG2);

		colinTransfur1 = new FlxSprite();
		colinTransfur1.loadGraphic(wayI + 'game/transfurAnim/whiteLatexPuddingTransfur.png', true, 300, 385);
		colinTransfur1.animation.add('transfurFrame1', [0], 1, true);
		colinTransfur1.animation.add('transfurFrame2', [1], 1, true);
		colinTransfur1.animation.add('transfurFrame3', [2], 1, true);
		colinTransfur1.animation.add('transfurFrame4', [3], 1, true);
		colinTransfur1.animation.add('transfurFrame5', [4], 1, true);
		colinTransfur1.animation.add('transfurFrame6', [5], 1, true);
		colinTransfur1.animation.add('transfurFrame7', [6], 1, true);
		colinTransfur1.animation.add('transfurFrame8', [7], 1, true);
		colinTransfur1.animation.play('transfurFrame1');
		colinTransfur1.x = 180;
		colinTransfur1.y = 95;
		add(colinTransfur1);

		colinTransfur2 = new FlxSprite();
		colinTransfur2.loadGraphic(wayI + 'game/transfurAnim/whiteKnightTransfur.png', true, 400, 415);
		colinTransfur2.animation.add('transfurFrame1', [0], 1, true);
		colinTransfur2.animation.add('transfurFrame2', [1], 1, true);
		colinTransfur2.animation.add('transfurFrame3', [2], 1, true);
		colinTransfur2.animation.add('transfurFrame4', [3], 1, true);
		colinTransfur2.animation.add('transfurFrame5', [4], 1, true);
		colinTransfur2.animation.add('transfurFrame6', [5], 1, true);
		colinTransfur2.animation.add('transfurFrame7', [6], 1, true);
		colinTransfur2.animation.add('transfurFrame8', [7], 1, true);
		colinTransfur2.animation.play('transfurFrame1');
		colinTransfur2.x = 130;
		colinTransfur2.y = 82;
		colinTransfur2.alpha = 0.0;
		add(colinTransfur2);
		// final ColinTransfur1 = new ColinTransfur1();
		// add(ColinTransfur1);

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

		SAVHUDV = new FlxSprite(wayI + 'game/HUD/savesHUD.png');
		SAVHUDV.x = 120;
		SAVHUDV.y = 374;
		SAVHUDV.alpha = 0.5;
		add(SAVHUDV);

		SAVHUD = new FlxSprite(wayI + 'game/HUD/savesHUD.png');
		SAVHUD.x = 120;
		SAVHUD.y = 374;
		add(SAVHUD);

		LHUD = new FlxSprite(wayI + 'game/HUD/latexHUD.png');
		LHUD.x = 0;
		LHUD.y = 0;
		add(LHUD);

		iColin = new FlxSprite();
		iColin.loadGraphic(wayI + 'icons/colin.png', true, 150, 175);
		iColin.animation.add('colinNormal', [0], 1, true);
		iColin.animation.add('colinTransfur', [1], 1, true);
		iColin.animation.play('colinNormal');
		iColin.x = 520;
		iColin.y = 350;
		iColin.scale.set(0.5, 0.5);
		add(iColin);
		// final ColinIconSystem = new ColinIconSystem();
		// add(ColinIconSystem);

		latex.makeGraphic(10, 5, FlxColor.WHITE);
		latex.x = 374;
		latex.y = 451;
		add(latex);

		score = new FlxText(270, 0, 0, 'Score : $scoreGame');
		score.setFormat(wayF + 'lifehackSans.ttf', 25, FlxColor.WHITE);
		add(score);

		#if mobile
		score.x = 268;

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

		iconBSF = new FlxSprite(wayI + 'game/shop/furryWolf.png');
		iconBSF.x = blockShop.x + 5;
		iconBSF.y = blockShop.y + 5;
		iconBSF.alpha = 0.0;
		add(iconBSF);

		textBlock = new FlxText(70, 35, 0, 'WHITE-LATEX CREATURE');
		textBlock.setFormat(wayF + 'offBitBold.ttf', 18, FlxColor.BLACK);
		textBlock.alpha = 0.0;
		add(textBlock);

		textBlockDop = new FlxText(325, 30, 0, 'Costs 500 score\n+1 per click');
		textBlockDop.setFormat(wayF + 'swampyClean.ttf', 15, FlxColor.WHITE, null, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		textBlockDop.borderSize = 2;
		textBlockDop.alpha = 0.0;
		add(textBlockDop);

		textBlockLVL = new FlxText(285, 27, 0, 'LVL\n 1');
		textBlockLVL.setFormat(wayF + 'offBitBold.ttf', 18, FlxColor.BLACK);
		textBlockLVL.alpha = 0.0;
		add(textBlockLVL);

		blockShop2 = new FlxSprite(wayI + 'game/shop/blockItem.png');
		blockShop2.x = 20;
		blockShop2.y = 100;
		blockShop2.alpha = 0.0;
		add(blockShop2);

		iconBSF2 = new FlxSprite(wayI + 'game/shop/bgPixel.png');
		iconBSF2.x = blockShop2.x + 5;
		iconBSF2.y = blockShop2.y + 5;
		iconBSF2.alpha = 0.0;
		add(iconBSF2);

		textBlock2 = new FlxText(70, 115, 0, 'LOCATION');
		textBlock2.setFormat(wayF + 'offBitBold.ttf', 18, FlxColor.BLACK);
		textBlock2.alpha = 0.0;
		add(textBlock2);

		textBlock2Dop = new FlxText(325, 110, 0, 'Costs 1500 score\n+3 per click');
		textBlock2Dop.setFormat(wayF + 'swampyClean.ttf', 15, FlxColor.WHITE, null, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		textBlock2Dop.borderSize = 2;
		textBlock2Dop.alpha = 0.0;
		add(textBlock2Dop);

		textBlockLVL2 = new FlxText(285, 107, 0, 'LVL\n 1');
		textBlockLVL2.setFormat(wayF + 'offBitBold.ttf', 18, FlxColor.BLACK);
		textBlockLVL2.alpha = 0.0;
		add(textBlockLVL2);

		tableShop = new FlxSprite(wayI + 'game/shop/table.png');
		tableShop.x = 0;
		tableShop.y = 0;
		tableShop.alpha = 0.0;
		add(tableShop);

		savBG = new FlxSprite(wayI + 'game/saves/savesBG.png');
		savBG.x = 0;
		savBG.y = 0;
		savBG.alpha = 0.0;
		savBG.scale.set(0.1, 0.1);
		add(savBG);

		blockSave = new FlxSprite(wayI + 'game/saves/blockSave.png');
		blockSave.screenCenter();
		blockSave.alpha = 0.0;
		add(blockSave);

		bSav = new FlxSprite(wayI + 'game/saves/saveGame.png');
		bSav.x = blockSave.x;
		bSav.y = blockSave.y - 45;
		bSav.alpha = 0.0;
		add(bSav);

		bLoad = new FlxSprite(wayI + 'game/saves/loadGame.png');
		bLoad.x = bSav.x + 200;
		bLoad.y = bSav.y;
		bLoad.alpha = 0.0;
		add(bLoad);

		bDel = new FlxSprite(wayI + 'game/saves/delGame.png');
		bDel.x = bSav.x + 400;
		bDel.y = bSav.y;
		bDel.alpha = 0.0;
		add(bDel);

		iconsSAV = new FlxSprite();
		iconsSAV.loadGraphic(wayI + 'game/saves/iconsSave.png', true, 95, 90);
		iconsSAV.animation.add('TransfurLVL1', [0], 1, true);
		iconsSAV.animation.add('TransfurLVL2', [1], 1, true);
		iconsSAV.animation.play('TransfurLVL1');
		iconsSAV.x = blockSave.x + 5;
		iconsSAV.y = blockSave.y + 15;
		iconsSAV.alpha = 0.0;
		add(iconsSAV);

		SAVTEXTGLAV = new FlxText(blockSave.x + 100, blockSave.y + 50, 0, 'SAVE #1($savesTOP)');
		SAVTEXTGLAV.setFormat(wayF + 'offBitBold.ttf', 30, FlxColor.WHITE, null, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		SAVTEXTGLAV.borderSize = 3;
		SAVTEXTGLAV.alpha = 0.0;
		add(SAVTEXTGLAV);

		SAVTEXTSTATIC = new FlxText(blockSave.x + 473, blockSave.y + 25, 0, 'SCORE : $scoreGame\nWLC LVL: $wlcNUM\nL LVL: $LNUM');
		SAVTEXTSTATIC.setFormat(wayF + 'offBitBold.ttf', 20, FlxColor.BLACK);
		SAVTEXTSTATIC.alpha = 0.0;
		add(SAVTEXTSTATIC);

		SAVESWELLDONE = new FlxText(250, 0, 0, 'SAVES');
		SAVESWELLDONE.setFormat(wayF + 'swampyClean.ttf', 50, FlxColor.WHITE);
		SAVESWELLDONE.alpha = 0.0;
		add(SAVESWELLDONE);

		SHUDTEXT = new FlxText(0, 0, 0, 'THE THREE LEVEL IS NOT DONE');
		SHUDTEXT.setFormat(wayF + 'offBitBold.ttf', 30, FlxColor.RED);
		SHUDTEXT.screenCenter();
		SHUDTEXT.alpha = 0.0;
		add(SHUDTEXT);

		#if android
		buttonEscape = new FlxSprite(wayI + 'buttonForMobile.png');
		buttonEscape.x = 20;
		buttonEscape.y = 400;
		buttonEscape.color = FlxColor.WHITE;
		buttonEscape.alpha = 0.0;
		add(buttonEscape);

		escapeText = new FlxText(buttonEscape.x + 9, buttonEscape.y + 25, 0, 'ESC');
		escapeText.setFormat(wayF + 'offBitBold.ttf', 35, FlxColor.WHITE);
		escapeText.alpha = 0.0;
		add(escapeText);

		buttonEscapeS = new FlxSprite(wayI + 'buttonForMobile.png');
		buttonEscapeS.x = 0;
		buttonEscapeS.y = 0;
		buttonEscapeS.color = FlxColor.WHITE;
		buttonEscapeS.alpha = 0.0;
		add(buttonEscapeS);

		escapeTextS = new FlxText(buttonEscapeS.x + 9, buttonEscapeS.y + 25, 0, 'ESC');
		escapeTextS.setFormat(wayF + 'offBitBold.ttf', 35, FlxColor.WHITE);
		escapeTextS.alpha = 0.0;
		add(escapeTextS);
		#end

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

		if (save.data.scoreGame == null)
		{
			trace('SAVE NOT FOUND.');
		}
		else
		{
			trace('SAVE FOUND!');

			// wlcNUM = save.data.wlcNUM;
		}
	}

	function saveGame()
	{
		save.bind('transfurSaveLGL');

		save.data.scoreGame = scoreGame;
		save.data.achiv1Status = achiv1Status;
		save.data.achiv1Done = achiv1Done;
		save.data.scoreClick = scoreClick;
		save.data.lvlOneWLC = lvlOneWLC;
		save.data.lvlTwoWLC = lvlTwoWLC;
		save.data.wlcNUM = wlcNUM;
		save.data.lvlOneL = lvlOneL;
		save.data.lvlTwoL = lvlTwoL;

		save.flush();
	}

	public function new()
	{
		super();

		save.bind('transfurSaveLGL');

		save.flush();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		SHUD.updateHitbox();
		SAVHUD.updateHitbox();
		bSav.updateHitbox();
		bLoad.updateHitbox();
		bDel.updateHitbox();

		score.text = 'Score : $scoreGame';

		latex.scale.set(latexScale, 1.00);

		SAVTEXTGLAV.text = 'SAVE #1($savesTOP)';
		SAVTEXTSTATIC.text = 'SCORE : $scoreGame\nWLC LVL: $wlcNUM\nL LVL: $LNUM';
		if (save.data.scoreGame == null)
		{
			savesTOP = 'SAVE NOT FOUND.';
		}
		else
		{
			savesTOP = 'SAVE FOUND!';
		}

		if (theEnd == false)
		{
			if (shopGame == 'false')
			{
				SHUD.x = -8;

				#if debug
				#if windows
				if (FlxG.keys.anyJustPressed([FlxKey.THREE]))
				{
					saveGame();
				}

				if (FlxG.keys.anyJustPressed([FlxKey.FOUR]))
				{
					if (save.data.scoreGame != null)
					{
						scoreGame = save.data.scoreGame;
						achiv1Status = save.data.achiv1Status;
						achiv1Done = save.data.achiv1Done;
						scoreClick = save.data.scoreClick;
						lvlOneWLC = save.data.lvlOneWLC;
						lvlTwoWLC = save.data.lvlTwoWLC;
						lvlOneL = save.data.lvlOneL;
						lvlTwoL = save.data.lvlTwoL;
					}
				}

				if (FlxG.keys.anyJustPressed([FlxKey.FIVE]))
				{
					save.erase();
				}
				#end
				#end

				#if android
				blockShop.updateHitbox();
				blockShop2.updateHitbox();
				buttonSeven.updateHitbox();

				for (touch in FlxG.touches.list)
				{
					if (touch.justPressed)
					{
						scoreGame = scoreGame + scoreClick;
						allScore = scoreGame + scoreClick;

						latexScale = latexScale + 0.50;
						latex.x = latex.x + 2.5;
						latexScore = latexScore + 10;

						new FlxTimer().start(0.001, timerScaleScore, 1);

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
					scoreGame = scoreGame + scoreClick;
					allScore = scoreGame + scoreClick;

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
				// TRANSUR1
				if (latexScore >= 0 && latexScore <= 20)
				{
					colinTransfur1.animation.play('transfurFrame1');
					colinTransfur2.animation.play('transfurFrame1');
				}

				if (latexScore >= 30 && latexScore <= 50)
				{
					colinTransfur1.animation.play('transfurFrame2');
					colinTransfur2.animation.play('transfurFrame2');
				}

				if (latexScore >= 60 && latexScore <= 80)
				{
					colinTransfur1.animation.play('transfurFrame3');
					colinTransfur2.animation.play('transfurFrame3');
				}

				if (latexScore >= 90 && latexScore <= 120)
				{
					colinTransfur1.animation.play('transfurFrame4');
					colinTransfur2.animation.play('transfurFrame4');
				}

				if (latexScore >= 130 && latexScore <= 160)
				{
					colinTransfur1.animation.play('transfurFrame5');
					colinTransfur2.animation.play('transfurFrame5');
				}

				if (latexScore >= 170 && latexScore <= 200)
				{
					colinTransfur1.animation.play('transfurFrame6');
					colinTransfur2.animation.play('transfurFrame6');
				}

				if (latexScore >= 210 && latexScore <= 240)
				{
					colinTransfur1.animation.play('transfurFrame7');
					colinTransfur2.animation.play('transfurFrame7');
				}

				if (latexScore >= 250 && latexScore <= 270)
				{
					colinTransfur1.animation.play('transfurFrame8');
					colinTransfur2.animation.play('transfurFrame8');
				}
				// ICON
				if (latexScore >= 0 && latexScore <= 130)
				{
					iColin.animation.play('colinNormal');
				}

				if (latexScore >= 140 && latexScore <= 270)
				{
					iColin.animation.play('colinTransfur');
				}
			}
			#if windows
			if (FlxG.keys.anyPressed([FlxKey.NINE]))
			{
				scoreGame = scoreGame + 100;
				allScore = allScore + 100;
			}
			#end
			if (shopGame == '.')
			{
				FlxTween.tween(bgShop, {'alpha': 0.9}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(blockShop, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(iconBSF, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(textBlock, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(textBlockDop, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(textBlockLVL, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(blockShop2, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(iconBSF2, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(textBlock2, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(textBlock2Dop, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(textBlockLVL2, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(tableShop, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				#if android
				FlxTween.tween(buttonEscape, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(escapeText, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				#end

				shopGame = '';

				new FlxTimer().start(2.0, timerBackSS, 1);
			}

			if (lvlOneWLC == true)
			{
				colinTransfur1.alpha = 1.0;
				colinTransfur2.alpha = 0.0;

				wlcNUM = 1;
				textBlockLVL.text = 'LVL\n $wlcNUM';
				textBlockDop.text = 'Costs 500 score\n+1 per click';
			}
			if (lvlTwoWLC == true)
			{
				colinTransfur1.alpha = 0.0;
				colinTransfur2.alpha = 1.0;

				wlcNUM = 2;
				textBlockLVL.text = 'LVL\n $wlcNUM';
				textBlockDop.text = 'Costs infinity score\n+1 per click';
			}
			if (wlcNUM == 1)
			{
				iconsSAV.animation.play('TransfurLVL1');
			}
			if (wlcNUM == 2)
			{
				iconsSAV.animation.play('TransfurLVL2');
			}
			if (lvlOneL == true)
			{
				BG.alpha = 1.0;
				BG2.alpha = 0.0;

				LNUM = 1;
				textBlockLVL2.text = 'LVL\n $LNUM';
				textBlock2Dop.text = 'Costs 1500 score\n+3 per click';
			}
			if (lvlTwoL == true)
			{
				BG.alpha = 0.0;
				BG2.alpha = 1.0;

				LNUM = 2;
				textBlockLVL2.text = 'LVL\n $LNUM';
				textBlock2Dop.text = 'Costs infinity score\n+3 per click';
			}

			if (shopGame == 'true')
			{
				#if android
				if (Cross.justPressedOn(buttonEscape))
				{
					shopGame = '';

					FlxTween.tween(bgShop, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(blockShop, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(iconBSF, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(blockShop2, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(textBlock, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(textBlockDop, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(textBlockLVL, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(textBlock2, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(textBlock2Dop, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(iconBSF2, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(textBlockLVL2, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(tableShop, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(latexTransition, {y: -1200}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(buttonEscape, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(escapeText, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});

					FlxG.sound.play(wayS + 'cancel.ogg');

					new FlxTimer().start(2.5, timerBackSF, 1);
				}
				#end
				if (Cross.justPressedOn(blockShop))
				{
					if (lvlOneWLC == true)
					{
						if (scoreGame <= 500)
						{
							shopGame = '';

							FlxTween.color(blockShop, 0.3, FlxColor.WHITE, FlxColor.RED, {
								ease: FlxEase.cubeInOut,
								onComplete: function(_)
								{
									FlxTween.color(blockShop, 0.7, FlxColor.RED, FlxColor.WHITE, {ease: FlxEase.cubeInOut});
								}
							});

							FlxG.sound.play(wayS + 'error.ogg');

							new FlxTimer().start(1.5, timerBackSS, 1);
						}
						if (scoreGame >= 500)
						{
							shopGame = '';

							FlxTween.color(blockShop, 0.3, FlxColor.WHITE, FlxColor.GREEN, {
								ease: FlxEase.cubeInOut,
								onComplete: function(_)
								{
									FlxTween.color(blockShop, 0.7, FlxColor.GREEN, FlxColor.WHITE, {ease: FlxEase.cubeInOut});
								}
							});

							FlxTween.color(textBlock, 0.3, FlxColor.BLACK, FlxColor.WHITE, {
								ease: FlxEase.cubeInOut,
								onComplete: function(_)
								{
									FlxTween.color(textBlock, 0.7, FlxColor.WHITE, FlxColor.BLACK, {ease: FlxEase.cubeInOut});
								}
							});

							FlxTween.color(textBlockLVL, 0.3, FlxColor.BLACK, FlxColor.WHITE, {
								ease: FlxEase.cubeInOut,
								onComplete: function(_)
								{
									FlxTween.color(textBlockLVL, 0.7, FlxColor.WHITE, FlxColor.BLACK, {ease: FlxEase.cubeInOut});
								}
							});

							scoreClick = scoreClick + 1;

							scoreGame = scoreGame - 500;

							FlxG.sound.play(wayS + 'load.ogg');

							new FlxTimer().start(1.0, timerLVLupTwo, 1);
							new FlxTimer().start(1.5, timerBackSS, 1);
						}
					}
					if (lvlTwoWLC == true)
					{
						if (scoreGame >= 0)
						{
							shopGame = '';

							FlxTween.color(blockShop, 0.3, FlxColor.WHITE, FlxColor.RED, {
								ease: FlxEase.cubeInOut,
								onComplete: function(_)
								{
									FlxTween.color(blockShop, 0.7, FlxColor.RED, FlxColor.WHITE, {ease: FlxEase.cubeInOut});
								}
							});

							FlxTween.tween(SHUDTEXT, {'alpha': 1.0}, 0.3, {
								ease: FlxEase.cubeInOut,
								onComplete: function(_)
								{
									FlxTween.tween(SHUDTEXT, {'alpha': 0.0}, 0.7, {ease: FlxEase.cubeInOut});
								}
							});

							FlxG.sound.play(wayS + 'error.ogg');

							new FlxTimer().start(1.5, timerBackSS, 1);
						}
					}
				}

				if (Cross.justPressedOn(blockShop2))
				{
					if (lvlOneL == true)
					{
						if (scoreGame <= 1500)
						{
							shopGame = '';

							FlxTween.color(blockShop2, 0.3, FlxColor.WHITE, FlxColor.RED, {
								ease: FlxEase.cubeInOut,
								onComplete: function(_)
								{
									FlxTween.color(blockShop2, 0.7, FlxColor.RED, FlxColor.WHITE, {ease: FlxEase.cubeInOut});
								}
							});

							FlxG.sound.play(wayS + 'error.ogg');

							new FlxTimer().start(1.5, timerBackSS, 1);
						}
						if (scoreGame >= 1500)
						{
							shopGame = '';

							FlxTween.color(blockShop2, 0.3, FlxColor.WHITE, FlxColor.GREEN, {
								ease: FlxEase.cubeInOut,
								onComplete: function(_)
								{
									FlxTween.color(blockShop2, 0.7, FlxColor.GREEN, FlxColor.WHITE, {ease: FlxEase.cubeInOut});
								}
							});

							FlxTween.color(textBlock2, 0.3, FlxColor.BLACK, FlxColor.WHITE, {
								ease: FlxEase.cubeInOut,
								onComplete: function(_)
								{
									FlxTween.color(textBlock2, 0.7, FlxColor.WHITE, FlxColor.BLACK, {ease: FlxEase.cubeInOut});
								}
							});

							FlxTween.color(textBlockLVL2, 0.3, FlxColor.BLACK, FlxColor.WHITE, {
								ease: FlxEase.cubeInOut,
								onComplete: function(_)
								{
									FlxTween.color(textBlockLVL2, 0.7, FlxColor.WHITE, FlxColor.BLACK, {ease: FlxEase.cubeInOut});
								}
							});

							scoreClick = scoreClick + 3;

							scoreGame = scoreGame - 1500;

							FlxG.sound.play(wayS + 'load.ogg');

							new FlxTimer().start(1.0, timerLVLupTwoL, 1);
							new FlxTimer().start(1.5, timerBackSS, 1);
						}
					}
					if (lvlTwoL == true)
					{
						if (scoreGame >= 0)
						{
							shopGame = '';

							FlxTween.color(blockShop2, 0.3, FlxColor.WHITE, FlxColor.RED, {
								ease: FlxEase.cubeInOut,
								onComplete: function(_)
								{
									FlxTween.color(blockShop2, 0.7, FlxColor.RED, FlxColor.WHITE, {ease: FlxEase.cubeInOut});
								}
							});

							FlxTween.tween(SHUDTEXT, {'alpha': 1.0}, 0.3, {
								ease: FlxEase.cubeInOut,
								onComplete: function(_)
								{
									FlxTween.tween(SHUDTEXT, {'alpha': 0.0}, 0.7, {ease: FlxEase.cubeInOut});
								}
							});

							FlxG.sound.play(wayS + 'error.ogg');

							new FlxTimer().start(1.5, timerBackSS, 1);
						}
					}
				}

				#if windows
				if (FlxG.keys.anyJustPressed([FlxKey.ESCAPE]))
				{
					shopGame = '';

					FlxTween.tween(bgShop, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(blockShop, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(iconBSF, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(blockShop2, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(textBlock, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(textBlockDop, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(textBlockLVL, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(textBlock2, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(textBlock2Dop, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(iconBSF2, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(textBlockLVL2, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(tableShop, {'alpha': 0.0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(latexTransition, {y: -1200}, 2.0, {ease: FlxEase.cubeInOut});

					FlxG.sound.play(wayS + 'cancel.ogg');

					new FlxTimer().start(2.5, timerBackSF, 1);
				}
				#end
			}
			if (Cross.justPressedOn(SAVHUD))
			{
				if (savesGame == 'false')
				{
					shopGame = '';
					SHUD.x = -300;
					SAVHUD.x = -300;
					savesGame = '';

					FlxTween.tween(savBG, {'scale.x': 1.0}, 0.60, {
						ease: FlxEase.linear,
						onComplete: function(_)
						{
							FlxTween.tween(savBG, {'scale.y': 1.0}, 0.60, {
								ease: FlxEase.cubeInOut
							});
						}
					});
					FlxTween.tween(savBG, {'alpha': 0.9}, 1.20, {
						ease: FlxEase.cubeInOut
					});

					FlxG.sound.play(wayS + 'load.ogg');

					new FlxTimer().start(1.3, timerSG, 1);
				}
			}
			if (savesGame == '.')
			{
				FlxTween.tween(bSav, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(bLoad, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(bDel, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(SAVESWELLDONE, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(blockSave, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(iconsSAV, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(SAVTEXTGLAV, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(SAVTEXTSTATIC, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				#if android
				FlxTween.tween(buttonEscapeS, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(escapeTextS, {'alpha': 1.0}, 1.5, {ease: FlxEase.cubeInOut});
				#end

				new FlxTimer().start(1.5, timerSGT, 1);

				savesGame = '';
			}
			if (savesGame == 'true')
			{
				if (Cross.justPressedOn(bSav))
				{
					saveGame();
				}
				if (Cross.justPressedOn(bLoad))
				{
					if (save.data.scoreGame != null)
					{
						scoreGame = save.data.scoreGame;
						achiv1Status = save.data.achiv1Status;
						achiv1Done = save.data.achiv1Done;
						scoreClick = save.data.scoreClick;
						lvlOneWLC = save.data.lvlOneWLC;
						lvlTwoWLC = save.data.lvlTwoWLC;
						lvlOneL = save.data.lvlOneL;
						lvlTwoL = save.data.lvlTwoL;
					}
				}
				if (Cross.justPressedOn(bDel))
				{
					save.erase();
				}

				#if android
				if (Cross.justPressedOn(buttonEscapeS))
				{
					FlxTween.tween(savBG, {'scale.y': 0.1}, 0.60, {
						ease: FlxEase.cubeInOut,
						onComplete: function(_)
						{
							FlxTween.tween(savBG, {'scale.x': 0.1}, 0.60, {
								ease: FlxEase.linear
							});
						}
					});

					FlxTween.tween(bSav, {'alpha': 0.0}, 1.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(bLoad, {'alpha': 0.0}, 1.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(SAVESWELLDONE, {'alpha': 0.0}, 1.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(bDel, {'alpha': 0.0}, 1.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(blockSave, {'alpha': 0.0}, 1.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(iconsSAV, {'alpha': 0.0}, 1.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(SAVTEXTGLAV, {'alpha': 0.0}, 1.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(SAVTEXTSTATIC, {'alpha': 0.0}, 1.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(buttonEscapeS, {'alpha': 0.0}, 1.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(escapeTextS, {'alpha': 0.0}, 1.0, {ease: FlxEase.cubeInOut});

					FlxG.sound.play(wayS + 'cancel.ogg');

					FlxTween.tween(savBG, {'alpha': 0.0}, 1.20, {ease: FlxEase.cubeInOut});
					new FlxTimer().start(2.5, timerBackSF, 1);
					new FlxTimer().start(2.5, timerBackSG, 1);

					savesGame = '';
				}
				#end
				#if windows
				if (FlxG.keys.anyJustPressed([FlxKey.ESCAPE]))
				{
					FlxTween.tween(savBG, {'scale.y': 0.1}, 0.60, {
						ease: FlxEase.cubeInOut,
						onComplete: function(_)
						{
							FlxTween.tween(savBG, {'scale.x': 0.1}, 0.60, {
								ease: FlxEase.linear
							});
						}
					});

					FlxTween.tween(bSav, {'alpha': 0.0}, 1.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(bLoad, {'alpha': 0.0}, 1.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(bDel, {'alpha': 0.0}, 1.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(SAVESWELLDONE, {'alpha': 0.0}, 1.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(blockSave, {'alpha': 0.0}, 1.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(iconsSAV, {'alpha': 0.0}, 1.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(SAVTEXTGLAV, {'alpha': 0.0}, 1.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(SAVTEXTSTATIC, {'alpha': 0.0}, 1.0, {ease: FlxEase.cubeInOut});

					FlxG.sound.play(wayS + 'cancel.ogg');

					FlxTween.tween(savBG, {'alpha': 0.0}, 1.20, {ease: FlxEase.cubeInOut});
					new FlxTimer().start(2.5, timerBackSF, 1);
					new FlxTimer().start(2.5, timerBackSG, 1);

					savesGame = '';
				}
				#end
			}
			if (shop == true)
			{
				if (Cross.justPressedOn(SHUD))
				{
					shopGame = '.';

					// FlxTween.tween(latexTransition, {y: 0}, 2.0, {ease: FlxEase.cubeInOut});

					FlxG.sound.play(wayS + 'load.ogg');
				}

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
				SAVHUD.x = -300;
			}
		}
		if (theEnd == true)
		{
			SHUDTEXT.size = 18;
			SHUDTEXT.alpha = 1.0;
			#if windows
			SHUDTEXT.text = "Sorry, i haven't thought the ending for the PRE-ALPHA version yet.\nExpect an ALPHA, BETA or DEMO version ;3\nPlease press 7 for States.hx or ALT+F4 to exit the game.";
			#end
			#if android
			SHUDTEXT.text = "Sorry, i haven't thought the ending for the PRE-ALPHA version yet.\nExpect an ALPHA, BETA or DEMO version ;3\nPlease press BACK on your smartphone to exit the game.";
			#end
			// Катсцена и конец игры!
		}

		if (latexScore == 280 || latexScore > 280)
		{
			latexScale = 1.00;
			latexScore = 0;
			latex.x = 374;

			FlxG.sound.play(wayS + 'transfurmation.ogg');
		}

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

		if (achiv1Status == 1)
		{
			if (scoreGame >= 100)
			{
				achiv1Status = 2;

				// (Первые шаги)
			}
			else
			{
				FlxTween.cancelTweensOf(achiv1);
				achiv1.x = 465;
				achiv1.y = -60;
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

		if (scoreGame >= 10000 && scoreGame <= 99999)
		{
			BGS.x = -4;
			BGS.scale.set(1.54, 1.18);
		}

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

	function timerLVLupTwo(timer:FlxTimer)
	{
		lvlOneWLC = false;
		lvlTwoWLC = true;
	}

	function timerLVLupTwoL(timer:FlxTimer)
	{
		lvlOneL = false;
		lvlTwoL = true;
	}

	function timerBackSS(timer:FlxTimer)
	{
		shopGame = 'true';
	}

	function timerBackSF(timer:FlxTimer)
	{
		SAVHUD.x = 120;

		shopGame = 'false';
	}

	function timerSG(timer:FlxTimer)
	{
		savesGame = '.';

		savesLOL = false;
	}

	function timerSGT(timer:FlxTimer)
	{
		savesGame = 'true';
	}

	function timerBackSG(timer:FlxTimer)
	{
		SAVHUD.x = 120;

		savesGame = 'false';
	}

	function timerRes(timer:FlxTimer)
	{
		Application.current.window.title = 'TransfurClick';

		FlxG.switchState(MainTransfurMenu.new);
	}
}
