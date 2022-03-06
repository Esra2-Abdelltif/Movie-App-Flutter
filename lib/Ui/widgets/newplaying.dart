import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Ui/DetialsScreen/details_movies.dart';

class NowPlaying extends StatelessWidget {
  final List nowplaying;
  const NowPlaying({Key key,this.nowplaying}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Now Playing',
            style: TextStyle(fontSize:26,color: Colors.green,fontWeight: FontWeight.bold),),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>Description()));
                      },
                      child: Container(

                        width: 180,
                        child: Column(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.network('${'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/'+ nowplaying[index]['poster_path']}',
                                fit: BoxFit.fill,
                                width: 220,
                                height: 200,
                              ),
                              elevation: 3,



                            ),
                            SizedBox(
                              height: 5,),
                            Center(
                              child: Text('MMDMD',
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
                  }))
        ],
      ),
    );
  }
}
