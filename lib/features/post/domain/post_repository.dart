import 'dart:async';
import 'package:flutter_clean_architecture_boilerplate/features/post/domain/entity/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}
