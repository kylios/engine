part of types;

abstract class Movable {

    ControlComponent controlComponent;

    double x;
    double y;
    double width;
    double height;

    void update(Scene world, DateTime prev, DateTime cur) =>
            this.controlComponent.update(world, this, prev, cur);
}
