part of floppy_horse;


class PlatformActor extends LayerActor {

    String _color;
    DrawingComponent drawingComponent;

    PlatformActor(this._color, double x, double y, double width, double height) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }

    String get color => this._color;
}

abstract class LayerActor extends ComponentActor with Drawable, Movable {


    GameMessageResponse handleMessage(GameMessage m) {

        if (m is LayerOffscreenMessage) {
            // do something?
        }
        return null;
    }
}