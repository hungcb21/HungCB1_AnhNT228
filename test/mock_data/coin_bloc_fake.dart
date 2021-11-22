import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

import 'package:crypto_mobile_application/src/blocs/coins_bloc/coins_event.dart';
import 'package:crypto_mobile_application/src/blocs/coins_bloc/coins_state.dart';


class FakeCoinState extends Fake implements CoinsState {}

class FakeCoinEvent extends Fake implements CoinsEvent {}

class RouteFake extends Fake implements Route {}