import 'package:moives_api/data/models/movie_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> getAllMovie();
// Future<PostModel> getPostById(int id);
}
