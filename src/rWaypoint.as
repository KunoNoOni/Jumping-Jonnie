package
{
	import org.flixel.*;
	
	public class rWaypoint extends FlxSprite
	{
		public function rWaypoint(X:Number=0,Y:Number=0)
		{
			super(X*20,Y*20)
			loadGraphic(Registry._rWaypoint,false,false,20,20);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}