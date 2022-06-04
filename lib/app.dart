import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_akhir_movie/cubit/moviecubit.dart';
import 'package:project_akhir_movie/data/repositori/movierepositori.dart';
import 'package:project_akhir_movie/view/home/homepage.dart';

class App extends StatelessWidget {
  final MovieRepository movieRepository;
  const App({Key? key, required this.movieRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (context) => MoviesCubit(movieRepository: movieRepository),
        child: HomePage(),
      ),
    );
  }
}
