package;

import flixel.input.gamepad.FlxGamepad;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.input.mouse.FlxMouseButton;
import flixel.util.FlxColor;
import lime.utils.Assets;
import Alphabet;

class PlayMenu extends MusicBeatState
{
	public static var category:Alphabet;

	var storyMode:Alphabet;
	var freeplay:Alphabet;
	var bg:FlxSprite;

	override function create()
	{
		bg = new FlxSprite().loadGraphic(Paths.image('menuBG', 'preload'));
		bg.antialiasing = true;
		bg.updateHitbox();
		bg.screenCenter();
		bg.visible = true;
		bg.scrollFactor.set();
		add(bg);

		storyMode = new Alphabet(35, 50, "StoryMode");
		storyMode.antialiasing = false;
		storyMode.screenCenter(X);
		add(storyMode);

		freeplay = new Alphabet(35, 150, "Freeplay");
		freeplay.antialiasing = false;
		freeplay.screenCenter(X);
		add(freeplay);

		category = new Alphabet(35, 250, "Category");
		category.antialiasing = false;
		category.screenCenter(X);
		add(category);

		super.create();
	}

	override function update(elapsed:Float)
	{
		FlxG.mouse.visible = true;

		if (controls.BACK)
		{
			FlxG.switchState(new MainMenuState());
		}

		if (FlxG.mouse.justPressed && storyMode.overlapsPoint(FlxG.mouse.getScreenPosition()))
		{
			runPlay('StoryMode');
		}
		if (FlxG.mouse.justPressed && freeplay.overlapsPoint(FlxG.mouse.getScreenPosition()))
		{
			runPlay('Freeplay');
		}
		if (FlxG.mouse.justPressed && category.overlapsPoint(FlxG.mouse.getScreenPosition()))
		{
			runPlay('Category');
		}
		super.update(elapsed);
	}

	private function runPlay(category:String)
	{
		switch (category)
		{
			case 'StoryMode':
				MusicBeatState.switchState(new StoryMenuState());
			case 'Freeplay':
				MusicBeatState.switchState(new FreeplayState());
			case 'Category':
				MusicBeatState.switchState(new categories.CategorySelect());
		}
	}
}
