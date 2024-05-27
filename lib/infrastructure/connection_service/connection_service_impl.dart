import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_boilerplate/exceptions/app_errors.dart';
import 'package:flutter_clean_architecture_boilerplate/infrastructure/connection_service/connection_service.dart';
import 'package:flutter_clean_architecture_boilerplate/infrastructure/connection_service/driver/connection_driver.dart';


class ConnectionServiceImpl implements ConnectionService {
  final ConnectionDriver driver;

  ConnectionServiceImpl({required this.driver});

  @override
  Future<Either<Failure, Unit>> isOnline() async {
    try {
      final isConnected = await driver.isOnline;
      if (isConnected) {
        return const Right(unit);
      }
      throw ConnectionError(message: "You're offline");
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ConnectionError(message: "Connection Error"));
    }
  }
  
  @override
  Stream<bool> get listenConnectionStatus => driver.listenConnectionStatus;
}
