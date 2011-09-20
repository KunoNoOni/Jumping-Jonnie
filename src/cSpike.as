package
{
	import org.flixel.*;
	
	public class cSpike extends FlxSprite
	{
		
		public function cSpike(X:Number=0,Y:Number=0)
		{
			super(X*20,Y*20);
			loadGraphic(Registry._cSpike,false,false,20,20);
	
		}
		
		override public function update():void
		{
			/*velocity.x = 0;
			velocity.y = 0;
			this.play("estanding");*/
			
			super.update();
		}
	}
}