import 'dart:convert';

import 'package:cinetopia/app/helpers/consts.dart';
import 'package:cinetopia/app/models/movie.dart';
import 'package:http/http.dart' as http;

abstract class SearchMoviesService {
  Future<List<Movie>> getMovies();
}

class SearchPopularMoviesService implements SearchMoviesService {
  final List<Movie> movies = <Movie>[];

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response = await http.get(
        Uri.parse(popularMoviesUrl),
        headers: requestHeader,
      );

      if (response.statusCode == 200) {
        for (dynamic movie in json.decode(response.body)["results"]) {
          movies.add(Movie.fromMap(movie));
        }
      } else {
        throw Exception(response.body);
      }

      return movies;
    } catch (e) {
      return movies;
    }
  }
}

class SearchForMovie implements SearchMoviesService {
  final List<Movie> movies = <Movie>[];
  final String query;

  SearchForMovie({required this.query});

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response = await http.get(
        Uri.parse(moviePrefixUrl + query + movieFilterSufix),
        headers: requestHeader,
      );

      if (response.statusCode == 200) {
        for (dynamic movie in json.decode(response.body)["results"]) {
          movies.add(Movie.fromMap(movie));
        }
      } else {
        throw Exception(response.body);
      }

      return movies;
    } catch (e) {
      return movies;
    }
  }
}
