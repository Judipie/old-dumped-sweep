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