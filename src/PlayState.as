package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxSpecialFX;
		
	public class PlayState extends FlxState
	{
		public static var level:FlxTilemap;
		private var bground:FlxTilemap;
		private var energyBall:FlxTilemap;
		private var Hero:Jonnie;
		private var Heroine:Jennie;
		private var bat:Bat;
		private var spider:Spider;
		private var snake:Snake;
		private var ghost:Ghost;
		private var door:Door;
		private var eballs:FlxGroup = new FlxGroup();
		private var eball:EnergyBalls;
		private var cspike:cSpike;
		private var fspike:fSpike;
		private var lchain:lChain;
		private var rchain:rChain;
		private var candle:Candle;
		private var enemies:FlxGroup= new FlxGroup();
		private var score:FlxText;
		private var men:FlxText;		
		private var lvl:FlxText;
		private var gridX:Number;
		private var gridY:Number;
		private var txt:FlxText;
		private var txt2:FlxText;
		private var t:FlxTimer = new FlxTimer();
		private var emitter:FlxEmitter;
		private var emitter2:FlxEmitter;
		private var emitter3:FlxEmitter;
		private var doorX:Number;
		private var doorY:Number;
		
		//Here we load in the current level and then parse out the sprites, display the level and show the HUD
		override public function create():void
		{	
			//Create a new tilemap using our level data
			bground = new FlxTilemap();
			level = new FlxTilemap();
			energyBall = new FlxTilemap();
			bground.loadMap(new Registry[Registry.bgrounds[Registry.currLvl]],Registry._backgroundTiles,20,20,0,0,1,7);
			level.loadMap(new Registry[Registry.levels[Registry.currLvl]],Registry._buildTile,20,20,0,0,1,15);
			energyBall.loadMap(new Registry[Registry.energyBalls[Registry.currLvl]],Registry._buildTile,20,20,0,0,1,15);
			swapBackgroundTileForSprite();
			add(bground);
			swapTileForSprite();
			add(level);
			add(Hero);
			showHud(); //display text at bottom of screen
			if(Registry.currLvl < 10)
				door.solid = true;
			Registry.savingGirl = true;

		}
		
		private function swapBackgroundTileForSprite():void
		{
			var i:int;
			var ii:int;
			//this will swap the candles on the level for sprite versions of them
			
			//the Candle
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(bground.getTile(i,ii) == 1)
					{
						bground.setTile(i,ii,0);
						candle = new Candle(i,ii);
						add(candle);
					}
				}
			}
		}
		
		private function swapTileForSprite():void
		{
			var i:int;
			var ii:int;
			//this will swap all the items on the level except for the red brick walls for sprite versions 
			
			
			//first up is the Door
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(level.getTile(i,ii) == 7)
					{
						level.setTile(i,ii,0);
						door = new Door(i,ii);
						doorX=i;
						doorY=ii;
						add(door);
						door.visible = false;
					}
					if(level.getTile(i,ii) == 3)
					{
						level.setTile(i,ii,0);
						bat = new Bat(i,ii);
						enemies.add(bat);
						add(bat);
					}
					if(level.getTile(i,ii) == 4)
					{
						level.setTile(i,ii,0);
						spider = new Spider(i,ii);
						enemies.add(spider);
						add(spider);
					}
					if(level.getTile(i,ii) == 5)
					{
						level.setTile(i,ii,0);
						snake = new Snake(i,ii);
						enemies.add(snake);
						add(snake);
					}
					if(level.getTile(i,ii) == 6)
					{
						level.setTile(i,ii,0);
						ghost = new Ghost(i,ii);
						enemies.add(ghost);
						add(ghost);
					}
					if(level.getTile(i,ii) == 9)
					{
						level.setTile(i,ii,0);
						cspike = new cSpike(i,ii);
						enemies.add(cspike);
						add(cspike);
					}
					if(level.getTile(i,ii) == 10)
					{
						level.setTile(i,ii,0);
						fspike = new fSpike(i,ii);
						enemies.add(fspike);
						add(fspike);
					}
					if(level.getTile(i,ii) == 11)
					{
						level.setTile(i,ii,0);
						lchain = new lChain(i,ii);
						add(lchain);
					}
					if(level.getTile(i,ii) == 12)
					{
						level.setTile(i,ii,0);
						rchain = new rChain(i,ii);
						add(rchain);
					}
					if(energyBall.getTile(i,ii) == 8)
					{
						Registry.eBalls +=1;
						energyBall.setTile(i,ii,0);
						eball = new EnergyBalls(i,ii);
						eballs.add(eball);
						add(eball);
					}
					if(level.getTile(i,ii) == 1)
					{
						level.setTile(i,ii,0);
						Hero = new Jonnie(i,ii);
					}
					if(level.getTile(i,ii) == 2)
					{
						level.setTile(i,ii,0);
						Heroine = new Jennie(i,ii);
						add(Heroine);
					}
				}
			}
		}

		//Displays Score, Men Left and Current Level 
		private function showHud():void
		{
			score = new FlxText(0,480,300,"SCORE: "+Registry.score);
			score.setFormat(null,16,0xFFFFFF);
			add(score);
			
			men = new FlxText(270,480,300,"MEN: "+Registry.lives);
			men.setFormat(null,16,0xFFFFFF);
			add(men)
			
			lvl = new FlxText(550,480,300,"LEVEL: "+Registry.currLvl);
			lvl.setFormat(null,16,0xFFFFFF);
			add(lvl)
		}
		
		//here is the update function where all the collisions are checked, also if to display exit door
		override public function update():void
		{
			if(Hero.isTouching(FlxObject.FLOOR))
				Registry.onGround = true;
			else
				Registry.onGround = false;
			if(Registry.eBallsGotten == Registry.eBalls)
			{
				if(Registry.currLvl == 10)
					saveTheGirl();
				else
				{	
					if(!Registry.doorVisible)
					{						
						FlxG.play(Registry._doorAppear,.2);
						door.visible = true;
						Registry.doorVisible = true;
						emitter = new FlxEmitter((doorX*20)+10,(doorY*20)+10);
						emitter.setXSpeed(-50,50);
						emitter.setYSpeed(-90,0);
						emitter.gravity = 100;
						emitter.makeParticles(Registry._spark,150,0,true,.5);
						add(emitter);
						emitter.start(true,2);
					}
				}
			}
			FlxG.overlap(Hero,eballs,getEnergy);
			FlxG.overlap(Hero,enemies,captured);
			FlxG.overlap(Hero,door,exitLevel);
			FlxG.overlap(Hero,Heroine,winGame);
			super.update();
			FlxG.collide(level, Hero);
			FlxG.collide(level, enemies);
		}
		
		//Function for picking up energy balls
		private function getEnergy(p:FlxSprite, e:FlxSprite):void
		{
			Registry.score += 100;
			Registry.eBallsGotten +=1;
			e.kill();
			FlxG.play(Registry._pickup,.2);
			score.text = "SCORE: "+Registry.score;
		}
		
		//Function for enemies getting the player  
		private function captured(p:FlxSprite, e:FlxSprite):void
		{
			if(Registry.lives == 0)
				FlxG.switchState(new GameOverState());
			else
			{
				p.kill();
				Registry.lives -= 1;
				men.text = "MEN: "+Registry.lives
				Registry.eBallsGotten = 0;
				Registry.eBalls = 0;
				Registry.score = Registry.tempScore;
				FlxG.resetState();
			}
		}
		
		//Function for what to do when player touches door
		private function exitLevel(p:FlxSprite, d:FlxSprite):void
		{
			if(Registry.eBallsGotten == Registry.eBalls)
			{
				//exit level code goes here
				if(!Registry.timerSet)
				{					
					winText();
				}
					delay();
			}
		}
		
		private function delay():void
		{	
			if(!Registry.timerSet)
				t.start(3);
			Registry.timerSet = true;
			if(t.finished)
			{
				t.stop();
				txt.visible = false;
				txt2.visible = false;
				Registry.timerSet = false;
				door.solid = false;
				Registry.currLvl += 1;
				Registry.tempScore = Registry.score;
				Registry.doorVisible = false;
				Registry.textVisible = false;
				FlxG.resetState();
			}			
		}
		
		private function winText():void
		{
			Registry.textVisible = true;
			txt=new FlxText(130,50,400,"Level Fininished!");
			txt.setFormat(null,50,0xFFFFFF, "center");				
			txt2=new FlxText( FlxG.width*.5-250,200,500,"On To Level "+(Registry.currLvl+1));
			txt2.setFormat(null,50,0xFFFFFF, "center");
			add(txt);
			add(txt2);
		}
		
		private function saveTheGirl():void
		{
			if(Registry.savingGirl)
			{
				Registry.savingGirl = false;
				FlxG.play(Registry._brickfall,.5);
				level.setTile(13,1,0);
				level.setTile(13,2,15);
				level.setTile(13,3,15);
				level.setTile(18,1,0);
				level.setTile(18,2,15);
				level.setTile(18,3,15);
				emitter2 = new FlxEmitter((13*20)+10,(2*20)+10);
				emitter2.setXSpeed(-50,50);
				emitter2.setYSpeed(-90,0);
				emitter2.gravity = 100;
				emitter2.makeParticles(Registry._spark,150,0,true,.5);
				add(emitter2);
				emitter3 = new FlxEmitter((18*20)+10,(2*20)+10);
				emitter3.setXSpeed(-50,50);
				emitter3.setYSpeed(-90,0);
				emitter3.gravity = 100;
				emitter3.makeParticles(Registry._spark,150,0,true,.5);
				add(emitter3);
				emitter2.start(true,2);
				emitter3.start(true,2);
			}
		}
		
		private function winGame(p:FlxSprite, h:FlxSprite):void
		{
			FlxG.switchState(new WinGameState());
		}
		

	}
}