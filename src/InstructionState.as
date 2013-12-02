package
{
	import org.flixel.*;
	
	public class InstructionState extends FlxState
	{
		//Variables got here
		
		public function InstructionState()
		{
			super();
		}
		
		override public function create():void
		{
			var heading:FlxText = new FlxText(FlxG.width*.5-125,25, 250, "INSTRUCTIONS");
			heading.setFormat(null,25,0xFF0000, "center");
			add(heading);
			var body:FlxText = new FlxText(FlxG.width*.5-320,60, 640, "Jonnie will need to successfully navigate 10 levels to save Jennie.\n\nEach level is filled" +
				" with Energy Balls which Jonnie will need to collect to power the door to the next level.\n\nThe levels have many enemies, which " +
				"Icks McBad has enhanced to stop Jonnie. If they touch Jonnie they will send him back in time to before he started the current floor. They will do " +
				"this 5 times before making Jonnie start over from the very first floor.");
			body.setFormat(null,20,0xFF0000, "center");
			add(body);
			var ending:FlxText = new FlxText(FlxG.width*.5-320,390, 640, "You control Jonnie with the arrow keys and use the spacebar to jump.");
			ending.setFormat(null,20,0x00FF00, "center");
			add(ending);
			
			
			var instruct:FlxText = new FlxText(FlxG.width*.5-150,450, 300, "PRESS [x] TO PLAY");
			instruct.setFormat(null,25,0xFFFFFF, "center");
			add(instruct);
		}
		
		override public function update():void
		{
			if(FlxG.keys.X)
				FlxG.switchState(new PlayState());	
			super.update();
		}
	}
}