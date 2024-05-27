import 'package:flutter_clean_architecture_boilerplate/infrastructure/http/dio_http_service.dart';
import 'package:flutter_clean_architecture_boilerplate/infrastructure/http/http_service.dart';
import 'package:flutter_clean_architecture_boilerplate/infrastructure/storage/storage_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final httpServiceProvider = Provider<HttpService>((ref) {
  final storageService = ref.watch(storageServiceProvider);

  return DioHttpService(
    storageService,
    enableCaching: false,
  );
});

final httpServiceProviderCaching = Provider<HttpService>((ref) {
  final storageService = ref.watch(storageServiceProvider);

  return DioHttpService(
    storageService,
    enableCaching: true,
  );
});
