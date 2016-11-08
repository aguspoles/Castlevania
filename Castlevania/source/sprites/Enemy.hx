package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;


class Enemy extends FlxSprite
{
	private var timer:Int = 0;
	private var direction:Int = 0;
	private var vida:Int = 0;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic (16, 16);
	}
	
}