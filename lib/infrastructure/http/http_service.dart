import 'package:dio/dio.dart';

abstract class HttpService {
  String get baseUrl;

  Map<String, String> get headers;

  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = false,
  });

  Future<dynamic> getFormData(
    String endpoint, {
    FormData? data,
    bool forceRefresh = false,
  });

  Future<dynamic> getBytes(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = false,
  });

  Future<dynamic> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
  });

  Future<dynamic> put(String endpoint,
      {Map<String, dynamic>? queryParameters, dynamic data});

  Future<dynamic> putFormData(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    FormData? data,
    bool forceRefresh = false,
  });

  Future<dynamic> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
  });

  Future<dynamic> deleteFormData(String endpoint,
      {Map<String, dynamic>? queryParameters, FormData? data});
}
