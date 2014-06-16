part of actor;


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
