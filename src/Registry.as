package
{
	import org.flixel.*;

	public class Registry
	{
		public static var eBalls:int = 0;
		public static var eBallsGotten:int = 0;
		public static var tempScore:int = 0;
		public static var score:int = tempScore;
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
		public static var doorVisible:Boolean = false;
		public static var textVisible:Boolean = false;
		public static var timerSet:Boolean = false;
		public static var levels:Array = ["null","_level1","_level2","_level3","_level4","_level5","_level6",
			"_level7","_level8","_level9","_level10"];
		public static var bgrounds:Array = ["null","b_level1","b_level1","b_level1","b_level1","b_level1","b_level1",
			"b_level1","b_level1","b_level1","b_level1"];
		public static var energyBalls:Array = ["null","e_level1","e_level2","e_level3","e_level4","e_level5","e_level6",
			"e_level7","e_level8","e_level9","e_level10"];
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
		[Embed(source = 'Sprites/title2.png')] static public var _title:Class;
		[Embed(source = 'Sprites/candle.png')] static public var _candle:Class;
		[Embed(source = 'Sprites/backgroundTiles.png')] static public var _backgroundTiles:Class;
		[Embed(source = 'Sprites/spark.png')] static public var _spark:Class;
		
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
		
		[Embed(source = 'Maps/mapCSV_Group2_Map1.csv', mimeType = 'application/octet-stream')] static public var b_level1:Class;
		
		[Embed(source = 'Maps/mapCSV_Group3_Map1.csv', mimeType = 'application/octet-stream')] static public var e_level1:Class;
		[Embed(source = 'Maps/mapCSV_Group3_Map2.csv', mimeType = 'application/octet-stream')] static public var e_level2:Class;
		[Embed(source = 'Maps/mapCSV_Group3_Map3.csv', mimeType = 'application/octet-stream')] static public var e_level3:Class;
		[Embed(source = 'Maps/mapCSV_Group3_Map4.csv', mimeType = 'application/octet-stream')] static public var e_level4:Class;
		[Embed(source = 'Maps/mapCSV_Group3_Map5.csv', mimeType = 'application/octet-stream')] static public var e_level5:Class;
		[Embed(source = 'Maps/mapCSV_Group3_Map6.csv', mimeType = 'application/octet-stream')] static public var e_level6:Class;
		[Embed(source = 'Maps/mapCSV_Group3_Map7.csv', mimeType = 'application/octet-stream')] static public var e_level7:Class;
		[Embed(source = 'Maps/mapCSV_Group3_Map8.csv', mimeType = 'application/octet-stream')] static public var e_level8:Class;
		[Embed(source = 'Maps/mapCSV_Group3_Map9.csv', mimeType = 'application/octet-stream')] static public var e_level9:Class;
		[Embed(source = 'Maps/mapCSV_Group3_Map10.csv', mimeType = 'application/octet-stream')] static public var e_level10:Class;
		
		[Embed(source = 'sounds/jump.mp3')] static public var _jump:Class;
		[Embed(source = 'sounds/pickup.mp3')] static public var _pickup:Class;
		[Embed(source = 'sounds/brickfall.mp3')] static public var _brickfall:Class;
		[Embed(source = 'sounds/door.mp3')] static public var _doorAppear:Class;
		
		
		public function Registry()
		{
		}
	}
}