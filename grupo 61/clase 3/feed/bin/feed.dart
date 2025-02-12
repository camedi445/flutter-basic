import 'package:feed/image_post.dart';
import 'package:feed/video_post.dart';

void main() {
  // Cargando los datos del Feed

  // Crear un post de tipo Imagen
  final ImagePost imagePost = ImagePost(
      id: 1,
      author: 'Camilo Medina',
      content: 'Un atardecer en Medellín',
      imageUrl: 'imageUrl');

  final VideoPost videoPost = VideoPost(
      durationInSeconds: 3600,
      videoUrl: 'videoUrl',
      author: 'Camilo Medina',
      id: 2);

  // Mostrando los datos en el Feed del usuario.
  imagePost.display();
  videoPost.display();
}
