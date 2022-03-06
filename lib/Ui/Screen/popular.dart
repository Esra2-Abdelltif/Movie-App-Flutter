import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Bloc/cubit.dart';
import 'package:movie_app/Bloc/state.dart';
import 'package:movie_app/Data/Models/popular_model.dart';
import 'package:movie_app/Shared/Components/component.dart';
import 'package:movie_app/Ui/widgets/popular_widget.dart';


class PopularMovie extends StatefulWidget {
  const PopularMovie({Key key}) : super(key: key);

  @override
  State<PopularMovie> createState() => _PopularMovieState();
}

class _PopularMovieState extends State<PopularMovie> {
  List<Results> allpopularmovies;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MovieCubit>(context).FetchAllPopular();

  }
  Widget BuildBlocWidget() {
    return BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state)
        {
          if ((state is PopularMovieLoaded)) {
           allpopularmovies = (state).listpopularmodel.results;
            return buildItem();

          } else {
            return ShowLooadingIcon();
          }
        });
  }
  Widget buildItem(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Popular Movies',
            style: TextStyle(
                fontSize: 26, color: Colors.green, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            height: 270,
            //color: Colors.red,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: allpopularmovies.length,
              itemBuilder: (context,index){
                return PopularMovieItem(popularModel: allpopularmovies[index]);
              },


            ),
          )
        ],
      ),
    );

  }


  @override
  Widget build(BuildContext context) {
    return BuildBlocWidget();
  }
}
