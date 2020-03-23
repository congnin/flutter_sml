import 'package:flutter_app/src/models/trailer_model.dart';
import 'package:flutter_app/src/resources/repository.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc_base.dart';

class MovieDetailBloc extends BlocBase {
  final Repository _repository;
  PublishSubject<int> _movieId;
  BehaviorSubject<Future<TrailerModel>> _trailers;

  @provide
  MovieDetailBloc(this._repository);

  Function(int) get fetchTrailersById => _movieId.sink.add;
  Stream<Future<TrailerModel>> get movieTrailers => _trailers.stream;

  init() {
    _movieId = PublishSubject<int>();
    _trailers = BehaviorSubject<Future<TrailerModel>>();
    _movieId.stream.transform(_itemTransformer()).pipe(_trailers);
  }

  @override
  dispose() async {
    _movieId.close();
    await _trailers.drain();
    _trailers.close();
  }

  _itemTransformer() {
    return ScanStreamTransformer(
          (Future<TrailerModel> trailer, int id, int index) {
        trailer = _repository.fetchTrailers(id);
        return trailer;
      },
    );
  }
}