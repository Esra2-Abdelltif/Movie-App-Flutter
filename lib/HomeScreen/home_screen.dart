import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        title: Text('Movie app',
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
    );
  }
}
