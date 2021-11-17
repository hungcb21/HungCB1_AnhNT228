import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'blocs/coins_bloc/coins_bloc.dart';
import 'blocs/coins_bloc/coins_event.dart';
import 'constants/routes.dart';
import 'routes/app_route.dart';
import 'screens/home_screen/home_screen.dart';
import 'services/app_coin_services.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final httpClient = http.Client();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: RouteConstant.welcomeRoute,
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => CoinsBloc(service: AppCoinService(httpClient))
            ..add(CoinListRequested(currency: 'usd', sparkLine: true)),
        ),
      ], child: HomeScreen()),
    );
  }
}
