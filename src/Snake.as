package
{
	import org.flixel.*;
	
	public class Snake extends FlxSprite
	{
		
		public function Snake(X:Number=0,Y:Number=0)
		{
			super(X*20,Y*20);
			loadGraphic(Registry._snake,true,true,20,20);
			addAnimation("slither",[0,1,2],15);
			
			this.maxVelocity.x = 50;
			this.drag.x = this.maxVelocity.x*4;
	
		}
		
		override public function update():void
		{
			FlxG.overlap(this,Registry.lwaypoints,goRight);
			FlxG.overlap(this,Registry.rwaypoints,goLeft);
			
			this.acceleration.x = this.maxVelocity.x*4;
			this.play('slither');
			
			if(Registry.snakeRWaypoint)
			{
				this.facing = LEFT;
				this.acceleration.x = -this.maxVelocity.x*4;
			}
			if(Registry.snakeLWaypoint)
			{
				this.facing = RIGHT;
				this.acceleration.x = this.maxVelocity.x*4;
			}	
			
			super.update();
		}
		
		private function goRight(e:FlxSprite, w:FlxSprite):void
		{
			//trace("goRight called!");
			Registry.snakeLWaypoint = true;
			Registry.snakeRWaypoint = false;
		}
		
		private function goLeft(e:FlxSprite, w:FlxSprite):void 
		{
			//trace("goLeft called!");
			Registry.snakeRWaypoint = true;
			Registry.snakeLWaypoint = false;
		}
	}
}