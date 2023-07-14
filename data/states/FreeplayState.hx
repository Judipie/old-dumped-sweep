import flixel.util.FlxAxes;

function postUpdate() {
    for (p in grpSongs)
        p.screenCenter(FlxAxes.X);

    iconArray[0].x = 1000 + 50;
    iconArray[1].x = 840 + 50;
}
