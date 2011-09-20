package
{
	import org.flixel.*;
	
	public class Spider extends FlxSprite
	{
		
		public function Spider(X:Number=0,Y:Number=0)
		{
			super(X*20,Y*20);
			loadGraphic(Registry._spider,true,false,20,20);
			addAnimation("crawl",[0,1,2],15);
			
			this.maxVelocity.x = 50;
			this.drag.x = this.maxVelocity.x*4;
		}
		
		override public function update():void
		{
			FlxG.overlap(this,Registry.lwaypoints,goRight);
			FlxG.overlap(this,Registry.rwaypoints,goLeft);
			
			this.acceleration.x = this.maxVelocity.x*4;
			this.play('crawl');
			
			if(Registry.spiderRWaypoint)
			{
				this.facing = LEFT;
				this.acceleration.x = -this.maxVelocity.x*4;
			}
			if(Registry.spiderLWaypoint)
			{
				this.facing = RIGHT;
				this.acceleration.x = this.maxVelocity.x*4;
			}	
			
			super.update();
		}
		
		private function goRight(e:FlxSprite, w:FlxSprite):void
		{
			//trace("goRight called!");
			Registry.spiderLWaypoint = true;
			Registry.spiderRWaypoint = false;
		}
		
		private function goLeft(e:FlxSprite, w:FlxSprite):void 
		{
			//trace("goLeft called!");
			Registry.spiderRWaypoint = true;
			Registry.spiderLWaypoint = false;
		}
	}
}