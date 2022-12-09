import 'package:movie_app_blastoff/models/movies_model.dart';
import 'package:movie_app_blastoff/repositories/movies_repository.dart';
import 'package:movie_app_blastoff/service/dio_service.dart';
import '../utils/apis_utils.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;
  MoviesRepositoryImp(this._dioService);

  @override
  Future<Movies> getMovies() async {
    await Future.delayed(Duration(seconds: 3));
    var result = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);
    return Movies.fromJson(result.data);
  }

}