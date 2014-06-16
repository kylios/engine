library engine;

import 'dart:async';
import 'dart:html';
import 'dart:math';












class Direction {

    double _xComponent;
    double _yComponent;

    Direction(this._xComponent, this._yComponent);

    factory Direction.random([Random r = null]) {

        if (null == r) {
            r = new Random();
        }

        double xSpeed = 1.0 - 2.0 * r.nextDouble();
        double ySpeed = sqrt(1.0 - pow(xSpeed, 2));
        if (r.nextBool()) {
            ySpeed = -1 * ySpeed;
        }

        return new Direction(xSpeed, ySpeed);
    }

    double get xComponent => this._xComponent;
    double get yComponent => this._yComponent;

    List<double> toList() => [ this.xComponent, this.yComponent ];
}

abstract class Scene extends Actor {

    List<GameActor> get gameActors;
    List<Actor> get actors;

    void start();
    void stop();
    void update(Scene world, DateTime prev, DateTime cur);
    void draw(CanvasRenderingContext2D context);
}



abstract class Component extends Actor {

    Actor _currentActor;
    Actor get currentActor => this._currentActor;

    Component attach(Actor cur) {
        this._currentActor = cur;
        return this;
    }

    void update(Scene world, DateTime prev, DateTime cur);
}

abstract class ControlComponent {

    void update(Scene world, Movable a, DateTime prev, DateTime cur);
}

abstract class DrawingComponent {

    void update(CanvasRenderingContext2D context, Drawable a);
}

abstract class CollisionComponent {

    bool checkCollision(Movable a, Scene scene);

     onCollision(Movable a, Scene scene);
}


class GameMessage {

    final Actor sender;

    GameMessage(this.sender);
}

class GameMessageResponse {

    final Actor receiver;

    GameMessageResponse(this.receiver);
}

/**
 * Represents a game actor or entity that needs to send and receive messages
 * from other entities.
 */
abstract class Actor {

    StreamController<GameMessage> _messageStream = new StreamController<GameMessage>();

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

    /**
     * Stream to listen on for messages produced by this actor.
     */
    Stream<GameMessage> get messageStream => this._messageStream.stream;

    /**
     * Broadcast a message to any subscribers that might be listening.
     */
    void broadcastMessage(GameMessage message) => this._messageStream.add(message);

    /**
     * Update this object by timestamps
     */
    void update(Scene world, DateTime prev, DateTime cur);
}

abstract class Movable {

    ControlComponent controlComponent;

    double x;
    double y;
    double width;
    double height;

    void update(Scene world, DateTime prev, DateTime cur) =>
            this.controlComponent.update(world, this, prev, cur);
}

abstract class Drawable {

    DrawingComponent drawingComponent;

    void draw(CanvasRenderingContext2D context) => this.drawingComponent.update(context, this);
}

abstract class GameActor extends Actor with Drawable, Movable {

}