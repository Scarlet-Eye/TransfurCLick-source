package;

import Sys;
import flixel.FlxGame;
import openfl.display.Sprite;

var versionGame:String = '0.2';
var versionPaths:String = '0';
var versionStatus:String = 'ALPHA';

class Main extends Sprite
{
	public function new()
	{
		super();

		addChild(new FlxGame(640, 480, StartScreenNEW, 60, 60, true, false));

		#if windows
		var basePath = Sys.programPath();
		var dir = haxe.io.Path.directory(basePath);

		Sys.setCwd(dir);

		trace('CD: ' + Sys.getCwd());
		#end
		trace('CHANGED WAS SUCCESSFULLY LAUNCHED AS A CLICKER! V$versionGame.$versionPaths($versionStatus) >:3');
	}
}
