package
{
	import org.flixel.*;
	
	[SWF(width="640", height="500", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
	
	
	public class JumpinJonnie extends FlxGame
	{
		public function JumpinJonnie()
		{
			super(640,500,MenuState,1);
			//forceDebugger = true;
			//FlxG.visualDebug = true;
			//FlxG.debug = true;
		}
	}
}