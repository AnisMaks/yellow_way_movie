import 'package:flutter/material.dart';
import '../models/credit_model.dart';
import '../models/movie_model.dart';
import '../services/services.dart';
import '../widgets/movies_listview.dart';

import '../widgets/upcoming.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Model> upcomingFuture,
      trendingFuture,
      popularMoviesFuture,
      popularTvFuture,
      topRatedFuture;
  late Future<Credit> creditsFuture;

  @override
  void initState() {
    upcomingFuture = getUpcomingMovies();
    trendingFuture = getTrendingMovies();
    popularMoviesFuture = getPopularMovies();
    popularTvFuture = getPopularTvShows();
    topRatedFuture = getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 25,
        ),
        UpcomingMovies(
          future: upcomingFuture,
        ),
        const SizedBox(
          height: 10,
        ),
        MoviesListView(future: trendingFuture, headlineText: 'Тенденции'),
        MoviesListView(
            future: popularMoviesFuture, headlineText: 'Популярные фильмы'),
        MoviesListView(
            future: popularTvFuture, headlineText: 'Популярные телешоу'),
        MoviesListView(
            future: topRatedFuture, headlineText: 'Фильмы с самым высоким рейтингом'),
      ],
    );
  }
}
