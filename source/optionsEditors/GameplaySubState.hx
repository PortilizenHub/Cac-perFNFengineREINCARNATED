package optionsEditors;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class GameplaySubState extends MusicBeatSubstate
{
    var gameplayList:Array<String> = [''];
    var gameplayListVAL:Array<Bool> = [];

    var curSelected:Int = 0;
	var grpOptionsTexts:FlxTypedGroup<Alphabet>;

	private var grpControls:FlxTypedGroup<Alphabet>;

    public function new():Void
    {
        super();
    }

    override function create()
    {
        super.create();

		grpOptionsTexts = new FlxTypedGroup<Alphabet>();
		add(grpOptionsTexts);

		grpControls = new FlxTypedGroup<Alphabet>();
		add(grpControls);

		for (i in 0...gameplayList.length)
		{
			var opt:Alphabet = new Alphabet(0, (70 * i) + 30, gameplayList[i], true, false);
			opt.isMenuItem = true;
			opt.targetY = i;
			add(opt);
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !! ma dumbass didnt read this lmao
		}
    }
    
        override function update(elapsed:Float)
    {
        super.update(elapsed);

        gameplayListVAL = [];

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

		var bullShit:Int = 0;

		for (item in grpControls.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;

			if (item.targetY == 0)
			{
				item.alpha = 1;
			}
		}

        if (controls.ACCEPT)
            {
                switch (gameplayList[curSelected])
                {
                    
                }
            }
    }
}
