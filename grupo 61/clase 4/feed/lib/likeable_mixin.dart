
mixin LikeableMixin {

  int _likes = 0;

  void like() {
    _likes++;
  }

  void unlike() {
    if (_likes > 0) {
      _likes--;
    }
  }

  int get likes => _likes;
}