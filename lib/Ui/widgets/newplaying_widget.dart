import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Data/Models/nowplaying_mdel.dart';
import 'package:movie_app/Ui/DetialsScreen/details_movies.dart';

class NowPlayingItem extends StatelessWidget {
  final Results nowplaying;
  const NowPlayingItem({Key key,this.nowplaying}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context)=>Description(description: nowplaying.overview,name: nowplaying.originalTitle,title:nowplaying.title,
                  backdropurl:nowplaying.backdropPath,
                  posterurl:nowplaying.posterPath,
                  rate:nowplaying.voteAverage
                  ,)));
      },
      child: Container(
        width: 180,
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network('${'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/'+nowplaying.posterPath}',
                fit: BoxFit.fill,
                width: 220,
                height: 200,
              ),
              elevation: 3,
            ),
            SizedBox(
              height: 5,),
            Center(
              child: Text(nowplaying.originalTitle,
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
      ),
    );
  }
}

