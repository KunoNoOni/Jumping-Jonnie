package 
{
	import org.flixel.*;

	public class Jonnie extends FlxSprite
	{	
		private var _jump:int;
		
		public function Jonnie(X:Number,Y:Number)
		{
			super(X*20, Y*20);
			loadGraphic(Registry._player,true,true,20,20);
			addAnimation("standing",[0],15);
			addAnimation("running",[1,2,3],15,true);
			addAnimation("jumping",[4],15,true);
			
			this.maxVelocity.x = 100;
			this.maxVelocity.y = 400;
			this.acceleration.y = 450;
			this.offset.x = 5;
			this.offset.y = 10;
			this.width = 10;
			this.height = 10;

		}
		
		override public function update():void
		{
			//this.acceleration.x = 0;
			this.velocity.x = 0;
			
			if(!Registry.doorVisible || !Registry.textVisible)
			{
			 	if(FlxG.keys.A || FlxG.keys.LEFT)
				{
					this.facing = LEFT;
					//this.acceleration.x = -this.maxVelocity.x*4;
					this.velocity.x = -this.maxVelocity.x;
				}
				
				if(FlxG.keys.D || FlxG.keys.RIGHT)
				{
					this.facing = RIGHT;
					//this.acceleration.x = this.maxVelocity.x*4;
					this.velocity.x = this.maxVelocity.x;
				}
				
				if(FlxG.keys.justPressed('SPACE') && Registry.onGround)
				{
					FlxG.play(Registry._jump,.2);
					this.velocity.y = -this.maxVelocity.y/2;
				}
			}
			
			if(this.velocity.y != 0)
				this.play("jumping");
			else if(this.velocity.x == 0)
				this.play("standing");
			else
				this.play("running");
			super.update();
		}
		
	}
}