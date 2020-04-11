import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class CastEvent extends Equatable {
  String get query => null;
}

class FetchCastAndCrewEvent extends CastEvent {
  final String movieId;
  FetchCastAndCrewEvent({@required this.movieId});

  @override
  List<Object> get props => [query];
}