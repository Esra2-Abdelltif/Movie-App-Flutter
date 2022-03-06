import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name, description, backdropurl, posterurl;
  final num  rate;
  const Description({Key key,
        this.name,
        this.description,
        this.backdropurl,
        this.posterurl,
        this.rate,
        })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
       // appBar: AppBar(),
        body: Container(
          child: ListView(children: [
            Container(
                height: 250,
                child: Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network('${'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/'+posterurl}',
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
            SizedBox(height: 15),
            Container(
                padding: EdgeInsets.all(10),
                child: Text(name, style: TextStyle(fontSize: 24),)),
            Container(
                padding: EdgeInsets.only(left: 10),
                child:
                Row(children: [
                  Text('${' ⭐ '* rate.toInt()}',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.start,),
                  SizedBox(width: 5,),
                  Text('${rate.toString()}',
                    style: TextStyle(
                        fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.start,),
                ],)),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 100,
                  child: Image.network('${'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/'+backdropurl}'),
                ),
                Flexible(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child:  Text(description),
                  )
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}