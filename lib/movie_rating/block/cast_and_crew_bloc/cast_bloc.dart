import 'package:flutter/material.dart';
import 'package:flutter_app/movie_rating/block/cast_and_crew_bloc/cast_event.dart';
import 'package:flutter_app/movie_rating/block/cast_and_crew_bloc/cast_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/movie_rating/data/model/api_cast_model.dart';
import 'package:flutter_app/movie_rating/data/movie_repository.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  MovieRepository repository;

  CastBloc({@required this.repository});

  @override
  CastState get initialState => CastInitialState();

  @override
  Stream<CastState> mapEventToState(CastEvent event) async* {
    if (event is FetchCastAndCrewEvent) {
      yield CastLoadingState();
      try {
        List<Cast> casts = await repository.getCastList(event.movieId);
        yield CastLoadedState(casts: casts);
      } catch (e) {
        yield CastErrorState(message: e.toString());
      }
    }
  }
}
