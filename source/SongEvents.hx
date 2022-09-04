package;

class Events extends MusicBeatState
{
	inline public static function playAnim(character:String = 'boyfriend', animation:String = 'idle')
	{
		// boyfriend

		if (character == 'bf' || character == 'boyfriend')
			PlayState.boyfriend.playAnim(animation, true);

		// gf

		if (character == 'gf' || character == 'girlfriend')
			PlayState.gf.playAnim(animation, true);

		// dad

		if (character == 'dad')
			PlayState.dad.playAnim(animation, true);

		return;
	}

	inline public static function changeBPM(newBPM:Int = 100)
	{
		Conductor.changeBPM(newBPM);

		return;
	}
}
