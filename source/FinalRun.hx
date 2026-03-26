package;

import additional.Cross;
import additional.Paths;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.tiled.TiledLayer.TiledLayerType;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxVelocity;
import flixel.sound.FlxSound;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxSort;
import flixel.util.FlxTimer;
import openfl.filters.ShaderFilter;

class FinalRun extends FlxState
{
	var layerF = new FlxTilemap();
	var layerFH = new FlxTilemap();
	var layerW = new FlxTilemap();
	var layerWH = new FlxTilemap();
	var layerWI = new FlxTilemap();
	var bgMenu = new FlxSprite();
	var speedBG:Int = 128;
	var pure1 = new FlxSprite();
	var lastDirectionP = 'pure1RIGHTi';
	var pure1Hitbox = new FlxSprite();
	var pure2 = new FlxSprite();
	var lastDirectionP2 = 'pure1RIGHTi';
	var pure2Hitbox = new FlxSprite();
	var colin = new FlxSprite();
	var lastDirection = 'colinRIGHTi';
	var colinHitbox = new FlxSprite();
	var actors:FlxTypedGroup<FlxSprite>;
	var colinW = new FlxSprite();
	var BVG = new FlxSprite();
	var BGS = new FlxSprite();
	var LRB = new FlxSprite();
	var SPACEB = new FlxSprite();
	var spaceTextScore = new FlxText();
	var spaceScore = 0;
	var bit = new FlxText();
	var score = new FlxText();
	var run = new FlxText();
	var buttonLeft = new FlxSprite();
	var leftText = new FlxText();
	var lrTextScore = new FlxText();
	var leftScore = 0;
	var rightScore = 0;
	var lrTop = true;
	var buttonUp = new FlxSprite();
	var upText = new FlxText();
	var buttonDown = new FlxSprite();
	var downText = new FlxText();
	var buttonRight = new FlxSprite();
	var rightText = new FlxText();
	var buttonSpace = new FlxSprite();
	var spaceText = new FlxText();
	var buttonMusic = new FlxSprite();
	var buttonPuro = new FlxSprite();
	var buttonSeven = new FlxSprite();
	var sevenText = new FlxText();
	var logoHF = new FlxSprite();
	var cdMusic = new FlxSprite();
	var credMusicText = new FlxText();
	var darkness = new FlxSprite();
	var dialogue:FlxTypeText;

	var timerMusicEnd = new FlxTimer();

	var scoreGame = 10000;
	var scoreMinus = false;
	var latexScale = 1.00;
	var bpm = 0;

	var credMusic = 'KrysisWave';

	var musicGame = Paths.music('final.ogg');
	var endingMusic = 1;

