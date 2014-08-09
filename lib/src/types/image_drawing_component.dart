part of types;

class ImageDrawingComponent extends DrawingComponent {

    void update(CanvasRenderingContext2D context, ImageDrawable a) =>
            context.drawImageScaled(a.image, a.x, a.y, a.width, a.height);
}
