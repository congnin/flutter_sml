import 'package:flutter_app/src/models/item_model.dart';
import 'package:flutter_app/src/models/trailer_model.dart';
import 'package:flutter_app/src/resources/movie_api_provider.dart';
import 'package:inject/inject.dart';

class Repository {

  final MovieApiProvider moviesApiProvider;

  @provide
  Repository(this.moviesApiProvider);

  Future<ItemModel> fetchAllMovies() =>
      moviesApiProvider.fetchMovieList();

  Future<TrailerModel> fetchTrailers(int movieId) =>
      moviesApiProvider.fetchTrailer(movieId);
}