import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/string_data.dart';
import '../../services/coin_service.dart';
import 'coins_event.dart';
import 'coins_state.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  CoinService service;
  CoinsBloc({required this.service}) : super(CoinsInitial());

  @override
  Stream<CoinsState> mapEventToState(CoinsEvent event) async* {
    if (event is GetListCoins) {
      try {
        yield CoinsLoadInProgress();
        final coins = await service.getCoinsFromAPI(
            currency: event.currency!,
            start: 1,
            limit: StringData.NUMBER_OF_COIN_PER_STATE,
            sparkline: event.sparkline!);
        yield CoinsLoadSuccess(listCoins: coins);
      } catch (e) {
        yield CoinsLoadFailure(error: e.toString());
      }
    }
  }
}
