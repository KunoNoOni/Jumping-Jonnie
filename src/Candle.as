package
{
	import org.flixel.*;
	
	public class Candle extends FlxSprite
	{
		public function Candle(X:Number=0,Y:Number=0)
		{
			super(X*20,Y*20);
			loadGraphic(Registry._candle,true,false,20,20);
			addAnimation("burning",[0,1],3);
		}
		
		override public function update():void
		{
			this.play('burning');
			super.update();
		}
	}
}