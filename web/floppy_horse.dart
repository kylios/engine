
import 'dart:html';
import 'package:engine/examples/floppy_horse/floppy_horse.dart';
import 'package:engine/animation.dart';

DateTime prev = new DateTime.now();
CanvasElement _canvas;
HorseScene _horseScene;

void main() {
    _canvas = querySelector('#canvas');
    _horseScene = new HorseScene(
            640, 480,
            new ImageElement(src: "assets/img/floppy_horse_background.png"),
            [
                new ImageAnimationFrame(
                        img: new ImageElement(src: "assets/img/floppy_horse1.png"),
                        duration: 0.1)
              , new ImageAnimationFrame(
                      img: new ImageElement(src: "assets/img/floppy_horse2.png"),
                      duration: 0.1)
              , new ImageAnimationFrame(
                      img: new ImageElement(src: "assets/img/floppy_horse3.png"),
                      duration: 0.1)
            ]);

    _horseScene.start();
    _runInternal(null);
}

void _runInternal(var _) {
    DateTime cur = new DateTime.now();

    update(prev, cur);
    draw();

    window.requestAnimationFrame(_runInternal);
    prev = cur;
}

void update(DateTime prev, DateTime cur) {

    _horseScene.update(prev, cur);
}

void draw() {

    CanvasRenderingContext2D c = _canvas.getContext('2d');
    c.fillStyle = 'white';
    c.fillRect(0, 0, 640, 480);

    _horseScene.draw(c);
}