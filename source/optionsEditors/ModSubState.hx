package optionsEditors;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class ModSubState extends MusicBeatSubstate
{
    var modList:Array<String> = ['introMod', 'iconMod'];
    var modListVAL:Array<Bool> = [introModVAR, iconModVAR];

    public static var introModVAR:Bool = false;
    public static var iconModVAR:Bool = false;

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

		for (i in 0...modList.length)
		{
			var opt:Alphabet = new Alphabet(0, (70 * i) + 30, modList[i], true, false);
			opt.isMenuItem = true;
			opt.targetY = i;
			add(opt);
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !! ma dumbass didnt read this lmao
		}
    }
    
        override function update(elapsed:Float)
    {
        super.update(elapsed);

        modListVAL = [introModVAR, iconModVAR];

        if (FlxG.keys.justReleased.ESCAPE)
            FlxG.switchState(new MainMenuState());

        if (controls.UP_P)
			curSelected -= 1;

		if (controls.DOWN_P)
			curSelected += 1;

		if (curSelected < 0)
			curSelected = modList.length - 1;

		if (curSelected >= modList.length)
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
                switch (modList[curSelected])
                {
                    case "introMod":
                        if (introModVAR == false)
                            introModVAR = true;
                        else if (introModVAR == true)
                            introModVAR = false;
                        trace('introMod: ' + introModVAR);

                    case "iconMod":
                        if (iconModVAR == false)
                            iconModVAR = true;
                        else if (iconModVAR == true)
                            iconModVAR = false;
                        trace('iconMod: ' + iconModVAR);

                }
            }
    }
}
