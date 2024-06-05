import 'package:flutter_clean_architecture_boilerplate/features/post/data/remote_post_repository_impl.dart';
import 'package:flutter_clean_architecture_boilerplate/features/post/domain/entity/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_list_provider.g.dart';

@riverpod
Future<List<Post>> getPosts(postRef) {
  final repository = postRef.watch(postRepositoryProvider);
  return repository.getPosts();
}
