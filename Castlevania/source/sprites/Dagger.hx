package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;


class Dagger extends FlxSprite
{
	public var ammo:Int = 5;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic (10, 10);
		velocity.x = 300;
	}
	
}