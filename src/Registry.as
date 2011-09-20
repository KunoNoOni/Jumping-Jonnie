package
{
	import org.flixel.*;

	public class Registry
	{
		public static var eBalls:int = 0;
		public static var eBallsGotten:int = 0;
		public static var score:int = 0;
		public static var lives:int = 5;
		public static var currLvl:int = 1;
		public static var startX:int = 0;
		public static var startY:int = 0;
		public static var onGround:Boolean = true;
		public static var tileWidth:Number = 20;
		public static var tileHeight:Number = 20;
		public static var mapWidth:Number = 32;
		public static var mapHeight:Number = 24;
		public static var checkTile:Number = 0;
		public static var snakeLWaypoint:Boolean = false;
		public static var snakeRWaypoint:Boolean = false;
		public static var batLWaypoint:Boolean = false;
		public static var batRWaypoint:Boolean = false;
		public static var ghostLWaypoint:Boolean = false;
		public static var ghostRWaypoint:Boolean = false;
		public static var spiderLWaypoint:Boolean = false;
		public static var spiderRWaypoint:Boolean = false;		
		public static var lwaypoints:FlxGroup = new FlxGroup();
		public static var rwaypoints:FlxGroup = new FlxGroup();
		public static var timerSet:Boolean = false;
		public static var levels:Array = ["null","_level1","_level2","_level3","_level4","_level5","_level6",
			"_level7","_level8","_level9","_level10"];
		public static var savingGirl:Boolean = true;

		
		
		[Embed(source = 'Sprites/buildTiles.png')] static public var _buildTile:Class;
		[Embed(source = 'Sprites/energyBall.png')] static public var _energyBall:Class;
		[Embed(source = 'Sprites/door.png')] static public var _door:Class;
		[Embed(source = 'Sprites/snake.png')] static public var _snake:Class;
		[Embed(source = 'Sprites/spider.png')] static public var _spider:Class;
		[Embed(source = 'Sprites/ghost.png')] static public var _ghost:Class;
		[Embed(source = 'Sprites/bat.png')] static public var _bat:Class;
		[Embed(source = 'Sprites/fSpike.png')] static public var _fSpike:Class;
		[Embed(source = 'Sprites/cSpike.png')] static public var _cSpike:Class;
		[Embed(source = 'Sprites/lChain.png')] static public var _lChain:Class;
		[Embed(source = 'Sprites/rChain.png')] static public var _rChain:Class;
		[Embed(source = 'Sprites/leftWaypoint.png')] static public var _lWaypoint:Class;
		[Embed(source = 'Sprites/rightWaypoint.png')] static public var _rWaypoint:Class;
		[Embed(source = 'Sprites/jonnie.png')] static public var _player:Class;
		[Embed(source = 'Sprites/jennie.png')] static public var _girl:Class;
		[Embed(source = 'Sprites/title.png')] static public var _title:Class;
		
		[Embed(source = 'Maps/mapCSV_Group1_Map1.csv', mimeType = 'application/octet-stream')] static public var _level1:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map2.csv', mimeType = 'application/octet-stream')] static public var _level2:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map3.csv', mimeType = 'application/octet-stream')] static public var _level3:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map4.csv', mimeType = 'application/octet-stream')] static public var _level4:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map5.csv', mimeType = 'application/octet-stream')] static public var _level5:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map6.csv', mimeType = 'application/octet-stream')] static public var _level6:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map7.csv', mimeType = 'application/octet-stream')] static public var _level7:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map8.csv', mimeType = 'application/octet-stream')] static public var _level8:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map9.csv', mimeType = 'application/octet-stream')] static public var _level9:Class;
		[Embed(source = 'Maps/mapCSV_Group1_Map10.csv', mimeType = 'application/octet-stream')] static public var _level10:Class;
		
		[Embed(source = 'sounds/jump.mp3')] static public var _jump:Class;
		[Embed(source = 'sounds/pickup.mp3')] static public var _pickup:Class;
		[Embed(source = 'sounds/brickfall.mp3')] static public var _brickfall:Class;
		
		
		public function Registry()
		{
		}
	}
}