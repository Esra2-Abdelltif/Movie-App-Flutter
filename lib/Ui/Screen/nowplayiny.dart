import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Bloc/cubit.dart';
import 'package:movie_app/Bloc/state.dart';
import 'package:movie_app/Data/Models/nowplaying_mdel.dart';
import 'package:movie_app/Shared/Components/component.dart';
import 'package:movie_app/Ui/widgets/newplaying_widget.dart';
class NowPlaying extends StatefulWidget {
  const NowPlaying({Key key}) : super(key: key);

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}
class _NowPlayingState extends State<NowPlaying> {
  List<Results> allNowPlayingmovies;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MovieCubit>(context).FetchAllNowPlayingMovie();

  }
  Widget BuildBloc1Widget() {
    return BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state)
        {
          if ((state is NowPlayingMovieLoaded)) {
            allNowPlayingmovies = (state).listNowPlayingmodel.results;
            return buildItem();
          } else {
            return ShowLooadingIcon();
          }
        });
  }
  Widget buildItem(){
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' Now Playing',
            style: TextStyle(
                fontSize: 26, color: Colors.green, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: allNowPlayingmovies.length,
                  itemBuilder: (context, index) {
                    return NowPlayingItem(nowplaying: allNowPlayingmovies[index],);
                  }))
        ],
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
   return BuildBloc1Widget();
  }
}
