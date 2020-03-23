import 'package:flutter_app/src/blocs/bloc_base.dart';
import 'package:flutter_app/src/models/item_model.dart';
import 'package:flutter_app/src/resources/repository.dart';
import 'package:inject/inject.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc extends BlocBase {
  final Repository _repository;
  PublishSubject<ItemModel> _moviesFetcher;

  @provide
  MoviesBloc(this._repository);

  init() {
    _moviesFetcher = PublishSubject<ItemModel>();
  }

  Stream<ItemModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  @override
  dispose() {
    _moviesFetcher.close();
  }
}