part of floppy_horse;

class HorseActor extends ComponentActor with PhysicsActor implements ImageDrawable {

    ImageAnimation _img;

    HorseActor(this._img);

    GameMessageResponse handleMessage(GameMessage m) {

        return null;
    }

    ImageElement get image => this._img.getImage();

    DrawingComponent _drawingComponent;
    set drawingComponent(DrawingComponent d) => this._drawingComponent = d;
    DrawingComponent get drawingComponent => this._drawingComponent;

    void draw(CanvasRenderingContext2D c) {
        if (this.drawingComponent != null) this.drawingComponent.update(c, this);
    }
}

