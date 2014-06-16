part of types;

abstract class Movable {

    ControlComponent get controlComponent;

    double x;
    double y;
    double width;
    double height;

    void setControlComponent(ControlComponent controlComponent);

    void update(Scene world, DateTime prev, DateTime cur) =>
            this.controlComponent.update(world, this, prev, cur);
}
