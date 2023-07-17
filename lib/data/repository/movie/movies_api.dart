import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moives_api/data/models/movie_model.dart';
import 'package:moives_api/data/repository/movie/movie_repository.dart';

import '../../../core/resources/conction.dart';
import '../../dio_factory.dart';
import '../../error_handler.dart';

class MovieApi extends MoviesRepository {
  DioFactory dioFactory = DioFactory();

  @override
  Future<List<MovieModel>> getAllMovie() async {
    List<MovieModel> movies = [];
    try {
      var response = await dioFactory.dio.get(
        'movie/now_playing',
        queryParameters: {"api_key": Connection.apiKye},
      );
      var list = response.data['results'] as List;
      movies = list.map((post) => MovieModel.fromJson(post)).toList();
    } catch (error) {

      throw ErrorHandler.handle(error).failure.message;
    }
    return movies;
  }
}
