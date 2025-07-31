import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/utils/movie_parser.dart';

class MovieProvider with ChangeNotifier {
   List<Movie> _movieList = [
    // 'Movie 1',
    // 'Movie 2',
    // 'Movie 3',
    // 'Movie 4',
    // 'Movie 5',
    // 'Movie 6',
    // 'Movie 7',
    // 'Movie 8',
    // 'Movie 9',
    // 'Movie 10'
  ];

  List<Movie> get movieList => _movieList;
  Future<void> loadMovies(BuildContext context) async {
    try {
      final String jsonString = await DefaultAssetBundle.of(
        context,
      ).loadString('assets/data/film.json');
      final movies = MovieParser.parseMovies(jsonString);
      _movieList.clear();
      _movieList = movies;
      notifyListeners();
    } catch (e) {
      print('Error fetching movies: $e');
    }
  }

 


}
