import 'package:dio/dio.dart';
import 'package:movie_app_blastoff/service/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
          baseUrl: "https://api.themoviedb.org/4",
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMjZmZTc5ZWY2MjUzMGI5MmVjMDM3ZmZmNTAxNGI1ZSIsInN1YiI6IjYzODhmNmUxMjI5YWUyMTViNDYxMGFlYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YpYorjYRAzmwqe1sVNQuk52uAt0-voFG_iPxFHoefzw'
      }),
    );
  }
}
