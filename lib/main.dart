import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_boilerplate/app.dart';
import 'package:flutter_clean_architecture_boilerplate/exceptions/async_error_logger.dart';
import 'package:flutter_clean_architecture_boilerplate/exceptions/error_logger.dart';
import 'package:flutter_clean_architecture_boilerplate/localization/string_hardcoded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore:depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // turn off the # in the URLs on the web
  usePathUrlStrategy();
  // * Register error handlers. For more info, see:
  // * https://docs.flutter.dev/testing/errors


  // * Create ProviderContainer with any required overrides
  final container = ProviderContainer(
    observers: [AsyncErrorLogger()],
  );


  final errorLogger = container.read(errorLoggerProvider);
  // * Register error handlers. For more info, see:
  // * https://docs.flutter.dev/testing/errors
  registerErrorHandlers(errorLogger);
  // * Entry point of the app
  runApp(UncontrolledProviderScope(
    container: container,
    child: const MyApp(),
  ));
}

void registerErrorHandlers(ErrorLogger errorLogger) {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    errorLogger.logError(details.exception, details.stack);
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    errorLogger.logError(error, stack);
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('An error occurred'.hardcoded),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}
