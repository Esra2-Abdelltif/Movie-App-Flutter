import 'package:movie_app/Data/Models/nowplaying_mdel.dart';
import 'package:movie_app/Data/Web%20Service/nowplaying_service.dart';

class  NowPlayingRepostory {
  //get object from web sercvice
  NowPlayingMovieSercive nowPlayingMovieSercive;

  //Construtor
  NowPlayingRepostory(this.nowPlayingMovieSercive);

  Future<List<NowPlayingModel>> RequestToNowPlayingMovieWebService() async {
    var newplayingMovies =
    await nowPlayingMovieSercive.GetDataFromNowPlayingMovieMoldel();
    return newplayingMovies.map((e) =>  NowPlayingModel.fromJson(e)).toList();
  }
}
