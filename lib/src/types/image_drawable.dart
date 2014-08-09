part of types;

abstract class ImageDrawable extends Drawable {

    ImageElement get image;

    void draw(CanvasRenderingContext2D context);
}