import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:movies/app/submodules/movies/domain/entities/movie.dart';
import 'package:movies/app/submodules/movies/domain/usecases/movies.dart';

part 'popular_movies_controller.g.dart';

class PopularMoviesController = _PopularMoviesControllerBase
    with _$PopularMoviesController;

abstract class _PopularMoviesControllerBase with Store {
  int currentPage = 1;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Movie> originalMovies = <Movie>[].asObservable();

  @observable
  ObservableList<Movie> filteredMovies = <Movie>[].asObservable();

  @action
  Future loadMovies() async {
    try {
      final IMovies moviesUsecase = Modular.get<IMovies>();

      isLoading = true;

      final response = await moviesUsecase.getPopularMovies(
        page: currentPage++,
      );

      response.fold((error) {
        debugPrint(error.toString());
      }, (result) {
        originalMovies.addAll(result.results);
        filteredMovies.addAll(result.results);
      });
    } finally {
      isLoading = false;
    }
  }
}
