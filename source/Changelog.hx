package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.app.Application;

class Changelog extends MusicBeatState
{
	public static var leftState:Bool = false;

	var changelogAdded:String = "- Custom Logo
		\n- Changelog Menu (press enter to proceed)
		\n- Chart Menu BG
		\n- Health drain in thorns
		\n- Camera Bops in week 6";

	var changelogFixed:String = "- MODDING.md
		\n- Mod system (the folders are in preload now)
    ";

	var changelogChanged:String = "- State you enter when leaving animation debug (you go back to gameplay)
		\n- Icon Offset (its 30 now)
		\n- Company
		\n- Story Mode week Flash Color
    ";

	var changelogRemoved:String = "- water mark
    ";

	var txt:FlxText;

	override function create()
	{
		super.create();

		var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = true;
		menuBG.color = 0x181818;
		add(menuBG);

		txt = new FlxText(0, 0, 0,
			"FNF Cac-Per Engine Reincarnated "
			+ Application.current.meta.get('version')
			+ " Changelog\n\n"
			+ "Added\n"
			+ changelogAdded
			+ "\n\nFixed\n"
			+ changelogFixed
			+ "Changed\n"
			+ changelogChanged
			+ "\n\nRemoved\n"
			+ changelogRemoved,
			12);
		txt.setFormat("VCR OSD Mono", 24, FlxColor.WHITE, CENTER);
		txt.screenCenter();
		add(txt);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
		{
			leftState = true;
			FlxG.sound.play(Paths.sound('scrollMenu'));
			FlxG.switchState(new MainMenuState());
		}

		super.update(elapsed);
	}
}