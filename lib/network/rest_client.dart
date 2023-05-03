import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:my_neo/widgets/extensions/cmn_ext.dart';

import '../models/base_model.dart';
import 'network_const.dart';

class RestParent {
  var dio = Dio();

  RestParent() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options); //continue
        },
        onResponse: (response, handler) {
          print('--->$response');
          return handler.next(response); // continue
        },
        onError: (DioError e, handler) {
          print(e);
          return handler.next(e); //continue
        },
      ),
    );
  }

  var options = BaseOptions(
    baseUrl: baseUrl,
  );

  Future<T> getReq<T>({
    required String endPoint,
    required Function(String aa)? resModel,
    Map<String, dynamic>? queryParams,
  }) async {
    dio.options = options;
    return await dio
        .get(
      endPoint,
      queryParameters: queryParams ?? {},
    )
        .then((value) {
      return resModel!(json.encode(value.data));
    }).onError((error, stackTrace) {
      return resModel!(handleError(error));
    });
  }

  Future<T> postReq<T>(
      {BaseOptions? reqOptions,
      required String endPoint,
      Map? data,
      FormData? formData,
      required Function(String aa)? resModel,
      Map<String, dynamic>? queryParams,
      bool withAuth = false}) async {
    dio.options = reqOptions ?? options;
    Map<String, String> header = await requestHeader(withAuth);
    return await dio
        .post(endPoint,
            queryParameters: queryParams ?? {},
            data: data ?? formData ?? {},
            options: Options(
              headers: header,
            ))
        .then((value) {
      return resModel!(json.encode(value.data));
    }).onError((error, stackTrace) {
      return resModel!(handleError(error));
    });
  }

  String handleError(error) {
    String message = "Some thing went wrong";
    if (error is SocketException) {
      message = "No internet connection";
    } else if (error is FormatException) {
      message = "Something wrong in response.";
    }
    Map<String, dynamic> er = {
      "status": 0,
      "msg": message,
    };
    return json.encode(er);
  }

  Future<BaseModel> postReqWithError<T, E>(
      {BaseOptions? reqOptions,
      required String endPoint,
      Map? data,
      FormData? formData,
      required Function(String aa)? resModel,
      required Function(String aa)? errorModel,
      Map<String, dynamic>? queryParams,
      bool withAuth = false}) async {
    dio.options = reqOptions ?? options;
    Map<String, String> header = await requestHeader(withAuth);
    return await dio
        .post(
      endPoint,
      queryParameters: queryParams ?? {},
      data: data ?? formData ?? {},
      options: Options(
        headers: header,
      ),
    ).then((value) {
      return BaseModel<T, E>(
          error: null, body: resModel!(json.encode(value.data)));
    }).onError((DioError error, stackTrace) {
      error.response.toString().debugPrint;
      return handleError2<T, E>(error, errorModel);
    });
  }

  Future<BaseModel> getReqWithError<T, E>(
      {BaseOptions? reqOptions,
      required String endPoint,
      required Function(String aa)? resModel,
      required Function(String aa)? errorModel,
      Map<String, dynamic>? queryParams,
        Map<String, String>? myHeader,
      bool withAuth = false}) async {
    dio.options = reqOptions ?? options;
    Map<String, String> header = await requestHeader(withAuth);
    printLine;
    printLine;
    header.toString().debugPrint;
    printLine;
    printLine;
    return await dio
        .get(endPoint,
            queryParameters: queryParams ?? {},
            options: Options(
              headers: myHeader?? header,
            ))
        .then((value) {
      return BaseModel<T, E>(
          error: null,
          body: json.encode(value.data).isJson()
              ? resModel!(json.encode(value.data))
              : null);
    }).onError((DioError error, stackTrace) {
      error.response.toString().debugPrint;
      return handleError2<T, E>(error, errorModel);
    });
  }

  Future<BaseModel> putReqWithError<T, E>(
      {BaseOptions? reqOptions,
      required String endPoint,
      Map? data,
      FormData? formData,
      required Function(String aa)? resModel,
      required Function(String aa)? errorModel,
      Map<String, dynamic>? queryParams,
      bool withAuth = false}) async {
    dio.options = reqOptions ?? options;
    Map<String, String> header = await requestHeader(withAuth);
    return await dio
        .put(endPoint,
            data: data ?? formData ?? {},
            options: Options(
              headers: header,
            ))
        .then((value) {
      return BaseModel<T, E>(
          error: null, body: resModel!(json.encode(value.data)));
    }).onError((DioError error, stackTrace) {
      error.response.toString().debugPrint;
      return handleError2<T, E>(error, errorModel);
    });
  }

  Future<BaseModel> deleteReqWithError<T, E>(
      {BaseOptions? reqOptions,
      required String endPoint,
      Map? data,
      FormData? formData,
      required Function(String aa)? resModel,
      required Function(String aa)? errorModel,
      Map<String, dynamic>? queryParams,
      bool withAuth = false}) async {
    dio.options = reqOptions ?? options;
    Map<String, String> header = await requestHeader(withAuth);
    return await dio
        .delete(endPoint,
            queryParameters: queryParams ?? {},
            data: data ?? formData ?? {},
            options: Options(
              headers: header,
            ))
        .then((value) {
      return BaseModel<T, E>(
          error: null, body: resModel!(json.encode(value.data)));
    }).onError((DioError error, stackTrace) {
      error.response.toString().debugPrint;
      return handleError2<T, E>(error, errorModel);
    });
  }

  BaseModel<T, E> handleError2<T, E>(
      DioError error, Function(String aa)? errorMethod) {
    return BaseModel<T, E>(
        error: errorMethod!(json.encode(error.response?.data ?? "")),
        body: null);
  }
}
