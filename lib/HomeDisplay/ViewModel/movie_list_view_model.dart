import 'package:fjob/HomeDisplay/ViewModel/movie_view_model.dart';
import 'package:fjob/Services/web_service.dart';
import 'package:flutter/material.dart';

class MovieListViewModel extends ChangeNotifier {
  List<MovieViewModel> movies = [];

  Future<void> fetchMovies(String keyword) async {
    final results = await Webservice().fetchMovies(keyword);
    movies = results.map((item) => MovieViewModel(movie: item)).toList();
    notifyListeners();
  }
}
