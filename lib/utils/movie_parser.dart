import 'dart:convert';

import 'package:movie_app/models/movie.dart';

class MovieParser {
  static List<Movie> parseMovies(String jsonString) {
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Movie.fromJson(json as Map<String,dynamic>)).toList();
  
    
  }

}