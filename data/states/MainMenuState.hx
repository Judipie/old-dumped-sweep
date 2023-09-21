import flixel.FlxObject;

var camFollowPos:FlxObject;

function postCreate() {
    camFollowPos = new FlxObject(0, 350);
   add(camFollowPos);
   FlxG.camera.follow(camFollowPos, null);
   FlxG.camera.zoom -= 0.1;
   Options.flashingMenu = false;
}

function postUpdate(elapsed) {
    menuItems.forEach(function(a:FlxSprite){
        a.x -= 300;
    });
}