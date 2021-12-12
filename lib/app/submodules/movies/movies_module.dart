import 'package:flutter_modular/flutter_modular.dart';

import 'ui/pages/popular_movies_page.dart';

class MoviesModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const PopularMoviesPage(),
        )
      ];
}
