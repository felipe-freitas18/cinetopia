import 'package:cinetopia/app/services/api_key.dart';

const String popularMoviesUrl =
    "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1";
const requestHeader = {
  'accept': 'application/json',
  'Authorization': 'Bearer $apiToken',
};

const imageUrlPrefix = "https://image.tmdb.org/t/p/w500";