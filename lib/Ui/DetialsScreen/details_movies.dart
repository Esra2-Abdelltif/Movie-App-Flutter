import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name, description, backdropurl, posterurl,title;
  final num  rate;
  const Description({Key key,
        this.name,
        this.description,
        this.backdropurl,
        this.posterurl,
        this.rate,this.title
        })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(name,style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,centerTitle: true,elevation: 5,  shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),),
        backgroundColor: Colors.white,
       // appBar: AppBar(),
        body: Container(
          child: ListView(children: [
            Container(
                height: 250,
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network('${'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/'+posterurl}',
                    fit: BoxFit.fill,
                  ),
                )),
            SizedBox(height: 15),
            Container(
                padding: EdgeInsets.all(10),
                child: Text(title, style: TextStyle(fontSize: 24),)),
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
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      height: 200,
                      width: 140,
                      child: Image.network('${'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/'+backdropurl}',fit: BoxFit.contain,),
                    ),
                    flex: 1,
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child:  Text(description),
                    )
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}