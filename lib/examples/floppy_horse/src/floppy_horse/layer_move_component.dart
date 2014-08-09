part of floppy_horse;

class LayerOffscreenMessage extends GameMessage {
    LayerActor _subject;
    LayerOffscreenMessage(this._subject) : super();

    LayerActor get subject => this._subject;
}

class LayerMoveComponent extends Component<LayerActor> {

    double _pxPerSec = 0.0;
    Scene _scene;

    LayerMoveComponent(this._scene, this._pxPerSec);

    void update(LayerActor a, DateTime prev, DateTime cur) {

        double dT = (cur.millisecondsSinceEpoch - prev.millisecondsSinceEpoch) / 1000;
        a.x += this._pxPerSec * dT;

        if (a.x + a.width < 0) {
            LayerOffscreenMessage m = new LayerOffscreenMessage(a);
            a.sendMessage(m);
            this._scene.sendMessage(m);
        }
    }
}