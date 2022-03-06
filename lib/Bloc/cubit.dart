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
  final NowPlayingRepostory nowPlayingRepostoryy;

  List<PopularModel> popularMovie=[];
  List<TopMovieModel> topMovie=[];
  List<NowPlayingModel> nowplayingMovie=[];

  MovieCubit(this.popularRepostory,this.topMovieRepostory,this.nowPlayingRepostoryy) : super(MovieInitial());
  static  MovieCubit get(context) => BlocProvider.of(context);

  List<PopularModel> FetchAllPopularMovie(){
    popularRepostory.RequestToPopularMovieWebService().then((value) {
      emit(PopularMovieLoaded(value));
      this.popularMovie=popularMovie;
    });
    return popularMovie;
  }
  List<TopMovieModel> FetchAllTopMovie(){
    topMovieRepostory.RequestToTopMovieWebService().then((value) {
      emit(TopMovieLoaded(value));
      this.topMovie=topMovie;
    });
    return topMovie;
  }
  List<NowPlayingModel> FetchAllNowPlayingMovie(){
    nowPlayingRepostoryy.RequestToNowPlayingMovieWebService().then((value) {
      emit(NowPlayingMovieLoaded(value));
      this.nowplayingMovie=nowplayingMovie;
    });
    return nowplayingMovie;
  }
}