	override public function create()
	{
		super.create();

		var tiledMap = new TiledMap(Paths.data('TCmapTest.tmx'));

		var mapWight = tiledMap.width * tiledMap.tileWidth;
		var mapHeight = tiledMap.height * tiledMap.tileHeight;

		layerF = new FlxTilemap();
		var layerFloor:TiledTileLayer = cast tiledMap.getLayer('floor');
		layerF.loadMapFromArray(layerFloor.tileArray, 60, 20, Paths.image('game/run/TileB.png'), 32, 32);
		add(layerF);

		layerFH = new FlxTilemap();
		var layerFloorH:TiledTileLayer = cast tiledMap.getLayer('hatch');
		layerFH.loadMapFromArray(layerFloorH.tileArray, 60, 20, Paths.image('game/run/TileB.png'), 32, 32);
		add(layerFH);

		layerW = new FlxTilemap();
		var layerWall:TiledTileLayer = cast tiledMap.getLayer('walls');
		layerW.loadMapFromArray(layerWall.tileArray, 60, 20, Paths.image('game/run/TileB.png'), 32, 32);
		add(layerW);

		layerWH = new FlxTilemap();
		var layerWallHit:TiledTileLayer = cast tiledMap.getLayer('wallsHitbox');
		layerWH.loadMapFromArray(layerWallHit.tileArray, 60, 20, Paths.image('game/run/TileB.png'), 32, 32);
		add(layerWH);

		layerWI = new FlxTilemap();
		var layerWallI:TiledTileLayer = cast tiledMap.getLayer('wallsItems');
		layerWI.loadMapFromArray(layerWallI.tileArray, 60, 20, Paths.image('game/run/TileB.png'), 32, 32);
		add(layerWI);

		bgMenu = new FlxSprite(Paths.image('mainMenu/BGMenu.png'));
		bgMenu.x = 0;
		bgMenu.y = 0;
		bgMenu.alpha = 0.0;
		add(bgMenu);

		actors = new FlxTypedGroup<FlxSprite>();
		add(actors);

		pure1 = new FlxSprite();
		pure1.loadGraphic(Paths.image('game/run/pureWhite1Assets.png'), true, 90, 128);
		pure1.animation.add('pure1LEFTi', [4], 1, true);
		pure1.animation.add('pure1UPi', [10], 1, true);
		pure1.animation.add('pure1DOWNi', [1], 1, true);
		pure1.animation.add('pure1RIGHTi', [7], 1, true);
		pure1.animation.add('pure1LEFT', [3, 4, 5, 4], 8, true);
		pure1.animation.add('pure1UP', [9, 10, 11, 10], 8, true);
		pure1.animation.add('pure1DOWN', [0, 1, 2, 1], 8, true);
		pure1.animation.add('pure1RIGHT', [6, 7, 8, 7], 8, true);
		pure1.animation.play('pure1RIGHTi');
		pure1.x = 50;
		pure1.y = 210;
		actors.add(pure1);

		pure1Hitbox.makeGraphic(64, 11, FlxColor.RED);
		pure1Hitbox.x = pure1.x + 13;
		pure1Hitbox.y = pure1.y + 117;
		pure1Hitbox.alpha = 0.0;
		add(pure1Hitbox);

		pure2 = new FlxSprite();
		pure2.loadGraphic(Paths.image('game/run/pureWhite1Assets.png'), true, 90, 128);
		pure2.animation.add('pure1LEFTi', [4], 1, true);
		pure2.animation.add('pure1UPi', [10], 1, true);
		pure2.animation.add('pure1DOWNi', [1], 1, true);
		pure2.animation.add('pure1RIGHTi', [7], 1, true);
		pure2.animation.add('pure1LEFT', [3, 4, 5, 4], 8, true);
		pure2.animation.add('pure1UP', [9, 10, 11, 10], 8, true);
		pure2.animation.add('pure1DOWN', [0, 1, 2, 1], 8, true);
		pure2.animation.add('pure1RIGHT', [6, 7, 8, 7], 8, true);
		pure2.animation.play('pure1RIGHTi');
		pure2.x = 950;
		pure2.y = 210;
		actors.add(pure2);

		pure2Hitbox.makeGraphic(64, 11, FlxColor.RED);
		pure2Hitbox.x = pure2.x + 13;
		pure2Hitbox.y = pure2.y + 117;
		pure2Hitbox.alpha = 0.0;
		add(pure2Hitbox);

		colin = new FlxSprite();
		colin.loadGraphic(Paths.image('game/run/colinAssets.png'), true, 60, 128);
		colin.animation.add('colinLEFTi', [4], 1, true);
		colin.animation.add('colinUPi', [10], 1, true);
		colin.animation.add('colinDOWNi', [1], 1, true);
		colin.animation.add('colinRIGHTi', [7], 1, true);
		colin.animation.add('colinLEFT', [3, 4, 5, 4], 8, true);
		colin.animation.add('colinUP', [9, 10, 11, 10], 8, true);
		colin.animation.add('colinDOWN', [0, 1, 2, 1], 8, true);
		colin.animation.add('colinRIGHT', [6, 7, 8, 7], 8, true);
		colin.animation.play('colinRIGHTi');
		colin.x = 500;
		colin.y = 210;
		actors.add(colin);

		FlxG.worldBounds.set(0, 0, mapWight, mapHeight);
		FlxG.camera.follow(colin);
		FlxG.camera.setScrollBoundsRect(0, 0, mapWight, mapHeight, true);

		colinHitbox.makeGraphic(50, 11, FlxColor.RED);
		colinHitbox.x = colin.x + 5;
		colinHitbox.y = colin.x + 177;
		colinHitbox.alpha = 0.0;
		add(colinHitbox);

		colinW = new FlxSprite();
		colinW.loadGraphic(Paths.image('game/run/colinInWater.png'), true, 128, 220);
		colinW.animation.add('colinGoes', [0, 1, 2], 8, true);
		colinW.animation.play('colinGoes');
		colinW.x = 200;
		colinW.y = 200;
		colinW.alpha = 0.0;
		add(colinW);

		BVG = new FlxSprite(Paths.image('mainMenu/choiceMenu/blackVG.png'));
		BVG.x = 0;
		BVG.y = 0;
		BVG.scale.x = 1.01;
		BVG.scrollFactor.set(0, 0);
		add(BVG);

		BGS = new FlxSprite(Paths.image('game/HUD/BGScore.png'));
		BGS.x = -17;
		BGS.y = 40;
		BGS.scale.set(0.82, 1.18);
		BGS.scrollFactor.set(0, 0);
		add(BGS);

		LRB = new FlxSprite();
		LRB.loadGraphic(Paths.image('game/HUD/leftAndRight.png'), true, 220, 113);
		LRB.animation.add('rightB', [0], 1, true);
		LRB.animation.add('leftB', [1], 1, true);
		LRB.animation.play('rightB');
		LRB.x = 350;
		LRB.y = 100;
		LRB.scrollFactor.set(0, 0);
		LRB.visible = false;
		add(LRB);

		SPACEB = new FlxSprite();
		SPACEB.loadGraphic(Paths.image('game/HUD/space.png'), true, 210, 120);
		SPACEB.animation.add('spaceNormal', [0], 1, true);
		SPACEB.animation.add('destruct', [1], 1, true);
		SPACEB.animation.play('spaceNormal');
		SPACEB.x = 350;
		SPACEB.y = 200;
		SPACEB.scrollFactor.set(0, 0);
		SPACEB.visible = false;
		add(SPACEB);

		spaceTextScore = new FlxText(270, BGS.y, 0, 'Space : $spaceScore');
		spaceTextScore.setFormat('', 25, FlxColor.RED);
		spaceTextScore.scrollFactor.set(0, 0);
		spaceTextScore.visible = false;
		add(spaceTextScore);

		lrTextScore = new FlxText(spaceTextScore.x - 50, spaceTextScore.y + 30, 0, 'Left : $leftScore | Right : $rightScore');
		lrTextScore.setFormat(Paths.font(''), 25, FlxColor.RED);
		lrTextScore.scrollFactor.set(0, 0);
		lrTextScore.visible = false;
		add(lrTextScore);

		bit = new FlxText(0, 455, 0, '$bpm');
		bit.setFormat(Paths.font(''), 25, FlxColor.ORANGE);
		bit.scrollFactor.set(0, 0);
		add(bit);

		score = new FlxText(270, 0, 0, 'Score : $scoreGame');
		score.setFormat(Paths.font(''), 25, FlxColor.WHITE);
		score.scrollFactor.set(0, 0);
		add(score);

		run = new FlxText(275, 0, 0, 'RUN!!!');
		run.setFormat(Paths.font(''), 25, FlxColor.WHITE);
		run.alpha = 0.0;
		run.scrollFactor.set(0, 0);
		add(run);

		#if android
		score.x = 268;
		run.x = 273;

		buttonLeft = new FlxSprite(Paths.image('buttonForMobile.png'));
		buttonLeft.x = 0;
		buttonLeft.y = 318;
		buttonLeft.color = FlxColor.PINK;
		buttonLeft.alpha = 0.8;
		buttonLeft.scrollFactor.set(0, 0);
		add(buttonLeft);

		leftText = new FlxText(buttonLeft.x + 30, buttonLeft.y + 25, 0, '<');
		leftText.setFormat(Paths.font('offBitBold.ttf'), 35, FlxColor.PINK);
		leftText.alpha = 0.8;
		leftText.scrollFactor.set(0, 0);
		add(leftText);

		buttonUp = new FlxSprite(Paths.image('buttonForMobile.png'));
		buttonUp.x = 81;
		buttonUp.y = 237;
		buttonUp.color = FlxColor.LIME;
		buttonUp.alpha = 0.8;
		buttonUp.scrollFactor.set(0, 0);
		add(buttonUp);

		upText = new FlxText(buttonUp.x + 30, buttonUp.y + 25, 0, 'v');
		upText.setFormat(Paths.font('offBitBold.ttf'), 35, FlxColor.LIME);
		upText.flipY = true;
		upText.alpha = 0.8;
		upText.scrollFactor.set(0, 0);
		add(upText);

		buttonDown = new FlxSprite(Paths.image('buttonForMobile.png'));
		buttonDown.x = 81;
		buttonDown.y = 399;
		buttonDown.alpha = 0.8;
		buttonDown.color = FlxColor.CYAN;
		buttonDown.scrollFactor.set(0, 0);
		add(buttonDown);

		downText = new FlxText(buttonDown.x + 30, buttonDown.y + 25, 0, 'v');
		downText.setFormat(Paths.font('offBitBold.ttf'), 35, FlxColor.CYAN);
		downText.alpha = 0.8;
		downText.scrollFactor.set(0, 0);
		add(downText);

		buttonRight = new FlxSprite(Paths.image('buttonForMobile.png'));
		buttonRight.x = 162;
		buttonRight.y = 318;
		buttonRight.alpha = 0.8;
		buttonRight.color = FlxColor.RED;
		buttonRight.scrollFactor.set(0, 0);
		add(buttonRight);

		rightText = new FlxText(buttonRight.x + 30, buttonRight.y + 25, 0, '>');
		rightText.setFormat(Paths.font('offBitBold.ttf'), 35, FlxColor.RED);
		rightText.alpha = 0.8;
		rightText.scrollFactor.set(0, 0);
		add(rightText);

		buttonSpace = new FlxSprite(Paths.image('buttonForMobile.png'));
		buttonSpace.x = 479;
		buttonSpace.y = 399;
		buttonSpace.alpha = 0.8;
		buttonSpace.scale.x = 2.0;
		buttonSpace.scrollFactor.set(0, 0);
		add(buttonSpace);

		spaceText = new FlxText(buttonSpace.x + 28, buttonSpace.y + 25, 0, 'SPACE');
		spaceText.setFormat(Paths.font('offBitBold.ttf'), 35, FlxColor.WHITE);
		spaceText.alpha = 0.8;
		spaceText.scrollFactor.set(0, 0);
		add(spaceText);

		buttonMusic = new FlxSprite(Paths.image('buttonForMobile.png'));
		buttonMusic.x = 0;
		buttonMusic.y = 91;
		buttonMusic.color = FlxColor.GRAY;
		buttonMusic.scrollFactor.set(0, 0);
		add(buttonMusic);

		var musicBtext = new FlxText(buttonMusic.x + 30, buttonMusic.y + 25, 0, '3');
		musicBtext.setFormat(Paths.font('offBitBold.ttf'), 35, FlxColor.GRAY);
		musicBtext.alpha = 0.8;
		musicBtext.scrollFactor.set(0, 0);
		add(musicBtext);

		buttonPuro = new FlxSprite(Paths.image('buttonForMobile.png'));
		buttonPuro.x = 91;
		buttonPuro.y = 0;
		buttonPuro.color = FlxColor.GRAY;
		buttonPuro.scrollFactor.set(0, 0);
		add(buttonPuro);

		var puroBtext = new FlxText(buttonPuro.x + 27, buttonPuro.y + 25, 0, '4');
		puroBtext.setFormat(Paths.font('offBitBold.ttf'), 35, FlxColor.GRAY);
		puroBtext.alpha = 0.8;
		puroBtext.scrollFactor.set(0, 0);
		add(puroBtext);

		buttonSeven = new FlxSprite(Paths.image('buttonForMobile.png'));
		buttonSeven.x = 0;
		buttonSeven.y = 0;
		buttonSeven.color = FlxColor.ORANGE;
		buttonSeven.scrollFactor.set(0, 0);
		add(buttonSeven);

		sevenText = new FlxText(buttonSeven.x + 30, buttonSeven.y + 25, 0, '7');
		sevenText.setFormat(Paths.font('offBitBold.ttf'), 35, FlxColor.ORANGE);
		sevenText.scrollFactor.set(0, 0);
		add(sevenText);

		logoHF = new FlxSprite(Paths.image('default.png'));
		logoHF.x = buttonSeven.x + 53;
		logoHF.y = buttonSeven.y + 10;
		logoHF.scrollFactor.set(0, 0);
		add(logoHF);
		#end

		cdMusic = new FlxSprite(Paths.image('mainMenu/musicDrive.png'));
		cdMusic.x = 400;
		cdMusic.y = 440;
		cdMusic.alpha = 1.0;
		cdMusic.scrollFactor.set(0, 0);
		add(cdMusic);

		FlxTween.angle(cdMusic, 0, 3600000, 50000, {ease: FlxEase.linear});

		credMusicText = new FlxText(0, 600, 0, 'Music by ' + credMusic);
		credMusicText.setFormat(Paths.font('offBitBold.ttf'), 20, FlxColor.GRAY);
		credMusicText.x = cdMusic.x - 190;
		credMusicText.alpha = 1.0;
		credMusicText.scrollFactor.set(0, 0);
		add(credMusicText);

		darkness.makeGraphic(642, FlxG.height, FlxColor.BLACK);
		darkness.x = 0;
		darkness.y = 0;
		darkness.alpha = 1.0;
		darkness.scrollFactor.set(0, 0);
		add(darkness);

		dialogue = new FlxTypeText(0, 0, 0, 'SURVIVE 94 SECONDS!');
		dialogue.delay = 0.08;
		dialogue.setFormat(Paths.font('offBitBold.ttf'), 15, 0xFF808080);
		dialogue.scrollFactor.set(0, 0);
		add(dialogue);
		dialogue.sounds = [FlxG.sound.load(Paths.sound('list.ogg'))];
		// dialogue.skip();
		dialogue.start();

		FlxG.sound.playMusic(musicGame, 1.0, false);

		FlxG.autoPause = false;
		#if (windows || html5)
		FlxG.mouse.visible = false;
		#end

		var retry = new FlxTimer().start(5, timerRetryBG, 1);
		retry.loops = 1000000;
		new FlxTimer().start(0.1, timerDarknessGoodBye, 1);
		new FlxTimer().start(3.0, timerCredMusic, 1);
		new FlxTimer().start(5.0, function(_)
		{
			leftScore = 0;
			rightScore = 0;
			spaceScore = 0;
		}, 0);
		new FlxTimer().start(18.0, timerMinusEpic, 1);
		new FlxTimer().start(24.5, timerMinus, 1);
		new FlxTimer().start(26.0, timerMinus, 1);
		new FlxTimer().start(27.6, timerMinus, 1);
		new FlxTimer().start(29.0, timerMinus, 1);
		timerMusicEnd = new FlxTimer().start(94.5, timerFade, 1);
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

		#if debug
		pure1Hitbox.alpha = 0.7;
		pure2Hitbox.alpha = 0.7;
		colinHitbox.alpha = 0.7;
		#end

		if (colinHitbox.overlaps(pure1Hitbox) || colinHitbox.overlaps(pure2Hitbox))
		{
			trace('Oops =3');

			FlxG.switchState(FinalTransfur.new);
		}

		bgMenu.velocity.x = -speedBG;

		bit.text = '$bpm';
		bpm = bpm + 1;

		actors.sort(FlxSort.byY, FlxSort.ASCENDING);

		pure1.velocity.set(0, 0);
		pure1.updateHitbox();

		pure2.velocity.set(0, 0);
		pure2.updateHitbox();

		colin.velocity.set(0, 0);
		colin.updateHitbox();

		FlxVelocity.moveTowardsObject(pure1, colin, 128);
		FlxVelocity.moveTowardsObject(pure2, colin, 140);

		if (pure1.velocity.x != 0 || pure1.velocity.y != 0)
		{
			if (Math.abs(pure1.velocity.x) > Math.abs(pure1.velocity.y))
			{
				if (pure1.velocity.x > 0)
				{
					pure1.animation.play('pure1RIGHT');

					lastDirectionP = 'pure1RIGHTi';
				}
				else
				{
					pure1.animation.play('pure1LEFT');

					lastDirectionP = 'pure1LEFTi';
				}
			}
			else
			{
				if (pure1.velocity.y > 0)
				{
					pure1.animation.play('pure1DOWN');

					lastDirectionP = 'pure1DOWNi';
				}
				else
				{
					pure1.animation.play('pure1UP');

					lastDirectionP = 'pure1UPi';
				}
			}
		}
		else
		{
			pure1.animation.play('$lastDirectionP');
		}

		if (pure2.velocity.x != 0 || pure2.velocity.y != 0)
		{
			if (Math.abs(pure2.velocity.x) > Math.abs(pure2.velocity.y))
			{
				if (pure2.velocity.x > 0)
				{
					pure2.animation.play('pure1RIGHT');

					lastDirectionP2 = 'pure1RIGHTi';
				}
				else
				{
					pure2.animation.play('pure1LEFT');

					lastDirectionP2 = 'pure1LEFTi';
				}
			}
			else
			{
				if (pure2.velocity.y > 0)
				{
					pure2.animation.play('pure1DOWN');

					lastDirectionP2 = 'pure1DOWNi';
				}
				else
				{
					pure2.animation.play('pure1UP');

					lastDirectionP2 = 'pure1UPi';
				}
			}
		}
		else
		{
			pure2.animation.play('$lastDirectionP2');
		}

		#if android
		for (touch in FlxG.touches.list)
		{
			if (touch.pressed)
			{
				if (touch.overlaps(buttonRight))
				{
					colin.velocity.x = 192;
				}
				if (touch.overlaps(buttonLeft))
				{
					colin.velocity.x = -192;
				}
				if (touch.overlaps(buttonUp))
				{
					colin.velocity.y = -192;
				}
				if (touch.overlaps(buttonDown))
				{
					colin.velocity.y = 192;
				}
			}
		}
		#end

		#if (windows || html5)
		if (FlxG.keys.anyPressed([FlxKey.RIGHT, D]))
		{
			colin.velocity.x = 192;
		}
		if (FlxG.keys.anyPressed([FlxKey.LEFT, A]))
		{
			colin.velocity.x = -192;
		}
		if (FlxG.keys.anyPressed([FlxKey.DOWN, S]))
		{
			colin.velocity.y = 192;
		}
		if (FlxG.keys.anyPressed([FlxKey.UP, W]))
		{
			colin.velocity.y = -192;
		}
		#end

		if (colin.velocity.x != 0 || colin.velocity.y != 0)
		{
			if (Math.abs(colin.velocity.x) > Math.abs(colin.velocity.y))
			{
				if (colin.velocity.x > 0)
				{
					colin.animation.play('colinRIGHT');

					lastDirection = 'colinRIGHTi';
				}
				else
				{
					colin.animation.play('colinLEFT');

					lastDirection = 'colinLEFTi';
				}
			}
			else
			{
				if (colin.velocity.y > 0)
				{
					colin.animation.play('colinDOWN');

					lastDirection = 'colinDOWNi';
				}
				else
				{
					colin.animation.play('colinUP');

					lastDirection = 'colinUPi';
				}
			}
		}
		else
		{
			colin.animation.play('$lastDirection');
		}

		pure1Hitbox.x = pure1.x + 13;
		pure1Hitbox.y = pure1.y + 117;
		pure2Hitbox.x = pure2.x + 13;
		pure2Hitbox.y = pure2.y + 117;
		colinHitbox.x = colin.x + 5;
		colinHitbox.y = colin.y + 117;

		FlxG.collide(pure1, layerWH);
		FlxG.collide(pure2, layerWH);
		FlxG.collide(pure1, layerFH);
		FlxG.collide(pure2, layerFH);
		FlxG.collide(colin, layerWH);

		if (scoreMinus == true)
		{
			scoreGame = scoreGame - 13;
		}

		#if android
		buttonUp.updateHitbox();
		buttonDown.updateHitbox();
		buttonLeft.updateHitbox();
		buttonRight.updateHitbox();
		buttonSpace.updateHitbox();
		buttonMusic.updateHitbox();
		buttonPuro.updateHitbox();
		buttonSeven.updateHitbox();

		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				if (lrTop == true)
				{
					if (touch.overlaps(buttonRight))
					{
						rightScore++;

						lrTop = false;

						LRB.animation.play('leftB');
					}
				}
				if (lrTop == false)
				{
					if (touch.overlaps(buttonLeft))
					{
						leftScore++;

						lrTop = true;

						LRB.animation.play('rightB');
					}
				}
				if (touch.overlaps(buttonSpace))
				{
					spaceScore++;
				}
				if (touch.overlaps(buttonPuro))
				{
					FlxG.switchState(PuroState.new);
				}
				if (touch.overlaps(buttonMusic))
				{
					FlxG.switchState(Balcony.new);
				}
				#if debug
				if (endingMusic == 1)
				{
					if (touch.overlaps(buttonMusic))
					{
						if (timerMusicEnd != null)
						{
							timerMusicEnd.destroy();
						}

						FlxG.sound.playMusic(Paths.music('goodEnding.ogg'));

						new FlxTimer().start(0.1, function(_)
						{
							endingMusic = 2;
						});
					}
				}
				if (endingMusic == 2)
				{
					if (touch.overlaps(buttonMusic))
					{
						if (timerMusicEnd != null)
						{
							timerMusicEnd.destroy();
						}

						FlxG.sound.playMusic(Paths.music('badEnding.ogg'));

						new FlxTimer().start(0.1, function(_)
						{
							endingMusic = 1;
						});
					}
				}
				#end

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
		spaceTextScore.text = 'Space : $spaceScore';
		lrTextScore.text = 'Left : $leftScore | Right : $rightScore';

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
		if (endingMusic == 1)
		{
			if (FlxG.keys.anyJustPressed([FlxKey.TWO]))
			{
				if (timerMusicEnd != null)
				{
					timerMusicEnd.destroy();
				}

				FlxG.sound.playMusic(Paths.music('goodEnding.ogg'));

				new FlxTimer().start(0.1, function(_)
				{
					endingMusic = 2;
				});
			}
		}
		if (endingMusic == 2)
		{
			if (FlxG.keys.anyJustPressed([FlxKey.TWO]))
			{
				if (timerMusicEnd != null)
				{
					timerMusicEnd.destroy();
				}

				FlxG.sound.playMusic(Paths.music('badEnding.ogg'));

				new FlxTimer().start(0.1, function(_)
				{
					endingMusic = 1;
				});
			}
		}

		if (FlxG.keys.anyJustPressed([FlxKey.RIGHT]) && lrTop)
		{
			rightScore++;

			lrTop = false;

			LRB.animation.play('leftB');
		}
		else if (FlxG.keys.anyJustPressed([FlxKey.LEFT]) && !lrTop)
		{
			leftScore++;

			lrTop = true;

			LRB.animation.play('rightB');
		}
		if (FlxG.keys.anyJustPressed([FlxKey.SPACE]))
		{
			spaceScore++;
		}
		if (FlxG.keys.anyPressed([FlxKey.SPACE]))
		{
			SPACEB.animation.play('destruct');
		}
		else
		{
			SPACEB.animation.play('spaceNormal');
		}
		if (FlxG.keys.anyJustPressed([FlxKey.THREE]))
		{
			FlxG.switchState(Balcony.new);
		}
		if (FlxG.keys.anyJustPressed([FlxKey.FOUR]))
		{
			FlxG.switchState(PuroState.new);
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
		dialogue.resetText(':3');
		dialogue.start();

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
		dialogue.resetText('GG');
		dialogue.color = 0xffd700;
		dialogue.start();

		FlxG.sound.music.fadeOut(1.0);
	}
}

class FinalTransfur extends FlxState
{
	var whiteBG = new FlxSprite();
	var eyeUP = new FlxSprite();
	var eyeDOWN = new FlxSprite();
	var latexTransition = new FlxSprite();
	var transfurImage = new FlxSprite();
	var dialogue:FlxTypeText;
	var sORe = new FlxText();
	var buttonSpaceDeath = new FlxSprite();
	var spaceTextD = new FlxText();

