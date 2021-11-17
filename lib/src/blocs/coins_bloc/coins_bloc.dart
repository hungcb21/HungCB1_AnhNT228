import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/string_data.dart';
import '../../services/coin_service.dart';
import 'coins_event.dart';
import 'coins_state.dart';

class CoinsBloc extends Bloc<CoinsEvent, CoinsState> {
  CoinService service;
  CoinsBloc({required this.service}) : super(CoinsInitial()) {
    on<CoinListRequested>((event, emit) async {
      try {
        emit(CoinsLoadInProgress());
        final coins = await service.getCoinsFromAPI(
            currency: event.currency!,
            start: 1,
            limit: StringData.NUMBER_OF_COIN_PER_STATE,
            sparkline: event.sparkLine!);
        emit(CoinsLoadSuccess(listCoins: coins));
      } catch (e) {
        emit(CoinsLoadFailure(error: e.toString()));
      }
    });
  }
}
