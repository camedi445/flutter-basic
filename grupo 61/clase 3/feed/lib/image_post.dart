import 'package:feed/post.dart';

class ImagePost extends Post {
  final String imageUrl;

  ImagePost({
    required this.imageUrl,
    required super.author,
    super.content,
    super.createdAt,
    required super.id,
  });

  @override
  void display() {
    print('''
    --- Post con Imagen ---
    Autor : $author
    Contenido : $content
    Imagen : $imageUrl,
    Fecha de creación : $createdAt
    \n
    ''');
  }
}
