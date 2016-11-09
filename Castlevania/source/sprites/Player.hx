package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.math.FlxRandom;


class Player extends FlxSprite
{
	public var direction:Int = 0;
	private var vidas = 10;
	private var pickup:Int = 5;
	private var armaSec:FlxRandom = new FlxRandom();
	private var aS:Int;
	private var auxdir: Float;
	public var hacha : Weapon;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		loadGraphic(AssetPaths.player__png, true, 64, 64);
		animation.add("caminata", [4,5, 6,7, 8, 9, 10, 11],10);
		animation.add("parado", [64], 4);
		animation.play("parado");
		animation.add("saltito", [ 43, 44, 45], 1, false) ;
		animation.add("hachazo", [28, 24, 25 , 25, 24 , 14] , 15, false); 
		acceleration.y = Reg.vAccel;
		set_width(24);
		centerOffsets();
		hacha = new Weapon();
		hacha.kill();
		FlxG.state.add(hacha);
	}
	
	override public function update(elapsed:Float):Void 
	{	
		super.update(elapsed);
		move();
		fPickup();
		basico();
		
	}
	public function basico ():Void
	{
		if (FlxG.keys.justPressed.A)
		{
			
			animation.play("hachazo");
			direction = 3;
		}
		
		if (animation.curAnim == animation.getByName("hachazo") && animation.frameIndex == 25){
			
			hacha.revive();
		    hacha.flipX = flipX;
			hacha.x = x + width  ;
			hacha.y = y - 10 ;
			hacha.animation.play("attack");
		}
		
		
		if (hacha.animation.finished){
			
			direction = 0;
		}
		
	}
	public function move():Void
	{
		velocity.x = 0;
		
	
		if (FlxG.keys.pressed.RIGHT && direction != 2 && direction != 3){
			velocity.x += Reg.hSpeed;
			if (direction != 1)
			{
				
				animation.play("caminata");
				
			}
			direction = 1;
			flipX = false;
		}
		if (FlxG.keys.pressed.LEFT && direction != 2 && direction != 3){
			velocity.x -= Reg.hSpeed;
			if (direction != -1) {
			
				animation.play("caminata");
				
			}
			direction = -1;
			flipX = true;
		}
		if (direction == 2) {
			velocity.x = auxdir;
		}

		if (isTouching(FlxObject.FLOOR)) {
			trace("SI SALE ESTO DEBERIA ESTAR FUNCIONANDO BIEN EL PLAYER");
			if (direction == 2) {
				direction = 0;	
			}
		}
		
		if (velocity.x == 0 && direction != 2 && direction != 3) {
		    
			animation.play("parado");
			direction = 0;
		}
		
		
		if (FlxG.keys.justPressed.UP && isTouching(FlxObject.FLOOR) && direction != 3) {
			direction = 2;
			auxdir = velocity.x;
			velocity.y = Reg.vSpeed;
			animation.play("saltito");
		}
		
		if ((velocity.y < 0) && (FlxG.keys.justReleased.UP)) {     
		    velocity.y = velocity.y * 0.5;
		}
		

	}
	
	public function interact(enemy:Enemy):Void
	{
		if (FlxG.overlap(this, enemy))
		{
			this.kill();
		}
	}
	
	public function fPickup ():Void
	{
		switch pickup
		{
			case 0:
				vidas += 3;
				aS = armaSec.int (0, 1);
				pickup = 5;
			
			case 1:
				aS = armaSec.int (0, 1);
				pickup = 5;
			
			case 2:
				makeGraphic(16, 32, 0xFF0000FF); //provisional
				aS = armaSec.int (0, 1);
				pickup = 5;
		}
	}
	
	public function recibeTipo(a:Int):Void
	{
		pickup = a;
	}
	
	public function getArmaSec ():Int
	{
		return aS;
	}
}
