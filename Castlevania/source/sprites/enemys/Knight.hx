package sprites.enemys;


class Knight extends Enemy
{

	public function new() 
	{
		
	}
	
	public function move():Void
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