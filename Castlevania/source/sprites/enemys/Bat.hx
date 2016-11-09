package sprites.enemys;

import sprites.Enemy;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;

class Bat extends Enemy
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (!inWorldBounds())
		    exists = false;
        if (isOnScreen()) 
	        _appeared = true;
	    if (_appeared && alive)    
	    {   
			move();
			
		    if (justTouched(FlxObject.WALL)) 
				flipDirection();
	    }
		super.update(elapsed);
	}
	
	override public function move ():Void
	{
		timer++;
		velocity.x = 100;
		if (timer <= 20)
		{
			velocity.y = -velocity.x;
		}
		
		else if (timer > 20 && timer <= 40)
		{
			velocity.y = velocity.x;
		}
		
	}
}