import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/app/submodules/movies/domain/entities/result.dart';
import 'package:movies/app/submodules/movies/external/datasources/movies_remote_data_source_impl.dart';
import 'package:movies/app/submodules/movies/infra/datasources/movies_remote_data_source.dart';
import 'package:movies/core/resources/response_examples/movies_responses.dart';
import 'package:movies/core/resources/strings/api_consts.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final Dio dioMock = DioMock();
  final IMoviesRemoteDataSource remoteDataSource =
      MoviesRemoteDataSourceImpl(dioMock);

  test("should return popular movies", () async {
    when(
      () => dioMock.get(
        any(),
        queryParameters: any(named: "queryParameters"),
      ),
    ).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(
          path: ApiConsts.popularMovies,
        ),
        data: jsonDecode(
          MoviesResponse.popularMoviesResponse,
        ),
      ),
    );
    final response = await remoteDataSource.getPopularMovies();
    expect(response.fold(id, id), isA<Result>());
    expect((response.fold(id, id) as Result).results.length, 2);
  });
}
