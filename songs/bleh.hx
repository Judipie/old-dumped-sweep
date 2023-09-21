
// healthBar stuff edits
function postCreate() {
    // Health bar edits because it looked god awful after replacing image
    healthBar.scale.set(0.87, 0.3);
    healthBarBG.y -= 15;
    healthBar.y -= 15;
}

// Notecam movement
function postUpdate(elapsed:Float) {
    if (FlxG.save.data.notecam) {
        if (curCameraTarget == 1) {
            switch (boyfriend.animation.curAnim.name) {
                case "singDOWN", "singDOWN-alt": camFollow.y += 10;
                case "singUP", "singUP-alt": camFollow.y -= 10;
                case "singLEFT", "singLEFT-alt": camFollow.x -= 10;
                case "singRIGHT", "singRIGHT-alt": camFollow.x += 10;
            }
        } else {
            switch (dad.animation.curAnim.name) {
                case "singDOWN", "singDOWN-alt": camFollow.y += 10;
                case "singUP", "singUP-alt": camFollow.y -= 10;
                case "singLEFT", "singLEFT-alt": camFollow.x -= 10;
                case "singRIGHT", "singRIGHT-alt": camFollow.x += 10;
            }
        }
    }
    // iconP1.scale.set(lerp(iconP1.scale.x, 1, 0.33), lerp(iconP1.scale.y, 1, 0.33));
	// iconP2.scale.set(lerp(iconP2.scale.x, 1, 0.33), lerp(iconP2.scale.y, 1, 0.33));
}

//  Original lua script by Gazozoz
function beatHit() {
    if (FlxG.save.data.iconBop) {
        switch (curBeat % 2) {
            case 0:
                FlxTween.angle(iconP1, 0, 5, Conductor.crochet / 1000, {ease: FlxEase.circOut});
                FlxTween.angle(iconP2, 0, 5, Conductor.crochet / 1000, {ease: FlxEase.circOut});
            default:
                FlxTween.angle(iconP1, 0, -5, Conductor.crochet / 1000, {ease: FlxEase.circOut});
                FlxTween.angle(iconP2, 0, -5, Conductor.crochet / 1000, {ease: FlxEase.circOut});
        }
    }
}