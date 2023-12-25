function postCreate() {
   FlxG.camera.followLerp = 0;
   FlxG.camera.zoom -= 0.1;
   Options.flashingMenu = false;
}

function postUpdate(elapsed) {
    menuItems.forEach(function(a:FlxSprite){
        a.x -= 300;
    });
}