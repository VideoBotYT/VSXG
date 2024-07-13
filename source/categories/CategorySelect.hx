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

import categories.Category0;
import categories.Category1;
import categories.Category2;


class CategorySelect extends MusicBeatState
{
    public static var category1:Alphabet;
    public static var category2:Alphabet;
    public static var category3:Alphabet;
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

        category1 = new Alphabet(35, 50, "0");
        category1.antialiasing = false;
        category1.screenCenter(X);
        add(category1);

        category2 = new Alphabet(35, 150, "1");
        category2.antialiasing = false;
        category2.screenCenter(X);
        add(category2);
        
        category3 = new Alphabet(35, 250, "2");
        category3.antialiasing = false;
        category3.screenCenter(X);
        add(category3);

        super.create();
    }

    override function update(elapsed:Float)
    {
        FlxG.mouse.visible = true;
 
        if (controls.BACK)
        {
            FlxG.switchState(new PlayMenu());
        }

        if (FlxG.mouse.justPressed && category1.overlapsPoint(FlxG.mouse.getScreenPosition())) {
            runCategory('0');
        }
        if (FlxG.mouse.justPressed && category2.overlapsPoint(FlxG.mouse.getScreenPosition())) {
            runCategory('1');
        }
        if (FlxG.mouse.justPressed && category3.overlapsPoint(FlxG.mouse.getScreenPosition())) {
            runCategory('2');
        }

        super.update(elapsed);
    }

    private function runCategory(category:String)
    {
        switch(category)
        {
            case '0':
                FlxG.switchState(new Category0());
            case '1':
                FlxG.switchState(new Category1());
            case '2':
                FlxG.switchState(new Category2());
        }
    }
}