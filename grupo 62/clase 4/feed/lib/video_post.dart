import 'package:feed/post.dart';
import 'package:feed/post_type.dart';

class VideoPost extends Post {
  final String videoUrl;
  final int durationInSeconds;

  VideoPost(
      {required super.id,
      required super.author,
      super.content,
      required this.videoUrl,
      required this.durationInSeconds,
      required super.type});

  VideoPost.fromMap(Map<String, dynamic> map)
      : videoUrl = map['videoUrl'],
        durationInSeconds = map['durationInSeconds'],
        super(
            id: map['id'],
            author: map['author'],
            content: map['content'],
            type: PostType.video);

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
