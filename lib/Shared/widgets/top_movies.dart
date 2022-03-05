import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Shared/Components/component.dart';


class TopMovies extends StatelessWidget {

  const TopMovies({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(Title: 'Top Movie'),
            SizedBox(height: 20,),
            Container(
                width: double.infinity,
                height: 250,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:5,
                  itemBuilder:(_,int index)=> Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      child: TopMovieCard(UrlPoster:'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/zPIug5giU8oug6Xes5K1sTfQJxY.jpg',
                      ),
                    ),
                  ),
                ),

            ),
          ],
        ) ,
      );

  }
}
