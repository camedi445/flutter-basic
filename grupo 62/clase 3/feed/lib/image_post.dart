import 'package:feed/post.dart';

class ImagePost extends Post {
  final String imageUrl;

  ImagePost({
    required super.id,
    required super.author,
    required this.imageUrl,
    super.content,
  });

  @override
  void display() {
    super.display();
    print('''Imagen: $imageUrl \n''');
  }
}
