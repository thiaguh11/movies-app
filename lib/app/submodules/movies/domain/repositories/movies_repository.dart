import 'package:dartz/dartz.dart';

import '../entities/result.dart';

abstract class IMoviesRepository {
  Future<Either<Exception, Result>> getPopularMovies({
    String? language,
    int? page,
    String? region,
  });
}
