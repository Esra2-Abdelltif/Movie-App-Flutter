import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Bloc/state.dart';
import 'package:movie_app/Data/Models/nowplaying_mdel.dart';
import 'package:movie_app/Data/Models/popular_model.dart';
import 'package:movie_app/Data/Models/top_movie_model.dart';
import 'package:movie_app/Data/Respository/nowplaying_repsitory.dart';
import 'package:movie_app/Data/Respository/popular_repsitory.dart';
import 'package:movie_app/Data/Respository/top_movie_repsitory.dart';

class MovieCubit extends Cubit<MovieState> {
  final PopularRepostory popularRepostory;
  final TopMovieRepostory topMovieRepostory;
  final NowPlayingRepostory nowPlayingRepostory;

  PopularModel popularMovie;
  TopMovieModel topMovie;
  NowPlayingModel nowplayingMovie;

  MovieCubit(this.popularRepostory, this.topMovieRepostory, this.nowPlayingRepostory) : super(MovieInitial());

  static MovieCubit get(context) => BlocProvider.of(context);

  void FetchAllPopular() {
    popularRepostory.RequestToPopularMovieWebService().then((value) {
        emit(PopularMovieLoaded(value));
      });
  }

  void FetchAllTopMovie() {
    topMovieRepostory.RequestToTopMovieWebService().then((value) {
      emit(TopMovieLoaded(value));
    });
  }

  void FetchAllNowPlayingMovie() {
    nowPlayingRepostory.RequestToNowPlayingMovieWebService().then((value) {
      emit(NowPlayingMovieLoaded(value));
    });
  }
}
