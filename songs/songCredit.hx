/**
    SongIntro lua script from MCM old build in Haxe
    to whoever made it the lua ver, 
    reach out to me via this port's github repo
    because I don't know who coded that one.
**/
import flixel.FlxCamera;

var introTextSize = 25;
var introSubTextSize = 30;
var introTagColor = FlxColor.GRAY;
var introTagWidth = 15;

var camOther:FlxCamera;
var jukeBoxTag, jukeBox:FlxSprite;
var jukeBoxText, jukeBoxSubText, composer, charter:FlxText;

function postCreate() {
    // The tag at the end of the box
    jukeBoxTag = new FlxSprite(-305-introTagWidth, 15).makeSolid(300+introTagWidth, 250, introTagColor);
    jukeBoxTag.cameras = [camOther];
    add(jukeBoxTag);
    
    // The box itself
    jukeBox = new FlxSprite(-305-introTagWidth, 15).makeSolid(300, 250, 0xFF000000);
    jukeBox.cameras = [camOther];
    add(jukeBox);

    // text for now playing
    jukeBoxText = new FlxText(-305-introTagWidth, 30, 300, "Now Playing:", introTextSize + 5);
    jukeBoxText.setFormat(Paths.font("vcr.ttf"), 15, 0xFFFFFFFF, "left");
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
}

function onSongStart() {
    /* 
        When the song starts the box appears then goes away after 3 seconds
        It's designed to be behind the strumlines so you'd read the notes properly 
        for opponent mode/coop
    */

    for (a in [jukeBoxTag, jukeBox, jukeBoxText, jukeBoxSubText, composer, charter]) {
        FlxTween.tween(a, {x: 0}, 1, {ease: FlxEase.circInOut});
    }

    new FlxTimer().start(3, function(timer:FlxTimer) {
        for (i in [jukeBoxTag, jukeBox, jukeBoxText, jukeBoxSubText, composer, charter]) {
            FlxTween.tween(i, {x: -450}, 1.5, {ease: FlxEase.circInOut, onComplete: function(delAssets:FlxTween) {
                remove(i);
            }});
        }
    });

}

function create() {
    // caveman's way to layer cameras via removing and adding
    FlxG.cameras.remove(camHUD, false);
    camOther = new FlxCamera();
    FlxG.cameras.add(camOther, false);
    camOther.bgColor = FlxColor.TRANSPARENT;
    FlxG.cameras.add(camHUD, false);
    
    switch (PlayState.SONG.meta.displayName) {
        case "dumped":
            switch (PlayState.difficulty) {
                case "HARD":
                    introTagColor = FlxColor.ORANGE;
                    composer = "Olimac";
                    charter = "MCM Dev";

                case "HARD-RECHART":
                    introTagColor = FlxColor.ORANGE;
                    composer = "Olimac";
                    charter = "I_have_Autism";
            }

        case "old dumped":
            introTagColor = FlxColor.ORANGE;
            composer = "Fish Man";
            charter = "Agent BB";

        case "old dumped remake":
            introTagColor = FlxColor.ORANGE;
            composer = "Sandi";
            charter = "MAZ";

        default:
            introTagColor = FlxColor.GRAY;
            composer = "idk";
            charter = "idk";
    }
}
