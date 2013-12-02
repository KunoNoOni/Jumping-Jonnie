package
{
	import org.flixel.*;
	
	public class Ghost extends FlxSprite
	{
		private var leftWall:int=0;
		private var rightWall:int=0;
		
		public function Ghost(X:Number=0,Y:Number=0)
		{
			super(X*20,Y*20);
			loadGraphic(Registry._ghost,true,true,20,20);
			addAnimation("float",[0,1,2],15);
			this.facing = LEFT;
			this.maxVelocity.x = 50;
			this.drag.x = this.maxVelocity.x*4;
			
			this.width = 12;
			this.height = 12;
			this.centerOffsets(true);
		}
		
		override public function update():void
		{
			leftWall = PlayState.level.getTile(Math.floor(this.x/Registry.tileWidth)-1, Math.floor(this.y/Registry.tileHeight));
			rightWall = PlayState.level.getTile(Math.floor(this.x/Registry.tileWidth)+1, Math.floor(this.y/Registry.tileHeight));
			
			if(this.facing == LEFT)
			{
				this.acceleration.x = -this.maxVelocity.x*4;
				if(leftWall == 15)
				{
					changeDirection();
				}
			}
			else if(this.facing == RIGHT)
			{
				this.acceleration.x = this.maxVelocity.x*4;
				if(rightWall == 15)
				{
					changeDirection();
				}
			}
			
			this.play('float');
			super.update();
		}
		
		private function changeDirection():void
		{
			if(this.facing == LEFT)
			{	
				//trace("ABOUT FACE RIGHT!");
				this.facing = RIGHT;
				this.acceleration.x = this.maxVelocity.x*4;
			}
			else if(this.facing == RIGHT)
			{
				//trace("ABOUT FACE LEFT!");
				this.facing = LEFT;
				this.acceleration.x = -this.maxVelocity.x*4;
			}
		}
	}
}