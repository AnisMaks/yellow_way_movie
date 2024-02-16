import 'package:bloc/bloc.dart';
import '../main_page.dart';

part 'movie_cast_state.dart';

class MovieCastCubit extends Cubit<MovieCastState> {
  MovieCastCubit() : super(const MovieCastInitial());

  MovieCastRepository repository = MovieCastRepository();

  Future<void> getMovieCast(int movieId) async {
    try {
      emit(const MovieCastLoadInProgress());
      final movieCasts = await repository.getMovieCast(movieId);
      emit(MovieCastLoadSuccess(movieCasts));
    } catch (e) {
      rethrow;
    }
  }
}

class MovieCastRepository {
  getMovieCast(int movieId) {}
}
