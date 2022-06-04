import 'package:flutter/material.dart';
import 'package:project_akhir_movie/data/models/movie.dart';
import 'package:project_akhir_movie/utils/utilconstants.dart';


class MovieImage extends StatelessWidget {
  final Movie movie;
  const MovieImage({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: movie.posterPath == null
              ? Icon(Icons.movie)
              : Image.network(
            imagePath + movie.posterPath!,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
