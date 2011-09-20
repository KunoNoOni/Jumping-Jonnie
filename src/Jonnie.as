package 
{
	import org.flixel.*;

	public class Jonnie extends FlxSprite
	{	
		public function Jonnie(X:Number,Y:Number)
		{
			super(X*20, Y*20);
			loadGraphic(Registry._player,true,true,20,20);
			addAnimation("standing",[0],15);
			addAnimation("running",[1,2,3],15,true);
			addAnimation("jumping",[4],15,true);
			
			this.maxVelocity.x = 100;
			this.maxVelocity.y = 450;
			this.acceleration.y = 450;
			this.drag.x = this.maxVelocity.x*4;

		}
		
		override public function update():void
		{
			this.acceleration.x = 0;
		
		 	if(FlxG.keys.A || FlxG.keys.LEFT)
			{
				this.facing = LEFT;
				this.acceleration.x = -this.maxVelocity.x*4;
			}
			
			if(FlxG.keys.D || FlxG.keys.RIGHT)
			{
				this.facing = RIGHT;
				this.acceleration.x = this.maxVelocity.x*4;

			}
			
			if(FlxG.keys.justPressed('SPACE') && Registry.onGround)
			{
				FlxG.play(Registry._jump,.2);
				this.velocity.y = -this.maxVelocity.y/2;
			}
			if(this.velocity.y != 0)
				this.play("jumping");
			else if(this.acceleration.x == 0)
				this.play("standing");
			else
				this.play("running");
			super.update();
		}
		
	}
}