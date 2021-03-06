package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;


class Axe extends FlxSprite
{
	public var ammo:Int = 5;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic (10, 10);
		velocity.x = 150;
		velocity.y = -350;
		acceleration.y = Reg.vAccel;
	}
	
}