import 'package:feed/image_post.dart';
import 'package:feed/post.dart';
import 'package:feed/video_post.dart';

void main() {
// Cargar los datos del Feed

  // Crear un post con imagen.
  final imagePost = ImagePost(
      id: 1,
      content: 'Un atardecer en Medellín.',
      author: 'Camilo Medina',
      imageUrl: 'imageUrl');

  // Crear un post con video.
  final videoPost = VideoPost(
    id: 2,
    author: 'Camilo Medina',
    videoUrl: 'videoUrl',
    durationInSeconds: 3600,
  );

// Mostrar los datos del Feed del usuario.

  imagePost.display();
  videoPost.display();

  print(imagePost is Post);
}
