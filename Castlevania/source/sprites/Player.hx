package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;

/**
 * ...
 * @author ...
 */
class Player extends FlxSprite
{
	public var whip:Weapon;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		makeGraphic(16, 32);
		
		acceleration.y = Reg.vAccel;
	}
	
	override public function update(elapsed:Float):Void 
	{		
		velocity.x = 0;
		
		if (FlxG.keys.pressed.RIGHT)
			velocity.x += Reg.hSpeed;
		
		if (FlxG.keys.pressed.LEFT)
			velocity.x -= Reg.hSpeed;
		
		if (FlxG.keys.justPressed.UP && isTouching(FlxObject.FLOOR))
			velocity.y = Reg.vSpeed;
			
		
		super.update(elapsed);
	}
	
}
