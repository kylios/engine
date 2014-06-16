part of types;

abstract class Drawable {

    DrawingComponent drawingComponent;

    void draw(CanvasRenderingContext2D context) => this.drawingComponent.update(context, this);
}
