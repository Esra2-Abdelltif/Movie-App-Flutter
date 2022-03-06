import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Bloc/cubit.dart';
import 'package:movie_app/Bloc/state.dart';
import 'package:movie_app/Data/Models/top_movie_model.dart';
import 'package:movie_app/Shared/Components/component.dart';
import 'package:movie_app/Ui/widgets/topmovie_widget.dart';

class TopMovies extends StatefulWidget {
  const TopMovies({Key key}) : super(key: key);

  @override
  State<TopMovies> createState() => _TopMoviesState();
}

class _TopMoviesState extends State<TopMovies> {
  List<TopMovieModel> alltopmovies;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MovieCubit>(context).FetchAllTopMovie();
  }

  Widget BuildBlocWidget() {
   return BlocBuilder<MovieCubit, MovieState>(
       builder: (context, state)
    {
      if ((state is TopMovieLoaded)) {
        alltopmovies = (state).listTopMoviemodel;
        return buildItem();

      } else {
        return ShowLooadingIcon();
      }
    });
  }

  Widget buildItem() {
   return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Movies',
            style: TextStyle(
                fontSize: 26, color: Colors.green, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
              height: 300,
              child:buildItemCard())
        ],
      ),
    );
  }

  Widget buildItemCard() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: alltopmovies.length,
        itemBuilder: (context, index) {
         TopMovieItem(topMovieModel: alltopmovies[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return BuildBlocWidget();
  }
}
