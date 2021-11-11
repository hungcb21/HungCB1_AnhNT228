import 'package:flutter/material.dart';
import '../constants/routes.dart';
import '../models/coins.dart';
import '../screens/detail_screen/detail_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/not_found_screen/not_found_screen.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final coins = settings.arguments as Coins;
    switch (settings.name) {
      case RouteConstant.welcomeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RouteConstant.detailRoute:
        return MaterialPageRoute(builder: (_) => DetailScreen(coins));
      default:
        return MaterialPageRoute(
          builder: (_) => (NotFoundScreen()),
        );
    }
  }
}
