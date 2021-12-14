import 'dart:convert';

import 'package:movies/app/submodules/movies/domain/entities/result.dart';
import 'package:movies/app/submodules/movies/infra/models/movie_model.dart';

class ResultModel extends Result {
  const ResultModel({
    required int page,
    required List<MovieModel> results,
    required int totalResults,
    required int totalPages,
  }) : super(
          page: page,
          results: results,
          totalResults: totalResults,
          totalPages: totalPages,
        );

  factory ResultModel.fromMap(Map<String, dynamic> map) {
    return ResultModel(
      page: map['page']?.toInt() ?? 0,
      results: List<MovieModel>.from(
        map['results']?.map(
          (x) => MovieModel.fromMap(x),
        ),
      ),
      totalResults: map['total_results']?.toInt() ?? 0,
      totalPages: map['total_pages']?.toInt() ?? 0,
    );
  }

  factory ResultModel.fromJson(String source) =>
      ResultModel.fromMap(json.decode(source));
}
