import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movies/core/resources/strings/api_consts.dart';

extension DioExtension on Dio {
  Dio initializeDio() {
    try {
      options.baseUrl = ApiConsts.baseUrl;

      interceptors.add(
            InterceptorsWrapper(
              onRequest: (RequestOptions options, handler) async {
                options.headers["Authorization"] = "Bearer xxx";
                return handler.next(options);
              },
              onResponse: (Response response, handler) async {
                return handler.next(response);
              },
              onError: (DioError e, handler) async {
                return handler.next(e);
              },
            ),
          );
    } catch (e) {
      debugPrint("Error: $e");
    }
    return this;
  }
}
