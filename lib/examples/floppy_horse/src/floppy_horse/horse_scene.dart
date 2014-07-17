part of floppy_horse;

class FloppyHorseSceneDrawer extends DrawingComponent {

    int _sceneWidth;
    int _sceneHeight;

    FloppyHorseSceneDrawer(this._sceneWidth, this._sceneHeight);

    void update(CanvasRenderingContext2D context, Drawable a) {

        double x = a.x;
        double y = this._sceneHeight - a.y;

        context.drawImageScaled(a.image, x, y + a.height, a.image.width, a.image.height);
    }
}

class HorseScene extends Scene {

    List<GameActor> _gameActors;
    List<Actor> _actors;

    BackgroundActor _backgroundActor;
    HorseActor _horseActor;

    List<GameActor> get gameActors => this._gameActors;
    List<Actor> get actors => this._actors;

    JumpComponent _jumpComponent;
    FloppyHorseSceneDrawer _drawer;

    HorseScene(int width, int height,
            ImageElement backgroundImage, List<ImageAnimationFrame> horseImages) :
            this._drawer = new FloppyHorseSceneDrawer(width, height),
            this._gameActors = new List<GameActor>(),
            this._actors = new List<Actor>() {

        this._jumpComponent = new JumpComponent(5.0);
        this.addKeyListener(this._jumpComponent);

        this._backgroundActor =
                new BackgroundActor(backgroundImage);
        this._backgroundActor.drawingComponent = new BackgroundDrawingComponent();
        this._backgroundActor.addComponent(new BackgroundScrollComponent(15));

        this._horseActor = new HorseActor(new ImageAnimation.images(horseImages));
        this._horseActor.addComponent(new PhysicsComponent(10.0));
        this._horseActor.addComponent(this._jumpComponent);
        this._horseActor.drawingComponent = this._drawer;

        this._horseActor.x = 80.0;
        this._horseActor.y = 480.0;
        this._horseActor.width = 64.0;
        this._horseActor.height = 64.0;


    }

    void start() {

    }

    void stop() {

    }

    void update(DateTime prev, DateTime cur) {

        this._backgroundActor.update(this, prev, cur);
        this._horseActor.update(this, prev, cur);

        for (Actor a in this._actors) {
            a.update(this, prev, cur);
        }

        this._jumpComponent.reset();
    }

    void draw(CanvasRenderingContext2D context) {

        this._backgroundActor.draw(context);
        this._horseActor.draw(context);

        for (Drawable a in this._actors) {

            a.draw(context);
        }
    }
}