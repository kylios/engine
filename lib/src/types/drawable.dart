part of types;

abstract class Drawable {

    void setDrawingComponent(DrawingComponent drawingComponent);
    DrawingComponent get drawingComponent;

    void draw(CanvasRenderingContext2D context) => this.drawingComponent.update(context, this);
}
