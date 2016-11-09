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
		velocity.y = 0;
		
		loadGraphic(AssetPaths.batps__png, true, 24, 24);
		animation.add("main", [0, 1, 2, 3] , 16 , true);
		animation.play("main");
		
		
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