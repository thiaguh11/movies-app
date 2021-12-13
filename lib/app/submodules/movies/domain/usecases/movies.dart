import 'package:dartz/dartz.dart';

import '../repositories/movies_repository.dart';
import '../entities/result.dart';

abstract class IMovies {
  Future<Either<Exception, Result>> getPopularMovies({
    String? language,
    int? page,
    String? region,
  });
}

class Movies implements IMovies {
  final IMoviesRepository repository;

  Movies(this.repository);

  @override
  Future<Either<Exception, Result>> getPopularMovies({
    String? language,
    int? page,
    String? region,
  }) async =>
      await repository.getPopularMovies(
        language: language,
        page: page,
        region: region,
      );
}
