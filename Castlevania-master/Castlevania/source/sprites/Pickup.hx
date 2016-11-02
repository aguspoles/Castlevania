package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxRandom;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Pickup extends FlxSprite
{
	private var tipo:FlxRandom = new FlxRandom();
	private var t:Int;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		t = tipo.int (0, 2);
		makeGraphic (5, 5);
	}
	
	override public function update (elapsed:Float) :Void
	{
		
	}
	public function getT () :Int
	{
		return t;
	}
	
	
}