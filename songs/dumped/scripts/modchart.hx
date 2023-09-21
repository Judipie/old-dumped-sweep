function postCreate() {
    boyfriend.alpha = 0.0001;
    maxCamZoom = 0.68; // Who on earth thought that 9000 of Add Camera Zoom is a good idea seriously?
    strumLines.members[0].characters[1].visible = false;
}

function stepHit(curStep) {
    switch (curStep) {
        case 432, 624, 688:
            strumLines.members[0].characters[1].visible = true;
            strumLines.members[0].characters[0].visible = false;

        case 496, 1168:
            strumLines.members[0].characters[1].visible = false;
            strumLines.members[0].characters[0].visible = true;

        case 1312:
            boyfriend.alpha = 1;
            strumLines.members[0].characters[1].visible = true;
            strumLines.members[0].characters[0].visible = false;
    }
}