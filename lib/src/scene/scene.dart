part of scene;


abstract class Scene {

    List<GameActor> get gameActors;
    List<Actor> get actors;

    void start();
    void stop();
    void update(DateTime prev, DateTime cur);
    void draw(CanvasRenderingContext2D context);

    void addKeyListener(KeyboardListener l) {

        window.onKeyDown.listen(l.onKeyDown);
        window.onKeyPress.listen(l.onKeyPressed);
        window.onKeyUp.listen(l.onKeyUp);
    }
}