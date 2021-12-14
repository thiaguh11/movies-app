import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String? posterPath;
  final bool adult;
  final String? overview;
  final String? releaseDate;
  final List<int> genreIds;
  final int id;
  final String? originalTitle;
  final String? originalLanguage;
  final String? title;
  final String? backdropPath;
  final double popularity;
  final int voteCount;
  final bool video;
  final double voteAverage;

  const Movie({
    this.posterPath,
    required this.adult,
    this.overview,
    this.releaseDate,
    required this.genreIds,
    required this.id,
    this.originalTitle,
    this.originalLanguage,
    this.title,
    this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
  });

  @override
  List<Object?> get props {
    return [
      posterPath,
      adult,
      overview,
      releaseDate,
      genreIds,
      id,
      originalTitle,
      originalLanguage,
      title,
      backdropPath,
      popularity,
      voteCount,
      video,
      voteAverage,
    ];
  }

  @override
  bool? get stringify => true;

  Movie copyWith({
    String? posterPath,
    bool? adult,
    String? overview,
    String? releaseDate,
    List<int>? genreIds,
    int? id,
    String? originalTitle,
    String? originalLanguage,
    String? title,
    String? backdropPath,
    double? popularity,
    int? voteCount,
    bool? video,
    double? voteAverage,
  }) {
    return Movie(
      posterPath: posterPath ?? this.posterPath,
      adult: adult ?? this.adult,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id,
      originalTitle: originalTitle ?? this.originalTitle,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      title: title ?? this.title,
      backdropPath: backdropPath ?? this.backdropPath,
      popularity: popularity ?? this.popularity,
      voteCount: voteCount ?? this.voteCount,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
    );
  }
}
