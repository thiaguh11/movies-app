import 'package:flutter/material.dart';
import 'package:movies/app/submodules/movies/domain/entities/movie.dart';

class ItemMovie extends StatelessWidget {
  final Movie movie;

  const ItemMovie({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        child: Ink(
          width: double.infinity,
          height: 120,
          child: Row(
            children: [
              Image.network(
                "https://image.tmdb.org/t/p/w500${movie.posterPath}",
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  movie.title ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8.0),
              IconButton(
                onPressed: () {},
                splashRadius: 24.0,
                icon: const Icon(
                  Icons.favorite_outline_outlined,
                  color: Colors.pinkAccent,
                  size: 32,
                ),
              ),
              const SizedBox(width: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}