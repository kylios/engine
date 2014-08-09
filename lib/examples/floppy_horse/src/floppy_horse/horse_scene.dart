part of floppy_horse;

class FloppyHorseSceneDrawer extends ImageDrawingComponent {

    int _sceneWidth;
    int _sceneHeight;

    FloppyHorseSceneDrawer(this._sceneWidth, this._sceneHeight);

    void update(CanvasRenderingContext2D context, ImageDrawable a) {

        double x = a.x;
        double y = this._sceneHeight - a.y - a.image.height;

        context.drawImageScaled(a.image, x, y, a.image.width, a.image.height);
    }
}

class FloppyHorseLayerDrawer extends DrawingComponent {

    int _sceneWidth;
    int _sceneHeight;

    FloppyHorseLayerDrawer(this._sceneWidth, this._sceneHeight);

    void update(CanvasRenderingContext2D c, PlatformActor a) {

        var style = c.fillStyle;
        c.fillStyle = a.color;
        c.fillRect(a.x, this._sceneHeight - a.y - a.height, a.width, a.height);
        c.fillStyle = style;
    }
}

class HorseScene extends Scene {

    static final double _PLATFORM_PLACEMENT_INTERVAL = 4.5;
    static final double _PLATFORM_WIDTH = 64.0;
    static final double _PLATFORM_HEIGHT = 8.0;

    Random _rand = new Random();

    List<GameActor> _gameActors;
    List<Actor> _actors;

    BackgroundActor _backgroundActor;
    HorseActor _horseActor;

    List<GameActor> get gameActors => this._gameActors;
    List<Actor> get actors => this._actors;

    JumpComponent _jumpComponent;
    FloppyHorseSceneDrawer _drawer;
    LayerMoveComponent _layer1;
    FloppyHorseLayerDrawer _platformDrawer;

    double _lastPlacedPlatform = 0.0;

    HorseScene(int width, int height,
            ImageElement backgroundImage,
            List<ImageAnimationFrame> horseImages) {

        this._drawer = new FloppyHorseSceneDrawer(width, height);
        this._layer1 = new LayerMoveComponent(this, -65.0);
        this._platformDrawer = new FloppyHorseLayerDrawer(width, height);
        this._gameActors = new List<GameActor>();
        this._actors = new List<Actor>();

        this._jumpComponent = new JumpComponent(5.0);
        this.addKeyListener(this._jumpComponent);

        this._backgroundActor = new BackgroundActor(backgroundImage);
        this._backgroundActor.drawingComponent = new BackgroundDrawingComponent();
        this._backgroundActor.addComponent(new BackgroundScrollComponent(15));

        this._horseActor = new HorseActor(new ImageAnimation.images(horseImages));
        this._horseActor.addComponent(new PhysicsComponent(this, 10.0));
        this._horseActor.addComponent(this._jumpComponent);
        this._horseActor.drawingComponent = this._drawer;

        this._horseActor.x = 120.0;
        this._horseActor.y = 480.0;
        this._horseActor.width = 64.0;
        this._horseActor.height = 64.0;

        this._actors.add(this._backgroundActor);
        this._actors.add(this._horseActor);
    }

    void start() {

    }

    void stop() {

    }

    void update(DateTime prev, DateTime cur) {

        double curMillis = cur.millisecondsSinceEpoch / 1000;
        if (curMillis - this._lastPlacedPlatform > _PLATFORM_PLACEMENT_INTERVAL) {
            this._lastPlacedPlatform = curMillis;
            this._placePlatform();
        }

        for (Actor a in this._actors) {
            a.update(this, prev, cur);
        }

        this._jumpComponent.reset();
    }

    void draw(CanvasRenderingContext2D context) {

        for (Drawable a in this._actors) {

            a.draw(context);
        }
    }

    GameMessageResponse handleMessage(GameMessage m) {

        if (m is LayerOffscreenMessage) {
            this._actors.remove(m.subject);
        }
        return null;
    }

    Iterable<LayerActor> get layerActors =>
            this._actors.where((a) => a is LayerActor);

    void _placePlatform() {

        double height = _rand.nextDouble() * 320;

        PlatformActor a = new PlatformActor("red", 680.0, height,
                _PLATFORM_WIDTH, _PLATFORM_HEIGHT);
        a.addComponent(this._layer1);
        a.drawingComponent = this._platformDrawer;
        this.actors.add(a);
    }
}