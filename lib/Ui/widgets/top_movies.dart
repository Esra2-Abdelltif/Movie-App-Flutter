import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Ui/DetialsScreen/details_movies.dart';



class TopMovies extends StatelessWidget {
  final List top ;
  const TopMovies({Key key,this.top}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Top Movies',
            style: TextStyle(fontSize:26,color: Colors.green,fontWeight: FontWeight.bold),),
          SizedBox(height: 10),
          Container(
              height: 300,
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
                        padding: EdgeInsets.all(5),
                        width: 350,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage('${'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/'+ top[index]['poster_path'] !=null ?
                                          'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/'+ top[index]['poster_path'] :'loading'
                                    }'),
                                    // 'https://image.tmdb.org/t/p/w500' +
                                    //     popularmovie[index]['backdrop_path']),
                                    fit: BoxFit.fill),
                              ),
                              height: 250,
                            ),
                            SizedBox(height: 8),
                            Container(
                              child: Text('${top[index]['original_name'] != null ? top[index]['original_name'] : 'Loading'}',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),

                              ),
                            )
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
