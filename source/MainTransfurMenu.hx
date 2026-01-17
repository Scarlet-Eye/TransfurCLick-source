package;

// Сразу предупреждаю что у некоторых программистов может произойти смерть от такого кода, пожалуйста не судите мой код строго. Я новичёк в HaxeFlixel, немного использую официальные туториалы, и свои знания для кода движка ^w^"
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
import flixel.util.FlxDestroyUtil;
import flixel.util.FlxSave;
import flixel.util.FlxTimer;
import lime.app.Application;

// Для FlxText = 'Лол\nОфигеть' Для себя заметка

class MainTransfurMenu extends FlxState
{
	var wayF = 'assets/fonts/';
	var wayM = 'assets/music/';
	var wayI = 'assets/images/';
	var wayS = 'assets/sounds/';

	var backGroundStart = new FlxSprite();
	var logoGame = new FlxSprite();
	var darknessBG = new FlxSprite();
	var bgMenu = new FlxSprite();
	var bgMenuBLOOD = new FlxSprite();
	var speedBG:Int = 64;
	var logoInMenu = new FlxSprite();
	var buttonSix = new FlxSprite();
	var buttonSeven = new FlxSprite();
	var logoHF = new FlxSprite();
	var buttonEscape = new FlxSprite();
	var bgHUDdop = new FlxSprite();
	var bgHUD = new FlxSprite();
	var cdMusic = new FlxSprite();
	var bTCS = new FlxSprite();
	var bTCC = new FlxSprite();
	var bTCE = new FlxSprite();
	var latexTransition = new FlxSprite();
	var darkness = new FlxSprite();

	var startText1 = new FlxText();
	var startText2 = new FlxText();
	var startText3 = new FlxText();
	var startText4 = new FlxText();
	var startGameText = new FlxText();
	var sixText = new FlxText();
	var sevenText = new FlxText();
	var welcomeText = new FlxText();
	var buildText = new FlxText();
	var versionGameText = new FlxText();
	var originalGame = new FlxText();

	var versionGame = '0.0.1(CONCEPT)';

	var pressEnter = false;

	var startScreen = true;
	var menuSelection = false;
	var creditsTC = false;
	var credMusicText = new FlxText();
	var credMusic = 'ShiZi'; // ShiZi и aleximine
	var credMusicLink = 'https://changed.fandom.com/wiki/Changed-OST';
	var escapeText = new FlxText();
	var credText = new FlxText();
	var creatorGame = 'Scarlet-Eye';
	var credGame = 'KittyFoxNyan';
	var credGame2 = 'Togo91';
	var creatorGameText = new FlxText();
	var credGameText = new FlxText();
	var credGameText2 = new FlxText();
	var creatorMod = ''; // Может-быть у игры появятся мододелы или мою идею кто-то улучшит? ХЗ
	var fnfctL = new FlxSprite();
	var fmsL = new FlxSprite();
	var ACLICK = new FlxText();
	var DCLICK = new FlxText();
	var CTROLE = new FlxText();
	var FMSROLE = new FlxText();
	var otherText = new FlxText();
	var escC = new FlxText();
	var creditsESCAPEmoment = false;

	var horrorEXE = 'nope';

	var startB = true;
	var creditsB = false;
	var exitB = false;

	var ENG = true; // ENG И RU