	var enterPress = false;

	override public function create()
	{
		super.create();

		whiteBG = new FlxSprite(Paths.image('game/run/gameOver/zone1.png'));
		whiteBG.x = 0;
		whiteBG.y = 0;
		whiteBG.alpha = 1.0;
		whiteBG.scrollFactor.set(0, 0);
		add(whiteBG);

		eyeUP.makeGraphic(642, 240, FlxColor.BLACK);
		eyeUP.x = 0;
		eyeUP.y = -240;
		eyeUP.alpha = 1.0;
		eyeUP.scrollFactor.set(0, 0);
		add(eyeUP);

		eyeDOWN.makeGraphic(642, 240, FlxColor.BLACK);
		eyeDOWN.x = 0;
		eyeDOWN.y = 480;
		eyeDOWN.alpha = 1.0;
		eyeDOWN.scrollFactor.set(0, 0);
		add(eyeDOWN);

		latexTransition = new FlxSprite(Paths.image('mainMenu/startScreen/lightLatex.png'));
		latexTransition.x = 0;
		latexTransition.y = -1200;
		add(latexTransition);

		transfurImage = new FlxSprite(Paths.image('game/run/gameOver/transfur1.png'));
		transfurImage.x = 0;
		transfurImage.y = 0;
		transfurImage.alpha = 0.0;
		add(transfurImage);

		dialogue = new FlxTypeText(102, 200, 0, 'TRANSFURMED!');
		dialogue.delay = 0.08;
		dialogue.setFormat(Paths.font('offBitBold.ttf'), 64, FlxColor.WHITE, null, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		dialogue.borderSize = 3;
		dialogue.scrollFactor.set(0, 0);
		add(dialogue);
		dialogue.sounds = [FlxG.sound.load(Paths.sound('list.ogg'))];

		sORe = new FlxText(0, 0, 0, '');
		#if (windows || html5)
		sORe.text = 'Press SPACE or ENTER to restart FinalRun.hx';
		sORe.x = 30;
		#end
		#if android
		sORe.text = 'Press SPACE to restart FinalRun.hx';
		sORe.x = 100;
		#end
		sORe.y = 450;
		sORe.setFormat(Paths.font('offBitBold.ttf'), 30, FlxColor.WHITE, null, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		sORe.borderSize = 3;
		sORe.alpha = 0.0;
		sORe.scrollFactor.set(0, 0);
		add(sORe);

		#if android
		buttonSpaceDeath = new FlxSprite(Paths.image('buttonForMobile.png'));
		buttonSpaceDeath.x = 479;
		buttonSpaceDeath.y = 399;
		buttonSpaceDeath.alpha = 0.0;
		buttonSpaceDeath.scale.x = 2.0;
		buttonSpaceDeath.scrollFactor.set(0, 0);
		add(buttonSpaceDeath);

		spaceTextD = new FlxText(buttonSpaceDeath.x + 28, buttonSpaceDeath.y + 25, 0, 'SPACE');
		spaceTextD.setFormat(Paths.font('offBitBold.ttf'), 35, FlxColor.WHITE);
		spaceTextD.alpha = 0.0;
		spaceTextD.scrollFactor.set(0, 0);
		add(spaceTextD);
		#end

		FlxTween.tween(eyeUP, {y: 0}, 0.5, {
			ease: FlxEase.cubeInOut,
			onComplete: function(_)
			{
				FlxTween.tween(eyeUP, {y: -240}, 0.5, {
					ease: FlxEase.cubeInOut,
					onComplete: function(_)
					{
						FlxTween.tween(eyeUP, {y: 0}, 2.0, {
							ease: FlxEase.cubeInOut
						});
					}
				});
			}
		});
		FlxTween.tween(eyeDOWN, {y: 240}, 0.5, {
			ease: FlxEase.cubeInOut,
			onComplete: function(_)
			{
				FlxTween.tween(eyeDOWN, {y: 480}, 0.5, {
					ease: FlxEase.cubeInOut,
					onComplete: function(_)
					{
						FlxTween.tween(eyeDOWN, {y: 240}, 2.0, {
							ease: FlxEase.cubeInOut,
							onComplete: function(_)
							{
								FlxG.sound.play(Paths.sound('transfurmation.ogg'));
								FlxTween.tween(latexTransition, {y: 0}, 2.0, {
									ease: FlxEase.cubeInOut,
									onComplete: function(_)
									{
										dialogue.start();
										FlxTween.tween(sORe, {'alpha': 1.0}, 1.0, {
											ease: FlxEase.cubeInOut
										});
										#if android
										FlxTween.tween(buttonSpaceDeath, {'alpha': 0.8}, 1.0, {
											ease: FlxEase.cubeInOut
										});
										FlxTween.tween(spaceTextD, {'alpha': 1.0}, 1.0, {
											ease: FlxEase.cubeInOut
										});
										#end
										FlxTween.tween(transfurImage, {'alpha': 1.0}, 1.0, {
											ease: FlxEase.cubeInOut,
											onComplete: function(_)
											{
												enterPress = true;
											}
										});
									}
								});
							}
						});
					}
				});
			}
		});
		FlxG.sound.playMusic('', 0.0);

		FlxG.sound.play(Paths.sound('slash.ogg'));
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		#if android
		buttonSpaceDeath.updateHitbox();
		#end

		if (enterPress == true)
		{
			#if android
			for (touch in FlxG.touches.list)
			{
				if (touch.justPressed)
				{
					if (touch.overlaps(buttonSpaceDeath))
					{
						FlxG.switchState(FinalRun.new);
					}
				}
			}
			#end
			#if (windows || html5)
			if (FlxG.keys.anyPressed([FlxKey.ENTER, SPACE]))
			{
				FlxG.switchState(FinalRun.new);
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
}

class PuroState extends FlxState
{
	var layerF = new FlxTilemap();
	var layerW = new FlxTilemap();
	var layerWH = new FlxTilemap();
	var puro = new FlxSprite();
	var puroHitbox = new FlxSprite();
	var colin = new FlxSprite();
	var colinHitbox = new FlxSprite();
	var actors:FlxTypedGroup<FlxSprite>;
	var bgDialogue = new FlxSprite();
	var iconDialogue = new FlxSprite();
	var dialogue:FlxTypeText;
	var dialogueText = [
		'...',
		'Colin. are you okay?',
		'You calmly look around and nod your head.',
		'Test Dialogues, ok?'
	];
	var numberDialogue:Int = -1;
	var isTyping:Bool = false;
	var buttonLeft = new FlxSprite();
	var leftText = new FlxText();
	var buttonUp = new FlxSprite();
	var upText = new FlxText();
	var buttonDown = new FlxSprite();
	var downText = new FlxText();
	var buttonRight = new FlxSprite();
	var rightText = new FlxText();
	var buttonSeven = new FlxSprite();
	var sevenText = new FlxText();
	var logoHF = new FlxSprite();
	var darkness = new FlxSprite();

	var lastDirection = 'colinUPi';

	override public function create()
	{
		var tiledMap = new TiledMap(Paths.data('theLastMomentWithPuro.tmx'));

		var mapWight = tiledMap.width * tiledMap.tileWidth;
		var mapHeight = tiledMap.height * tiledMap.tileHeight;

		layerF = new FlxTilemap();
		var layerFloor:TiledTileLayer = cast tiledMap.getLayer('floor');
		layerF.loadMapFromArray(layerFloor.tileArray, 30, 20, Paths.image('game/run/TileB.png'), 32, 32);
		add(layerF);

		layerW = new FlxTilemap();
		var layerWall:TiledTileLayer = cast tiledMap.getLayer('walls');
		layerW.loadMapFromArray(layerWall.tileArray, 30, 20, Paths.image('game/run/TileB.png'), 32, 32);
		add(layerW);

		layerWH = new FlxTilemap();
		var layerWallHit:TiledTileLayer = cast tiledMap.getLayer('wallsHitbox');
		layerWH.loadMapFromArray(layerWallHit.tileArray, 30, 20, Paths.image('game/run/TileB.png'), 32, 32);
		add(layerWH);

		actors = new FlxTypedGroup<FlxSprite>();
		add(actors);

		puro = new FlxSprite();
		puro.loadGraphic(Paths.image('game/run/puroAssets.png'), true, 121, 151);
		puro.animation.add('puroLEFTi', [4], 1, true);
		puro.animation.add('puroUPi', [10], 1, true);
		puro.animation.add('puroDOWNi', [1], 1, true);
		puro.animation.add('puroRIGHTi', [7], 1, true);
		puro.animation.add('puroLEFT', [3, 4, 5, 4], 8, true);
		puro.animation.add('puroUP', [9, 10, 11, 10], 8, true);
		puro.animation.add('puroDOWN', [0, 1, 2, 1], 8, true);
		puro.animation.add('puroRIGHT', [6, 7, 8, 7], 8, true);
		puro.animation.play('puroDOWNi');
		puro.x = 725;
		puro.y = 300;
		actors.add(puro);

		puroHitbox.makeGraphic(110, 11, FlxColor.RED);
		puroHitbox.x = puro.x + 5;
		puroHitbox.y = puro.y + 137;
		puroHitbox.alpha = 0.0;
		add(puroHitbox);

		colin = new FlxSprite();
		colin.loadGraphic(Paths.image('game/run/colinAssets.png'), true, 60, 128);
		colin.animation.add('colinLEFTi', [4], 1, true);
		colin.animation.add('colinUPi', [10], 1, true);
		colin.animation.add('colinDOWNi', [1], 1, true);
		colin.animation.add('colinRIGHTi', [7], 1, true);
		colin.animation.add('colinLEFT', [3, 4, 5, 4], 8, true);
		colin.animation.add('colinUP', [9, 10, 11, 10], 8, true);
		colin.animation.add('colinDOWN', [0, 1, 2, 1], 8, true);
		colin.animation.add('colinRIGHT', [6, 7, 8, 7], 8, true);
		colin.animation.play('colinUPi');
		colin.x = 750;
		colin.y = 450;
		actors.add(colin);

		colinHitbox.makeGraphic(50, 11, FlxColor.RED);
		colinHitbox.x = colin.x + 5;
		colinHitbox.y = colin.y + 117;
		colinHitbox.alpha = 0.0;
		add(colinHitbox);

		FlxG.worldBounds.set(0, 0, mapWight, mapHeight);
		FlxG.camera.follow(colin);
		FlxG.camera.setScrollBoundsRect(0, 0, mapWight, mapHeight, true);

		bgDialogue.makeGraphic(642, 96, FlxColor.GRAY);
		bgDialogue.x = 0;
		bgDialogue.y = 0;
		bgDialogue.scrollFactor.set(0, 0);
		bgDialogue.alpha = 0.7;
		add(bgDialogue);

		iconDialogue = new FlxSprite();
		iconDialogue.loadGraphic(Paths.image('game/run/goodEnding/actorPuro.png'), true, 96, 96);
		iconDialogue.animation.add('animIcon1', [0], 1, true);
		iconDialogue.animation.add('animIcon6', [5], 1, true);
		iconDialogue.animation.add('animIcon7', [6], 1, true);
		iconDialogue.animation.play('animIcon6');
		iconDialogue.x = 0;
		iconDialogue.y = 0;
		iconDialogue.scrollFactor.set(0, 0);
		iconDialogue.alpha = 0.0;
		add(iconDialogue);

		dialogue = new FlxTypeText(iconDialogue.x + 100, iconDialogue.y, FlxG.width, '...');
		dialogue.delay = 0.06;
		dialogue.setFormat(Paths.font('offBitBold.ttf'), 22, FlxColor.WHITE);
		dialogue.scrollFactor.set(0, 0);
		dialogue.start();
		add(dialogue);
		dialogue.sounds = [FlxG.sound.load(Paths.sound('list.ogg'))];

		#if android
		buttonLeft = new FlxSprite(Paths.image('buttonForMobile.png'));
		buttonLeft.x = 0;
		buttonLeft.y = 318;
		buttonLeft.color = FlxColor.PINK;
		buttonLeft.alpha = 0.8;
		buttonLeft.scrollFactor.set(0, 0);
		add(buttonLeft);

		leftText = new FlxText(buttonLeft.x + 30, buttonLeft.y + 25, 0, '<');
		leftText.setFormat(Paths.font('offBitBold.ttf'), 35, FlxColor.PINK);
		leftText.alpha = 0.8;
		leftText.scrollFactor.set(0, 0);
		add(leftText);

		buttonUp = new FlxSprite(Paths.image('buttonForMobile.png'));
		buttonUp.x = 81;
		buttonUp.y = 237;
		buttonUp.color = FlxColor.LIME;
		buttonUp.alpha = 0.8;
		buttonUp.scrollFactor.set(0, 0);
		add(buttonUp);

		upText = new FlxText(buttonUp.x + 30, buttonUp.y + 25, 0, 'v');
		upText.setFormat(Paths.font('offBitBold.ttf'), 35, FlxColor.LIME);
		upText.flipY = true;
		upText.alpha = 0.8;
		upText.scrollFactor.set(0, 0);
		add(upText);

		buttonDown = new FlxSprite(Paths.image('buttonForMobile.png'));
		buttonDown.x = 81;
		buttonDown.y = 399;
		buttonDown.alpha = 0.8;
		buttonDown.color = FlxColor.CYAN;
		buttonDown.scrollFactor.set(0, 0);
		add(buttonDown);

		downText = new FlxText(buttonDown.x + 30, buttonDown.y + 25, 0, 'v');
		downText.setFormat(Paths.font('offBitBold.ttf'), 35, FlxColor.CYAN);
		downText.alpha = 0.8;
		downText.scrollFactor.set(0, 0);
		add(downText);

		buttonRight = new FlxSprite(Paths.image('buttonForMobile.png'));
		buttonRight.x = 162;
		buttonRight.y = 318;
		buttonRight.alpha = 0.8;
		buttonRight.color = FlxColor.RED;
		buttonRight.scrollFactor.set(0, 0);
		add(buttonRight);

		rightText = new FlxText(buttonRight.x + 30, buttonRight.y + 25, 0, '>');
		rightText.setFormat(Paths.font('offBitBold.ttf'), 35, FlxColor.RED);
		rightText.alpha = 0.8;
		rightText.scrollFactor.set(0, 0);
		add(rightText);

		buttonSeven = new FlxSprite(Paths.image('buttonForMobile.png'));
		buttonSeven.x = 559;
		buttonSeven.y = 399;
		buttonSeven.color = FlxColor.ORANGE;
		buttonSeven.scrollFactor.set(0, 0);
		add(buttonSeven);

		sevenText = new FlxText(buttonSeven.x + 30, buttonSeven.y + 25, 0, '7');
		sevenText.setFormat(Paths.font('offBitBold.ttf'), 35, FlxColor.ORANGE);
		sevenText.scrollFactor.set(0, 0);
		add(sevenText);

		logoHF = new FlxSprite(Paths.image('default.png'));
		logoHF.x = buttonSeven.x + 53;
		logoHF.y = buttonSeven.y + 10;
		logoHF.scrollFactor.set(0, 0);
		add(logoHF);
		#end

		darkness.makeGraphic(642, FlxG.height, FlxColor.BLACK);
		darkness.x = 0;
		darkness.y = 0;
		darkness.alpha = 1.0;
		darkness.scrollFactor.set(0, 0);
		add(darkness);

		FlxTween.tween(darkness, {'alpha': 0.0}, 3.0, {ease: FlxEase.cubeInOut});

		new FlxTimer().start(1.5, function(_)
		{
			#if debug
			trace(numberDialogue);
			#end
		}, 0);

		FlxG.sound.play(Paths.sound('open3.ogg'));
		FlxG.sound.music.stop();
	}

	function showLine()
	{
		isTyping = true;

		dialogue.resetText(dialogueText[numberDialogue]);
		dialogue.start();

		dialogue.completeCallback = function()
		{
			isTyping = false;
		}
	}

	function endDialogue()
	{
		dialogue.kill();
		bgDialogue.alpha = 0.0;
		iconDialogue.alpha = 0.0;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		#if debug
		puroHitbox.alpha = 0.7;
		colinHitbox.alpha = 0.7;
		#end
		#if android
		buttonSeven.updateHitbox();

		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				if (touch.overlaps(bgDialogue))
				{
					if (isTyping)
					{
						dialogue.skip();
					}
					else
					{
						numberDialogue++;

						if (numberDialogue < dialogueText.length)
						{
							showLine();
						}
						else
						{
							endDialogue();
						}
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
		if (FlxG.keys.anyJustPressed([FlxKey.ENTER]))
		{
			if (isTyping)
			{
				dialogue.skip();
			}
			else
			{
				numberDialogue++;

				if (numberDialogue < dialogueText.length)
				{
					showLine();
				}
				else
				{
					endDialogue();
				}
			}
		}
		#end

		switch (numberDialogue)
		{
			case 1:
				iconDialogue.alpha = 1.0;
			case 2:
				iconDialogue.alpha = 0.0;
			case 3:
				iconDialogue.alpha = 1.0;
				iconDialogue.animation.play('animIcon7');
		}

		// if (colinHitbox.overlaps(puroHitbox))
		// {
		// numberDialogue = 1;
		// }

		actors.sort(FlxSort.byY, FlxSort.ASCENDING);

		puro.velocity.set(0, 0);
		puro.updateHitbox();

		colin.velocity.set(0, 0);
		colin.updateHitbox();

		var dx:Float = colin.x - puro.x;
		var dy:Float = colin.y - puro.y;

		var direction:String;

		if (Math.abs(dx) > Math.abs(dy))
		{
			if (dx > 0)
			{
				direction = 'puroRIGHTi';
			}
			else
			{
				direction = 'puroLEFTi';
			}
		}
		else
		{
			if (dy > 0)
			{
				direction = 'puroDOWNi';
			}
			else
			{
				direction = 'puroUPi';
			}
		}

		if (puro.animation.curAnim == null || puro.animation.curAnim.name != direction)
		{
			puro.animation.play(direction);
		}

		#if android
		for (touch in FlxG.touches.list)
		{
			if (touch.pressed)
			{
				if (numberDialogue >= 4)
				{
					if (touch.overlaps(buttonRight))
					{
						colin.velocity.x = 192;
					}
					if (touch.overlaps(buttonLeft))
					{
						colin.velocity.x = -192;
					}
					if (touch.overlaps(buttonUp))
					{
						colin.velocity.y = -192;
					}
					if (touch.overlaps(buttonDown))
					{
						colin.velocity.y = 192;
					}
				}
			}
		}
		#end

		#if (windows || html5)
		if (numberDialogue >= 4)
		{
			if (FlxG.keys.anyPressed([FlxKey.RIGHT, D]))
			{
				colin.velocity.x = 192;
			}
			if (FlxG.keys.anyPressed([FlxKey.LEFT, A]))
			{
				colin.velocity.x = -192;
			}
			if (FlxG.keys.anyPressed([FlxKey.DOWN, S]))
			{
				colin.velocity.y = 192;
			}
			if (FlxG.keys.anyPressed([FlxKey.UP, W]))
			{
				colin.velocity.y = -192;
			}
		}
		#end

		if (colin.velocity.x != 0 || colin.velocity.y != 0)
		{
			if (Math.abs(colin.velocity.x) > Math.abs(colin.velocity.y))
			{
				if (colin.velocity.x > 0)
				{
					colin.animation.play('colinRIGHT');

					lastDirection = 'colinRIGHTi';
				}
				else
				{
					colin.animation.play('colinLEFT');

					lastDirection = 'colinLEFTi';
				}
			}
			else
			{
				if (colin.velocity.y > 0)
				{
					colin.animation.play('colinDOWN');

					lastDirection = 'colinDOWNi';
				}
				else
				{
					colin.animation.play('colinUP');

					lastDirection = 'colinUPi';
				}
			}
		}
		else
		{
			colin.animation.play('$lastDirection');
		}

		puroHitbox.x = puro.x + 8;
		puroHitbox.y = puro.y + 140;
		colinHitbox.x = colin.x + 5;
		colinHitbox.y = colin.y + 117;

		FlxG.collide(colin, layerWH);

		#if (windows || html5)
		if (FlxG.keys.anyJustPressed([FlxKey.SEVEN]))
		{
			FlxG.switchState(States.new);
		}
		#end
	}
}

class Balcony extends FlxState
{
	var bgBad = new FlxSprite();
	var puroAndColinScreen = new FlxSprite();
	var sun = new FlxSprite();
	var finalCredits = new FlxText();
	var RC1 = new FlxSprite();
	var RC2 = new FlxSprite();
	var floorBad = new FlxSprite();
	var colin = new FlxSprite();
	var railings = new FlxSprite();
	var buttonRight = new FlxSprite();
	var rightText = new FlxText();
	var buttonSpace = new FlxSprite();
	var spaceText = new FlxText();
	var buttonSeven = new FlxSprite();
	var sevenText = new FlxText();
	var logoHF = new FlxSprite();
	var darkness = new FlxSprite();
	var dialogue:FlxTypeText;
	var textFinalCred = ['Scarlet-Eye', 'KittyFoxNyan', 'Togo91', 'ShiZi', 'KrysisWave', 'aleximine'];
	var textFinalRole = [
		'Fan-Game Created by ',
		'Desing Assistance - ',
		'Playtester - ',
		'Music used by '
	];
	var statusAnim = 9;

	var windS:FlxSound;

	// var bloom:BloomShader;
	// var shaderFinal:ShaderFilter;

	override public function create()
	{
		bgBad.makeGraphic(642, 1000);
		bgBad.color = 0xffd16d;
		bgBad.x = 0;
		bgBad.y = -520;
		bgBad.alpha = 0.8;
		add(bgBad);

		puroAndColinScreen = new FlxSprite();
		puroAndColinScreen.loadGraphic(Paths.image('game/run/badEnding/61.png'));
		puroAndColinScreen.x = 0;
		puroAndColinScreen.y = 0;
		puroAndColinScreen.alpha = 0.0;
		add(puroAndColinScreen);

		sun = new FlxSprite(Paths.image('game/run/badEnding/sun.png'));
		sun.x = 300;
		sun.y = 300;
		add(sun);

		finalCredits = new FlxText(175, 400, 0,
			'Creators TransfurClick :\n'
			+ textFinalRole[0]
			+ textFinalCred[0]
			+ '\n'
			+ textFinalRole[1]
			+ textFinalCred[1]
			+ '\n'
			+ textFinalRole[2]
			+ textFinalCred[2]
			+ '\n\n'
			+ 'Special Thanks :\n'
			+ textFinalRole[3]
			+ textFinalCred[3]
			+ '\n'
			+ textFinalCred[4]
			+ '\n'
			+ textFinalCred[5]
			+ '\n\n'
			+ 'Thank you, player,\nfor completing TransfurClick! <3');
		finalCredits.setFormat(Paths.font('offBitBold.ttf'), 25, FlxColor.WHITE, null, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(finalCredits);

		RC1 = new FlxSprite(Paths.image('game/run/badEnding/ruinedCity.png'));
		RC1.x = 0;
		RC1.y = 335;
		add(RC1);

		RC2 = new FlxSprite(Paths.image('game/run/badEnding/ruinedCity.png'));
		RC2.x = 480;
		RC2.y = 335;
		add(RC2);

		floorBad.makeGraphic(140, 150, FlxColor.BLACK);
		floorBad.x = 0;
		floorBad.y = 250;
		floorBad.alpha = 1.0;
		add(floorBad);

		colin = new FlxSprite();
		colin.loadGraphic(Paths.image('game/run/colinAssets.png'), true, 60, 128);
		colin.animation.add('colinLEFTi', [4], 1, true);
		colin.animation.add('colinUPi', [10], 1, true);
		colin.animation.add('colinDOWNi', [1], 1, true);
		colin.animation.add('colinRIGHTi', [7], 1, true);
		colin.animation.add('colinLEFT', [3, 4, 5, 4], 8, true);
		colin.animation.add('colinUP', [9, 10, 11, 10], 8, true);
		colin.animation.add('colinDOWN', [0, 1, 2, 1], 8, true);
		colin.animation.add('colinRIGHT', [6, 7, 8, 7], 8, true);
		colin.animation.play('colinRIGHTi');
		colin.x = 0;
		colin.y = floorBad.y - 128;
		colin.setColorTransform(0, 0, 0, 1, 0, 0, 0, 0);
		add(colin);

		railings = new FlxSprite(Paths.image('game/run/badEnding/railing.png'));
		railings.x = 0;
		railings.y = floorBad.y - 64;
		add(railings);

		#if android
		buttonRight = new FlxSprite(Paths.image('buttonForMobile.png'));
		buttonRight.x = 162;
		buttonRight.y = 318;
		buttonRight.alpha = 0.8;
		buttonRight.color = FlxColor.RED;
		buttonRight.scrollFactor.set(0, 0);
		add(buttonRight);

		rightText = new FlxText(buttonRight.x + 30, buttonRight.y + 25, 0, '>');
		rightText.setFormat(Paths.font('offBitBold.ttf'), 35, FlxColor.RED);
		rightText.alpha = 0.8;
		rightText.scrollFactor.set(0, 0);
		add(rightText);

		buttonSpace = new FlxSprite(Paths.image('buttonForMobile.png'));
		buttonSpace.x = 479;
		buttonSpace.y = 399;
		buttonSpace.alpha = 0.0;
		buttonSpace.scale.x = 2.0;
		buttonSpace.scrollFactor.set(0, 0);
		add(buttonSpace);

		spaceText = new FlxText(buttonSpace.x + 28, buttonSpace.y + 25, 0, 'SPACE');
		spaceText.setFormat(Paths.font('offBitBold.ttf'), 35, FlxColor.WHITE);
		spaceText.alpha = 0.0;
		spaceText.scrollFactor.set(0, 0);
		add(spaceText);

		buttonSeven = new FlxSprite(Paths.image('buttonForMobile.png'));
		buttonSeven.x = 0;
		buttonSeven.y = 0;
		buttonSeven.color = FlxColor.ORANGE;
		buttonSeven.scrollFactor.set(0, 0);
		add(buttonSeven);

		sevenText = new FlxText(buttonSeven.x + 30, buttonSeven.y + 25, 0, '7');
		sevenText.setFormat(Paths.font('offBitBold.ttf'), 35, FlxColor.ORANGE);
		sevenText.scrollFactor.set(0, 0);
		add(sevenText);

		logoHF = new FlxSprite(Paths.image('default.png'));
		logoHF.x = buttonSeven.x + 53;
		logoHF.y = buttonSeven.y + 10;
		logoHF.scrollFactor.set(0, 0);
		add(logoHF);
		#end

		darkness.makeGraphic(642, FlxG.height, FlxColor.BLACK);
		darkness.x = 0;
		darkness.y = 0;
		darkness.alpha = 1.0;
		darkness.scrollFactor.set(0, 0);
		add(darkness);

		dialogue = new FlxTypeText(102, 200, 0, 'HI PLAYER!');
		dialogue.delay = 0.08;
		dialogue.setFormat(Paths.font('offBitBold.ttf'), 64, FlxColor.BLACK, null, FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);
		dialogue.borderSize = 3;
		dialogue.scrollFactor.set(0, 0);
		dialogue.alpha = 0.0;
		add(dialogue);
		dialogue.sounds = [FlxG.sound.load(Paths.sound('list.ogg'))];

		// bloom = new BloomShader();
		// shaderFinal = new ShaderFilter(bloom);
		// bloom.data.strength.value = [1.0];

		// bgBad.shader = bloom;
		// FlxG.camera.filters = [shaderFinal]

		FlxTween.tween(bgBad, {'alpha': 1.0}, 60.0, {ease: FlxEase.linear});
		FlxTween.tween(sun, {y: 100}, 300.0, {ease: FlxEase.linear});

		FlxTween.tween(darkness, {'alpha': 0.0}, 3.0, {
			ease: FlxEase.cubeInOut,
			onComplete: function(_)
			{
				statusAnim = 8;
			}
		});
		FlxG.sound.play(Paths.sound('open3.ogg'));
		windS = FlxG.sound.play(Paths.sound('wind.ogg'), 0.0, true);
		windS.fadeIn(3.0, 0.0, 0.2);

		FlxG.sound.music.stop();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		#if android
		buttonRight.updateHitbox();
		buttonSpace.updateHitbox();
		buttonSeven.updateHitbox();

		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				if (touch.overlaps(buttonSeven))
				{
					FlxG.switchState(States.new);
				}
			}
		}
		#end

		switch (statusAnim)
		{
			case 0:
				FlxTween.tween(finalCredits, {y: -305}, 52, {ease: FlxEase.linear});

				statusAnim = 9;
			case 1:
				colin.animation.play('colinRIGHT');

				FlxTween.tween(colin, {x: 50}, 0.5, {
					ease: FlxEase.linear,
					onComplete: function(_)
					{
						colin.animation.play('colinRIGHTi');
					}
				});

				#if android
				FlxTween.tween(buttonRight, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(rightText, {'alpha': 0.0}, 0.5, {ease: FlxEase.cubeInOut});
				#end

				windS.fadeOut(0.5, 0.02);

				FlxG.sound.playMusic(Paths.music('goodEnding.ogg'), 1.0, false);

				statusAnim = 0;

				new FlxTimer().start(38.5, function(_)
				{
					FlxTween.tween(puroAndColinScreen, {'alpha': 1.0}, 1.0, {
						ease: FlxEase.cubeInOut,
						onComplete: function(_)
						{
							FlxTween.tween(puroAndColinScreen, {'alpha': 0.0}, 2.25, {
								ease: FlxEase.cubeInOut,
								onComplete: function(_)
								{
									puroAndColinScreen.loadGraphic(Paths.image('game/run/badEnding/108.png'));

									FlxTween.tween(puroAndColinScreen, {'alpha': 1.0}, 1.0, {
										ease: FlxEase.cubeInOut,
										onComplete: function(_)
										{
											FlxTween.tween(puroAndColinScreen, {'alpha': 0.0}, 2.25, {
												ease: FlxEase.cubeInOut,
												onComplete: function(_)
												{
													puroAndColinScreen.loadGraphic(Paths.image('game/run/badEnding/146.png'));

													FlxTween.tween(puroAndColinScreen, {'alpha': 1.0}, 1.0, {
														ease: FlxEase.cubeInOut,
														onComplete: function(_)
														{
															FlxTween.tween(puroAndColinScreen, {'alpha': 0.0}, 2.25, {
																ease: FlxEase.cubeInOut,
																onComplete: function(_) {}
															});
														}
													});
												}
											});
										}
									});
								}
							});
						}
					});
				}, 1);

				new FlxTimer().start(52.0, function(_)
				{
					windS.fadeIn(0.5, 0.02, 0.2);

					statusAnim = 3;
				}, 1);
			case 2:
				colin.animation.play('colinLEFT');

				FlxTween.tween(colin, {x: 0}, 0.5, {
					ease: FlxEase.linear,
					onComplete: function(_)
					{
						colin.animation.play('colinLEFTi');

						FlxTween.tween(darkness, {'alpha': 1.0}, 1.0, {
							ease: FlxEase.cubeInOut,
							onComplete: function(_)
							{
								// dialogue.alpha = 1.0;
								// dialogue.start();

								windS.fadeOut(0.5, 0.0, function(_)
								{
									FlxG.switchState(MainTransfurMenu.new);
								});
							}
						});

						FlxG.sound.play(Paths.sound('open3.ogg'));
					}
				});
				statusAnim = 0;
			case 3:
				#if android
				FlxTween.tween(buttonSpace, {'alpha': 0.8}, 0.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(spaceText, {'alpha': 0.8}, 0.5, {ease: FlxEase.cubeInOut});

				for (touch in FlxG.touches.list)
				{
					if (touch.justPressed)
					{
						if (touch.overlaps(buttonSpace))
						{
							statusAnim = 2;
						}
					}
				}
				#end
				#if (windows || html5)
				if (FlxG.keys.anyJustPressed([FlxKey.SPACE, LEFT]))
				{
					statusAnim = 2;
				}
				#end
			case 8:
				#if android
				for (touch in FlxG.touches.list)
				{
					if (touch.justPressed)
					{
						if (touch.overlaps(buttonRight))
						{
							statusAnim = 1;
						}
					}
				}
				#end
				#if (windows || html5)
				if (FlxG.keys.anyJustPressed([FlxKey.RIGHT, D]))
				{
					statusAnim = 1;
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
}
