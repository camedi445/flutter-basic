import 'package:feed/post_service.dart';

void main() async {
  // Cargar datos del feed desde un recurso local
  final postService = PostService();

  print('Cargando los datos desde el servicio');
  final futureFeed = postService.getFeed();

  /*futureFeed.then((posts) {
    for (final post in posts) {
      post.display();
    }
  }).catchError((error) {
    print('Ocurrió un error cargando los datos: $error');
  }).whenComplete(() {
    print('Carga de datos finalizada.');
  });*/

  /*final listOfPost = await postService.getFeed();
  for (final post in listOfPost) {
    post.display();
  }*/

  final postStream = postService.getPostStream();

  postStream.listen((post) {
    post.display();
    print('\n Esperando el siguiente post \n');
  });

  print('Mostrando datos adicionales');
}
