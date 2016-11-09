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
		super(?X, ?Y, ?SimpleGraphic);
		vida = 1;
	}
	
	override public function update(elapsed:Float):Void 
	{
		move();
	}

}