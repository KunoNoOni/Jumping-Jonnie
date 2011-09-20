package
{
	import org.flixel.*;
	
	public class lWaypoint extends FlxSprite
	{
		public function lWaypoint(X:Number=0,Y:Number=0)
		{
			super(X*20,Y*20)
			loadGraphic(Registry._lWaypoint,false,false,20,20);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}