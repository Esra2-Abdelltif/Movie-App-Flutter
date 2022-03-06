import 'package:flutter/material.dart';
import 'package:movie_app/Ui/HomeScreen/home_screen.dart';

void main() {
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {


  const MovieApp({Key key, }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      
    );
  }
}




