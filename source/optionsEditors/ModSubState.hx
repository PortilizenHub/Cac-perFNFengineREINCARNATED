package optionsEditors;

import flixel.FlxObject;
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

	var camFollow:FlxObject;

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

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		for (i in 0...modList.length)
		{
			var optionText:FlxText = new FlxText(20, 20 + (i * 80), 0, modList[i], 32);
			optionText.ID = i;
			grpOptionsTexts.add(optionText);
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

		grpOptionsTexts.forEach(function(txt:FlxText)
		{
			txt.color = FlxColor.WHITE;

			if (txt.ID == curSelected)
				txt.color = FlxColor.YELLOW;
		});


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
