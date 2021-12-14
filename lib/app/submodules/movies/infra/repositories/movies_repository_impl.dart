import 'package:dartz/dartz.dart';

import 'package:movies/app/submodules/movies/domain/entities/result.dart';
import 'package:movies/app/submodules/movies/domain/repositories/movies_repository.dart';
import 'package:movies/app/submodules/movies/infra/datasources/movies_remote_data_source.dart';

class MoviesRepositoryImpl implements IMoviesRepository {
  final IMoviesRemoteDataSource remoteDataSource;

  MoviesRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Exception, Result>> getPopularMovies({
    String? language,
    int? page,
    String? region,
  }) async {
    try {
      return await remoteDataSource.getPopularMovies();
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
