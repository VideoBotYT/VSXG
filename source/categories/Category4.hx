package categories;

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


class Category4 extends MusicBeatState
{
    public static var category1:Alphabet;
    public static var category2:Alphabet;
    public static var category3:Alphabet;
    public static var category4:Alphabet;
    var bg:FlxSprite;
   
    override function create()
    {
        FlxG.mouse.visible = true;

        FlxG.mouse.visible = true;
        bg = new FlxSprite().loadGraphic(Paths.image('categories/bg', 'preload'));
        bg.antialiasing = true;
        bg.updateHitbox();
        bg.screenCenter();
        bg.visible = true;
        bg.scrollFactor.set();
        add(bg);

        category1 = new Alphabet(35, 50, "1");
        category1.antialiasing = false;
        category1.screenCenter(X);
        add(category1);

        category2 = new Alphabet(35, 150, "2");
        category2.antialiasing = false;
        category2.screenCenter(X);
        add(category2);

        category3 = new Alphabet(35, 250, "3");
        category3.antialiasing = false;
        category3.screenCenter(X);
        add(category3);

        category4 = new Alphabet(35, 350, "4");
        category4.antialiasing = false;
        category4.screenCenter(X);
        add(category4);

        super.create();
    }

    override function update(elapsed:Float)
    {
        FlxG.mouse.visible = true;
 
        if (controls.BACK)
        {
            FlxG.switchState(new CategorySelect());
        }

        if (FlxG.mouse.justPressed && category1.overlapsPoint(FlxG.mouse.getScreenPosition())) {
            runSong('1');
        }
        if (FlxG.mouse.justPressed && category2.overlapsPoint(FlxG.mouse.getScreenPosition())) {
            runSong('2');
        }
        if (FlxG.mouse.justPressed && category3.overlapsPoint(FlxG.mouse.getScreenPosition())) {
            runSong('3');
        }
        if (FlxG.mouse.justPressed && category4.overlapsPoint(FlxG.mouse.getScreenPosition())) {
            runSong('4');
        }

        super.update(elapsed);
    }

    private function runSong(song:String)
    {
        switch(song)
        {
            case '1':
				PlayState.SONG = Song.loadFromJson('pico-hard', 'pico');
				PlayState.isStoryMode = false;
				PlayState.storyDifficulty = 2;
				PlayState.storyWeek = 1;
				FlxG.camera.fade(FlxColor.WHITE, 0.5, false);
				FlxG.sound.play(Paths.sound('confirmMenu'));
				LoadingState.loadAndSwitchState(new PlayState());
            case '2':
				PlayState.SONG = Song.loadFromJson('philly nice-hard', 'philly nice');
				PlayState.isStoryMode = false;
				PlayState.storyDifficulty = 2;
				PlayState.storyWeek = 1;
				FlxG.camera.fade(FlxColor.WHITE, 0.5, false);
				FlxG.sound.play(Paths.sound('confirmMenu'));
				LoadingState.loadAndSwitchState(new PlayState());
            case '3':
				PlayState.SONG = Song.loadFromJson('blammed-hard', 'blammed');
				PlayState.isStoryMode = false;
				PlayState.storyDifficulty = 2;
				PlayState.storyWeek = 1;
				FlxG.camera.fade(FlxColor.WHITE, 0.5, false);
				FlxG.sound.play(Paths.sound('confirmMenu'));
				LoadingState.loadAndSwitchState(new PlayState());
            case '4':
                PlayState.SONG = Song.loadFromJson('blammedmt-hard', 'blammedmt');
                PlayState.isStoryMode = false;
                PlayState.storyDifficulty = 2;
                PlayState.storyWeek = 1;
                FlxG.camera.fade(FlxColor.BLACK, 2, false);
                FlxG.sound.play(Paths.sound('confirmMenu'));
                LoadingState.loadAndSwitchState(new PlayState());
        }
    }
}