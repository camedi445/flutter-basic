import 'package:feed/likeable_mixin.dart';
import 'package:feed/post.dart';
import 'package:feed/post_type.dart';

class ImagePost extends Post with LikeableMixin {
  final String imageUrl;

  ImagePost({
    required super.author,
    required super.content,
    required this.imageUrl,
    super.createdAt,
    required super.id,
  }) : super(type: PostType.image);

  ImagePost.fromMap(Map<String, dynamic> map)
      : imageUrl = map['imageUrl'],
        super(
          id: map['id'],
          author: map['author'],
          content: map['content'],
          type: PostType.image,
        );

  @override
  void display() {
    print('--- Post con Imagen ---');
    print('Autor: $author');
    print('Contenido: $content');
    print('Imagen: $imageUrl');
    print('Publicado el: ${createdAt.toLocal()}');
    print('likes: $likes');
    super.display();
  }
}
