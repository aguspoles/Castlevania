
package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

class Weapon extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Hacha__png, true, 100, 64);
		animation.add("attack", [0, 1, 2, 3, 3 ], 12, false, false, false);
		
		setSize(40, 40);
		offset.x = 50;
		offset.y = 20;
		
		
	}
	
	override public function update(elapsed: Float){
		super.update(elapsed);
		if (animation.finished){
			
			this.kill();
			
		}
		
		
		
	}
	
	public function interact(enemy:Enemy):Void
	{
		if (animation.frameIndex == 3){
			//CHEQUEAR SI FUNCA.
		if (FlxG.overlap(this, enemy))
		{
			enemy.kill();
		}
		
		}
	}

	/*public function interact(enemy:Enemy):Void
	{
		enemy.kill();
		Reg.score += 10;
	}*/
}