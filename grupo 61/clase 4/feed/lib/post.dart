import 'package:feed/comentable_mixin.dart';
import 'package:feed/image_post.dart';
import 'package:feed/post_type.dart';
import 'package:feed/video_post.dart';

abstract class Post with ComentableMixin {
  final int id;
  final String author;
  final String content;
  final DateTime createdAt;
  final PostType type;

  // forma 1 Post(this.author, this.content, this.createdAt);

  // Forma 2
  Post({
    required this.id,
    required this.author,
    required this.content,
    required this.type,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Post.fromMap(Map<String, dynamic> map) {
    switch (postTypeFromString(map['type'])) {
      case PostType.image:
        return ImagePost.fromMap(map);
      case PostType.video:
        return VideoPost.fromMap(map);
    }
  }

  void display() {
    if (comments.isNotEmpty) {
      for (final comment in comments) {
        print('Comentario: $comment');
      }
    } else {
      print('No hay comentarios');
    }
  }
}
