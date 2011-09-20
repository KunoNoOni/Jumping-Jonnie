package
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public class GameOverState extends FlxState
	{
		
		public function GameOverState()
		{
			super();
		}
		
		override public function create():void
		{
	
			var logo:FlxText = new FlxText(FlxG.width*0.5 - 200, 150, 400, "GAME OVER");
			logo.setFormat(null,40,0xFFFFFF, "center");
			add(logo);
			
			var instruct:FlxText = new FlxText(FlxG.width*0.5 - 200, 220, 400, "PRESS [x] TO RESTART");
			instruct.setFormat(null,20,0xFF0000, "center");
			add(instruct);
		}
		
		override public function update():void
		{
			if(FlxG.keys.X)
			{
				Registry.lives = 5;
				Registry.currLvl = 1;
				Registry.score = 0;
				FlxG.switchState(new PlayState()); //<--- using new state change code for flixel 2.5
			}
			super.update();
		}
	}
}