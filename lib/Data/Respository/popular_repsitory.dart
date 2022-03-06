import 'package:movie_app/Data/Models/popular_model.dart';
import 'package:movie_app/Data/Web%20Service/popular_service.dart';

class PopularRepostory {
  //get object from web sercvice
  PopularMovieService popularMovieService;

  //Construtor
  PopularRepostory(this.popularMovieService);

  Future<List<PopularModel>> RequestToPopularMovieWebService() async {
    var popularMovies =
        await popularMovieService.GetDataFromPopularMovieMoldel();
    return popularMovies.map((e) => PopularModel.fromJson(e)).toList();
  }
}
