import 'package:equatable/equatable.dart';

import 'movie.dart';

class Result extends Equatable {
  final int page;
  final List<Movie> results;
  final int totalResults;
  final int totalPages;

  const Result({
    required this.page,
    required this.results,
    required this.totalResults,
    required this.totalPages,
  });

  @override
  List<Object?> get props => [
        page,
        results,
        totalResults,
        totalPages,
      ];

  @override
  bool? get stringify => true;
}
