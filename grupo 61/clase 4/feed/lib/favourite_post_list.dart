import 'package:feed/post.dart';

class FavouritePostList {
  final List<Post> _posts = [];

  void addPost(Post post) {
    _posts.add(post);
    print('Post #${post.id} agregado a favoritos');
  }
}
