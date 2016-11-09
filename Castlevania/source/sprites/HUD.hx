package sprites;

import flixel.FlxBasic; 
import flixel.FlxG; 
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText; 
import flixel.math.FlxPoint; 
import flixel.util.FlxColor;

class HUD extends FlxSpriteGroup 
{    
	private var _textScore:FlxText;
	private var _textLives:FlxText; 
	static inline var OFFSET:Int = 4;
	
    public function new()    
	{        
		super();                
		_textScore = new FlxText(OFFSET, OFFSET, 0);    
	    _textLives = new FlxText(OFFSET+100, OFFSET, 0);
		add(_textScore);
		add(_textLives);
        _textScore.scrollFactor = FlxPoint.get(0, 0);
		_textLives.scrollFactor = FlxPoint.get(0, 0);
		
	}
	
    override public function update(elapsed:Float)   
	{        
		_textScore.text = "SCORE\n" + (Reg.score);
		_textLives.text = "LIVES\n" + (Reg.lives);
		super.update(elapsed);    	
	} 
	
}
