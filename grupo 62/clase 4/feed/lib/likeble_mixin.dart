mixin LikebleMixin {
  int _likes = 0;

  void like() {
    _likes++;
  }

  int get likes => _likes;
}
