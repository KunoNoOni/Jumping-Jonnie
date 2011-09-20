package
{
	import org.flixel.*;
	
	public class Bat extends FlxSprite
	{
		
		public function Bat(X:Number=0,Y:Number=0)
		{
			super(X*20,Y*20);
			loadGraphic(Registry._bat,true,false,20,20);
			addAnimation("flying",[0,1,2],15);
			
			this.maxVelocity.x = 50;
			this.drag.x = this.maxVelocity.x*4;
	
		}
		
		override public function update():void
		{
			FlxG.overlap(this,Registry.lwaypoints,goRight);
			FlxG.overlap(this,Registry.rwaypoints,goLeft);
			
			this.acceleration.x = this.maxVelocity.x*4;
			this.play('flying');
			
			if(Registry.batRWaypoint)
			{
				this.facing = LEFT;
				this.acceleration.x = -this.maxVelocity.x*4;
			}
			if(Registry.batLWaypoint)
			{
				this.facing = RIGHT;
				this.acceleration.x = this.maxVelocity.x*4;
			}	
			
			super.update();
		}
		
		private function goRight(e:FlxSprite, w:FlxSprite):void
		{
			//trace("goRight called!");
			Registry.batLWaypoint = true;
			Registry.batRWaypoint = false;
		}
		
		private function goLeft(e:FlxSprite, w:FlxSprite):void 
		{
			//trace("goLeft called!");
			Registry.batRWaypoint = true;
			Registry.batLWaypoint = false;
		}
	}
}