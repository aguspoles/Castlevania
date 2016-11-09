package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/level.oel", "assets/data/level.oel");
			type.set ("assets/data/level.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/P.oep", "assets/data/P.oep");
			type.set ("assets/data/P.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/animacionarma.png", "assets/images/animacionarma.png");
			type.set ("assets/images/animacionarma.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/batgris.png", "assets/images/batgris.png");
			type.set ("assets/images/batgris.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/batps.png", "assets/images/batps.png");
			type.set ("assets/images/batps.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/bg1.png", "assets/images/bg1.png");
			type.set ("assets/images/bg1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/bg2.png", "assets/images/bg2.png");
			type.set ("assets/images/bg2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/flame.png", "assets/images/flame.png");
			type.set ("assets/images/flame.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Hacha.png", "assets/images/Hacha.png");
			type.set ("assets/images/Hacha.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/heart.png", "assets/images/heart.png");
			type.set ("assets/images/heart.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Knight.png", "assets/images/Knight.png");
			type.set ("assets/images/Knight.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/player.png", "assets/images/player.png");
			type.set ("assets/images/player.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/posibleboss.png", "assets/images/posibleboss.png");
			type.set ("assets/images/posibleboss.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tiles2.png", "assets/images/tiles2.png");
			type.set ("assets/images/tiles2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
