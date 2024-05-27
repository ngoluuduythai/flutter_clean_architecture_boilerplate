import 'package:flutter_clean_architecture_boilerplate/infrastructure/storage/hive_storage_service.dart';
import 'package:flutter_clean_architecture_boilerplate/infrastructure/storage/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageServiceProvider = Provider<StorageService>(
  (_) => HiveStorageService(),
);
