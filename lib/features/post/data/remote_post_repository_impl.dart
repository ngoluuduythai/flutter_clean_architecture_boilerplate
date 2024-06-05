import 'package:flutter_clean_architecture_boilerplate/constants/endpoints.dart';
import 'package:flutter_clean_architecture_boilerplate/features/post/domain/entity/post.dart';
import 'package:flutter_clean_architecture_boilerplate/features/post/domain/post_repository.dart';
import 'package:flutter_clean_architecture_boilerplate/infrastructure/http/http_service.dart';
import 'package:flutter_clean_architecture_boilerplate/infrastructure/http/http_service_provider.dart';
import 'package:flutter_clean_architecture_boilerplate/infrastructure/logger/logger_provider.dart';
import 'package:flutter_clean_architecture_boilerplate/infrastructure/logger/system_logger.dart';
import 'package:flutter_clean_architecture_boilerplate/utils/extensions/extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemotePostRepositoryImpl extends PostRepository {
  // api objects
  final HttpService _httpService;
  final SystemLogger _logger;

  // constructor
  RemotePostRepositoryImpl(this._httpService, this._logger);

  // Post: ---------------------------------------------------------------------
  @override
  Future<List<Post>> getPosts() async {
    final resp = await _httpService.get('${Endpoints.baseUrl}/posts');
    _logger.d(resp);

    final posts = (resp['data'] as List<dynamic>).passerJson((json) => Post.fromJson(json));
    return posts;
  }
}

final postRepositoryProvider = Provider<PostRepository>(
  (ref) {
    final httpService = ref.watch(httpServiceProvider);
    final logService = ref.watch(loggerServiceProvider);

    return RemotePostRepositoryImpl(
      httpService,
      logService,
    );
  },
);
