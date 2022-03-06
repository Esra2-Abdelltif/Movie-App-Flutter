import 'package:flutter/material.dart';
import 'package:movie_app/Data/Models/top_movie_model.dart';
import 'package:movie_app/Ui/DetialsScreen/details_movies.dart';

class TopMovieItem extends StatelessWidget {
  final Results topMovieModel;
  const TopMovieItem({Key key, this.topMovieModel}) : super(key: key);

  @override
  Widget build(BuildContext context ) {
     return  InkWell(
       onTap: () {
         Navigator.push(
             context,
             MaterialPageRoute(
                 builder: (context) =>Description(description: topMovieModel.overview,name: topMovieModel.originalTitle,title: topMovieModel.title,
                   backdropurl: topMovieModel.backdropPath,
                   posterurl: topMovieModel.posterPath,
                   rate: topMovieModel.voteAverage
                   ,)));
       },
       child: Column(
         children: [
           Card(
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
             semanticContainer: true,
             clipBehavior: Clip.antiAliasWithSaveLayer,
             child: Image.network('${'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/'+topMovieModel.posterPath}',
               fit: BoxFit.fill,
               width: 220,
               height: 200,
             ),
             elevation: 3,



           ),
           SizedBox(height: 8),
           Center(
             child: Text(topMovieModel.originalTitle,
               style: TextStyle(
                   fontSize: 18,
                   color: Colors.black87,
                   fontWeight: FontWeight.bold
               ),
               textAlign: TextAlign.start,maxLines: 1,
               overflow: TextOverflow.ellipsis,),
           ),
         ],
       ),
     );

  }

}
