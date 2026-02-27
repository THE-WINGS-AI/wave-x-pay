// ignore_for_file: constant_identifier_names, use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'package:xtpay/app/utils/storage.dart';
import 'package:xtpay/app/widgets/app_colors.dart';
import 'package:xtpay/app/widgets/toast_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:xtpay/app/data/network/service/api_exception.dart';
import 'package:xtpay/app/utils/api_url.dart';
// import 'package:xtpay/app/utils/preferences_service.dart';

enum RESULT { SUCCESS, ERROR }

class DioClient {
  final Dio _dio;

  DioClient({String? baseUrl})
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl ?? ApiUrl.baseUrl, 
          connectTimeout: const Duration(milliseconds: ApiUrl.connectionTimeout),
          receiveTimeout: const Duration(milliseconds: ApiUrl.receiveTimeout),
        )) {
    _dio.interceptors.add(_interceptor());
    _dio.interceptors.add(_connectionInterceptor());
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      compact: false,
      enabled: true,
      responseBody: true,
    ));
  }

  void updateBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  Interceptor _interceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await AppStorage().getToken();
        if (token.isNotEmpty) {
          options.headers["Authorization"] = "Bearer $token";
        }
        options.headers["x-api-key"] = "<API_KEY>"; //TODO DOT ENV LATER
        handler.next(options);
      },
      onError: (error, handler) {
        DioExceptions.fromDioError(error);
        handler.next(error);
      },
    );
  }

  Interceptor _connectionInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final connectivityResult = await Connectivity().checkConnectivity();
        if (connectivityResult == ConnectivityResult.none) {
          return handler.reject(
            DioException(
              requestOptions: options,
              error: "No internet connection",
              type: DioExceptionType.connectionError,
            ),
          );
        }
        return handler.next(options);
      },
      onError: (error, handler) {
        DioExceptions.fromDioError(error);
        handler.next(error);
      },
    );
  }

  Future<Response> get(String url, {Map<String, dynamic>? params}) async {
    return await _dio.get(url, queryParameters: params);
  }

  Future<Response> post(String url, {dynamic data}) async {
    return await _dio.post(url, data: data);
  }

  Future<Response> put(String url, {dynamic data}) async {
    return await _dio.put(url, data: data);
  }

  Future<Response> postwithOptions(String url, {dynamic data, Options? options}) async {
    return await _dio.post(url, data: data, options: options);
  }

  Future<Response> delete(String url, {dynamic data}) async {
    return await _dio.delete(url, data: data);
  }

  Future<Response> sendFormData({
    required String url,
    required Map<String, dynamic> formFields,
    required Map<String, dynamic> fileStrings,
  }) async {
    FormData formData = FormData();

    formFields.forEach((key, value) {
      formData.fields.add(MapEntry(key, value.toString()));
    });       

    fileStrings.forEach((key, value) async {
      if (value != null) {
        if (File(value).existsSync()) {
          formData.files.add(MapEntry(
            key,
            await MultipartFile.fromFile(value),
          ));
        } else {
          formData.fields.add(MapEntry(key, value));
        }
      }
    });

    return await _dio.post(url, data: formData);
  }
}
