package
{
	import org.flixel.*;
		
	public class MenuState extends FlxState
	{
		//Variables got here
		public var myTitle:Title = new Title();
		
		public function MenuState()
		{
			super();
		}
		
		override public function create():void
		{
			/*var logo:FlxText = new FlxText(FlxG.width*0.5-180,FlxG.height*0.5-90, 200, "Jumpin' Jonnie");
			logo.setFormat(null,10,0xFFFFFF, "center");
			add(logo);
			
			var instruct:FlxText = new FlxText(FlxG.width*0.5-180,FlxG.height*0.5-70, 200, "PRESS [x] TO START");
			instruct.setFormat(null,10,0xFF0000, "center");
			add(instruct);*/
			
			myTitle.loadGraphic(Registry._title,false,false);
			add(myTitle);
			
			
		}
		
		override public function update():void
		{
			if(FlxG.keys.X)
				FlxG.switchState(new StoryState());	//<--- using new state change code for flixel 2.5		
			super.update();
		}
	}
}