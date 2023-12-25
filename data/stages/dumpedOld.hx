// function create() {
//     importScript("data/globall");
// }

function postCreate()
    camZoomingStrength -= 0.8;

function postUpdate(elapsed:Float) {
    if (!FlxG.save.data.camZooming) camZooming = false;
    camFollow.x = 1205;
    camFollow.y = 750;

    if (curCameraTarget == 0) {
        defaultCamZoom = 0.55;
        defaultHudZoom = 1;
        // FlxTween.tween(FlxG.camera, {zoom: 0.55}, Conductor.crochet / 2000, {ease: FlxEase.quadInOut});
    } else {
        defaultCamZoom = 0.52;
        defaultHudZoom = 0.97;
        // FlxTween.tween(FlxG.camera, {zoom: 0.5}, Conductor.crochet / 2000, {ease: FlxEase.quadInOut});
    }
}