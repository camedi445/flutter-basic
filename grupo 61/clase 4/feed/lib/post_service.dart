import 'dart:convert';

import 'package:feed/feed_mock.dart';
import 'package:feed/post.dart';

class PostService {
  Future<List<Post>> getFeed() async {
    // Simulamos una demora de 3 segundo
    await Future.delayed(Duration(seconds: 3));
    // Convertir los datos de la API a una lista de Post
    final decodeJson = jsonDecode(feedMock) as List;
    return decodeJson.map((post) => Post.fromMap(post)).toList();
  }

  Stream<Post> getPostStream() async* {
    // Simulamos una demora de 3 segundo
    await Future.delayed(Duration(seconds: 3));
    final decodeJson = jsonDecode(feedMock) as List;
    for (final postJson in decodeJson) {
      // Simulamos una demora de 3 segundo
      await Future.delayed(Duration(seconds: 2));
      yield Post.fromMap(postJson);
    }
  }
}
