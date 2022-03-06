import 'package:flutter/material.dart';
import 'package:movie_app/Data/Models/top_movie_model.dart';
import 'package:movie_app/Ui/DetialsScreen/details_movies.dart';

class TopMovieItem extends StatelessWidget {
  final TopMovieModel topMovieModel;
  const TopMovieItem({Key key, this.topMovieModel}) : super(key: key);

  @override
  Widget build(BuildContext context ) {
     return  Container(
       child: InkWell(
         onTap: () {
           Navigator.push(
               context,
               MaterialPageRoute(
                   builder: (context) =>Description()));
         },
         child: Container(
           padding: EdgeInsets.all(5),
           width: 350,
           child: Column(
             children: [
               Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   image: DecorationImage(
                       image: NetworkImage('https://www.themoviedb.org/t/p/w300_and_h450_bestv2/'+ topMovieModel.results[topMovieModel.totalResults].posterPath,),
                       fit: BoxFit.fill),
                 ),
                 height: 250,
               ),
               SizedBox(height: 8),
               Container(
                 child: Text(topMovieModel.results[topMovieModel.totalResults].title,
                   style: TextStyle(
                       fontWeight: FontWeight.bold, fontSize: 18),
                 ),
               )
             ],
           ),
         ),
       ),
     );

  }

}
