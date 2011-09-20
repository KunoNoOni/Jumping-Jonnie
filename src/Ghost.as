package
{
	import org.flixel.*;
	
	public class Ghost extends FlxSprite
	{
		
		public function Ghost(X:Number=0,Y:Number=0)
		{
			super(X*20,Y*20);
			loadGraphic(Registry._ghost,true,true,20,20);
			addAnimation("float",[0,1,2],15);
			
			this.maxVelocity.x = 50;
			this.drag.x = this.maxVelocity.x*4;
		}
		
		override public function update():void
		{
			FlxG.overlap(this,Registry.lwaypoints,goRight);
			FlxG.overlap(this,Registry.rwaypoints,goLeft);
			
			this.acceleration.x = this.maxVelocity.x*4;
			this.play('float');
			
			if(Registry.ghostRWaypoint)
			{
				this.facing = LEFT;
				this.acceleration.x = -this.maxVelocity.x*4;
			}
			if(Registry.ghostLWaypoint)
			{
				this.facing = RIGHT;
				this.acceleration.x = this.maxVelocity.x*4;
			}	
			
			super.update();
		}
		
		private function goRight(e:FlxSprite, w:FlxSprite):void
		{
			//trace("goRight called!");
			Registry.ghostLWaypoint = true;
			Registry.ghostRWaypoint = false;
		}
		
		private function goLeft(e:FlxSprite, w:FlxSprite):void 
		{
			//trace("goLeft called!");
			Registry.ghostRWaypoint = true;
			Registry.ghostLWaypoint = false;
		}
		
	}
}