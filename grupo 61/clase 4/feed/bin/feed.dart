import 'package:feed/image_post.dart';
import 'package:feed/post_datasource.dart';
import 'package:feed/video_post.dart';

void main() async {
  // Cargar datos del feed desde un recurso local
  final postDatasource = PostDatasource();

  print('Iniciando carga de datos...');
  // Código usando await y try-catch
  try {
    final posts = await postDatasource.getFeed();
    for (final post in posts) {
      if (post is ImagePost) {
        // Cargar comportamiento de la imagen
        post.like();
        post.like();
        post.like();
        post.unlike();
        post.addComment('Hermosa foto');
      } else if (post is VideoPost) {
        // Cargar comportamiento del video
        post.like();
        post.like();
        post.like();
      }
      post.display();
      print('\n');
    }
    print('Carga de datos finalizada');
  } catch (error) {
    print('Error: $error');
  }

  // Código original usando lambda
  postDatasource.getFeed().then((posts) {
    for (final post in posts) {
      if (post is ImagePost) {
        // Cargar comportamiento de la imagen
        post.like();
        post.like();
        post.like();
        post.unlike();
        post.addComment('Hermosa foto');
      } else if (post is VideoPost) {
        // Cargar comportamiento del video
        post.like();
        post.like();
        post.like();
      }
      post.display();
      print('\n');
    }
  }).catchError((error) {
    print('Error: $error');
  }).whenComplete(() {
    print('Carga de datos finalizada');
  });
}
