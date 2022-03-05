import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Shared/Constans/constans.dart';
import 'package:movie_app/Ui/DetialsScreen/details_movies.dart';
import 'package:movie_app/Ui/HomeScreen/home_screen.dart';

class AppRouter
{
  Route generateRouter(RouteSettings settings)
  {
    switch(settings.name)
        {
      case MovieScreen:
        return MaterialPageRoute(builder: (_)=> HomeScreen());
      case DescriptionMovie:
        return MaterialPageRoute(builder: (_)=> Description());

        }
  }

}
