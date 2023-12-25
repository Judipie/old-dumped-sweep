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