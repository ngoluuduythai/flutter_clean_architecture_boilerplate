import 'package:flutter_clean_architecture_boilerplate/infrastructure/logger/system_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loggerServiceProvider = Provider<SystemLogger>((ref) {
  return SystemLogger();
});