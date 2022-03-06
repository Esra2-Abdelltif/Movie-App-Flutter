import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Bloc/cubit.dart';
import 'package:movie_app/Bloc/state.dart';
import 'package:movie_app/Data/Respository/nowplaying_repsitory.dart';
import 'package:movie_app/Data/Respository/popular_repsitory.dart';
import 'package:movie_app/Data/Respository/top_movie_repsitory.dart';
import 'package:movie_app/Ui/widgets/newplaying.dart';
import 'package:movie_app/Ui/widgets/popular.dart';
import 'package:movie_app/Ui/widgets/top_movies.dart';



class HomeScreen extends StatelessWidget {
   HomeScreen({Key key}) : super(key: key);
  PopularRepostory popularRepostory;
  NowPlayingRepostory nowPlayingRepostory;
  TopMovieRepostory topMovieRepostory;
  MovieCubit movieCubit;
  List popularmovie=[] ;
  List topmovie = [];
  List nowplayingmovie = [];


  @override
  Widget build(BuildContext context) {
    return  BlocProvider( create:(BuildContext context)=>MovieCubit(popularRepostory,topMovieRepostory,nowPlayingRepostory),
      child: BlocConsumer<MovieCubit,MovieState>(
        listener: (BuildContext context,MovieState state){
          if(state is MovieInitial) print('intial state');
          if(state is PopularMovieLoaded) print('Popular state');
          if(state is TopMovieRepostory) print('top maovie state');
          if(state is NowPlayingMovieLoaded) print('NowPLay maovie state');
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
                      TopMovies(top:topmovie,),
                      PopularMovie(popular:popularmovie,),
                      NowPlaying(nowplaying: nowplayingmovie,),

                    ],
                  )));
        } ,
      ),

    );
  }
}

