import 'package:fjob/HomeDisplay/Models/movie.dart';

class MovieViewModel {
  final Movie movie;

  MovieViewModel({required this.movie});

  String get title {
    return movie.title;
  }

  String get poster {
    return movie.posterUrl;
  }
}
