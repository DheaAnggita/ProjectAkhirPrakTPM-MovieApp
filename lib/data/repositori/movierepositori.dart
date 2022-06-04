import 'package:project_akhir_movie/data/models/movie.dart';
import 'package:project_akhir_movie/data/services/providers/movieproviders.dart';

class MovieRepository {
  final MovieProviders providers;
  MovieRepository(this.providers);
  Future<List<Movie>> fetchMovies() async {
    return await providers.fetchMovies();
  }
  Future<List<Movie>> searchMovies(String query) async {
    return await providers.searchMovies(query);
  }
}
