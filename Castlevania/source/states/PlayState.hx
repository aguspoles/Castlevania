package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.group.FlxGroup;
import flixel.FlxCamera;
import flixel.addons.editors.ogmo.FlxOgmoLoader;//para cargar el nivel de ogmo
import flixel.tile.FlxTilemap;//para usarlo
import flixel.FlxObject;
import sprites.Enemy;
import sprites.Player;
import sprites.Obstacle;
import sprites.Weapon;
import sprites.Dagger;
import sprites.Axe;
import sprites.Pickup;

class PlayState extends FlxState
{
	private var tilemap:FlxTilemap;
	private var loader:FlxOgmoLoader;
	private var player:Player;
	private var enemys:FlxTypedGroup<Enemy>;
	private var whip:Weapon;
	private var platform:Obstacle;
	private var dagger:Dagger;
	private var axe:Axe;
	private var aS:Int;
	private var pickup:Pickup;
	
	override public function create():Void
	{
		super.create();
		//FlxG.debugger.visible = true;
		FlxG.cameras.bgColor = 0xff0078f8;
		FlxG.mouse.visible = false;
		
		whip = new Weapon();
		whip.kill();
		
		enemys = new FlxTypedGroup<Enemy>();
		pickup = new Pickup(50, 150);
		
		loader = new FlxOgmoLoader(AssetPaths.level__oel);
		tilemap = loader.loadTilemap(AssetPaths.tiles2__png, 24, 24, "tiles");
		loader.loadEntities(entityCreator, "entities");
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(1, FlxObject.ANY);
		
		aS = player.getArmaSec();
		
		add(tilemap);
		add(player);
		add(enemys);
		add(pickup);
		FlxG.camera.follow(player, FlxCameraFollowStyle.PLATFORMER);
		FlxG.camera.setScrollBounds(0, tilemap.width, 0, tilemap.height);
		FlxG.worldBounds.set(0, 0, tilemap.width, tilemap.height);
	}

	override public function update(elapsed:Float):Void
	{	
		FlxG.collide(tilemap, player);
		FlxG.collide(tilemap, enemys);
		whipEnemyCollision(whip, enemys);
		FlxG.overlap(player, enemys, playerEnemyCollision);
		
		armaSec();
		
		super.update(elapsed);
		
		basico();
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
	
	private function whipEnemyCollision(whip:Weapon, enemys:FlxTypedGroup<Enemy>):Void
	{
		for (i in 0...enemys.length)
		{
			if(FlxG.overlap(enemys.members[i],whip))
			   whip.interact(enemys.members[i]);
		}
	}
	
	private function playerEnemyCollision(player:Player, enemys:FlxTypedGroup<Enemy>):Void
	{
	    player.kill();
	}
	
	private function entityCreator(entityName:String, entityData:Xml):Void
	{
		//	Parseo la X y la Y de cada entidad en el nivel de OGMO
		var entityStartX:Float = Std.parseFloat(entityData.get("x"));
		var entityStartY:Float = Std.parseFloat(entityData.get("y"));
		
		//	Me fijo qué tipo de entidad tengo que inicializar...
		switch(entityName)
		{
			//	...y creo la entidad y seteo sus cosillas.
			case "player":
				player = new Player(entityStartX, entityStartY);
			case "enemigo1":
				    enemys.add(new Enemy(entityStartX, entityStartY));
			case "enemigo2":
				    enemys.add(new Enemy(entityStartX, entityStartY));
			case "enemigo3":
				    enemys.add(new Enemy(entityStartX, entityStartY));
			case "boss":
				    enemys.add(new Enemy(entityStartX, entityStartY));
			/*case "desaparese":
				    add(entityStartX, entityStartY));
			case "semueve":
				    add(entityStartX, entityStartY));*/
		}

	}

}
