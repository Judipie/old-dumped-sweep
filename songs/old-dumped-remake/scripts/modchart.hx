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
    for (i in ([iconP1, iconP2, healthBarBG, healthBar])) {
        i.visible = false;
    }
    add(bigBlackBox);

    for (d in cpuStrums) {
        if (!PlayState.coopMode && !PlayState.opponentMode) /*solo mode*/ {
            d.visible = false;
        } else {
            d.visible = true;
        }
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
        case 1:
            camZoomingStrength = 0;
        case 36:
            for (p in cpuStrums) p.visible = true;
            camZoomingStrength = 1;
            camZoomingInterval = 4;
            scrollSpeed = 2.5;
            for (a in [iconP1, iconP2, healthBarBG, healthBar]) {
                a.visible = true;
            }
            bigBlackBox.visible = false;
        case 268:
            camZoomingStrength = 0;
            bigBlackBox.visible = true;
            for (a in [iconP1, iconP2, healthBarBG, healthBar]) {
                a.visible = false;
            }
            for (a in cpuStrums)
                a.visible = true;
    }

}