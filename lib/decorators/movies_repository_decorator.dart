import 'package:movie_app_blastoff/models/movies_model.dart';
import 'package:movie_app_blastoff/repositories/movies_repository.dart';

class MoviesRepositoryDecorator implements MoviesRepository{

  final MoviesRepository _moviesRepository;

  MoviesRepositoryDecorator(this._moviesRepository);

  @override
  Future<Movies> getMovies() async {
    return _moviesRepository.getMovies();
  }


}