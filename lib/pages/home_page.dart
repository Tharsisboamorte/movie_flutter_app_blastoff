import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app_blastoff/controllers/movie_controller.dart';
import 'package:movie_app_blastoff/decorators/movies_cache_repository_decorator.dart';
import 'package:movie_app_blastoff/repositories/movies_repository_imp.dart';
import 'package:movie_app_blastoff/service/dio_service%20_imp.dart';

import '../models/movies_model.dart';
import '../widgets/custom_list_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
      MoviesCacheRepositoryDecorator(MoviesRepositoryImp(DioServiceImp())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(28),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return Visibility(
                    visible: movies != null,
                    child: Column(
                      children: [
                        Text(
                          "Movies",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          onChanged: _controller.onChanged,
                        ),
                      ],
                    ),
                  );
                }),
            ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: movies.listMovies!.length,
                          separatorBuilder: (_, __) => Divider(),
                          itemBuilder: (_, idx) => CustomListCardWidget(
                                movie: movies.listMovies![idx],
                              ))
                      : Lottie.asset('assets/lottie.json');
                }),
          ],
        ),
      ),
    ));
  }
}
