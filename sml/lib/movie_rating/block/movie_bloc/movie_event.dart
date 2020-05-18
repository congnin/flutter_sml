import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class MovieEvent extends Equatable {}

class FetchMovieEvent extends MovieEvent {
  @override
  // TODO: implement props
  String movieType;
  FetchMovieEvent({@required this.movieType});

  List<Object> get props => [movieType];
}
