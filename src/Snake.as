package
{
	import org.flixel.*;
	
	public class Snake extends FlxSprite
	{
		private var leftTile:int=0;
		private var rightTile:int=0;
		private var leftWall:int=0;
		private var rightWall:int=0;
		
		public function Snake(X:Number=0,Y:Number=0)
		{
			super(X*20,Y*20);
			loadGraphic(Registry._snake,true,true,20,20);
			addAnimation("slither",[0,1,2],15);
			this.facing = LEFT;
			this.maxVelocity.x = 50;
			this.drag.x = this.maxVelocity.x*4;
			
			this.width = 12;
			this.height = 12;
			this.centerOffsets(true);
	
		}
		
		override public function update():void
		{
			leftTile = PlayState.level.getTile(Math.floor(this.x/Registry.tileWidth)-1, Math.floor(this.y/Registry.tileHeight)+1);
			rightTile = PlayState.level.getTile(Math.floor(this.x/Registry.tileWidth)+1, Math.floor(this.y/Registry.tileHeight)+1);
			leftWall = PlayState.level.getTile(Math.floor(this.x/Registry.tileWidth)-1, Math.floor(this.y/Registry.tileHeight));
			rightWall = PlayState.level.getTile(Math.floor(this.x/Registry.tileWidth)+1, Math.floor(this.y/Registry.tileHeight));
			
			if(this.facing == LEFT)
			{
				this.acceleration.x = -this.maxVelocity.x*4;
				if(leftTile == 0 || leftWall == 15)
				{
					changeDirection();
				}
			}
			else if(this.facing == RIGHT)
			{
				this.acceleration.x = this.maxVelocity.x*4;
				if(rightTile == 0 || rightWall == 15)
				{
					changeDirection();
				}
			}			
			
			this.play('slither');
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