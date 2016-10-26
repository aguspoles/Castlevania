package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import sprites.Player;
import sprites.Obstacle;
import sprites.Weapon;

class PlayState extends FlxState
{
	private var player:Player;
	private var whip:Weapon;
	private var platform:Obstacle;
	
	override public function create():Void
	{
		super.create();
		
		FlxG.mouse.visible = false;
		
		platform = new Obstacle(0, 200);
		platform.makeGraphic(FlxG.width, 16, 0xFF00FFFF);
		platform.immovable = true;
		
		player = new Player(100, 100);
		
		add(platform);
		add(player);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		FlxG.collide (platform, player);
		
		if (FlxG.keys.justPressed.A)
		{
			whip = new Weapon (player.x + player.width, player.y + player.width/2);
			add (whip);
		}
	}
}
