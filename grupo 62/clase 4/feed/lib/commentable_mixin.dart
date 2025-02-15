mixin CommentableMixin {
  final List<String> _comments = [];

  void addComment(String comment) {
    if (comment.isNotEmpty) {
      _comments.add(comment);
    }
  }

  List<String> get comments => _comments;
}
