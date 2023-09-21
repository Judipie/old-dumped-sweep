// function create() {
//     // importScript("data/globall");
//     introTagColor = 0xFFFFA500;
// }
import flixel.addons.effects.FlxTrail;
var tweenGame:FlxTween;
var tweenHud:FlxTween;
var fillScreenThing:FlxSprite;

function create() {
    fillScreenThing = new FlxSprite();
    fillScreenThing.makeGraphic(FlxG.width * 60, FlxG.height * 60, 0x00000000);
    fillScreenThing.screenCenter();
    fillScreenThing.cameras = [camGame];
}

function postCreate() {
    boyfriend.visible = false;
    // if (PlayState.difficulty == "HARD") {
    //     trace("Old dumped time");
    // }
}

// function postUpdate()
//     trace("Scroll speed: " + FlxMath.roundDecimal(scrollSpeed, 2));

function beatHit(curBeat) {
    switch(curBeat) {
        case 4:
            // FlxTween.num(scrollSpeed, scrollSpeed = Std.parseFloat(0.8), 5);
            // scrollSpeed_tween(scrollSpeed + 0.8, 3);
        
        case 712:
            tweenGame = FlxTween.tween(FlxG.camera, {zoom: 0.75}, 20, {ease: FlxEase.quadInOut});
            tweenHud = FlxTween.tween(camHUD, {zoom: 1.25}, 20, {ease: FlxEase.quadInOut});

        case 736:
            tweenGame.cancel();
            tweenHud.cancel();
        
        case 800: 
            add(fillScreenThing);  // makeSolid doesn't work on BeatHit at all
    }
}