part of types;

abstract class ComponentActor extends Actor {

    List<Component> _components = new List<Component>();

    List<Component> get components => this._components;

    void addComponent(Component c) {
        this._components.add(c);
    }

    void update(Scene world, DateTime prev, DateTime cur) {

        for (Component c in this.components) {
            c.update(this, prev, cur);
        }
    }
}