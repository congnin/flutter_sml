import 'package:flutter_app/bloc_ex/models/item_model.dart';
import 'package:flutter_app/bloc_ex/models/trailer_model.dart';
import 'package:flutter_app/bloc_ex/resources/movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() =>
      moviesApiProvider.fetchMovieList();

  Future<TrailerModel> fetchTrailers(int movieId) =>
      moviesApiProvider.fetchTrailer(movieId);
}