package
{
	import org.flixel.*;

	public class WinGameState extends FlxState
	{
		public function WinGameState()
		{
			super();
		}
		
		override public function create():void
		{
			var line1:FlxText = new FlxText(55,25, 550, "So Jonnie saved Jennie from the clutches");
			line1.setFormat(null,20,0xFF0000, "center");
			add(line1);
			var line2:FlxText = new FlxText(55,60, 500, "of Icks McBad. As they walked out of the tower on Misery Mountain");
			line2.setFormat(null,20,0xFF0000, "center");
			add(line2);
			var line3:FlxText = new FlxText(55,120, 500, "Jonnie stopped and turned around. The tower was pitch black.");
			line3.setFormat(null,20,0xFF0000, "center");
			add(line3);
			var line4:FlxText = new FlxText(55,180, 500, "Jonnie shrugged and they began walking back down the mountain.");
			line4.setFormat(null,20,0xFF0000, "center");
			add(line4);
			var line5:FlxText = new FlxText(55,240, 500, "All of a sudden from atop the tower they heard a voice say");
			line5.setFormat(null,20,0xFF0000, "center");
			add(line5);
			var line6:FlxText = new FlxText(55,300, 500, "'I shall return! You haven't seen the last of Icks McBad!'");
			line6.setFormat(null,20,0xFF0000, "center");
			add(line6);
			var line7:FlxText = new FlxText(55,360, 500, "'Don't worry Jennie, we'll be ready for him next time!' said Jonnie");
			line7.setFormat(null,20,0xFF0000, "center");
			add(line7);
			var line8:FlxText = new FlxText(55,420, 500, "THE END...OR IS IT?");
			line8.setFormat(null,20,0xFF0000, "center");
			add(line8);
			
			var instruct:FlxText = new FlxText(135,450, 350, "PRESS [x] CONTINUE");
			instruct.setFormat(null,20,0xFFFFFF, "center");
			add(instruct);
		}
		
		override public function update():void
		{
			if(FlxG.keys.X)
				FlxG.switchState(new CreditsState());	//<--- using new state change code for flixel 2.5		
			super.update();
		}
	}
}