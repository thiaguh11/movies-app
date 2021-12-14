// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PopularMoviesController on _PopularMoviesControllerBase, Store {
  final _$isLoadingAtom = Atom(name: '_PopularMoviesControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$originalMoviesAtom =
      Atom(name: '_PopularMoviesControllerBase.originalMovies');

  @override
  ObservableList<Movie> get originalMovies {
    _$originalMoviesAtom.reportRead();
    return super.originalMovies;
  }

  @override
  set originalMovies(ObservableList<Movie> value) {
    _$originalMoviesAtom.reportWrite(value, super.originalMovies, () {
      super.originalMovies = value;
    });
  }

  final _$filteredMoviesAtom =
      Atom(name: '_PopularMoviesControllerBase.filteredMovies');

  @override
  ObservableList<Movie> get filteredMovies {
    _$filteredMoviesAtom.reportRead();
    return super.filteredMovies;
  }

  @override
  set filteredMovies(ObservableList<Movie> value) {
    _$filteredMoviesAtom.reportWrite(value, super.filteredMovies, () {
      super.filteredMovies = value;
    });
  }

  final _$loadMoviesAsyncAction =
      AsyncAction('_PopularMoviesControllerBase.loadMovies');

  @override
  Future<dynamic> loadMovies() {
    return _$loadMoviesAsyncAction.run(() => super.loadMovies());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
originalMovies: ${originalMovies},
filteredMovies: ${filteredMovies}
    ''';
  }
}
