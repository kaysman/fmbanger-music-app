import 'dart:developer';

import 'package:dio/dio.dart';

import 'constants.dart';

class DioRequest {
  static DioRequest _instance = DioRequest._internal();
  factory DioRequest() => _instance;

  Dio? dio;

  DioRequest._internal() {
    // Dio BaseOptions object
    final BaseOptions options = BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: 40000,
      receiveTimeout: 35000,
      headers: {},
      contentType: 'application/json; charset=utf-8',
    );

    // initialize dio
    dio = Dio(options);
  }

  /// get request
  get(
      String path, {
        Map<String, dynamic>? params,
        Options? options,
      }) async {
    try {
      final Options requestOptions = options ?? Options();

      final response = await dio?.get(
        path,
        queryParameters: params,
        options: requestOptions,
      );

      return response?.data;
    } on DioError catch (e) {
      log(e.toString());
      throw createErrorEntity(e);
    }
  }

  ///  post request
  Future post(String path, {dynamic params, Options? options}) async {
    try {
      final Options requestOptions = options ?? Options();

      final response =
      await dio?.post(path, data: params, options: requestOptions);
      return response?.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  ///  put request
  Future put(String path, {dynamic params, Options? options}) async {
    try {
      final Options requestOptions = options ?? Options();

      final response =
      await dio?.put(path, data: params, options: requestOptions);
      return response?.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  ///  patch request
  Future patch(String path, {dynamic params, Options? options}) async {
    try {
      final Options requestOptions = options ?? Options();

      final response =
      await dio?.patch(path, data: params, options: requestOptions);
      return response?.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  /// delete request
  Future delete(String path, {dynamic params, Options? options}) async {
    try {
      final Options requestOptions = options ?? Options();

      final response =
      await dio?.delete(path, data: params, options: requestOptions);
      return response?.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  ///  post form request
  Future postForm(String path,
      {Map<String, dynamic>? params, Options? options}) async {
    final Options requestOptions = options ?? Options();

    try {
      final response = await dio?.post(
        path,
        data: FormData.fromMap(params!),
        options: requestOptions,
      );
      return response?.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }
}

ErrorEntity createErrorEntity(DioError error) {
  switch (error.type) {
    case DioErrorType.cancel:
      {
        return ErrorEntity(code: -1, message: "Request canceled");
      }

    case DioErrorType.connectTimeout:
      {
        return ErrorEntity(code: -1, message: "connection timeout");
      }

    case DioErrorType.sendTimeout:
      {
        return ErrorEntity(code: -1, message: "send timeout");
      }

    case DioErrorType.receiveTimeout:
      {
        return ErrorEntity(code: -1, message: "receive timeout");
      }

    case DioErrorType.response:
      {
        try {
          final int errCode = error.response!.statusCode!;
          switch (errCode) {
            case 400:
              {
                return ErrorEntity(code: errCode, message: "error code 400");
              }

            case 401:
              {
                return ErrorEntity(code: errCode, message: "error code 401");
              }

            case 403:
              {
                return ErrorEntity(code: errCode, message: "error code 403");
              }

            case 404:
              {
                return ErrorEntity(code: errCode, message: "error code 404");
              }

            case 405:
              {
                return ErrorEntity(code: errCode, message: "error code 405");
              }

            case 500:
              {
                return ErrorEntity(code: errCode, message: "error code 500");
              }

            case 502:
              {
                return ErrorEntity(code: errCode, message: "error code 502");
              }

            case 503:
              {
                return ErrorEntity(code: errCode, message: "error code 503");
              }

            case 505:
              {
                return ErrorEntity(code: errCode, message: "error code 505");
              }

            default:
              {
                return ErrorEntity(
                  code: errCode,
                  message: error.response!.statusMessage,
                );
              }
          }
        } on Exception catch (_) {
          return ErrorEntity(code: -1, message: "Unknown Exception");
        }
      }

    default:
      {
        return ErrorEntity(code: -1, message: error.message);
      }
  }
}

// data class
class ErrorEntity implements Exception {
  int? code;
  String? message;
  ErrorEntity({this.code, this.message});

  @override
  String toString() {
    if (message == null) return "Exception";
    return "Exception: code $code, $message";
  }
}
