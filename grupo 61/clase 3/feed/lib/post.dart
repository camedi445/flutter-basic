abstract class Post {
  final int id;
  final String? content;
  final String author;
  final DateTime? createdAt;

  Post({
    required this.author,
    DateTime? createdAt,
    this.content,
    required this.id,
  }) : createdAt = createdAt ?? DateTime.now();

  void display();
}
