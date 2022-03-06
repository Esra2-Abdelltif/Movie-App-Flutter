import 'package:dio/dio.dart';
import 'package:movie_app/Shared/Constans/strings.dart';

class  NowPlayingMovieSercive {
  Dio dio;

  NowPlayingMovieSercivee() {}

  Future<dynamic> GetDataFromNowPlayingMovieMoldel() async {
    Dio dio = new Dio();
    dio.options.baseUrl = BaseUrL;
    dio.options.connectTimeout = 20 * 1000;
    dio.options.receiveTimeout = 20 * 1000;
    try {
      Response response = await dio.get('3/movie/now_playing?api_key=247a18e38e58225afffc980e1d8998e1',
          queryParameters: {
        'api_key': '247a18e38e58225afffc980e1d8998e1',
      });
      print('Now Playing model');
      print(response.data);
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
