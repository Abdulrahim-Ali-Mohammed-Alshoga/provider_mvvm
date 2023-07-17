import 'package:flutter/material.dart';
import 'package:moives_api/data/models/movie_model.dart';

import 'grid_title_widget.dart';
class MoviesGridView extends StatelessWidget {
   const MoviesGridView({Key? key,required this.movies}) : super(key: key);
 final List<MovieModel> movies;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      cacheExtent: 100,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: movies.length,
      itemBuilder: (BuildContext context, index) {
        return GridTitleWidget(
            movie: movies[index]
        );
      },
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .8,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
    );
  }
}
