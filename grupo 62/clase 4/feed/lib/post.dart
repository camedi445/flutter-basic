import 'package:feed/commentable_mixin.dart';
import 'package:feed/image_post.dart';
import 'package:feed/post_type.dart';
import 'package:feed/video_post.dart';

abstract class Post with CommentableMixin {
  final int id;
  final String? content;
  final String author;
  final DateTime createdAt;
  final PostType type;

  Post(
      {required this.id,
      this.content,
      required this.author,
      DateTime? createdAt,
      required this.type})
      : createdAt = createdAt ?? DateTime.now();

  factory Post.fromMap(Map<String, dynamic> map) {
    switch (postTypeFromString(map['type'])) {
      case PostType.image:
        return ImagePost.fromMap(map);
      case PostType.video:
        return VideoPost.fromMap(map);
    }
  }

  void display() {
    print('''
      --- Post ---
      Autor : $author
      Fecha de publicación: $createdAt
      contenido: $content
    ''');

    for (final comment in comments) {
      print('Comentario: $comment');
    }
  }
}
