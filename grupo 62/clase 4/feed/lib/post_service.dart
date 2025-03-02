import 'dart:convert';

import 'package:feed/feed_mock.dart';
import 'package:feed/post.dart';

class PostService {
  Future<List<Post>> getFeed() async {
    // Simular un tiempo de espera de 3 segundos
    await Future.delayed(Duration(seconds: 3));
    final decodeJson = jsonDecode(feedMock) as List;
    return decodeJson.map((post) => Post.fromMap(post)).toList();
  }

  Stream<Post> getPostStrean() async* {
    // Simular un tiempo de espera de 3 segundos
    await Future.delayed(Duration(seconds: 3));
    final decodeJson = jsonDecode(feedMock) as List;
    for (final postJson in decodeJson) {
      // Emitir un post cada 2 segundos
      await Future.delayed(Duration(seconds: 2));
      yield Post.fromMap(postJson);
    }
  }
}
