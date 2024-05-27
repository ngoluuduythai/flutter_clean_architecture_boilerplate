import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_boilerplate/exceptions/app_errors.dart';

abstract class ConnectionService {
  Future<Either<Failure, Unit>> isOnline();
  Stream<bool> get listenConnectionStatus;
}
