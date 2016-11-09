package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxObject;


class Enemy extends FlxSprite
{
	private var _direction:Int = -1;    
	private var _appeared:Bool = false;
	
	private var timer:Int = 0;
	private var direction:Int = 0;
	private var vida:Int = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic (16, 16);
		acceleration.y = Reg.vAccel;
	}
	
	override public function update(elapsed:Float) 
	{    
		if (!inWorldBounds())
		    exists = false;
        if (isOnScreen()) 
	        _appeared = true;
	    if (_appeared && alive)    
	    {   
		    if (justTouched(FlxObject.WALL))           
		        flipDirection();        
	    }
		
        super.update(elapsed);
	}
	
    private function flipDirection() 
	{    
		flipX = !flipX;   
		_direction = -_direction; 
	}
}