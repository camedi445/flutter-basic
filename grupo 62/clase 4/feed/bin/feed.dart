import 'package:feed/post.dart';
import 'package:feed/post_service.dart';

void main() async {
// Cargar los datos del Feed

  print('Iniciando la carga de los datos del Feed');
  final postService = PostService();
  //final futureFeed = postService.getFeed();

  /*futureFeed.catchError((error) {
    print('Ocurrió un error al intentar cargar el feed : $error');
  }).then((listOfPost) {
    for (final post in listOfPost) {
      post.display();
    }
  }).whenComplete(() {
    print('Se completó la carga del Feed');
  });*/

  /*try {
    final List<Post> listOfPost = await postService.getFeed();
    for (final post in listOfPost) {
      post.display();
    }
    print('Se completó la carga del Feed');
  } catch (error) {
    print('Ocurrió un error al intentar cargar el feed : $error');
  }*/

  /*final postStream = postService.getPostStrean();

  await for (final post in postStream) {
    post.display();
    print('\n Esperando el siguiente Post \n');
  }*/

  postService.getPostStrean().listen((post) {
    post.display();
    print('\n Esperando el siguiente Post \n');
  });

  print('Segundo llamado a otro API');

  // Simular un evento de like
  //imagePost.like();

  // Simular un evento de comentario
  //videoPost.addComment('Comentario de prueba');

// Mostrar los datos del Feed del usuario.

  // imagePost.display();
  // videoPost.display();
}
