package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import sprites.Axe;
import sprites.Dagger;
import sprites.Enemy;
import sprites.Pickup;
import sprites.Player;
import sprites.Obstacle;
import sprites.Weapon;

class PlayState extends FlxState
{
	private var player:Player;
	private var aS:Int;
	private var pickup:Pickup;
	private var whip:Weapon;
	private var platform:Obstacle;
	private var enemy1:Enemy;
	private var dagger:Dagger;
	private var axe:Axe;
	
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
		
		aS = player.getArmaSec();
		
		add(platform);
		add(player);
		add(pickup);
	}

	override public function update(elapsed:Float):Void
	{	
		FlxG.collide (platform, player);
		armaSec();
		basico();
		super.update(elapsed);
	}
	public function basico ():Void
	{
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
	public function armaSec ():Void
	{
		aS = player.getArmaSec();
		
		if (FlxG.overlap(pickup, player))
		{
			player.recibeTipo(pickup.getT());
			pickup.destroy ();
		}
		if (!pickup.exists)
		{
			pickup = new Pickup(150, 150);
			add (pickup);
		}
		
		if (aS == 0)
		{
			if (FlxG.keys.justPressed.S)
			{
				dagger = new Dagger (player.x + player.width, whip.y = player.y + player.width / 2);
				add(dagger);
				aS = 5;
			}
		}
		
		if (aS == 1)
		{
			if (FlxG.keys.justPressed.S)
				{
					axe = new Axe (player.x + player.width, whip.y = player.y + player.width / 2);
					add(axe);
					aS = 5;
				}
		}
	}
}
