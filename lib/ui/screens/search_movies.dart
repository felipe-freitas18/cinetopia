import 'package:cinetopia/app/viewmodels/search_movies_viewmodel.dart';
import 'package:cinetopia/ui/components/movie_card.dart';
import 'package:flutter/material.dart';

class SearchMovies extends StatelessWidget {
  final SearchMoviesViewmodel viewModel = SearchMoviesViewmodel();
  SearchMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewModel.getPopularMovies(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          return Container(
            decoration: BoxDecoration(color: Color(0xFF1D0E44)),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Image.asset(
                    "assets/popular.png",
                    height: 80,
                    width: 80,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      "Filmes Populares",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      decoration: InputDecoration(
                        label: Text(
                          "Pesquisar",
                          style: TextStyle(fontSize: 15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList.builder(
                  itemBuilder: (context, index) => MovieCard(movie: viewModel.moviesList[index]),
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
