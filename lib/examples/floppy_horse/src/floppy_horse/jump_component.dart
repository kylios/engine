part of floppy_horse;

class JumpComponent extends Component<PhysicsActor> implements KeyboardListener {

    int _keyPressed = 0;
    double _accel;

    JumpComponent(this._accel);

    void update(PhysicsActor a, DateTime prev, DateTime cur) {

        if (this._keyPressed != 0) {
            window.console.log("Updating vY");
            a.vY = -this._accel;
        }
    }

    void reset() {
        this._keyPressed = 0;
    }

    void onKeyDown(KeyboardEvent e) {

    }

    void onKeyUp(KeyboardEvent e) {

        window.console.log("keyup");
        this._keyPressed = e.keyCode;
    }

    void onKeyPressed(KeyboardEvent e) {

        window.console.log("keypressed");
        this._keyPressed = e.keyCode;
    }
}