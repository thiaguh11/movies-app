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
}
