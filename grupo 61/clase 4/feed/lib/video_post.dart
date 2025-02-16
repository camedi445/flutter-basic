import 'package:feed/likeable_mixin.dart';
import 'package:feed/post.dart';
import 'package:feed/post_type.dart';

class VideoPost extends Post with LikeableMixin {
  final String videoUrl;
  final int duration;

  VideoPost({
    required this.videoUrl,
    required this.duration,
    required super.id,
    required super.author,
    required super.content,
    super.createdAt,
  }) : super(type: PostType.video);

  VideoPost.fromMap(Map<String, dynamic> map)
      : videoUrl = map['videoUrl'],
        duration = map['duration'],
        super(
          id: map['id'],
          author: map['author'],
          content: map['content'],
          type: PostType.image,
        );

  @override
  void display() {
    print('--- Post con Video ---');
    print('Autor: $author');
    print('Contenido: $content');
    print('Video: $videoUrl');
    print('Duración: $duration segundos');
    print('Publicado el: ${createdAt.toLocal()}');
    print('likes: $likes');
    super.display();
  }
}
