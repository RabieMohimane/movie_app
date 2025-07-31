import 'package:flutter/material.dart';
import 'package:movie_app/component/movie_card.dart';
import 'package:movie_app/models/movie.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie});
  final Movie movie;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title ?? 'Movie Details'),
        actions: const [],
      ),
      body: Container(
        child: Column(
          children: [
            MovieCard(movie: movie,hideButton: true),
            Text(
              'Movie Posters',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movie.images?.length ?? 0,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4.0,
                    child: Image.network(
                      movie.images![index],
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
