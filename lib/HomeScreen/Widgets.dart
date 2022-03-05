
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 Widget TopMovieCard({String UrlPoster})=> InkWell(
   onTap: (){},
   child:Container(
     width: 370,
     child: Image.network('${'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/'+UrlPoster}',
     fit: BoxFit.fill,),
   )



   // margin: EdgeInsets.all(10),


   );



Widget MovieCard({String UrlPoster,String MovieName,double MovieRate})=> InkWell(
  onTap: (){},
  child: Container(

    width: 180,
    child: Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.network('${'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/'+UrlPoster}',
            fit: BoxFit.fill,
            width: 220,
            height: 200,
          ),
          elevation: 3,

         // margin: EdgeInsets.all(10),


        ),
        SizedBox(
          height: 5,),
        Center(
          child: Text('${MovieName}',
            style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.start,maxLines: 1,
            overflow: TextOverflow.ellipsis,),
        ),
        SizedBox(height: 5,),
        // Text('${MovieRate}',
        //   style: TextStyle(
        //       fontSize: 18,color: Colors.grey[600],fontWeight: FontWeight.bold
        //   ),
        //   textAlign: TextAlign.start,),



      ],
    ),
  ),
);

Widget SectionTitle({String Title})=>  Row(
  children: [
    Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Text('${Title}',
        style: TextStyle(
            color: Colors.green,
            fontSize: 22,
            fontWeight: FontWeight.w800),
        textAlign: TextAlign.start,

      ),
    ),
  ],
);

