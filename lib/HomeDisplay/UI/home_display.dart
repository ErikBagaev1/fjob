import 'package:fjob/Feachers/movies_list.dart';
import 'package:fjob/HomeDisplay/ViewModel/movie_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<MovieListViewModel>(context, listen: false).fetchMovies("ave");
//you can use anything you like or not use anything here. I call it just to have a content on the screen rather than having a blank screen
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MovieListViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Movies MVVM Example"),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          centerTitle: true,
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 203, 196, 196),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      vm.fetchMovies(value);
                      _controller.clear();
                    }
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: "Поиск",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              Expanded(
                  child: MovieList(
                      movies: vm.movies)) //we will create this further down
            ])));
  }
}

// class HomeDisplay extends StatelessWidget {
//   const HomeDisplay({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
//           title: const Text('The_moovi'),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: Container(),
//         ));
//   }
// }
