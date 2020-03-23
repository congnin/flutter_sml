import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/blocs/movie_detail_bloc.dart';
import 'package:flutter_app/src/blocs/movies_bloc.dart';
import 'package:flutter_app/src/di/bloc_injector.dart';
import 'package:flutter_app/src/di/bloc_module.dart';
import 'package:flutter_app/src/models/item_model.dart';
import 'package:flutter_app/src/ui/movie_detail.dart';
import 'package:flutter_app/src/ui/movie_list.dart';
import 'package:inject/inject.dart';

class App extends StatelessWidget {
  final MoviesBloc moviesBloc;
  final MovieDetailBloc movieDetailBloc;

  @provide
  App(this.moviesBloc, this.movieDetailBloc) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      // ignore: missing_return
      onGenerateRoute: (settings) {
        if (settings.name == 'movieDetail') {
          final Result result = settings.arguments;
          return MaterialPageRoute(builder: (context) {
            return MovieDetail(
              movieDetailBloc,
              result.title,
              result.backdrop_path,
              result.overview,
              result.release_date,
              result.vote_average.toString(),
              result.id,
            );
          });
        }
      },
      routes: {
        '/': (context) => MovieList(moviesBloc),
      },
    );
  }
}

void main() async {
  var container = await BlocInjector.create(BlocModule());
  runApp(container.app);
}
