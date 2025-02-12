import 'package:feed/post.dart';

class VideoPost extends Post {
  final String videoUrl;
  final int durationInSeconds;

  VideoPost({
    required this.durationInSeconds,
    required this.videoUrl,
    required super.author,
    super.content,
    super.createdAt,
    required super.id,
  });

  @override
  void display() {
    print('''
    --- Post con Video ---
    Autor : $author
    Contenido : $content
    Video : $videoUrl,
    Duración : $durationInSeconds
    Fecha de creación : $createdAt
    \n
    ''');
  }
}
