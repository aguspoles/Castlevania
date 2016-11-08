package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.math.FlxRandom;


class Player extends FlxSprite
{
	public var direction:Int = 1;
	private var vidas = 10;
	private var pickup:Int = 5;
	private var armaSec:FlxRandom;
	private var aS:Int;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		armaSec = new FlxRandom();
		makeGraphic(16, 32);
		
		acceleration.y = Reg.vAccel;
	}
	
	override public function update(elapsed:Float):Void 
	{		
		move();
		fPickup();

		super.update(elapsed);
	}
	
	public function move():Void
	{
		velocity.x = 0;
		
		if (FlxG.keys.pressed.RIGHT){
			velocity.x += Reg.hSpeed;
			direction = 1;
			flipX = false;
		}
		
		if (FlxG.keys.pressed.LEFT){
			velocity.x -= Reg.hSpeed;
			direction = -1;
			flipX = true;
		}
		
		if (FlxG.keys.justPressed.UP && isTouching(FlxObject.FLOOR))
			velocity.y = Reg.vSpeed;
			
		if ((velocity.y < 0) && (FlxG.keys.justReleased.UP))       
		    velocity.y = velocity.y * 0.5;
	}
	
	public function interact(enemy:Enemy):Void
	{
		if (FlxG.overlap(this, enemy))
		{
			this.kill();
		}
	}
	
	public function fPickup ():Void
	{
		switch pickup
		{
			case 0:
				vidas += 3;
				aS = armaSec.int (0, 1);
				pickup = 5;
			
			case 1:
				aS = armaSec.int (0, 1);
				pickup = 5;
			
			case 2:
				makeGraphic(16, 32, 0xFF0000FF); //provisional
				aS = armaSec.int (0, 1);
				pickup = 5;
		}
	}
	
	public function recibeTipo(a:Int):Void
	{
		pickup = a;
	}
	
	public function getArmaSec ():Int
	{
		return aS;
	}
}
