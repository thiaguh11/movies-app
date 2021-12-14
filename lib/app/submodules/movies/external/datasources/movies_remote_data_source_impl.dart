import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:movies/app/submodules/movies/domain/entities/result.dart';
import 'package:movies/app/submodules/movies/infra/datasources/movies_remote_data_source.dart';
import 'package:movies/app/submodules/movies/infra/models/result_model.dart';
import 'package:movies/core/resources/strings/api_consts.dart';
import 'package:movies/core/utils/extensions/map_extensions.dart';

class MoviesRemoteDataSourceImpl implements IMoviesRemoteDataSource {
  final Dio dio;

  MoviesRemoteDataSourceImpl(this.dio);

  @override
  Future<Either<Exception, Result>> getPopularMovies({
    String? language,
    int? page,
    String? region,
  }) async {
    try {
      final queryParameters = {
        "language": language,
        "page": page,
        "region": region,
      };

      queryParameters.removeInvalidValues();

      final response = await dio.get(
        ApiConsts.popularMovies,
        queryParameters: queryParameters,
      );

      return Right(
        ResultModel.fromMap(
          response.data,
        ),
      );
    } on Exception catch (_) {
      rethrow;
    }
  }
}
