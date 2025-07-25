import 'package:cinetopia/app/services/api_key.dart';

const String popularMoviesUrl =
    "https://api.themoviedb.org/3/movie/popular?language=pt-BR&page=1";

const String popularUpcomingMoviesUrl = "https://api.themoviedb.org/3/movie/upcoming?language=pt-BR&page=1";

const String moviePrefixUrl =
    'https://api.themoviedb.org/3/search/movie?query=';

const String movieFilterSufix = "&include_adult=false&language=pt-BR&page=1";

const requestHeader = {
  'accept': 'application/json',
  'Authorization': 'Bearer $apiToken',
};

const imageUrlPrefix = "https://image.tmdb.org/t/p/w500";
