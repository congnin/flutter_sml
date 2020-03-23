import 'dart:convert';

import 'package:flutter_app/src/models/item_model.dart';
import 'package:flutter_app/src/models/trailer_model.dart';
import 'package:http/http.dart';
import 'package:inject/inject.dart';

class MovieApiProvider {
  final Client client;
  final _apiKey = '3cc91d496a0b7cf338fafae2c567ffd7';
  final _baseUrl = "http://api.themoviedb.org/3/movie";

  @provide
  MovieApiProvider(this.client);

  Future<ItemModel> fetchMovieList() async {
    Response response;
    response = await client.get("$_baseUrl/popular?api_key=$_apiKey");
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<TrailerModel> fetchTrailer(int movieId) async {
    final response =
        await client.get("$_baseUrl/$movieId/videos?api_key=$_apiKey");

    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}
