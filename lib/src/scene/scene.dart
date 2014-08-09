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

    /**
     * Send a message to this actor.  The message will be processed asynchronously,
     * so the response is returned in a future.
     */
    Future<GameMessageResponse> sendMessage(GameMessage message) =>
            new Future.delayed(new Duration(), () => this.handleMessage(message));

    /**
     * Abstract method, should be overridden by any child class.  Handle a
     * game message and return a response
     */
    GameMessageResponse handleMessage(GameMessage message);
}