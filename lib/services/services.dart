import 'package:http/http.dart' as http;
import '../models/movie_model.dart';
import '../models/credit_model.dart';
import '../models/review_model.dart';

const baseUrl = 'https://api.themoviedb.org/3/';
const apiKey = '849ca4e7d0233675e89a41072de49e65';
var key = '?api_key=$apiKey';
late String endPoint;

Future<Model> getUpcomingMovies() async {
  endPoint = 'movie/upcoming';
  final url = '$baseUrl$endPoint$key';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return modelFromJson(response.body);
  } else {
    throw Exception('не удалось загрузить тренд');
  }
}

Future<Model> getTrendingMovies() async {
  endPoint = 'trending/all/day';
  final url = '$baseUrl$endPoint$key';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return modelFromJson(response.body);
  } else {
    throw Exception('не удалось загрузить тренды');
  }
}

Future<Model> getPopularMovies() async {
  endPoint = 'movie/popular';
  final url = '$baseUrl$endPoint$key';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return modelFromJson(response.body);
  } else {
    throw Exception('не удалось загрузить популярные');
  }
}

Future<Model> getPopularTvShows() async {
  endPoint = 'tv/popular';
  final url = '$baseUrl$endPoint$key';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return modelFromJson(response.body);
  } else {
    throw Exception('не удалось загрузить популярные');
  }
}

Future<Model> getTopRatedMovies() async {
  endPoint = 'movie/top_rated';
  final String url = '$baseUrl$endPoint$key';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return modelFromJson(response.body);
  } else {
    throw Exception('не удалось загрузить фильмы с самым высоким рейтингом');
  }
}

Future<Model> discoverMovies({int? genreId}) async {
  endPoint = 'discover/movie';
  final String url = genreId == null
      ? '$baseUrl$endPoint$key'
      : '$baseUrl$endPoint$key&with_genres=$genreId';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return modelFromJson(response.body);
  } else {
    throw Exception('не удалось загрузить жанры');
  }
}

Future<Credit> getCredits(int id, bool isTvShow) async {
  endPoint = isTvShow ? 'tv/$id/credits' : 'movie/$id/credits';
  final String url = '$baseUrl$endPoint$key';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return creditFromJson(response.body);
  } else {
    throw Exception('не удалось загрузить титры');
  }
}

Future<Model> getSimilar(int id, bool isTvShow) async {
  endPoint = isTvShow ? 'tv/$id/similar' : 'movie/$id/similar';
  final String url = '$baseUrl$endPoint$key';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return modelFromJson(response.body);
  } else {
    throw Exception('не удалось загрузить сходство');
  }
}

Future<Review> getReviews(int id, bool isTvShow) async {
  endPoint = isTvShow ? 'tv/$id/reviews' : 'movie/$id/reviews';
  final String url = '$baseUrl$endPoint$key';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return reviewFromJson(response.body);
  } else {
    throw Exception('не удалось загрузить отзывы');
  }
}

Future<Model> movieSearch(String query) async {
  endPoint = 'search/movie';
  final url = '$baseUrl$endPoint$key&query=$query';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return modelFromJson(response.body);
  } else {
    throw Exception('не найдено');
  }
}

Future<Model> searchData(String query) async {
  endPoint = 'search/multi';
  final url = '$baseUrl$endPoint$key&query=$query';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return modelFromJson(response.body);
  } else {
    throw Exception('не найдено');
  }
}
