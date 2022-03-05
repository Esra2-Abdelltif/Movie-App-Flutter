import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {Key key,
        this.name,
        this.description,
        this.bannerurl,
        this.posterurl,
        this.vote,
        this.launch_on})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     // appBar: AppBar(),
      body: Container(
        child: ListView(children: [
          Container(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network('https://www.themoviedb.org/t/p/w300_and_h450_bestv2/zPIug5giU8oug6Xes5K1sTfQJxY.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: Text( ' ⭐ ' * 8)),
              ])),
          SizedBox(height: 15),
          Container(
              padding: EdgeInsets.all(10),
              child: Text('Encatno', style: TextStyle(fontSize: 24),)),
          Container(
              padding: EdgeInsets.only(left: 10),
              child:
              Text('Encatno', style: TextStyle(fontSize: 14),)),
          Row(
            children: [
              Container(
                height: 200,
                width: 100,
                child: Image.network('https://www.themoviedb.org/t/p/w300_and_h450_bestv2/zPIug5giU8oug6Xes5K1sTfQJxY.jpg'),
              ),
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child:  Text('Encatno', style: TextStyle(fontSize: 18),)),
              ),
            ],
          )
        ]),
      ),
    );
  }
}