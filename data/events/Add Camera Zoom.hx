function onEvent(eventEvent) {
    if (eventEvent.event.name == "Add Camera Zoom" && FlxG.camera.zoom < maxCamZoom && FlxG.save.data.camZooming) {
        FlxTween.tween(FlxG.camera,
            {zoom: FlxG.camera.zoom + Std.parseFloat(eventEvent.event.params[0]) }, 
            Conductor.crochet / 8000, 
            {ease: FlxEase.cubicOut} );
        if (eventEvent.event.params[1] != null)
            camHUD.zoom += Std.parseFloat(eventEvent.event.params[1]);
    }
}