	override public function create()
	{
		super.create();

		if (startScreen == true)
		{
			backGroundStart = new FlxSprite(wayI + 'mainMenu/startScreen/BG.png');
			backGroundStart.x = 0;
			backGroundStart.y = 0;
			add(backGroundStart);

			logoGame = new FlxSprite(wayI + 'mainMenu/startScreen/transfurClickLogo.png');
			logoGame.screenCenter();
			add(logoGame);

			darknessBG.makeGraphic(642, 480, FlxColor.BLACK);
			darknessBG.x = 0;
			darknessBG.y = 0;
			add(darknessBG);

			if (ENG == false)
			{
				startText1 = new FlxText(0, 0, 0, 'Сделано на HaxeFlixel');
				startText2 = new FlxText(0, 0, 0, 'Создано Алым Глазом');
				startText3 = new FlxText(0, 0, 0, 'Удачи');
			}

			if (ENG == true)
			{
				startText1 = new FlxText(0, 0, 0, 'Powered by ' + FlxG.VERSION);
				startText2 = new FlxText(0, 0, 0, 'Created by Scarlet Eye');
				startText3 = new FlxText(0, 0, 0, 'Good Luck');
			}

			startText1.setFormat(wayF + 'offBitBold.ttf', 50, FlxColor.WHITE);
			startText1.screenCenter();
			startText1.alpha = 0.0;
			add(startText1);

			startText2.setFormat(wayF + 'offBitBold.ttf', 50, FlxColor.WHITE);
			startText2.screenCenter();
			startText2.alpha = 0.0;
			add(startText2);

			startText3.setFormat(wayF + 'offBitBold.ttf', 50, FlxColor.WHITE);
			startText3.screenCenter();
			startText3.alpha = 0.0;
			add(startText3);

			startText4 = new FlxText(0, 0, 0, '>:3');
			startText4.setFormat(wayF + 'offBitBold.ttf', 50, FlxColor.CYAN);
			startText4.screenCenter();
			startText4.alpha = 0.0;
			add(startText4);

			#if (windows || html5)
			startGameText = new FlxText(150, 400, 0, 'Press Enter to Begin');
			#end
			#if android
			startGameText = new FlxText(210, 400, 0, 'Press Tap to Begin');
			#end
			startGameText.setFormat(wayF + 'swampyClean.ttf', 30, FlxColor.GRAY);
			startGameText.x = 150;
			startGameText.y = 400;
			startGameText.alpha = 0.0;
			add(startGameText);
		}

		bgMenu = new FlxSprite(wayI + 'mainMenu/BGMenu.png');
		bgMenu.x = 0;
		bgMenu.y = 0;
		bgMenu.alpha = 0.0;
		add(bgMenu);

		bgMenuBLOOD = new FlxSprite(wayI + 'mainMenu/BGMenuSecret.png');
		bgMenuBLOOD.x = 0;
		bgMenuBLOOD.y = 0;
		bgMenuBLOOD.alpha = 0.0;
		add(bgMenuBLOOD);

		final TheSharkMenu = new TheSharkMenu();
		add(TheSharkMenu);

		final TheSharkMenuEXE = new TheSharkMenuEXE();
		add(TheSharkMenuEXE);

		bgHUDdop.makeGraphic(20, 40, FlxColor.BLACK);
		bgHUDdop.x = 630;
		bgHUDdop.y = 0;
		bgHUDdop.alpha = 0.0;
		add(bgHUDdop);

		bgHUD = new FlxSprite(wayI + 'mainMenu/BGHUD.png');
		bgHUD.x = 0;
		bgHUD.y = 0;
		bgHUD.alpha = 0.0;
		add(bgHUD);

		cdMusic = new FlxSprite(wayI + 'mainMenu/musicDrive.png');
		cdMusic.x = 602;
		cdMusic.y = 2;
		cdMusic.alpha = 0.0;
		add(cdMusic);

		FlxTween.angle(cdMusic, 0, 3600000, 50000, {ease: FlxEase.linear});

		bTCS = new FlxSprite(wayI + 'mainMenu/buttonTCSm.png');
		bTCS.x = 25;
		bTCS.y = 75;
		bTCS.alpha = 0.0;
		add(bTCS);

		bTCC = new FlxSprite(wayI + 'mainMenu/buttonTCCm.png');
		bTCC.x = 50;
		bTCC.y = 175;
		bTCC.alpha = 0.0;
		add(bTCC);

		#if (windows || android)
		bTCE = new FlxSprite(wayI + 'mainMenu/buttonTCEm.png');
		#end
		#if html5
		bTCE = new FlxSprite(wayI + 'mainMenu/buttonTCRm.png');
		#end
		bTCE.x = 75;
		bTCE.y = 275;
		bTCE.alpha = 0.0;
		add(bTCE);

		logoInMenu = new FlxSprite(wayI + 'mainMenu/transfurClickLogo.png');
		logoInMenu.x = 181;
		logoInMenu.y = 15;
		logoInMenu.alpha = 0.0;
		logoInMenu.scale.set(0.50, 0.50);
		add(logoInMenu);

		#if android
		buttonSix = new FlxSprite(wayI + 'buttonForMobile.png');
		buttonSix.x = 460;
		buttonSix.y = 400;
		buttonSix.color = FlxColor.RED;
		buttonSix.alpha = 0.0;
		add(buttonSix);

		sixText = new FlxText(buttonSix.x + 30, buttonSix.y + 25, 0, '6');
		sixText.setFormat(wayF + 'offBitBold.ttf', 35, FlxColor.RED);
		sixText.alpha = 0.0;
		add(sixText);

		buttonSeven = new FlxSprite(wayI + 'buttonForMobile.png');
		buttonSeven.x = 560;
		buttonSeven.y = 400;
		buttonSeven.color = FlxColor.ORANGE;
		buttonSeven.alpha = 0.0;
		add(buttonSeven);

		sevenText = new FlxText(buttonSeven.x + 30, buttonSeven.y + 25, 0, '7');
		sevenText.setFormat(wayF + 'offBitBold.ttf', 35, FlxColor.ORANGE);
		sevenText.alpha = 0.0;
		add(sevenText);

		logoHF = new FlxSprite(wayI + 'default.png');
		logoHF.x = buttonSeven.x + 53;
		logoHF.y = buttonSeven.y + 10;
		logoHF.alpha = 0.0;
		add(logoHF);
		#end

		if (ENG == false)
		{
			welcomeText = new FlxText(250, 8, 0, 'ДОБРО ПОЖАЛОВАТЬ!');
			originalGame = new FlxText(0, 462, 0, 'Changed от DragonSnow');
		}

		if (ENG == true)
		{
			welcomeText = new FlxText(250, 8, 0, 'WELCOME!');
			originalGame = new FlxText(0, 462, 0, 'Changed by DragonSnow');
		}

		welcomeText.setFormat(wayF + 'offBitBold.ttf', 30, FlxColor.WHITE);
		welcomeText.alpha = 0.0;
		add(welcomeText);

		credMusicText = new FlxText(0, -100, 0, 'Music by ' + credMusic);
		credMusicText.setFormat(wayF + 'offBitBold.ttf', 20, FlxColor.GRAY);
		credMusicText.x = cdMusic.x - 130;
		add(credMusicText);

		#if windows
		buildText = new FlxText(0, 422, 0, 'WINDOWS BUILD');
		#end
		#if html5
		buildText = new FlxText(0, 422, 0, 'HTML5 BUILD');
		#end
		#if android
		buildText = new FlxText(0, 422, 0, 'ANDROID BUILD');
		#end
		buildText.setFormat(wayF + 'offBitBold.ttf', 18, FlxColor.WHITE);
		buildText.alpha = 0.0;
		add(buildText);

		versionGameText = new FlxText(0, 442, 0, 'V' + versionGame);
		versionGameText.setFormat(wayF + 'offBitBold.ttf', 18, FlxColor.WHITE);
		versionGameText.alpha = 0.0;
		add(versionGameText);

		originalGame.setFormat(wayF + 'offBitBold.ttf', 18, FlxColor.WHITE);
		originalGame.alpha = 0.0;
		add(originalGame);

		latexTransition = new FlxSprite(wayI + 'mainMenu/startScreen/lightLatex.png');
		latexTransition.x = 0;
		latexTransition.y = -1200;
		add(latexTransition);

		credText = new FlxText(160, 0, 0, 'CREDITS :');
		credText.setFormat(wayF + 'lifehackSans.ttf', 70, FlxColor.BLACK);
		credText.alpha = 0.0;
		add(credText);

		creatorGameText = new FlxText(0, 0, 0, 'Fan-Game by ' + creatorGame);
		creatorGameText.setFormat(wayF + 'offBitBold.ttf', 34, FlxColor.BLACK);
		creatorGameText.screenCenter();
		creatorGameText.alpha = 0.0;
		add(creatorGameText);

		credGameText = new FlxText(creatorGameText.x - 64, creatorGameText.y + 34, 0, 'Desing Assistance - ' + credGame);
		credGameText.setFormat(wayF + 'offBitBold.ttf', 34, FlxColor.BLACK);
		credGameText.alpha = 0.0;
		add(credGameText);

		credGameText2 = new FlxText(creatorGameText.x + 32, credGameText.y + 34, 0, 'Playtester - ' + credGame2);
		credGameText2.setFormat(wayF + 'offBitBold.ttf', 34, FlxColor.BLACK);
		credGameText2.alpha = 0.0;
		add(credGameText2);

		fnfctL = new FlxSprite(wayI + 'mainMenu/creditsMenu/logoFNFCT.png');
		fnfctL.x = 10;
		fnfctL.y = 420;
		fnfctL.alpha = 0.0;
		add(fnfctL);

		fmsL = new FlxSprite(wayI + 'mainMenu/creditsMenu/logoFMS.png');
		fmsL.x = 580;
		fmsL.y = 420;
		fmsL.alpha = 0.0;
		add(fmsL);

		#if (windows || html5)
		ACLICK = new FlxText(fnfctL.x + 55, fnfctL.y + 20, 0, '[A]');
		ACLICK.setFormat(wayF + 'offBitBold.ttf', 15, FlxColor.GRAY);
		ACLICK.alpha = 0.0;
		add(ACLICK);

		DCLICK = new FlxText(fmsL.x - 30, fmsL.y + 20, 0, '[D]');
		DCLICK.setFormat(wayF + 'offBitBold.ttf', 15, FlxColor.GRAY);
		DCLICK.alpha = 0.0;
		add(DCLICK);
		#end

		CTROLE = new FlxText(ACLICK.x, ACLICK.y + 12, 0, 'Participating');
		CTROLE.setFormat(wayF + 'offBitBold.ttf', 15, FlxColor.GRAY);
		CTROLE.alpha = 0.0;
		add(CTROLE);

		FMSROLE = new FlxText(DCLICK.x, DCLICK.y + 12, 0, 'Mine');
		FMSROLE.setFormat(wayF + 'offBitBold.ttf', 15, FlxColor.GRAY);
		FMSROLE.alpha = 0.0;
		add(FMSROLE);

		otherText = new FlxText(192, 436, 0, '<- OTHERS PROJECT ->');
		otherText.setFormat(wayF + 'offBitBold.ttf', 22, FlxColor.BLACK);
		otherText.alpha = 0.0;
		add(otherText);

		#if android
		buttonEscape = new FlxSprite(wayI + 'buttonForMobile.png');
		buttonEscape.x = 0;
		buttonEscape.y = 0;
		buttonEscape.color = FlxColor.RED;
		buttonEscape.alpha = 0.0;
		add(buttonEscape);

		escapeText = new FlxText(buttonEscape.x + 9, buttonEscape.y + 25, 0, 'ESC');
		escapeText.setFormat(wayF + 'offBitBold.ttf', 35, FlxColor.RED);
		escapeText.alpha = 0.0;
		add(escapeText);
		#end
		#if (windows || html5)
		escC = new FlxText(5, 5, 0, '[ESC] for exit from credits');
		escC.setFormat(wayF + 'offBitBold.ttf', 12, FlxColor.RED);
		escC.alpha = 0.0;
		add(escC);
		#end

		darkness.makeGraphic(642, 480, FlxColor.BLACK);
		darkness.x = 0;
		darkness.y = 0;
		darkness.alpha = 0.0;
		add(darkness);

		FlxG.sound.playMusic(wayM + 'mainMenu.ogg');

		FlxG.autoPause = false;
		#if (windows || html5)
		FlxG.mouse.visible = false;
		#end

		new FlxTimer().start(2.0, timeStartText1, 1);
		new FlxTimer().start(2.5, timeStartText2, 1);
		new FlxTimer().start(3.0, timeStartText3, 1);
		new FlxTimer().start(3.5, timeStartText4, 1);
		new FlxTimer().start(4.0, timerFlash, 1);

		var retry = new FlxTimer().start(10.0, timerRetryBG, 1);
		retry.loops = 1000000;
		var retryB = new FlxTimer().start(10.0, timerRetryBGB, 1);
		retryB.loops = 1000000;

		#if windows
		var basePath = Sys.programPath();
		var dir = haxe.io.Path.directory(basePath);

		Sys.setCwd(dir);

		trace("CD: " + Sys.getCwd());
		#end

		Application.current.window.title = 'TransfurClick V' + versionGame;
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

		#if android // Адаптация кода с клавы на экран смартфона ХР
		cdMusic.updateHitbox();
		bTCS.updateHitbox();
		bTCC.updateHitbox();
		bTCE.updateHitbox();
		buttonSix.updateHitbox();
		buttonSeven.updateHitbox();
		buttonEscape.updateHitbox();
		fnfctL.updateHitbox();
		fmsL.updateHitbox();

		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				if (pressEnter == true)
				{
					FlxTween.tween(latexTransition, {y: 0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(darkness, {'alpha': 1.0}, 3.0, {ease: FlxEase.cubeInOut});

					startScreen = false;
					pressEnter = false;

					FlxG.sound.play(wayS + 'transfurmation.ogg');

					new FlxTimer().start(6.0, timerMainMenu, 1);
					new FlxTimer().start(9.1, timerSelect, 1);
				}

				if (menuSelection == true)
				{
					if (touch.overlaps(cdMusic))
					{
						FlxG.openURL(credMusicLink, '_blank');
					}
					if (touch.overlaps(bTCS))
					{
						bTCS.x = 50;
						bTCC.x = 50;
						bTCE.x = 75;

						bTCS.color = FlxColor.GRAY;
						bTCC.color = FlxColor.WHITE;
						bTCE.color = FlxColor.WHITE;

						menuSelection = false;

						FlxTween.tween(latexTransition, {y: 0}, 2.0, {ease: FlxEase.cubeInOut});
						FlxTween.tween(darkness, {'alpha': 1.0}, 3.0, {ease: FlxEase.cubeInOut});

						FlxG.sound.play(wayS + 'transfurmation.ogg');

						new FlxTimer().start(3.1, timerChangeState, 1);
					}
					if (touch.overlaps(bTCC))
					{
						bTCS.x = 25;
						bTCC.x = 75;
						bTCE.x = 75;

						bTCS.color = FlxColor.WHITE;
						bTCC.color = FlxColor.GRAY;
						bTCE.color = FlxColor.WHITE;

						FlxTween.tween(latexTransition, {y: 0}, 2.0, {ease: FlxEase.cubeInOut});

						menuSelection = false;
						creditsTC = true;

						FlxG.sound.play(wayS + 'transfurmation.ogg');

						new FlxTimer().start(2.0, timerCredVisible, 1);
						new FlxTimer().start(2.5, timerCESCAPE, 1);
					}
					if (touch.overlaps(bTCE))
					{
						Sys.exit(0);
					}
					if (touch.overlaps(buttonSix))
					{
						buttonSix.y = 900;
						sixText.y = 925;

						horrorEXE = 'true';

						credMusicText.x = cdMusic.x - 160;
						credMusic = 'aleximine';
						credMusicLink = 'https://youtu.be/TGNyKFLuP9E?si=DjX4uUh5ZZl-tgha';

						bgMenu.alpha = 0.0;
						bgMenuBLOOD.alpha = 1.0;

						logoInMenu.color = FlxColor.RED;
						latexTransition.color = FlxColor.RED;

						welcomeText.color = FlxColor.RED;
						buildText.color = FlxColor.RED;
						versionGameText.color = FlxColor.RED;
						originalGame.color = FlxColor.RED;
						buttonEscape.color = FlxColor.WHITE;
						escapeText.color = FlxColor.WHITE;

						FlxG.sound.play(wayM + 'mainMenuSecret.ogg');
						FlxG.sound.play(wayS + 'thunder.ogg');

						FlxG.camera.flash(FlxColor.WHITE, 1.0);

						new FlxTimer().start(0.01, timerCredMusic, 1);
						new FlxTimer().start(110.3, timerGoodbyePlayer, 1);
						new FlxTimer().start(113.0, timerExitGame, 1);
					}
					if (touch.overlaps(buttonSeven))
					{
						FlxG.switchState(States.new);
					}
				}
				if (creditsTC == true)
				{
					if (creditsESCAPEmoment == true)
					{
						if (touch.overlaps(buttonEscape))
						{
							FlxTween.tween(latexTransition, {y: -1200}, 2.0, {ease: FlxEase.cubeInOut});
							FlxTween.tween(creatorGameText, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
							FlxTween.tween(credGameText, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
							FlxTween.tween(credGameText2, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
							FlxTween.tween(fnfctL, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
							FlxTween.tween(fmsL, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
							FlxTween.tween(otherText, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
							FlxTween.tween(credText, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
							FlxTween.tween(buttonEscape, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
							FlxTween.tween(escapeText, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});

							creditsTC = false;
							creditsESCAPEmoment = false;

							FlxG.sound.play(wayS + 'cancel.ogg');

							new FlxTimer().start(2.0, timerMenuWorkStart, 1);
						}
						if (touch.overlaps(fnfctL))
						{
							FlxG.openURL('https://gamebanana.com/mods/573078', '_blank');
						}
						if (touch.overlaps(fmsL))
						{
							FlxG.openURL('https://gamebanana.com/tools/14210', '_blank');
						}
					}
				}
			}
		}
		#end

		bgMenu.velocity.x = -speedBG;
		bgMenuBLOOD.velocity.x = -speedBG;

		credMusicText.text = 'Music by ' + credMusic;

		if (horrorEXE == 'false')
		{
			#if (windows || html5)
			if (FlxG.keys.anyJustPressed([FlxKey.SIX]))
			{
				horrorEXE = 'true';

				credMusicText.x = cdMusic.x - 160;
				credMusic = 'aleximine';
				credMusicLink = 'https://youtu.be/TGNyKFLuP9E?si=DjX4uUh5ZZl-tgha';

				bgMenu.alpha = 0.0;
				bgMenuBLOOD.alpha = 1.0;

				logoInMenu.color = FlxColor.RED;
				latexTransition.color = FlxColor.RED;

				welcomeText.color = FlxColor.RED;
				buildText.color = FlxColor.RED;
				versionGameText.color = FlxColor.RED;
				originalGame.color = FlxColor.RED;
				escC.color = FlxColor.WHITE;

				FlxG.sound.play(wayM + 'mainMenuSecret.ogg');
				FlxG.sound.play(wayS + 'thunder.ogg');

				FlxG.camera.flash(FlxColor.WHITE, 1.0);

				new FlxTimer().start(0.01, timerCredMusic, 1);
				new FlxTimer().start(110.3, timerGoodbyePlayer, 1);
				new FlxTimer().start(113.0, timerExitGame, 1);
			}
			#end
		}

		if (horrorEXE == 'true')
		{
			FlxG.sound.playMusic(wayM + 'mainMenu.ogg', 0.0);
		}

		if (startScreen == false)
		{
			FlxTween.tween(backGroundStart, {'alpha': 0.0}, 5.0, {ease: FlxEase.cubeInOut});
			FlxTween.tween(logoGame, {'alpha': 0.0}, 5.0, {ease: FlxEase.cubeInOut});
			FlxTween.tween(startText1, {'alpha': 0.0}, 5.0, {ease: FlxEase.cubeInOut});
			FlxTween.tween(startText2, {'alpha': 0.0}, 5.0, {ease: FlxEase.cubeInOut});
			FlxTween.tween(startText3, {'alpha': 0.0}, 5.0, {ease: FlxEase.cubeInOut});
			FlxTween.tween(startText4, {'alpha': 0.0}, 5.0, {ease: FlxEase.cubeInOut});
			FlxTween.tween(startGameText, {'alpha': 0.0}, 5.0, {ease: FlxEase.cubeInOut});
		}

		if (pressEnter == true)
		{
			#if (windows || html5)
			if (FlxG.keys.anyJustPressed([FlxKey.ENTER]))
			{
				FlxTween.tween(latexTransition, {y: 0}, 2.0, {ease: FlxEase.cubeInOut});
				FlxTween.tween(darkness, {'alpha': 1.0}, 3.0, {ease: FlxEase.cubeInOut});

				startScreen = false;
				pressEnter = false;

				FlxG.sound.play(wayS + 'transfurmation.ogg');

				new FlxTimer().start(6.0, timerMainMenu, 1);
				new FlxTimer().start(9.1, timerSelect, 1);
			}
			#end
		}

		if (creditsTC == true)
		{
			#if (windows || html5)
			if (FlxG.keys.anyJustPressed([FlxKey.A]))
			{
				FlxG.openURL('https://gamebanana.com/mods/573078', '_blank');
			}

			if (FlxG.keys.anyJustPressed([FlxKey.D]))
			{
				FlxG.openURL('https://gamebanana.com/tools/14210', '_blank');
			}
			#end

			#if (windows || html5)
			if (creditsESCAPEmoment == true)
			{
				if (FlxG.keys.anyJustPressed([FlxKey.ESCAPE]))
				{
					FlxTween.tween(latexTransition, {y: -1200}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(creatorGameText, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
					FlxTween.tween(credGameText, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
					FlxTween.tween(credGameText2, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
					FlxTween.tween(fnfctL, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
					FlxTween.tween(fmsL, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
					FlxTween.tween(CTROLE, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
					FlxTween.tween(FMSROLE, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
					FlxTween.tween(ACLICK, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
					FlxTween.tween(DCLICK, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
					FlxTween.tween(otherText, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
					FlxTween.tween(credText, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
					FlxTween.tween(escC, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});

					creditsTC = false;
					creditsESCAPEmoment = false;

					FlxG.sound.play(wayS + 'cancel.ogg');

					new FlxTimer().start(2.0, timerMenuWorkStart, 1);
				}
			}
			#end
		}

		if (menuSelection == true)
		{
			#if (windows || html5)
			if (FlxG.keys.anyJustPressed([FlxKey.TAB]))
			{
				FlxG.openURL(credMusicLink, '_blank');
			}

			if (startB == true)
			{
				bTCS.x = 50;
				bTCC.x = 50;
				bTCE.x = 75;

				bTCS.color = FlxColor.GRAY;
				bTCC.color = FlxColor.WHITE;
				bTCE.color = FlxColor.WHITE;

				if (FlxG.keys.anyJustPressed([FlxKey.DOWN, S]))
				{
					new FlxTimer().start(0.1, timerChangeC, 1);
				}

				if (FlxG.keys.anyJustPressed([FlxKey.ENTER]))
				{
					menuSelection = false;

					FlxTween.tween(latexTransition, {y: 0}, 2.0, {ease: FlxEase.cubeInOut});
					FlxTween.tween(darkness, {'alpha': 1.0}, 3.0, {ease: FlxEase.cubeInOut});

					FlxG.sound.play(wayS + 'transfurmation.ogg');

					new FlxTimer().start(3.1, timerChangeState, 1);
				}
			}
			#end

			if (creditsB == true)
			{
				#if (windows || html5)
				bTCS.x = 25;
				bTCC.x = 75;
				bTCE.x = 75;

				bTCS.color = FlxColor.WHITE;
				bTCC.color = FlxColor.GRAY;
				bTCE.color = FlxColor.WHITE;

				if (FlxG.keys.anyJustPressed([FlxKey.UP, W]))
				{
					new FlxTimer().start(0.1, timerChangeS, 1);
				}

				if (FlxG.keys.anyJustPressed([FlxKey.DOWN, S]))
				{
					new FlxTimer().start(0.1, timerChangeE, 1);
				}

				if (FlxG.keys.anyJustPressed([FlxKey.ENTER]))
				{
					FlxTween.tween(latexTransition, {y: 0}, 2.0, {ease: FlxEase.cubeInOut});

					menuSelection = false;
					creditsTC = true;

					FlxG.sound.play(wayS + 'transfurmation.ogg');

					new FlxTimer().start(2.0, timerCredVisible, 1);
					new FlxTimer().start(2.5, timerCESCAPE, 1);
				}
				#end
			}

			if (exitB == true)
			{
				bTCS.x = 25;
				bTCC.x = 50;
				bTCE.x = 100;

				bTCS.color = FlxColor.WHITE;
				bTCC.color = FlxColor.WHITE;
				bTCE.color = FlxColor.RED;

				#if (windows || html5)
				if (FlxG.keys.anyJustPressed([FlxKey.UP, W]))
				{
					new FlxTimer().start(0.1, timerChangeC, 1);
				}

				if (FlxG.keys.anyJustPressed([FlxKey.ENTER]))
				{
					trace('Goodbye my frined -w-');

					#if windows
					Sys.exit(0);
					#end
					#if html5
					FlxG.switchState(MainTransfurMenu.new);
					#end
				}
				#end
			}
		}
		#if (windows || html5)
		if (FlxG.keys.anyJustPressed([FlxKey.SEVEN]))
		{
			FlxG.switchState(States.new);
		}
		#end
	}

	function timeStartText1(timer:FlxTimer)
	{
		startText1.alpha = 1.0;
	}

	function timeStartText2(timer:FlxTimer)
	{
		startText1.alpha = 0.0;
		startText2.alpha = 1.0;
	}

	function timeStartText3(timer:FlxTimer)
	{
		startText2.alpha = 0.0;
		startText3.alpha = 1.0;
	}

	function timeStartText4(timer:FlxTimer)
	{
		startText3.alpha = 0.0;
		startText4.alpha = 1.0;
	}

	function timerFlash(timer:FlxTimer)
	{
		FlxG.camera.flash(FlxColor.WHITE, 1);
		darknessBG.alpha = 0.0;
		startText4.alpha = 0.0;
		startGameText.alpha = 1.0;
		pressEnter = true;
	}

	function timerRetryBG(timer:FlxTimer)
	{
		bgMenu.x = 0;
	}

	function timerRetryBGB(timer:FlxTimer)
	{
		bgMenuBLOOD.x = 0;
	}

	function timerMainMenu(timer:FlxTimer)
	{
		bgMenu.alpha = 1.0;
		bgHUDdop.alpha = 1.0;
		bgHUD.alpha = 1.0;
		cdMusic.alpha = 1.0;
		bTCS.alpha = 1.0;
		bTCC.alpha = 1.0;
		bTCE.alpha = 1.0;
		logoInMenu.alpha = 1.0;
		buttonSix.alpha = 1.0;
		sixText.alpha = 1.0;
		buttonSeven.alpha = 1.0;
		sevenText.alpha = 1.0;
		logoHF.alpha = 1.0;
		welcomeText.alpha = 1.0;
		buildText.alpha = 1.0;
		versionGameText.alpha = 1.0;
		originalGame.alpha = 1.0;
		latexTransition.y = -1200;
		FlxTween.tween(darkness, {'alpha': 0.0}, 3.0, {ease: FlxEase.cubeInOut});

		new FlxTimer().start(0.01, timerCredMusic, 1);
	}

	function timerSelect(timer:FlxTimer)
	{
		horrorEXE = 'false';

		menuSelection = true;
	}

	function timerCredMusic(timer:FlxTimer)
	{
		FlxTween.tween(credMusicText, {y: 10}, 2.0, {ease: FlxEase.cubeInOut});

		new FlxTimer().start(2.0, timerCredMusicGoodbye, 1);
	}

	function timerCredMusicGoodbye(timer:FlxTimer)
	{
		FlxTween.tween(credMusicText, {'alpha': 0.0}, 1.0, {ease: FlxEase.cubeInOut});

		new FlxTimer().start(1.0, timerCredMusicY, 1);
	}

	function timerCredMusicY(timer:FlxTimer)
	{
		credMusicText.y = -100;
		credMusicText.alpha = 1.0;
	}

	function timerCESCAPE(timer:FlxTimer)
	{
		creditsESCAPEmoment = true;
	}

	function timerMenuWorkStart(timer:FlxTimer)
	{
		menuSelection = true;
	}

	function timerChangeS(timer:FlxTimer)
	{
		startB = true;
		creditsB = false;
		exitB = false;

		FlxG.sound.play(wayS + 'list.ogg');
	}

	function timerChangeC(timer:FlxTimer)
	{
		startB = false;
		creditsB = true;
		exitB = false;

		FlxG.sound.play(wayS + 'list.ogg');
	}

	function timerChangeE(timer:FlxTimer)
	{
		startB = false;
		creditsB = false;
		exitB = true;

		FlxG.sound.play(wayS + 'list.ogg');
	}

	function timerCredVisible(timer:FlxTimer)
	{
		FlxTween.tween(creatorGameText, {'alpha': 1.0}, 0.5, {ease: FlxEase.cubeInOut});
		FlxTween.tween(credGameText, {'alpha': 1.0}, 0.5, {ease: FlxEase.cubeInOut});
		FlxTween.tween(credGameText2, {'alpha': 1.0}, 0.5, {ease: FlxEase.cubeInOut});
		FlxTween.tween(fnfctL, {'alpha': 1.0}, 0.5, {ease: FlxEase.cubeInOut});
		FlxTween.tween(fmsL, {'alpha': 1.0}, 0.5, {ease: FlxEase.cubeInOut});
		#if (windows || html5)
		FlxTween.tween(CTROLE, {'alpha': 1.0}, 0.5, {ease: FlxEase.cubeInOut});
		FlxTween.tween(FMSROLE, {'alpha': 1.0}, 0.5, {ease: FlxEase.cubeInOut});
		FlxTween.tween(ACLICK, {'alpha': 1.0}, 0.5, {ease: FlxEase.cubeInOut});
		FlxTween.tween(DCLICK, {'alpha': 1.0}, 0.5, {ease: FlxEase.cubeInOut});
		#end
		FlxTween.tween(otherText, {'alpha': 1.0}, 0.5, {ease: FlxEase.cubeInOut});
		FlxTween.tween(credText, {'alpha': 1.0}, 0.5, {ease: FlxEase.cubeInOut});
		#if android
		FlxTween.tween(buttonEscape, {'alpha': 1.0}, 0.5, {ease: FlxEase.cubeInOut});
		FlxTween.tween(escapeText, {'alpha': 1.0}, 0.5, {ease: FlxEase.cubeInOut});
		#end
		#if (windows || html5)
		FlxTween.tween(escC, {'alpha': 1.0}, 0.5, {ease: FlxEase.cubeInOut});
		#end
	}

	function timerGoodbyePlayer(timer:FlxTimer)
	{
		menuSelection = false;
		creditsTC = false;

		darkness.alpha = 1.0;
	}

	function timerExitGame(timer:FlxTimer)
	{
		#if (windows || android)
		Sys.exit(0);
		#end
		#if html5
		FlxG.switchState(MainTransfurMenu.new);
		#end
	}

	function timerChangeState(timer:FlxTimer)
	{
		FlxG.switchState(LatexSelectionMenu.new);
	}
}

class LatexSelectionMenu extends FlxState
{
	var wayF = 'assets/fonts/';
	var wayM = 'assets/music/';
	var wayI = 'assets/images/';
	var wayS = 'assets/sounds/';

	var FSIDE = new FlxSprite();
	var SSIDE = new FlxSprite();
	var WLW = new FlxSprite();
	var BYC = new FlxSprite();
	var cyanFlash = new FlxSprite();
	var redFlash = new FlxSprite();
	var DLINE = new FlxSprite();
	var WS = new FlxSprite();
	var BS = new FlxSprite();
	var BVG = new FlxSprite();
	var AB = new FlxSprite();
	var DB = new FlxSprite();
	var latexTransition = new FlxSprite();
	var darkness = new FlxSprite();

	var errorText = new FlxText(); // This side will be available in the full version of the game!

	var selectSide = false;

	var ENG = true;

	override public function create()
	{
		super.create();

		FSIDE = new FlxSprite(wayI + 'mainMenu/choiceMenu/firstSide.png');
		FSIDE.x = 0;
		FSIDE.y = 0;
		add(FSIDE);

		SSIDE = new FlxSprite(wayI + 'mainMenu/choiceMenu/secondSide.png');
		SSIDE.x = 0;
		SSIDE.y = 0;
		add(SSIDE);

		WLW = new FlxSprite(wayI + 'mainMenu/choiceMenu/whiteLatexWolf.png');
		WLW.x = 0;
		WLW.y = 0;
		add(WLW);

		final ColinWLW = new ColinWLW();
		add(ColinWLW);

		BYC = new FlxSprite(wayI + 'mainMenu/choiceMenu/blackYufengCub.png');
		BYC.x = 0;
		BYC.y = 0;
		add(BYC);

		final ColinBLW = new ColinBLW();
		add(ColinBLW);

		cyanFlash.makeGraphic(320, 480, FlxColor.CYAN);
		cyanFlash.x = 0;
		cyanFlash.y = 0;
		cyanFlash.alpha = 0.0;
		add(cyanFlash);

		redFlash.makeGraphic(320, 480, FlxColor.RED);
		redFlash.x = 320;
		redFlash.y = 0;
		redFlash.alpha = 0.0;
		add(redFlash);

		errorText = new FlxText(360, 240, 0, 'This side will be available\nin the full version of\nthe game!');
		errorText.setFormat(wayF + 'offBitBold.ttf', 22, FlxColor.RED);
		errorText.alpha = 0.0;
		add(errorText);

		DLINE = new FlxSprite(wayI + 'mainMenu/choiceMenu/DLINE.png');
		DLINE.x = 0;
		DLINE.y = 0;
		add(DLINE);

		WS = new FlxSprite(wayI + 'mainMenu/choiceMenu/whiteS.png');
		WS.x = 0;
		WS.y = 0;
		add(WS);

		BS = new FlxSprite(wayI + 'mainMenu/choiceMenu/blackS.png');
		BS.x = 0;
		BS.y = 0;
		add(BS);

		BVG = new FlxSprite(wayI + 'mainMenu/choiceMenu/blackVG.png');
		BVG.x = 0;
		BVG.y = 0;
		add(BVG);

		#if (windows || html5)
		AB = new FlxSprite(wayI + 'mainMenu/choiceMenu/AButton.png');
		AB.x = 0;
		AB.y = 0;
		add(AB);

		DB = new FlxSprite(wayI + 'mainMenu/choiceMenu/DButton.png');
		DB.x = 0;
		DB.y = 0;
		add(DB);
		#end

		latexTransition = new FlxSprite(wayI + 'mainMenu/startScreen/lightLatex.png');
		latexTransition.x = 0;
		latexTransition.y = -1200;
		add(latexTransition);

		darkness.makeGraphic(642, 480, FlxColor.BLACK);
		darkness.x = 0;
		darkness.y = 0;
		darkness.alpha = 1.0;
		add(darkness);

		FlxG.sound.playMusic(wayM + 'choiceMusic.ogg');

		FlxG.autoPause = false;
		#if (windows || html5)
		FlxG.mouse.visible = false;
		#end

		new FlxTimer().start(3.1, timerFunctionSide, 1);
		new FlxTimer().start(0.1, timerDarknessGoodBye, 1);
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

		if (selectSide == true)
		{
			#if android
			for (touch in FlxG.touches.list)
			{
				if (touch.justPressed)
				{
					if (touch.overlaps(cyanFlash))
					{
						selectSide = false;

						FlxTween.tween(cyanFlash, {'alpha': 0.7}, 0.5, {ease: FlxEase.cubeInOut});
						FlxTween.tween(latexTransition, {y: 0}, 2.0, {ease: FlxEase.cubeInOut});
						FlxTween.tween(darkness, {'alpha': 1.0}, 3.0, {ease: FlxEase.cubeInOut});

						FlxG.sound.play(wayS + 'load.ogg');

						new FlxTimer().start(0.5, timerRFGB, 1);
						new FlxTimer().start(3.1, timerChangeState, 1);
					}
					if (touch.overlaps(redFlash))
					{
						selectSide = false;

						FlxTween.tween(redFlash, {'alpha': 0.7}, 0.5, {ease: FlxEase.cubeInOut});
						FlxTween.tween(errorText, {'alpha': 1.0}, 0.5, {ease: FlxEase.cubeInOut});

						FlxG.sound.play(wayS + 'error.ogg');

						new FlxTimer().start(0.5, timerRFGB, 1);
						new FlxTimer().start(1.0, timerBackSS, 1);
					}
				}
			}
			#end
			#if (windows || html5)
			if (FlxG.keys.anyJustPressed([FlxKey.A]))
			{
				selectSide = false;

				FlxTween.tween(cyanFlash, {'alpha': 0.7}, 0.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(latexTransition, {y: 0}, 2.0, {ease: FlxEase.cubeInOut});
				FlxTween.tween(darkness, {'alpha': 1.0}, 3.0, {ease: FlxEase.cubeInOut});

				FlxG.sound.play(wayS + 'load.ogg');

				new FlxTimer().start(0.5, timerRFGB, 1);
				new FlxTimer().start(3.1, timerChangeState, 1);
			}

			if (FlxG.keys.anyJustPressed([FlxKey.D]))
			{
				selectSide = false;

				FlxTween.tween(redFlash, {'alpha': 0.7}, 0.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(errorText, {'alpha': 1.0}, 0.5, {ease: FlxEase.cubeInOut});

				FlxG.sound.play(wayS + 'error.ogg');

				new FlxTimer().start(0.5, timerRFGB, 1);
				new FlxTimer().start(1.0, timerBackSS, 1);
			}
			#end
		}
		#if (windows || html5)
		if (FlxG.keys.anyJustPressed([FlxKey.SEVEN]))
		{
			FlxG.switchState(States.new);
		}
		#end
	}

	function timerRFGB(timer:FlxTimer)
	{
		// FlxTween.tween(cyanFlash, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
		FlxTween.tween(redFlash, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
		FlxTween.tween(errorText, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
	}

	function timerBackSS(timer:FlxTimer)
	{
		selectSide = true;
	}

	function timerFunctionSide(timer:FlxTimer)
	{
		selectSide = true;
	}

	function timerDarknessGoodBye(timer:FlxTimer)
	{
		FlxTween.tween(darkness, {'alpha': 0.0}, 3.0, {ease: FlxEase.cubeInOut});
	}

	function timerChangeState(timer:FlxTimer)
	{
		FlxG.switchState(LatexGameLove.new);
	}
}
