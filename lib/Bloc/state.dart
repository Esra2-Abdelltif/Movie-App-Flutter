import 'package:flutter/cupertino.dart';
import 'package:movie_app/Data/Models/nowplaying_mdel.dart';
import 'package:movie_app/Data/Models/popular_model.dart';
import 'package:movie_app/Data/Models/top_movie_model.dart';

@immutable
abstract class MovieState {
  MovieState();
}

class MovieInitial extends MovieState {}


class PopularMovieLoaded extends MovieState {
  final PopularModel listpopularmodel;
  PopularMovieLoaded(this.listpopularmodel);
}
class TopMovieLoaded extends MovieState {
  final TopMovieModel listTopMoviemodel;
 TopMovieLoaded(this.listTopMoviemodel);
}


class NowPlayingMovieLoaded extends MovieState {
  final NowPlayingModel listNowPlayingmodel;
  NowPlayingMovieLoaded(this.listNowPlayingmodel);
}
