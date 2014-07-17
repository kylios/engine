part of floppy_horse;

class HorseActor extends ComponentActor with Drawable, PhysicsActor {

    ImageAnimation _img;

    HorseActor(this._img);

    GameMessageResponse handleMessage(GameMessage m) {

        return null;
    }

    ImageElement get image => this._img.getImage();

    DrawingComponent _drawingComponent;
    set drawingComponent(DrawingComponent d) => this._drawingComponent = d;
    DrawingComponent get drawingComponent => this._drawingComponent;

}

