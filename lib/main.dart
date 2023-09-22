import 'package:fjob/HomeDisplay/UI/home_display.dart';
import 'package:fjob/HomeDisplay/ViewModel/movie_list_view_model.dart';
import 'package:fjob/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      home: ChangeNotifierProvider(
        create: (context) => MovieListViewModel(),
        child: const MovieListPage(),
      ),
    );
  }
}
