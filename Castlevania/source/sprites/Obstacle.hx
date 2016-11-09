package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxObject;


class Obstacle extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(24, 24);
		velocity.x = -150;
	}
	
	override public function update(elapsed:Float) 
	{    
		if (justTouched(FlxObject.WALL))
            velocity.x *= -1;
			
        super.update(elapsed);
	}
	
}