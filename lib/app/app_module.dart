import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/app/core/utils/extensions/dio_extension.dart';

import 'submodules/movies/movies_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio().initializeDio()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: MoviesModule(),
        )
      ];
}
