import 'package:cinetopia/app/viewmodels/search_movies_viewmodel.dart';
import 'package:cinetopia/ui/components/movie_card.dart';
import 'package:cinetopia/ui/screens/details.dart';
import 'package:flutter/material.dart';

class Releases extends StatelessWidget {
  final SearchMoviesViewmodel viewModel = SearchMoviesViewmodel();
  Releases({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewModel.getUpcomingMovies(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          return Container(
            decoration: BoxDecoration(color: Color(0xFF1D0E44)),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Image.asset(
                    "assets/upcoming.png",
                    height: 80,
                    width: 80,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      "Próximos Lançamentos",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SliverList.builder(
                  itemBuilder: (context, index) => IconButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Details(movie: viewModel.moviesList[index]),
                      ),
                    ),
                    icon: MovieCard(movie: viewModel.moviesList[index]),
                  ),
                  itemCount: viewModel.moviesList.length,
                ),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
