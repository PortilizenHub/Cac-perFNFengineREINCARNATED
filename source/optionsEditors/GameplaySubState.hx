package optionsEditors;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class GameplaySubState extends MusicBeatSubstate
{
	var gameplayList:Array<String> = ['game over sprites'];
	var gameplayListVAL:Array<Bool> = [gameOverSPR];

	public static var gameOverSPR:Bool = false;

	var curSelected:Int = 0;
	var grpOptionsTexts:FlxTypedGroup<FlxText>;

	private var grpControls:FlxTypedGroup<Alphabet>;

	public function new():Void
	{
		super();
	}

	override function create()
	{
		super.create();

		grpOptionsTexts = new FlxTypedGroup<FlxText>();
		add(grpOptionsTexts);

		grpControls = new FlxTypedGroup<Alphabet>();
		add(grpControls);

		for (i in 0...gameplayList.length)
		{
			var optionText:FlxText = new FlxText(20, 20 + (i * 80), 0, gameplayList[i], 32);
			optionText.ID = i;
			grpOptionsTexts.add(optionText);
		}
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		gameplayListVAL = [gameOverSPR];

		if (FlxG.keys.justReleased.ESCAPE)
			FlxG.switchState(new MainMenuState());

		if (controls.UP_P)
			curSelected -= 1;

		if (controls.DOWN_P)
			curSelected += 1;

		if (curSelected < 0)
			curSelected = gameplayList.length - 1;

		if (curSelected >= gameplayList.length)
			curSelected = 0;

		grpOptionsTexts.forEach(function(txt:FlxText)
		{
            txt.color = FlxColor.WHITE;

			if (txt.ID == curSelected)
				txt.color = FlxColor.YELLOW;
		});

		if (controls.ACCEPT)
		{
			switch (gameplayList[curSelected])
			{
				case 'game over sprites':
					if (gameOverSPR == false)
						gameOverSPR = true;
					else if (gameOverSPR == true)
						gameOverSPR = false;
					trace('game over sprites: ' + gameOverSPR);
			}
		}
	}
}
