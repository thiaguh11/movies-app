import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/app/submodules/movies/domain/entities/result.dart';
import 'package:movies/app/submodules/movies/domain/repositories/movies_repository.dart';
import 'package:movies/app/submodules/movies/infra/datasources/movies_remote_data_source.dart';
import 'package:movies/app/submodules/movies/infra/repositories/movies_repository_impl.dart';

class MoviesRemoteDataSourceMock extends Mock
    implements IMoviesRemoteDataSource {}

void main() {
  final IMoviesRemoteDataSource remoteDataSource = MoviesRemoteDataSourceMock();
  final IMoviesRepository repository = MoviesRepositoryImpl(remoteDataSource);

  test("should return popular movies", () async {
    when(() => remoteDataSource.getPopularMovies()).thenAnswer(
      (_) async => const Right(
        Result(page: 1, results: [], totalResults: 100, totalPages: 2),
      ),
    );
    final response = await repository.getPopularMovies();
    expect(response.fold(id, id), isA<Result>());
  });
}
