import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_mobile_application/src/blocs/coins_bloc/coins_bloc.dart';
import 'package:crypto_mobile_application/src/blocs/coins_bloc/coins_event.dart';
import 'package:crypto_mobile_application/src/blocs/coins_bloc/coins_state.dart';
import 'package:crypto_mobile_application/src/services/coin_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCoinService extends Mock implements CoinService {}

void main() {
  CoinService coinsService;
  CoinsBloc? coinsBloc;
  setUp(() {
    coinsService = MockCoinService();
    coinsBloc = CoinsBloc(service: coinsService);
  });

  tearDown(() {
    coinsBloc?.close();
  });

  blocTest(
    'emits [CoinsLoadInProgress] then [CoinsLoadSuccess] when [GetListCoins] is called',
    build: () {
      coinsService = MockCoinService();
      return CoinsBloc(service: coinsService);
    },
    act: (CoinsBloc bloc) =>
        bloc.add(GetListCoins(currency: 'usd', sparkline: true)),
    expect: () => [CoinsLoadInProgress(), CoinsLoadSuccess()],
  );

  blocTest(
    'emits [CoinsLoadInProgress] then [CoinsLoadFailure] when [GetListCoins] is called',
    build: () {
      coinsService = MockCoinService();
      return CoinsBloc(service: coinsService);
    },
    act: (CoinsBloc bloc) =>
        bloc.add(GetListCoins(currency: null, sparkline: null)),
    expect: () => [CoinsLoadInProgress(), CoinsLoadFailure()],
  );

  blocTest(
    'emits [CoinsLoadFailure] when [GetListCoins] is called and service throws error.',
    build: () {
      coinsService = MockCoinService();
      when(coinsService.getCoinsFromAPI(
              currency: '', start: 1, limit: 2, sparkline: true))
          .thenThrow(Exception());
      return CoinsBloc(service: coinsService);
    },
    act: (CoinsBloc bloc) => bloc.add(GetListCoins()),
    expect: () => [
      CoinsLoadInProgress(),
      CoinsLoadFailure(error: Exception().toString())
    ],
  );
}
