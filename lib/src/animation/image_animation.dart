part of animation;

class ImageAnimationFrame {

    ImageAnimationFrame({this.img, this.duration});

    ImageElement img;
    double duration;
}

class ImageAnimation {

    List<ImageAnimationFrame> _images;
    int _pos = 0;
    double _elapsed = 0.0;
    double _lastTime = 0.0;

    ImageAnimation.images(this._images);

    ImageAnimation() : this.images(new List<ImageAnimationFrame>());

    void addImage(ImageAnimationFrame img) {
        this._images.add(img);
    }

    ImageElement getImage() {
        double curTime = new DateTime.now().millisecondsSinceEpoch / 1000;

        if (this._pos >= this._images.length) {
            this._pos = 0;
        }

        ImageAnimationFrame frame = this._images[this._pos];
        if (frame.duration <= this._elapsed + (curTime - this._lastTime)) {
            this._pos ++;
            this._elapsed = 0.0;
        } else {
            this._elapsed += curTime - this._lastTime;
        }

        this._lastTime = curTime;

        return frame.img;
    }
}