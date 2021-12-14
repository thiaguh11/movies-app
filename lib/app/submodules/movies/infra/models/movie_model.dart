import 'dart:convert';

import 'package:movies/app/submodules/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    String? posterPath,
    required bool adult,
    String? overview,
    String? releaseDate,
    required List<int> genreIds,
    required int id,
    String? originalTitle,
    String? originalLanguage,
    String? title,
    String? backdropPath,
    required double popularity,
    required int voteCount,
    required bool video,
    required double voteAverage,
  }) : super(
          posterPath: posterPath,
          adult: adult,
          overview: overview,
          releaseDate: releaseDate,
          genreIds: genreIds,
          id: id,
          originalTitle: originalTitle,
          originalLanguage: originalLanguage,
          title: title,
          backdropPath: backdropPath,
          popularity: popularity,
          voteCount: voteCount,
          video: video,
          voteAverage: voteAverage,
        );

  Map<String, dynamic> toMap() {
    return {
      'posterPath': posterPath,
      'adult': adult,
      'overview': overview,
      'releaseDate': releaseDate,
      'genreIds': genreIds,
      'id': id,
      'originalTitle': originalTitle,
      'originalLanguage': originalLanguage,
      'title': title,
      'backdropPath': backdropPath,
      'popularity': popularity,
      'voteCount': voteCount,
      'video': video,
      'voteAverage': voteAverage,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      posterPath: map['poster_path'],
      adult: map['adult'] ?? false,
      overview: map['overview'],
      releaseDate: map['release_date'],
      genreIds: List<int>.from(map['genre_ids']),
      id: map['id']?.toInt() ?? 0,
      originalTitle: map['original_title'],
      originalLanguage: map['original_language'],
      title: map['title'],
      backdropPath: map['backdrop_path'],
      popularity: map['popularity']?.toDouble() ?? 0.0,
      voteCount: map['vote_count']?.toInt() ?? 0,
      video: map['video'] ?? false,
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));
}
