
package sprites.enemys;

import sprites.Enemy;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;

class Knight extends Enemy
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

}