mixin ComentableMixin {
  final List<String> _comments = [];

  void addComment(String comment) {
    _comments.add(comment);
  }

  List<String> get comments => _comments;
}
