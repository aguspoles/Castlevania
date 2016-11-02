package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;


class Player extends FlxSprite
{
	public  var direction:Int = 1;
	private var pickup:Int = 5;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		makeGraphic(16, 32);
		
		acceleration.y = Reg.vAccel;
	}
	
	override public function update(elapsed:Float):Void 
	{		
		move();
		switch pickup
		{
			case 0:
				makeGraphic(16, 32, 0xFF00FFFF); //provisional
			
			case 1:
				makeGraphic(16, 32, 0xFFFF0000); //provisional
			
			case 2:
				makeGraphic(16, 32, 0xFF0000FF); //provisional
			
			case 3:
				makeGraphic(16, 32, 0xFFFFFFFF); //provisional
			
			
			
		}
		
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
	public function recibeTipo(a:Int):Void
	{
		pickup = a;
	}
	
}
