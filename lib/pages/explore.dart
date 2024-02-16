import 'package:flutter/material.dart';
import '../services/services.dart';
import '../widgets/movies_listview.dart';
import '../widgets/search.dart';
import '../models/movie_model.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late Future<Model> comedyFuture,
      actionFuture,
      horrorFuture,
      dramaFuture,
      romanceFuture,
      familyFuture;
  @override
  void initState() {
    comedyFuture = discoverMovies(genreId: 35);
    actionFuture = discoverMovies(genreId: 28);
    horrorFuture = discoverMovies(genreId: 27);
    dramaFuture = discoverMovies(genreId: 18);
    familyFuture = discoverMovies(genreId: 10751);
    romanceFuture = discoverMovies(genreId: 10749);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GestureDetector(
          onTap: () {
            showSearch(context: context, delegate: Search());
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            height: 60,
            child: Card(
              color: const Color.fromARGB(255, 207, 152, 52).withOpacity(.2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Поиск фильма...'),
                  ],
                ),
              ),
            ),
          ),
        ),
        MoviesListView(future: comedyFuture, headlineText: 'Комедийные фильмы'),
        MoviesListView(future: actionFuture, headlineText: 'Боевики'),
        MoviesListView(future: dramaFuture, headlineText: 'Драматические фильмы'),
        MoviesListView(future: horrorFuture, headlineText: 'Фильмы ужасов'),
        MoviesListView(future: familyFuture, headlineText: 'Семейные фильмы'),
        MoviesListView(future: romanceFuture, headlineText: 'Романтические фильмы'),
      ],
    );
  }
}
