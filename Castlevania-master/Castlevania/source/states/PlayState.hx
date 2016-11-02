package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import sprites.Enemy;
import sprites.Pickup;
import sprites.Player;
import sprites.Obstacle;
import sprites.Weapon;

class PlayState extends FlxState
{
	private var player:Player;
	private var pickup:Pickup;
	private var whip:Weapon;
	private var platform:Obstacle;
	private var enemy1:Enemy;
	
	override public function create():Void
	{
		super.create();
		
		FlxG.mouse.visible = false;
		
		whip = new Weapon();
		whip.kill();
		pickup = new Pickup(50, 150);
		platform = new Obstacle(0, 200);
		platform.makeGraphic(FlxG.width, 16, 0xFF00FFFF);
		platform.immovable = true;
		
		player = new Player(100, 100);
		
		add(platform);
		add(player);
		add(pickup);
	}

	override public function update(elapsed:Float):Void
	{	
		FlxG.collide (platform, player);
		
		if (FlxG.overlap(pickup, player))
		{
			player.recibeTipo(pickup.getT());
			pickup.destroy ();
		}
		/*if (!pickup.exists)
		{
			pickup = new Pickup(150, 150);
			add (pickup);
		}*/
		if (FlxG.keys.justPressed.A)
		{
			whip.revive();
			if (player.flipX)
			{
				whip.x = player.x + player.width + 150;
				whip.y = player.y + player.width / 2;
				whip.animation.play("attack");
			}
			else
			{
				whip.x = player.x + player.width;
				whip.y = player.y + player.width / 2;
				whip.animation.play("attack");
			}
			
			add (whip);
		}
		
		if (whip.animation.finished)
		{
			whip.kill();
		}
		super.update(elapsed);
		if (whip.alive)
		{
			if (player.flipX)
			{
				whip.x = player.x - player.width;
				whip.flipX = true;
				whip.y = player.y + player.width / 2;
			}
			else
			{
				whip.x = player.x + player.width;
				whip.flipX = false;
				whip.y = player.y + player.width / 2;
			}
			
			
		}
	}
}
