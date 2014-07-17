part of types;

abstract class Drawable {

    set drawingComponent(DrawingComponent);
    DrawingComponent get drawingComponent;

    ImageElement get image;

    double width;
    double height;
    double x;
    double y;

    void draw(CanvasRenderingContext2D context) => this.drawingComponent.update(context, this);
}
