import 'dart:convert';

import 'package:fjob/HomeDisplay/Models/movie.dart';
import 'package:http/http.dart' as http;

const apikey = '1GXVX41-H9WMRVD-N2E68RY-F7QHMJ8';

class Webservice {
  Future<List<Movie>> fetchMovies(String keyword) async {
    final url = "http://www.omdbapi.com/?s=$keyword&apikey=eb0d5538";

    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["Search"];
      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
