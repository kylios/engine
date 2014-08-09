part of floppy_horse;

abstract class PhysicsActor {

    double vX = 0.0;
    double vY = 0.0;
    double aY = 0.0;

    double x = 0.0;
    double y = 0.0;
    double width = 0.0;
    double height = 0.0;

}

class PhysicsComponent extends Component<PhysicsActor> {

    double _aG;
    HorseScene _scene;

    PhysicsComponent(this._scene, this._aG);

    void update(PhysicsActor a, DateTime prev, DateTime cur) {

        double dT = (cur.millisecondsSinceEpoch - prev.millisecondsSinceEpoch) / 1000;
        a.vY += this._aG * dT;
        a.y -= a.vY;

        // Get actors from scene and do collision detection
        for (LayerActor ac in this._scene.layerActors) {
            if ((   (a.x >= ac.x && a.x <= ac.x + ac.width) ||
                    (a.x + a.width >= ac.x && a.x + a.width <= ac.x + ac.width)) &&
                    (a.y + a.height > ac.y + ac.height && a.y <= ac.y + ac.height)) {
                // bounce
                a.vY = -12.0;
                a.y = ac.y + ac.height;
                break;
            }
        }

        if (a.y < 0.0) {
            a.y = a.height;
            a.vY = 0.0;
        }

        //window.console.log("vX: ${a.vX}, vY: ${a.vY}, x: ${a.x}, y: ${a.y}");
    }
}