import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/app/submodules/movies/domain/repositories/movies_repository.dart';
import 'package:movies/app/submodules/movies/domain/usecases/movies.dart';
import 'package:movies/app/submodules/movies/external/datasources/movies_remote_data_source_impl.dart';
import 'package:movies/app/submodules/movies/infra/datasources/movies_remote_data_source.dart';
import 'package:movies/app/submodules/movies/infra/repositories/movies_repository_impl.dart';
import 'package:movies/app/submodules/movies/ui/controllers/popular_movies_controller.dart';

import 'ui/pages/popular_movies_page.dart';

class MoviesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<PopularMoviesController>((i) => PopularMoviesController()),
        Bind<IMoviesRemoteDataSource>((i) => MoviesRemoteDataSourceImpl(i())),
        Bind<IMoviesRepository>((i) => MoviesRepositoryImpl(i())),
        Bind<IMovies>((i) => Movies(i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const PopularMoviesPage(),
        )
      ];
}
