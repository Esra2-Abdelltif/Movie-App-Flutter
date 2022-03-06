import 'dart:convert';

import 'package:movie_app/Data/Models/top_movie_model.dart';
import 'package:movie_app/Data/Web%20Service/top_movie_service.dart';

class TopMovieRepostory {
  //get object from web sercvice
 final TopMovieService topMovieService;

  //Construtor
  TopMovieRepostory(this.topMovieService);

  Future<List<TopMovieModel>> RequestToTopMovieWebService() async {


    final topMovies = await topMovieService.GetDataFromTopMovieMoldel();


    return topMovies.map((e) => TopMovieModel.fromJson(e)).toList()  ;
  }
}
