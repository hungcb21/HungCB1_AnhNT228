import 'package:crypto_mobile_application/src/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'blocs/coins_bloc/coins_bloc.dart';
import 'blocs/coins_bloc/coins_event.dart';
import 'screens/home_screen/home_screen.dart';
import 'services/app_coin_services.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final httpClient = http.Client();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteConstant.welcomeRoute,
        home: BlocProvider(
            create: (context) => CoinsBloc(service: AppCoinService(httpClient))
              ..add(GetListCoins(currency: 'usd', sparkline: true)),
            child: HomeScreen()),
      ),
    );
  }
}
