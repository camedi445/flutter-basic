import 'package:feed/post.dart';

class VideoPost extends Post {
  final String videoUrl;
  final int durationInSeconds;

  VideoPost({
    required super.id,
    required super.author,
    super.content,
    required this.videoUrl,
    required this.durationInSeconds,
  });

  @override
  void display() {
    super.display();
    print('''
      Video : $videoUrl,
      Duración : $durationInSeconds
      \n
    ''');
  }
}
