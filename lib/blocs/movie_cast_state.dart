part of 'movie_cast_cubit.dart';

abstract class MovieCastState extends MainPage{
  const MovieCastState({super.key});
}


class MovieCastInitial extends MovieCastState {
  const MovieCastInitial({super.key});

  List<Object> get props => [];
}

class MovieCastLoadInProgress extends MovieCastState {
  const MovieCastLoadInProgress({super.key});

  List<Object> get props => [];
}

class MovieCastLoadSuccess extends MovieCastState {

  const MovieCastLoadSuccess(this.movieCasts, {super.key});

  // ignore: prefer_typing_uninitialized_variables
  final movieCasts;

  List<Object> get props => [movieCasts];
}

class Equatable extends MovieCastState {
  const Equatable({super.key});

  List<Object> get props => [];
}