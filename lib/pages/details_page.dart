import 'package:flutter/material.dart';

import '../models/movies_model.dart';
import '../utils/apis_utils.dart';
class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .55,
                child: Hero(
                  tag: movie.id!,
                  child: Image.network(
                    API.REQUEST_IMG(movie.posterPath),
              ),
                )),
              const SizedBox(height: 20,),
              Text(movie.overview!, style: Theme.of(context).textTheme.subtitle1,),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.title),
                  Text(movie.originalTitle!),
                ],
              ),
              const SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.new_releases),
                  Text(movie.releaseDate!),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
