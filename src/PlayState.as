package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxSpecialFX;
	import org.flixel.system.FlxTile;
		
	public class PlayState extends FlxState
	{
		public var level:FlxTilemap;
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
		private var lwaypoint:lWaypoint;
		private var rwaypoint:rWaypoint;
		private var enemies:FlxGroup= new FlxGroup();
		private var score:FlxText;
		private var men:FlxText;		
		private var lvl:FlxText;
		private var gridX:Number;
		private var gridY:Number;
		private var txt:FlxText;
		private var txt2:FlxText;
		private var t:FlxTimer = new FlxTimer();
		
		//Here is load in the current level and then parse out the sprites, display the level and show the HUD
		override public function create():void
		{	
			//Create a new tilemap using our level data
			level = new FlxTilemap();
			//level.loadMap(new Registry._level1,Registry._buildTile,20,20,0,0,1,15);
			trace(Registry[Registry.levels[Registry.currLvl]]);
			level.loadMap(new Registry[Registry.levels[Registry.currLvl]],Registry._buildTile,20,20,0,0,1,15);
			swapTileForSprite();
			add(level);
			showHud(); //display text at bottom of screen
			if(Registry.currLvl < 10)
				door.solid = true;
			Registry.savingGirl = true;
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
						add(door);
						door.visible = false;
					}
				}
			}
			
			//next are the Energy Balls
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(level.getTile(i,ii) == 8)
					{
						Registry.eBalls +=1;
						//trace("X= "+i+" Y= "+ii+" Energy Ball "+Registry.eBalls+" Located");
						level.setTile(i,ii,0);
						eball = new EnergyBalls(i,ii);
						eballs.add(eball);
						add(eball);
					}
				}
			}
			
			//next up is the Left Waypoint
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(level.getTile(i,ii) == 13)
					{
						level.setTile(i,ii,0);
						lwaypoint = new lWaypoint(i,ii);
						Registry.lwaypoints.add(lwaypoint);
						add(lwaypoint);
						lwaypoint.visible = false;
					}
				}
			}
			
			//next up is the Right Waypoint
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(level.getTile(i,ii) == 14)
					{
						level.setTile(i,ii,0);
						rwaypoint = new rWaypoint(i,ii);
						Registry.rwaypoints.add(rwaypoint);
						add(rwaypoint);
						rwaypoint.visible = false;
					}
				}
			}

			//next is the Bat
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(level.getTile(i,ii) == 3)
					{
						level.setTile(i,ii,0);
						bat = new Bat(i,ii);
						enemies.add(bat);
						add(bat);
					}
				}
			}
			
			//next is the Spider
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(level.getTile(i,ii) == 4)
					{
						level.setTile(i,ii,0);
						spider = new Spider(i,ii);
						enemies.add(spider);
						add(spider);
					}
				}
			}
			
			//next is the Snake
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(level.getTile(i,ii) == 5)
					{
						level.setTile(i,ii,0);
						snake = new Snake(i,ii);
						enemies.add(snake);
						add(snake);
					}
				}
			}	
			
			//next is the Ghost
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(level.getTile(i,ii) == 6)
					{
						level.setTile(i,ii,0);
						ghost = new Ghost(i,ii);
						enemies.add(ghost);
						add(ghost);
					}
				}
			}

			//next is the cSpike
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(level.getTile(i,ii) == 9)
					{
						level.setTile(i,ii,0);
						cspike = new cSpike(i,ii);
						enemies.add(cspike);
						add(cspike);
					}
				}
			}
			
			//next is the fSpike
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(level.getTile(i,ii) == 10)
					{
						level.setTile(i,ii,0);
						fspike = new fSpike(i,ii);
						enemies.add(fspike);
						add(fspike);
					}
				}
			}
			
			//next is the lChain
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(level.getTile(i,ii) == 11)
					{
						level.setTile(i,ii,0);
						lchain = new lChain(i,ii);
						add(lchain);
					}
				}
			}
			
			//next is the rChain
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(level.getTile(i,ii) == 12)
					{
						level.setTile(i,ii,0);
						rchain = new rChain(i,ii);
						add(rchain);
					}
				}
			}
			
			//next is Jonnie our Hero
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
					if(level.getTile(i,ii) == 1)
					{
						level.setTile(i,ii,0);
						Hero = new Jonnie(i,ii);
						add(Hero);
					}
				}
			}
			
			//next is Jennie our Heroine
			for(i=0;i<Registry.mapWidth;i++)
			{
				for(ii=0;ii<Registry.mapHeight;ii++)
				{
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
			if(FlxG.keys.justPressed("Q"))
			{
				Registry.eBallsGotten = Registry.eBalls
			}
			if(Hero.isTouching(FlxObject.FLOOR))
				Registry.onGround = true;
			else
				Registry.onGround = false;
			if(Registry.eBallsGotten == Registry.eBalls)
			{
				if(Registry.currLvl == 10)
					saveTheGirl();
				else
					door.visible = true;
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
			/*trace("=======================================");
			trace("total eBalls = "+Registry.eBalls); 
			trace("eBallsGotten = "+Registry.eBallsGotten);
			trace("Living = "+eballs.countLiving());
			trace("Dead = "+eballs.countDead());
			trace("=======================================");*/
			e.kill();
			FlxG.play(Registry._pickup,.5);
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
				Registry.score = 0;
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
					trace("Running winText()");
					winText();
					trace("Running delay()");
				}
					delay();
			}
		}
		
		private function delay():void
		{	
			if(!Registry.timerSet)
				t.start(1);
			Registry.timerSet = true;
			trace("Timer has "+FlxU.floor(t.timeLeft)+" seconds left");
			if(t.finished)
			{
				t.stop();
				trace("setting text to invisible");
				txt.visible = false;
				txt2.visible = false;
				Registry.timerSet = false;
				door.solid = false;
				trace("Registry.currLvl was "+Registry.currLvl);
				Registry.currLvl += 1;
				trace("Registry.currLvl is "+Registry.currLvl);
				FlxG.resetState();
			}			
		}
		
		private function winText():void
		{
			txt=new FlxText(130,50,400,"Level Fininished!");
			txt.setFormat(null,50,0xFFFFFF, "center");				
			txt2=new FlxText( 130,200,400,"On To The Next Level!");
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
			}
		}
		
		private function winGame(p:FlxSprite, h:FlxSprite):void
		{
			FlxG.switchState(new WinGameState());
		}
		

	}
}