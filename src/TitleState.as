package
{
	import org.flixel.*;
		
	public class TitleState extends FlxState
	{
		//Variables got here
		public var myTitle:FlxSprite;
		
		public function TitleState()
		{
			super();
		}
		
		override public function create():void
		{	
			myTitle = new FlxSprite(0,0,Registry._title);
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