import 'package:k_structure/model/post_model.dart';

mixin BaseRepository {
  Future<List<Post>> getPosts();
}
