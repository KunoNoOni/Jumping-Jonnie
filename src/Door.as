package
{
	import org.flixel.*;
	
	public class Door extends FlxSprite
	{
		
		public function Door(X:Number=0,Y:Number=0)
		{
			super(X*20,Y*20);
			loadGraphic(Registry._door,false,false,20,20);
	
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