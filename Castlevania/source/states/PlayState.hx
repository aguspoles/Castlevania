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
		
		whip = new Weapon();
		whip.kill();
		platform = new Obstacle(0, 200);
		platform.makeGraphic(FlxG.width, 16, 0xFF00FFFF);
		platform.immovable = true;
		
		player = new Player(100, 100);
		
		add(platform);
		add(player);
	}

	override public function update(elapsed:Float):Void
	{	
		FlxG.collide (platform, player);
		
		if (FlxG.keys.justPressed.A)
		{
			whip.revive();
			whip.x = player.x + player.width;
			whip.y = player.y + player.width / 2;
			whip.animation.play("attack");
			add (whip);
		}
		
		if (whip.animation.finished)
		{
			whip.kill();
		}
		super.update(elapsed);
		if (whip.alive)
		{
			whip.x = player.x + player.width;
			whip.y = player.y + player.width / 2;
		}
	}
}
