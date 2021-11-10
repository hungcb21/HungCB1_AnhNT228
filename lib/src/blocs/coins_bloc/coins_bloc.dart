import 'package:crypto_mobile_application/src/blocs/coins_bloc/coins_state.dart';
import 'package:crypto_mobile_application/src/services/coin_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'coins_event.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  CoinsBloc({this.service}) : super(CoinsInitial());
  final NUMBER_OF_COINS_PER_STATE = 100;
  CoinService? service;

  @override
  Stream<CoinsState> mapEventToState(CoinsEvent event) async* {
    // TODO: implement mapEventToState
    if (event is CoinsGetListCoin) {
      try {
        yield CoinsLoadInProgress();
        final coins = await service!.getCoinsFromAPI(
            currency: event.currency!,
            start: 1,
            limit: NUMBER_OF_COINS_PER_STATE,
            sparkline: event.sparkline!);
        yield CoinsLoadSuccess(listCoins: coins);
      } catch (e) {
        yield CoinsLoadFailure(error: e.toString());
      }
    }
  }
}
