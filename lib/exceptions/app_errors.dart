import 'package:dio/dio.dart';

abstract class Failure implements Exception {
  String? get message;
}

class GenericError extends Failure {
  @override
  final String? message;
  final String? code;
  GenericError({this.message, this.code});

  factory GenericError.formDioError(DioError error) {
    var errorResponse = (error).response;
    return GenericError(
        message: errorResponse?.data['message'] ?? "",
        code: errorResponse?.data['error'] ?? "");
  }

  factory GenericError.formRedeemError(DioError error) {
    var errorResponse = (error).response;
    return GenericError(
        message: errorResponse?.data['data']['max_deals'] != null
            ? "You reached max of 2 deals per day!"
            : "Get Deal Error", //"You reached max of \u0002 deals per day!"
        code: errorResponse?.data['error'] ?? "");
  }
}

class ListGenericErrorsData extends Failure {
  @override
  final String? message;
  final List<GenericErrorData>? errorsData;
  ListGenericErrorsData({this.message, this.errorsData});

  factory ListGenericErrorsData.formDioError(DioError error) {
    var errorData = (error).response?.data;

    List<GenericErrorData> listErrorDataFromJson(Map<String, dynamic> map) {
      return List<GenericErrorData>.from(
          (map['errors_data'].cast<Map<String, dynamic>>()).toList()
              .map((map) => GenericErrorData.fromMap(map)));
    }

    return ListGenericErrorsData(errorsData: listErrorDataFromJson(errorData));
  }
}

class GenericErrorData extends Failure {
  @override
  final String? message;
  final String? key;
  final String? type;

  GenericErrorData({this.message, this.key, this.type});

  factory GenericErrorData.fromMap(Map<String, dynamic>? map) {
    if (map == null) return GenericErrorData();

    return GenericErrorData(
        key: map['key'], type: map['type'], message: map['message']);
  }
}

class ConnectionError extends Failure {
  @override
  final String? message;
  ConnectionError({this.message});
}

class S3ServiceError extends Failure {
  @override
  final String? message;
  S3ServiceError({this.message});
}
