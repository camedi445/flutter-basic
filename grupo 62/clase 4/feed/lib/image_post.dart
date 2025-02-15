import 'package:feed/likeble_mixin.dart';
import 'package:feed/post.dart';
import 'package:feed/post_type.dart';

class ImagePost extends Post with LikebleMixin {
  final String imageUrl;

  ImagePost(
      {required super.id,
      required super.author,
      required this.imageUrl,
      super.content,
      required super.type});

  ImagePost.fromMap(Map<String, dynamic> map)
      : imageUrl = map['imageUrl'],
        super(
            id: map['id'],
            author: map['author'],
            content: map['content'],
            type: PostType.image);

  @override
  void display() {
    super.display();
    print('''
       Imagen: $imageUrl 
       Cantidad de likes : $likes
    ''');
  }
}
