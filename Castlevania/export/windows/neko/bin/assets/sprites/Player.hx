package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Player extends FlxSprite
{
	

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		
	}
	
	override public function update (elapsed:Float):Void
	{
		if (FlxG.keys.pressed.D)
		{
			velocity.x = 5;
		}
		
		if (FlxG.keys.pressed.A)
		{
			velocity.x = -5;
		}
		
		
		
	}
	
}