import 'package:flutter/material.dart';
import 'package:moives_api/data/repository/movie/movies_api.dart';
import 'package:moives_api/view_model/movie_view_model.dart';
import 'package:provider/provider.dart';
import '../../presentation/view/fault_route_view.dart';
import '../../presentation/view/movie_view.dart';
import 'routes_name.dart';

class Routes {
  Routes._();
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case RoutesName.movie:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(create: (context) =>MovieViewModel(MovieApi())..fetchMoviesList() ,child: const MovieView(),),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const FaultRouteView(),
        );
    }
  }
}
