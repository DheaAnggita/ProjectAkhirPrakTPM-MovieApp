import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:project_akhir_movie/data/models/movie.dart';
import 'package:project_akhir_movie/data/models/movieresponse.dart';
import 'package:project_akhir_movie/data/services/apiclient.dart';
import 'package:project_akhir_movie/utils/utilconstants.dart';

class MovieProviders {
  ApiClient _client;

  MovieProviders(this._client);

  Future<List<Movie>> fetchMovies() async {
    try {
      Response response = await _client.dio.get(
        "discover/movie",
        queryParameters: {"api_key": API_KEY},
      );
      return MovieResponse.fromJson(response.data).results!;
    } on DioError catch (e) {
      log("RVL_ERROR : ${e.message}");
      return [];
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    try {
      Response response = await _client.dio.get(
        "search/movie",
        queryParameters: {"api_key": API_KEY, "query": query},
      );
      return MovieResponse.fromJson(response.data).results!;
    } on DioError catch (e) {
      log("RVL_ERROR : ${e.message}");
      return [];
    }
  }
}
