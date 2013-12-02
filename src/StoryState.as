package
{
	import org.flixel.*;
	
	public class StoryState extends FlxState
	{
		//Variables got here
		
		public function StoryState()
		{
			super();
		}
		
		override public function create():void
		{
			var heading:FlxText = new FlxText(25,25, 150, "Jonnie,");
			heading.setFormat(null,25,0xFF0000, "left");
			add(heading);
			var body:FlxText = new FlxText(70,125, 500, "I have your girl, Jennie! If you want to see her alive again come to the old tower on top of Misery Mountain.");
			body.setFormat(null,25,0xFF0000, "center");
			add(body);
			var ending:FlxText = new FlxText(400,300, 200, "Icks McBad");
			ending.setFormat(null,25,0xFF0000, "right");
			add(ending);
			
			var instruct:FlxText = new FlxText(75,400, 500, "PRESS [i] FOR INSTRUCTIONS");
			instruct.setFormat(null,25,0x00FF00, "center");
			add(instruct);
			
			var play:FlxText = new FlxText(175,450, 300, "PRESS [x] TO PLAY");
			play.setFormat(null,25,0xFFFFFF, "center");
			add(play);
		}
		
		override public function update():void
		{
			if(FlxG.keys.X)
				FlxG.switchState(new PlayState());
			if(FlxG.keys.I)
				FlxG.switchState(new InstructionState());
			super.update();
		}
	}
}