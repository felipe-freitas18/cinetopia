import 'package:cinetopia/app/models/movie.dart';
import 'package:cinetopia/app/services/search_movies_service.dart';

class SearchMoviesViewmodel {
  List<Movie> _moviesList = <Movie>[];

  Future<List<Movie>> getPopularMovies() async {
    final SearchMoviesService service = SearchPopularMoviesService();
    _moviesList = await service.getMovies();
    return _moviesList;
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final SearchMoviesService service = SearchUpcomingMoviesService();
    _moviesList = await service.getMovies();
    return _moviesList;
  }

  Future<List<Movie>> getMovies(String query) async {
    if (query.isEmpty) {
      return await getPopularMovies();
    } else {
      final SearchMoviesService service = SearchForMovie(query: query);
      _moviesList = await service.getMovies();
      return _moviesList;
    }
  }

  List<Movie> get moviesList => _moviesList;
}
