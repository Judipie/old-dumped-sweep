// function create() {
//     importScript("data/globall");
// }

function postCreate() {
    gf.kill();
    camZoomingStrength -= 0.8;
}

function postUpdate(elapsed:Float) {
    if (!FlxG.save.data.camZooming)
        camZooming = false;
    camFollow.x = 1200;
    camFollow.y = 700;

    if (curCameraTarget == 0) {
        // CPU
        defaultCamZoom = 0.52;
        defaultHudZoom = 1;
        // FlxTween.tween(FlxG.camera, {zoom: 0.55}, Conductor.crochet / 2000, {ease: FlxEase.quadInOut});
    } else {
        // BF
        defaultCamZoom = 0.5;
        defaultHudZoom = 0.96;
        // FlxTween.tween(FlxG.camera, {zoom: 0.5}, Conductor.crochet / 2000, {ease: FlxEase.quadInOut});
    }
}