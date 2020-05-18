import 'package:equatable/equatable.dart';
import 'package:flutter_app/movie_rating/data/model/api_result_model.dart';
import 'package:meta/meta.dart';

abstract class SearchMovieState extends Equatable {}

class SearchMovieInitialState extends SearchMovieState {
  @override
  List<Object> get props => [];
}

class SearchMovieLoadingState extends SearchMovieState {
  @override
  List<Object> get props => [];
}

class SearchMovieLoadedState extends SearchMovieState {
  final List<Results> movies;
  SearchMovieLoadedState({@required this.movies});
  get moviesList => movies;

  @override
  List<Object> get props => null;
}

class SearchMovieErrorState extends SearchMovieState {
  final String message;
  SearchMovieErrorState({@required this.message});
  @override
  List<Object> get props => null;
}
