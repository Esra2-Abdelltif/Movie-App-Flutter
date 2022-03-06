import 'package:dio/dio.dart';
import 'package:movie_app/Shared/Constans/strings.dart';

class  NowPlayingMovieSercive {
  Dio dio;

  NowPlayingMovieSercivee() {
    BaseOptions options = BaseOptions(
      baseUrl: BaseUrL,
      //Get information if haappend any error
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> GetDataFromNowPlayingMovieMoldel() async {
    try {
      Response response = await dio.get('3/movie/now_playing', queryParameters: {
        'api_key': '247a18e38e58225afffc980e1d8998e1',
      });
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
