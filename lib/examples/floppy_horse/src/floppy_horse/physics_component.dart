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

    PhysicsComponent(this._aG);

    void update(PhysicsActor a, DateTime prev, DateTime cur) {

        double dT = (cur.millisecondsSinceEpoch - prev.millisecondsSinceEpoch) / 1000;
        a.vY += this._aG * dT;
        a.y -= a.vY;
        if (a.y < 0.0) {
            a.y = a.height;
            a.vY = 0.0;
        }

        window.console.log("vX: ${a.vX}, vY: ${a.vY}, x: ${a.x}, y: ${a.y}");
    }
}