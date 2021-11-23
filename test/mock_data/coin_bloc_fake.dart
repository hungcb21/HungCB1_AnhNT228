import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

import 'package:crypto_mobile_application/src/blocs/coins_bloc/coins_event.dart';
import 'package:crypto_mobile_application/src/blocs/coins_bloc/coins_state.dart';
import 'package:crypto_mobile_application/src/blocs/coins_bloc/coins_bloc.dart';

class FakeCoinState extends Fake implements CoinsState {}

class FakeCoinEvent extends Fake implements CoinsEvent {}

class RouteFake extends Fake implements Route {}

class MockCoinBloc extends MockBloc<CoinsEvent, CoinsState>
    implements CoinsBloc {}
