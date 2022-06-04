import 'package:flutter/material.dart';
import 'package:project_akhir_movie/data/models/movie.dart';
import 'package:project_akhir_movie/view/home/movieimage.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;
  final Function onTapFunction;
  const MovieListItem({
    Key? key,
    required this.movie,
    required this.onTapFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: MovieImage(movie: movie),
      ),
      onTap: () {
        onTapFunction();
      },
    );
  }
}
