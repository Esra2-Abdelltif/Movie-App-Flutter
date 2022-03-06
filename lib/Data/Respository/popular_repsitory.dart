import 'package:movie_app/Data/Models/popular_model.dart';
import 'package:movie_app/Data/Web%20Service/popular_service.dart';

class PopularRepostory {
  //get object from web sercvice
 final PopularMovieService popularMovieService;

  //Construtor
  PopularRepostory(this.popularMovieService);

 Future<PopularModel> RequestToPopularMovieWebService() async {


   final popularmovie = await popularMovieService.GetDataFromPopularMovieMoldel();

   return PopularModel.fromJson(popularmovie);
 }
}
