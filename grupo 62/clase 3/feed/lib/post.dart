abstract class Post {
  final int id;
  final String? content;
  final String author;
  final DateTime createdAt;

  Post({
    required this.id,
    this.content,
    required this.author,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  void display() {
    print('''
      --- Post ---
      Autor : $author
      Fecha de publicación: $createdAt
      contenido: $content
    ''');
  }
}
