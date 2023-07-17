import 'package:flutter/material.dart';
import 'package:moives_api/view_model/movie_view_model.dart';
import 'package:provider/provider.dart';
import '../../core/enum/status.dart';
import '../widget/movies_grid_view.dart';

class MovieView extends StatelessWidget {
  const MovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie')),
      body: Consumer<MovieViewModel>(builder: (context, value, _) {
        switch (value.apiResponse.status) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            return Center(child: Text(value.apiResponse.message.toString()));
          case Status.COMPLETED:
            return MoviesGridView(movies: value.apiResponse.data!);
          default:
            return Container();
        }
      }),
    );
  }
}
