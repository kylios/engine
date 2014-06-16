part of scene;


abstract class Scene extends Actor {

    List<GameActor> get gameActors;
    List<Actor> get actors;

    void start();
    void stop();
    void update(Scene world, DateTime prev, DateTime cur);
    void draw(CanvasRenderingContext2D context);
}