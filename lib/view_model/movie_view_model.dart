import 'package:flutter/material.dart';
import 'package:moives_api/core/resources/utils.dart';
import 'package:moives_api/data/repository/movie/movie_repository.dart';

import '../core/response/api_response.dart';
import '../data/models/movie_model.dart';

class MovieViewModel extends ChangeNotifier{
MovieViewModel(this.moviesRepository);
  ApiResponse<List<MovieModel>> _apiResponse = ApiResponse.loading();
 // List<MovieModel> movies = [];
  MoviesRepository moviesRepository ;

  ApiResponse<List<MovieModel>> get apiResponse => _apiResponse;

  Future<void> fetchMoviesList() async {
    _setApiResponse(ApiResponse.loading());
    try {
      final value = await moviesRepository.getAllMovie();
      _setApiResponse(ApiResponse.completed(value));
    } catch (error) {
      Utils.toastMessage(error.toString());
      _setApiResponse(ApiResponse.error(error.toString()));
    }
  }

  void _setApiResponse(ApiResponse<List<MovieModel>> response) {
    _apiResponse = response;
    notifyListeners();
  }
}