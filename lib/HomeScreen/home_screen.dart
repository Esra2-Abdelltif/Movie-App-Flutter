import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/HomeScreen/Widgets.dart';
import 'package:http/http.dart ' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future <List>getMovieData() async{
    var res = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=247a18e38e58225afffc980e1d8998e1"));
    if (res.statusCode ==200)
    {
      var obj =json.decode((res.body))['results'];
      return obj;
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovieData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        title: Text('Movie App',
          style: TextStyle(color: Colors.black87),
      ),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
    bottom: Radius.circular(20),
    ),

      ),
        elevation:5,
        backgroundColor: Colors.white,
        centerTitle: true,) ,
      body:  FutureBuilder<List>(
        future:getMovieData(),
        builder: (ctx,AsyncSnapshot<List>snapshot){
          if (!snapshot.hasData) return Text("Loading");

      return Padding(
          padding: const EdgeInsets.only(top: 12,),
          child:ListView(

            children: [
              SizedBox(height: 20,),
              //Section Top Movies
              SectionTitle(Title: 'Top Movie'),
              SizedBox(height: 20,),
              Container(
                  width: double.infinity,
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:snapshot.data.length,
                    itemBuilder:(_,int index)=> Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: TopMovieCard(UrlPoster: snapshot.data[index]['poster_path'],
                      ),
                    ),
                  )
              ),
              //Section Popular Movies
              SizedBox(height: 20,),
              SectionTitle(Title: 'Popular Movie'),
              SizedBox(height: 20,),
              Container(
                  width: double.infinity,
                  height: 250,
                  child:  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:snapshot.data.length,
                    itemBuilder:(_,int index)=> Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: MovieCard(UrlPoster: snapshot.data[index]['poster_path'],
                        MovieName: snapshot.data[index]['original_title'],
                      ),
                    ),
                  )
              ),
              //Section Now Playing Movies
              SizedBox(height: 20,),
              SectionTitle(Title: 'Now Playing'),
              SizedBox(height: 20,),
              Container(
                  width: double.infinity,
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: MovieCard(UrlPoster: 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/zPIug5giU8oug6Xes5K1sTfQJxY.jpg',
                            MovieName: 'Spider-Man: No Way Home',MovieRate: 8.10
                        ),
                      ),

                    ],
                  )
              ),
            ],
          )

      );






        },
      ),
    );
  }
}
