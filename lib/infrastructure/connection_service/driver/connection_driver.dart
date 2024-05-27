
import 'dart:async';

abstract class ConnectionDriver {
  Future<bool> get isOnline;
  Stream<bool> get listenConnectionStatus;
}
