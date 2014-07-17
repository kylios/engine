part of types;

class DrawingComponent {

    void update(CanvasRenderingContext2D context, Drawable a) =>
            context.drawImageScaled(a.image, a.x, a.y, a.width, a.height);
}
