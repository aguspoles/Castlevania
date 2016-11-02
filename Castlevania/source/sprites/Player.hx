package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;


class Player extends FlxSprite
{
	public var direction:Int = 1;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		makeGraphic(16, 32);
		
		acceleration.y = Reg.vAccel;
	}
	
	override public function update(elapsed:Float):Void 
	{		
		move();	
		
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
}
