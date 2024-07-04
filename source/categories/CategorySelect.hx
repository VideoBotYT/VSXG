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

import categories.Category1;
import categories.Category2;
import categories.Category3;
import categories.Category4;
import categories.Category5;
import categories.Category6;


class CategorySelect extends MusicBeatState
{
    public static var category1:Alphabet;
    public static var category2:Alphabet;
    public static var category3:Alphabet;
    public static var category4:Alphabet;
    public static var category5:Alphabet;
    public static var category6:Alphabet;
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

        category5 = new Alphabet(35, 450, "5");
        category5.antialiasing = false;
        category5.screenCenter(X);
        add(category5);

        category6 = new Alphabet(35, 550, "6");
        category6.antialiasing = false;
        category6.screenCenter(X);
        add(category6);

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
            runCategory('1');
        }
        if (FlxG.mouse.justPressed && category2.overlapsPoint(FlxG.mouse.getScreenPosition())) {
            runCategory('2');
        }
        if (FlxG.mouse.justPressed && category3.overlapsPoint(FlxG.mouse.getScreenPosition())) {
            runCategory('3');
        }
        if (FlxG.mouse.justPressed && category4.overlapsPoint(FlxG.mouse.getScreenPosition())) {
            runCategory('4');
        }
        
        if (FlxG.mouse.justPressed && category5.overlapsPoint(FlxG.mouse.getScreenPosition())) {
            runCategory('5');
        }

        if (FlxG.mouse.justPressed && category6.overlapsPoint(FlxG.mouse.getScreenPosition())) {
            runCategory('6');
        }

        super.update(elapsed);
    }

    private function runCategory(category:String)
    {
        switch(category)
        {
            case '1':
                FlxG.switchState(new Category1());
            case '2':
                FlxG.switchState(new Category2());
            case '3':
                FlxG.switchState(new Category3());
            case '4':
                FlxG.switchState(new Category4());
            case '5':
                FlxG.switchState(new Category5());
            case '6':
                FlxG.switchState(new Category6());
        }
    }
}