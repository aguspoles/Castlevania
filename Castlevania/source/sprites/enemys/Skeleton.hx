package source.sprites.enemys;

import sprites.Enemy;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;

class Skeleton extends Enemy
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
	
	public function move ():Void
	{
		timer++;
		
		if (timer <= 60 && isTouching(FlxObject.FLOOR))
		{
			velocity.x += Reg.hSpeed;
			direction = 1;
		}
		
		else if (timer > 60 && timer < 120 && isTouching(FlxObject.FLOOR)
		{
			velocity.x -= Reg.hSpeed;
			direction = -1;
			timer = 0;
		}
		
		else
		{
			direction = 0;
			velocity.x = 0;
		}
		
	}
}