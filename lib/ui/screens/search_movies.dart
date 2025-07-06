import 'package:cinetopia/app/viewmodels/search_movies_viewmodel.dart';
import 'package:cinetopia/ui/components/movie_card.dart';
import 'package:flutter/material.dart';

class SearchMovies extends StatefulWidget {

  SearchMovies({super.key});

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  final SearchMoviesViewmodel viewModel = SearchMoviesViewmodel();
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewModel.getMovies(textController.text),
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
                      controller: textController,
                      onEditingComplete: () {
                        FocusScope.of(context).unfocus();
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        label: Text(
                          "Pesquisar",
                          style: TextStyle(fontSize: 15),
                        ),
                        border: OutlineInputBorder(
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
