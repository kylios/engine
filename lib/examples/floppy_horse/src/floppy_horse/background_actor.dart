part of floppy_horse;

class BackgroundDrawingComponent extends DrawingComponent {

    void update(CanvasRenderingContext2D context, BackgroundActor a) {

        if (a._img.complete) {

            context.drawImageScaled(a._img, a._scrollIdx, 0, a._img.width, a._img.height);
            context.drawImageScaled(a._img, a._scrollIdx + a._img.width, 0, a._img.width, a._img.height);
        }
    }
}

class BackgroundScrollComponent extends Component<BackgroundActor> {

    int _scrollSpeed;

    BackgroundScrollComponent(this._scrollSpeed);

    void update(BackgroundActor a, DateTime prev, DateTime cur) {

        int prevSeconds = prev.millisecondsSinceEpoch;
        int curSeconds = cur.millisecondsSinceEpoch;

        if (a._scroll) {

            double move = ((curSeconds - prevSeconds) / 1000 * this._scrollSpeed);
            a._scrollIdx -= move;

            if (a._scrollIdx < -1 * a._img.width) {
                a._scrollIdx = 0.0;
            }
        }
    }
}

class BackgroundActor extends ComponentActor with Drawable {

    ImageElement _img;

    double _scrollIdx = 0.0;
    bool _scroll = true;

    ImageElement get image => this._img;

    DrawingComponent _drawingComponent;
    set drawingComponent(DrawingComponent d) => this._drawingComponent = d;
    DrawingComponent get drawingComponent => this._drawingComponent;

    BackgroundActor(this._img);

    GameMessageResponse handleMessage(GameMessage message) {

        return null;
    }
}