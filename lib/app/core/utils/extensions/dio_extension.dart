import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movies/app/core/resources/strings/api_consts.dart';

extension DioExtension on Dio {
  Dio initializeDio() {
    try {
      options.baseUrl = ApiConsts.baseUrl;

      interceptors.add(
            InterceptorsWrapper(
              onRequest: (RequestOptions options, handler) async {
                options.headers["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiYzJlM2RhMDQwZTA4Yzg0YmYzNTI0MGQ3ZDMyY2I1OSIsInN1YiI6IjVlNGQxNTcwOWI4NjE2MDAxMTY4NTE5OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xPZYxEMNufByoqqlsAMWym09jaDN6uZKCodQKE3evao";
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
