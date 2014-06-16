part of types;

abstract class Movable {

    ControlComponent get controlComponent;

    double get x;
    double get y;
    double get width;
    double get height;

    void setControlComponent(ControlComponent controlComponent);

    void update(Scene world, DateTime prev, DateTime cur) =>
            this.controlComponent.update(world, this, prev, cur);
}
