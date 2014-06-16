part of component;

abstract class Component extends Actor {

    Actor _currentActor;
    Actor get currentActor => this._currentActor;

    Component attach(Actor cur) {
        this._currentActor = cur;
        return this;
    }

    void update(Scene world, DateTime prev, DateTime cur);
}
