import 'package:flutter/material.dart';
import 'package:project_akhir_movie/data/models/movie.dart';
import 'package:project_akhir_movie/utils/utilcolor.dart';
import 'package:project_akhir_movie/view/home/movieimage.dart';
import 'package:project_akhir_movie/utils/utiltext.dart';


class MovieDetailPage extends StatefulWidget {
  final Movie movie;
  const MovieDetailPage({Key? key, required this.movie}) : super(key: key);
  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.movie.title.toString()), backgroundColor: Colors.deepPurple,),
      body: _movieDetail(),
    );
  }

  Widget _movieDetail() {
    var movie = widget.movie;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: 180.0,
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: MovieImage(movie: movie),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(movie.title ?? "", style: UtilText.textStyle18No),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.0, bottom: 16.0),
              child: Text(
                  "${movie.releaseDate} | ${movie.originalLanguage} | "
                      "${movie.popularity}",
                  style: UtilText.textStyle16),
            ),
            Divider(height: 1.0, color: UtilColor.colorPrimary),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  "Overview",
                  style: UtilText.textStyle20,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  movie.overview ?? "",
                  style: UtilText.textStyle16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
