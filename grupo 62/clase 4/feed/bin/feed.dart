import 'package:feed/post_service.dart';

void main() {
// Cargar los datos del Feed

  final postService = PostService();
  final feed = postService.getFeed();

  for (final post in feed) {
    print(post);
  }

  // Simular un evento de like
  //imagePost.like();

  // Simular un evento de comentario
  //videoPost.addComment('Comentario de prueba');

// Mostrar los datos del Feed del usuario.

  // imagePost.display();
  // videoPost.display();
}
