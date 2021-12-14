import 'package:dartz/dartz.dart';
import 'package:movies/app/submodules/movies/domain/entities/result.dart';

abstract class IMoviesRemoteDataSource {
  Future<Either<Exception, Result>> getPopularMovies({
    String? language,
    int? page,
    String? region,
  });
}
