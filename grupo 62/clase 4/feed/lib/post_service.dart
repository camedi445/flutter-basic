import 'dart:convert';

import 'package:feed/feed_mock.dart';
import 'package:feed/post.dart';

class PostService {
  List<Post> getFeed() {
    final decodeJson = jsonDecode(feedMock) as List;
    return decodeJson.map((post) => Post.fromMap(post)).toList();
  }
}
