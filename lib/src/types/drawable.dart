part of types;

abstract class Drawable {

    set drawingComponent(DrawingComponent);
    DrawingComponent get drawingComponent;

    double width;
    double height;
    double x;
    double y;

    void draw(CanvasRenderingContext2D context) {
        if (this.drawingComponent != null) this.drawingComponent.update(context, this);
    }
}
