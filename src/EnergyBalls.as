package
{
	import org.flixel.*;
	
	public class EnergyBalls extends FlxSprite
	{
		
		public function EnergyBalls(X:Number=0,Y:Number=0)
		{
			super(X*20,Y*20);
			loadGraphic(Registry._energyBall,false,false,6,10);
			
			this.x = x+7;
			this.width = 6;
			this.height = 20;
			this.offset.y = -10;
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}