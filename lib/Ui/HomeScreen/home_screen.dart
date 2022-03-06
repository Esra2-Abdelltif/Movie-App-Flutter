import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Bloc/cubit.dart';
import 'package:movie_app/Bloc/state.dart';
import 'package:movie_app/Data/Respository/nowplaying_repsitory.dart';
import 'package:movie_app/Data/Respository/popular_repsitory.dart';
import 'package:movie_app/Data/Respository/top_movie_repsitory.dart';
import 'package:movie_app/Data/Web%20Service/nowplaying_service.dart';
import 'package:movie_app/Data/Web%20Service/popular_service.dart';
import 'package:movie_app/Data/Web%20Service/top_movie_service.dart';
import 'package:movie_app/Ui/Screen/nowplayiny.dart';
import 'package:movie_app/Ui/Screen/popular.dart';
import 'package:movie_app/Ui/Screen/top_movies.dart';



class HomeScreen extends StatelessWidget {
   HomeScreen({Key key}) : super(key: key);
  MovieCubit movieCubit= MovieCubit(
       PopularRepostory(PopularMovieService()),
       TopMovieRepostory(TopMovieService()),
       NowPlayingRepostory(NowPlayingMovieSercive())
       );


  @override
  Widget build(BuildContext context) {

    return  BlocProvider(
      create:(BuildContext context)=> movieCubit,
       child:  BlocConsumer<MovieCubit,MovieState>(
          listener: (BuildContext context,MovieState state)
          {
            if(state is MovieInitial) return print('intial state');
            if(state is PopularMovieLoaded) return print('popular state');
            if(state is TopMovieLoaded) return print('top movie state');
            if(state is NowPlayingMovieLoaded) return print('popular state');

          },
          builder:(BuildContext context ,MovieState state) {
            return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: Text(
                    'Movie App',
                    style: TextStyle(color: Colors.black87),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                  ),
                  elevation: 5,
                  backgroundColor: Colors.white,
                  centerTitle: true,
                ),
                body:Padding(
                    padding: const EdgeInsets.only(
                      top: 9,
                    ),
                    child: ListView(
                      children: [
                         TopMovies(),
                         PopularMovie(),
                       NowPlaying(),

                      ],
                    )));
          } ,
        ),




    );
  }
}

