import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_boilerplate/configs/configs.dart';
import 'package:flutter_clean_architecture_boilerplate/infrastructure/http/dio-interceptors/cache_interceptor.dart';
import 'package:flutter_clean_architecture_boilerplate/infrastructure/http/http_service.dart';
import 'package:flutter_clean_architecture_boilerplate/infrastructure/logger/system_logger.dart';
import 'package:flutter_clean_architecture_boilerplate/infrastructure/storage/storage_service.dart';


class DioHttpService implements HttpService {
  final StorageService storageService;

  late final Dio dio;
  final logger = SystemLogger();

  DioHttpService(
    this.storageService, {
    Dio? dioOverride,
    bool enableCaching = false,
  }) {
    dio = dioOverride ?? Dio(baseOptions);
    if (enableCaching) {
      dio.interceptors.add(CacheInterceptor(storageService));
    }
  }

  @override
  String get baseUrl => Configs.apiBaseUrl;

  @override
  Map<String, String> headers = {
    'accept': 'application/json',
    'content-type': 'application/json'
  };

  Map<String, String> formDataHeaders = {'content-type': 'multipart/form-data'};

  BaseOptions get baseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  @override
  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = false,
    String? customBaseUrl,
  }) async {
    logger.d("request.data $endpoint");

    dio.options.extra[dioCacheForceRefreshKey] = forceRefresh;

    Response response = await dio.get(
      endpoint,
      queryParameters: queryParameters,
    );

    logger.d("response.data ${response.data}");
    logger.d("response.statusCode ${response.statusCode}");

    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data;
  }

  @override
  Future<dynamic> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    logger.d("request.data $endpoint");

    Response response =
        await dio.post(endpoint, queryParameters: queryParameters, data: data);

    logger.d("response.data ${response.data}");
    logger.d("response.statusCode ${response.statusCode}");

    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data;
  }

  @override
  Future<dynamic> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    logger.d("request.data $endpoint");

    Response response = await dio.delete(
      endpoint,
      queryParameters: queryParameters,
      data: data,
    );

    logger.d("response.data ${response.data}");
    logger.d("response.statusCode ${response.statusCode}");

    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data;
  }

  @override
  Future put(String endpoint,
      {Map<String, dynamic>? queryParameters, dynamic data}) async {
    logger.d("request.data $endpoint put $data");

    Response response = await dio.put(
      endpoint,
      queryParameters: queryParameters,
      data: data,
    );

    logger.d("response.data ${response.data}");
    logger.d("response.statusCode ${response.statusCode}");

    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data;
  }

  @override
  Future getBytes(String endpoint,
      {Map<String, dynamic>? queryParameters,
      bool forceRefresh = false}) async {
    dio.options.extra[dioCacheForceRefreshKey] = forceRefresh;

    Response<List<int>> response = await dio.get<List<int>>(endpoint,
        queryParameters: queryParameters,
        options: Options(responseType: ResponseType.bytes));

    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data;
  }

  @override
  Future deleteFormData(String endpoint,
      {Map<String, dynamic>? queryParameters, FormData? data}) async {
    logger.d("request.data $endpoint");

    Response response = await dio.delete(
      endpoint,
      queryParameters: queryParameters,
      data: data,
      options: Options(headers: formDataHeaders),
    );

    logger.d("response.data ${response.data}");
    logger.d("response.statusCode ${response.statusCode}");

    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data;
  }

  @override
  Future getFormData(String endpoint,
      {FormData? data, bool forceRefresh = false}) async {
    logger.d("request.data $endpoint");

    dio.options.extra[dioCacheForceRefreshKey] = forceRefresh;

    Response response = await dio.get(
      endpoint,
      data: data,
      options: Options(headers: formDataHeaders),
    );

    logger.d("response.data ${response.data}");
    logger.d("response.statusCode ${response.statusCode}");

    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data;
  }

  @override
  Future putFormData(String endpoint,
      {Map<String, dynamic>? queryParameters,
      FormData? data,
      bool forceRefresh = false}) async {
    logger.d("request.data $endpoint put $data");

    Response response = await dio.put(
      endpoint,
      queryParameters: queryParameters,
      data: data,
      options: Options(headers: formDataHeaders),
    );

    logger.d("response.data ${response.data}");
    logger.d("response.statusCode ${response.statusCode}");

    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data;
  }
}

class HttpException implements Exception {
  final String? title;
  final String? message;
  final int? statusCode;

  HttpException({
    this.title,
    this.message,
    this.statusCode,
  });
}
