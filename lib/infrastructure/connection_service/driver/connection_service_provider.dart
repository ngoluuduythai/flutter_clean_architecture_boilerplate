import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_clean_architecture_boilerplate/infrastructure/connection_service/connection_service.dart';
import 'package:flutter_clean_architecture_boilerplate/infrastructure/connection_service/connection_service_impl.dart';
import 'package:flutter_clean_architecture_boilerplate/infrastructure/connection_service/driver/flutter_connectivity_driver.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityProvider = Provider<FlutterConnectivityDriver>((ref) {
  return FlutterConnectivityDriver(connectivity: Connectivity());
});
 
final connectionServiceProvider = Provider<ConnectionService>((ref) {
  final connectionDriver =  ref.watch(connectivityProvider);
  return ConnectionServiceImpl(driver: connectionDriver);
});
 