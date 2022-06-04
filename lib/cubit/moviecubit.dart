import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_akhir_movie/data/repositori/movierepositori.dart';
import 'package:project_akhir_movie/data/models/movie.dart';
part 'moviestate.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MovieRepository movieRepository;
  MoviesCubit({required this.movieRepository}) : super(MoviesInitial());
  void fetchMovies() {
    emit(MoviesLoading());
    movieRepository.fetchMovies().then((movies) {
      emit(MoviesLoaded(movies: movies));
    });
  }

  void searchMovies(String query) {
    emit(MoviesLoading());
    movieRepository.searchMovies(query).then((movies) {
      emit(MoviesLoaded(movies: movies));
    });
  }
}
