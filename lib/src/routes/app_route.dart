import 'package:crypto_mobile_application/src/constants/routes.dart';
import 'package:crypto_mobile_application/src/screens/detail_screen/detail_screen.dart';
import 'package:crypto_mobile_application/src/screens/home_screen/home_screen.dart';
import 'package:crypto_mobile_application/src/screens/not_found_screen/not_found_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.welcomeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RouteConstant.detailRoute:
        return MaterialPageRoute(builder: (_) => DetailScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => (NotFoundScreen()),
        );
    }
  }
}
