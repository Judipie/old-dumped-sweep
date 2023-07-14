// SongIntro remade from lua to haxe plus minor changes I did
// plus even more scripts like iconBounce and camThing
import flixel.FlxCamera;
import flixel.util.FlxColor;

var introTextSize = 25;
var introSubTextSize = 30;
var introTagColor = 0xFF808080; // gray
var introTagWidth = 15;
var camOther:FlxCamera;

var jukeBoxTag:FlxSprite;
var jukeBox:FlxSprite;
var jukeBoxText:FlxText;
var jukeBoxSubText:FlxText;
var composer:FlxText;
var charter:FlxText;

function postCreate() {
    // Health bar edits because it looked god awful
    healthBar.scale.set(0.87, 0.3);
    healthBarBG.y -= 15;
    healthBar.y -= 15;

    // The tag at the end of the box
    jukeBoxTag = new FlxSprite(-305-introTagWidth, 15).makeGraphic(300+introTagWidth, 250, introTagColor);
    jukeBoxTag.cameras = [camOther];
    add(jukeBoxTag);
    
    // The box itself
    jukeBox = new FlxSprite(-305-introTagWidth, 15).makeGraphic(300, 250, 0xFF000000);
    jukeBox.cameras = [camOther];
    add(jukeBox);

    // text for now playing
    jukeBoxText = new FlxText(-305-introTagWidth, 30, 300, "Now Playing:", introTextSize + 5);
    jukeBoxText.setFormat("vcr.ttf", 15, 0xFFFFFFFF, "left");
    jukeBoxText.cameras = [camOther];
    add(jukeBoxText);

    // text for the song name
    jukeBoxSubText = new FlxText(-305-introTagWidth, 60, 300, PlayState.SONG.meta.displayName, introSubTextSize);
    jukeBoxSubText.cameras = [camOther];
    add(jukeBoxSubText);

    // text for composer
    composer = new FlxText(-305-introTagWidth, 150, 300, "by " + composer, introSubTextSize - 5);
    composer.cameras = [camOther];
    add(composer);

    // text for charter
    charter = new FlxText(-305-introTagWidth, 210, 300, "Charter: " + charter, introSubTextSize - 10);
    charter.cameras = [camOther];
    add(charter);

    var timerStart = new FlxTimer().start(3, function(a:FlxTimer) {
        FlxTween.tween(jukeBoxTag, {x: -1}, 1, {ease: FlxEase.circInOut});
        FlxTween.tween(composer, {x: -1}, 1, {ease: FlxEase.circInOut});
        FlxTween.tween(charter, {x: -1}, 1, {ease: FlxEase.circInOut});
        FlxTween.tween(jukeBox, {x: -1}, 1, {ease: FlxEase.circInOut});
        FlxTween.tween(jukeBoxText, {x: -1}, 1, {ease: FlxEase.circInOut});
        FlxTween.tween(jukeBoxSubText, {x: -1}, 1, {ease: FlxEase.circInOut});
    }, 1);

    var timerShit = new FlxTimer().start(6, function(timer:FlxTimer) {
        FlxTween.tween(jukeBoxTag, {x: -450}, 1.5, {ease: FlxEase.circInOut});
        FlxTween.tween(charter, {x: -450}, 1.5, {ease: FlxEase.circInOut});
        FlxTween.tween(composer, {x: -450}, 1.5, {ease: FlxEase.circInOut});
        FlxTween.tween(jukeBox, {x: -450}, 1.5, {ease: FlxEase.circInOut});
        FlxTween.tween(jukeBoxText, {x: -450}, 1.5, {ease: FlxEase.circInOut});
        FlxTween.tween(jukeBoxSubText, {x: -450}, 1.5, {ease: FlxEase.circInOut});
    } ,1);
}

function postUpdate(elapsed) {
    if (FlxG.save.data.notecam) {
        if (curCameraTarget == 1) {
            switch (boyfriend.animation.curAnim.name) {
                case "singDOWN": camFollow.y += 10; // 10
                case "singUP": camFollow.y -= 10;
                case "singLEFT": camFollow.x -= 10;
                case "singRIGHT": camFollow.x += 10;
            }
        } else {
            switch (dad.animation.curAnim.name) {
                case "singDOWN": camFollow.y += 10;
                case "singUP": camFollow.y -= 10;
                case "singLEFT": camFollow.x -= 10;
                case "singRIGHT": camFollow.x += 10;
            }
        }
    }
}

// Icon Bounce code that I made from MCM YCE port lol
function beatHit() {
    if (curBeat % 2 == 0) {
        FlxTween.angle(iconP1, 0, 5, Conductor.crochet / 1000, {ease: FlxEase.circOut});
        FlxTween.angle(iconP2, 0, 5, Conductor.crochet / 1000, {ease: FlxEase.circOut});
    } else {
        FlxTween.angle(iconP1, 0, -5, Conductor.crochet / 1000, {ease: FlxEase.circOut});
        FlxTween.angle(iconP2, 0, -5, Conductor.crochet / 1000, {ease: FlxEase.circOut});
    }
}

function create() {
    FlxG.cameras.add(camOther = new FlxCamera(), false);
    camOther.bgColor = FlxColor.TRANSPARENT;
    
    if (PlayState.SONG.meta.displayName == "old dumped") {
        introTagColor = 0xFFFFA500; // orange
        composer = "Fish Man";
        charter = "Agent BB";
    } else {
        introTagColor = 0xFFFFA500; // another orange
        composer = "Sandi";
        charter = "MAZ";
    }
}