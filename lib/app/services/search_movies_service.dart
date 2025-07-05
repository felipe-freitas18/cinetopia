import 'dart:convert';

import 'package:cinetopia/app/models/movie.dart';
import 'package:cinetopia/app/services/api_key.dart';
import 'package:http/http.dart' as http;

class SearchMoviesService {
  final String popularMoviesUrl =
      "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1";

  Future<List<Movie>> searchMovies() async {
    try {
      http.Response response = await http.get(
        Uri.parse(popularMoviesUrl),
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer $apiToken',
        },
      );
      Map<String, dynamic> mapResponse = json.decode(response.body);
      List<dynamic> listDynamic = json.decode(mapResponse["results"]);
      List<Movie> listMovies = [];

      for (dynamic dyn in listDynamic) {
        Map<String, dynamic> mapMovie = dyn as Map<String, dynamic>;
        Movie movie = Movie.fromMap(mapMovie);
        listMovies.add(movie);
      }

      return listMovies;
    } catch (e) {
      return [];
    }
  }
}
