import 'package:flutter/material.dart';
import 'package:flutter_app/movie_rating/block/movie_bloc/movie_event.dart';
import 'package:flutter_app/movie_rating/block/movie_bloc/movie_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/movie_rating/data/model/api_result_model.dart';
import 'package:flutter_app/movie_rating/data/movie_repository.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieRepository repository;

  MovieBloc({@required this.repository});

  @override
  // TODO: implement initialState
  MovieState get initialState => MovieInitialState();

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    // TODO: implement mapEventToState

    if (event is FetchMovieEvent) {
      yield MovieLoadingState();
      try {
        List<Results> movies = await repository.getMovies(event.movieType);
        yield MovieLoadedState(movies: movies);
      } catch (e) {
        yield MovieErrorState(message: e.toString());
      }
    }
  }
}
