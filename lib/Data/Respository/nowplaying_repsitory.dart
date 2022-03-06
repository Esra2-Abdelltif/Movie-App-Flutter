import 'package:movie_app/Data/Models/nowplaying_mdel.dart';
import 'package:movie_app/Data/Web%20Service/nowplaying_service.dart';

class  NowPlayingRepostory {
  //get object from web sercvice
 final NowPlayingMovieSercive nowPlayingMovieSercive;

  //Construtor
  NowPlayingRepostory(this.nowPlayingMovieSercive);

  Future<NowPlayingModel> RequestToNowPlayingMovieWebService() async {

    final newplayingMovies = await nowPlayingMovieSercive.GetDataFromNowPlayingMovieMoldel();
    return  NowPlayingModel.fromJson(newplayingMovies);
  }
}
