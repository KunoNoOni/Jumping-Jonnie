package
{
	import org.flixel.*;
	
	public class Jennie extends FlxSprite
	{
		private var counter:Number = 0;
		private var tick:Number = 0;
		
		public function Jennie(X:Number=0,Y:Number=0)
		{
			super(X*20,Y*20);
			loadGraphic(Registry._girl,true,false,20,20);
			addAnimation("stand",[0],15);
			addAnimation("scream0",[0],15);
			addAnimation("scream1",[1],15);
			addAnimation("scream2",[2],15);
			addAnimation("scream3",[3],15);
			addAnimation("scream4",[4],15);
			addAnimation("scream5",[5],15);
	
		}
		
		override public function update():void
		{
			velocity.x = 0;
			velocity.y = 0;
			delay();
			this.play("scream"+tick);

			super.update();
		}
		
		private function delay():void
		{
			counter += FlxG.elapsed;
			if (counter >= 1)
			{
				// After 2 seconds has passed, the timer will reset.
				counter = 0;
				tick +=1;
				if(tick > 5)
					tick = 0;
			}
		}
	}
}