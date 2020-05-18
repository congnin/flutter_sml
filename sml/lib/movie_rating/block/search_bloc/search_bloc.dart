import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/movie_rating/block/search_bloc/search_event.dart';
import 'package:flutter_app/movie_rating/block/search_bloc/search_state.dart';
import 'package:flutter_app/movie_rating/data/model/api_result_model.dart';
import 'package:flutter_app/movie_rating/data/movie_repository.dart';

class SearchMovieBloc extends Bloc<SearchEvent, SearchMovieState> {
  MovieRepository repository;

  SearchMovieBloc({@required this.repository});

  @override
  // TODO: implement initialState
  SearchMovieState get initialState => SearchMovieInitialState();

  @override
  Stream<SearchMovieState> mapEventToState(SearchEvent event) async* {
    // TODO: implement mapEventToState

    if (event is FetchMovieBySearchEvent) {
      yield SearchMovieLoadingState();
      try {
        List<Results> movies = await repository.getMoviesBySearch(event.query);
        yield SearchMovieLoadedState(movies: movies);
      } catch (e) {
        yield SearchMovieErrorState(message: e.toString());
      }
    }
  }
}
