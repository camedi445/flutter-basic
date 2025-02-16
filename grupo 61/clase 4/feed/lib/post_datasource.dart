import 'dart:convert';

import 'package:feed/feed_mock.dart';
import 'package:feed/post.dart';

class PostDatasource {
  Future<List<Post>> getFeed() async {
    // Simulamos una demora de 3 segundo
    await Future.delayed(Duration(seconds: 3));
    // Convertir los datos de la API a una lista de Post
    final decodeJson = jsonDecode(feedMock) as List;
    return decodeJson.map((post) => Post.fromMap(post)).toList();
  }
}
