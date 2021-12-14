import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/app/submodules/movies/domain/entities/result.dart';
import 'package:movies/app/submodules/movies/domain/repositories/movies_repository.dart';
import 'package:movies/app/submodules/movies/domain/usecases/movies.dart';

class MoviesRepositoryMock extends Mock implements IMoviesRepository {}

void main() {
  final IMoviesRepository repository = MoviesRepositoryMock();
  final IMovies moviesUsecase = Movies(repository);

  test("should return popular movies", () async {
    when(() => repository.getPopularMovies()).thenAnswer(
      (_) async => const Right(
        Result(page: 1, results: [], totalResults: 100, totalPages: 2),
      ),
    );
    final response = await moviesUsecase.getPopularMovies();
    expect(response.fold(id, id), isA<Result>());
  });
}
