import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
          Text(movie.title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(movie.overview, maxLines: 2, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
