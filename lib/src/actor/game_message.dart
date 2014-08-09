part of actor;


class GameMessage {

    final Actor sender;

    GameMessage() : this.from(null);
    GameMessage.from(this.sender);
}
