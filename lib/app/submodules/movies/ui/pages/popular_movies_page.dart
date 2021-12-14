import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/app/core/widgets/default_scaffold.dart';
import 'package:movies/app/submodules/movies/ui/controllers/popular_movies_controller.dart';
import 'package:movies/app/submodules/movies/ui/widgets/item_movie.dart';
import 'package:movies/app/submodules/movies/ui/widgets/loading_more_button.dart';

class PopularMoviesPage extends StatefulWidget {
  const PopularMoviesPage({Key? key}) : super(key: key);

  @override
  State<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState
    extends ModularState<PopularMoviesPage, PopularMoviesController> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await controller.loadMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: AppBar(title: const Text("Movies App")),
      body: (_, __) => Observer(
        builder: (_) {
          final moviesList = controller.filteredMovies;

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                if (controller.isLoading && controller.originalMovies.isEmpty)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                if (moviesList.isNotEmpty)
                  ListView.builder(
                    itemCount: moviesList.length + 1,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return (index == moviesList.length)
                          ? LoadingMoreButton(
                              isLoading: controller.isLoading,
                              onPressed: () async {
                                await controller.loadMovies();
                              },
                            )
                          : ItemMovie(movie: moviesList[index]);
                    },
                  ),
                if (!controller.isLoading && moviesList.isEmpty)
                  const Center(
                    child: Text("No have results!"),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
