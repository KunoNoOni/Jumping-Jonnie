package
{
	import org.flixel.*;
	
	public class CreditsState extends FlxState
	{
		private var stop:int = -550;

		private var line1:FlxText;
		
		public function CreditsState()
		{
			super();
		}
		
		override public function create():void
		{
			line1 = new FlxText(60,FlxG.height, FlxG.width - 100, "Produced/Directed/Programmed/Sound\nWilliam LaGamba (KunoNoOni)\n\n\n\n\n\n\n\n\n\nThanks for Playing!\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nPRESS [x] PLAY AGAIN");
			line1.setFormat(null,20,0xFF0000, "center");
			add(line1);
		}
		
		override public function update():void
		{
			if(line1.y > stop)
				line1.velocity.y = -20;
			else
				line1.velocity.y = 0;
			if(FlxG.keys.X)
				FlxG.switchState(new StoryState());	//<--- using new state change code for flixel 2.5		
			super.update();
		}
	}
}