var bigBlackBox:FlxSprite;
var anglePart = false;

function onCountdown(event:CountdownEvent) {
    event.cancel();
}

function create() {
    bigBlackBox = new FlxSprite().makeGraphic(8000, 8000, 0xFF000000);
    bigBlackBox.y -= 400;
    bigBlackBox.x -= 400;
    bigBlackBox.cameras = [camGame];
}

function postCreate() {
    boyfriend.visible = false;
    for (i in ([iconP1, iconP2, healthBarBG, healthBar]))
        i.visible = false;
        add(bigBlackBox);

    boyfriend.visible = false;

    for (d in cpuStrums)
        if (!PlayState.coopMode && !PlayState.opponentMode) /*solo mode*/ {
            d.visible = false;
        } else {
            d.visible = true;
        }
}

function beatHit(curBeat) {
    if (curBeat == 204) {
        scrollSpeed = 2.8;
        camZoomingInterval = 2;
        camZoomingStrength = 1.2;
        camGame.flash();
        anglePart = true;
    }

    if (anglePart == true) {
        if (curBeat % 2 == 0) {
            FlxTween.tween(camGame, {angle: 5}, Conductor.crochet / 1000, {type: FlxTween.BACKWARD, ease: FlxEase.cubeInOut});
        } else {
            FlxTween.tween(camGame, {angle: -5}, Conductor.crochet / 1000, {type: FlxTween.BACKWARD, ease: FlxEase.cubeInOut});
        }
    }

    switch (curBeat){
        case curBeat = 1:
            camZoomingStrength = 0;
        case curBeat = 36:
            for (p in cpuStrums)
                p.visible = true;
            camZoomingStrength = 1;
            camZoomingInterval = 4;
            scrollSpeed = 2.5;
            iconP1.visible = true;
            iconP2.visible = true;
            healthBar.visible = true;
            healthBarBG.visible = true;
            bigBlackBox.visible = false;
        case curBeat = 268:
            camZoomingStrength = 0;
            bigBlackBox.visible = true;
            iconP1.visible = false;
            iconP2.visible = false;
            healthBar.visible = false;
            healthBarBG.visible = false;
            for (a in cpuStrums)
                a.visible = true;
    }

}