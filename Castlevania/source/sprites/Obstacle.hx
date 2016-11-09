package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxObject;


class Obstacle extends FlxSprite
{

	private var speed:Int = 50;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(24, 24);
		velocity.x = speed;
	}
	
	override public function update(elapsed:Float) 
	{    
		if (justTouched(FlxObject.WALL))
		{
            velocity.x = speed * -1;
		}
        super.update(elapsed);
	}
	
}