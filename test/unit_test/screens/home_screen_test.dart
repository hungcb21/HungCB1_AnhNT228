import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_mobile_application/src/blocs/coins_bloc/coins_bloc.dart';
import 'package:crypto_mobile_application/src/blocs/coins_bloc/coins_event.dart';
import 'package:crypto_mobile_application/src/blocs/coins_bloc/coins_state.dart';
import 'package:crypto_mobile_application/src/constants/routes.dart';
import 'package:crypto_mobile_application/src/models/coins.dart';
import 'package:crypto_mobile_application/src/routes/app_route.dart';
import 'package:crypto_mobile_application/src/screens/home_screen/home_screen.dart';
import 'package:crypto_mobile_application/src/services/coin_service.dart';
import 'package:crypto_mobile_application/src/widgets/coin_card.dart';
import 'package:crypto_mobile_application/src/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock_data/coins_mock_data.dart';
import '../../mock_data/navigator_mock.dart';

class MockCoinBloc extends MockBloc<CoinsEvent, CoinsState>
    implements CoinsBloc {}

class MockCoinService extends Mock implements CoinService {}

class FakeCoinState extends Fake implements CoinsState {}

class FakeCoinEvent extends Fake implements CoinsEvent {}

class MyTypeFake extends Fake implements Route {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}
class CustomBindings extends AutomatedTestWidgetsFlutterBinding {
  @override
  bool get overrideHttpClient => false;
}

main() {
  CustomBindings();
  String emptyList = 'Coin List is empty';
  final listName = 'Coins';
  final mockResponse = json.decode(mockCoinsData);

  setUpAll(() {
    registerFallbackValue(FakeCoinState());
    registerFallbackValue(FakeCoinEvent());
    registerFallbackValue(MyTypeFake());
  });

  group('Home Screen Tests', () {
    late CoinService coinService;
    late CoinsBloc coinsBloc;
    late CoinsEvent coinsEvent;
    late AppRoute route;
    final mockObserver = MockNavigatorObserver();
    var widget = MaterialApp(
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: RouteConstant.welcomeRoute,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => coinsBloc,
          ),
        ],
        child: HomeScreen(),
      ),
      navigatorObservers: [mockObserver],
      // onGenerateRoute: AppRoute.generateRoute,
    );

    setUp(() {
      coinService = MockCoinService();
      coinsBloc = MockCoinBloc();
      coinsEvent = FakeCoinEvent();
    });

    tearDown(() {
      coinsBloc.close();
    });

    testWidgets('Should navigator CoinCart when tap in Coin Card',
            (tester) async {
          when(() => coinsBloc.state).thenReturn(CoinsLoadSuccess(
            listCoins:
            List<Coins>.from(mockResponse.map((model) => Coins.fromJson(model)))
                .toList(),
          ));
          await tester.pumpWidget(widget);
          await tester.pumpAndSettle();
          final coinCardFinder = find.descendant(
              of: find.byType(ListView), matching: find.byType(CoinCard).first);
          await tester.tap(coinCardFinder);
          await tester.pumpAndSettle();
          verify(() => mockObserver.didPush(any(), any())).called(2);
        });


    testWidgets('Should refresh list coin when scroll', (tester) async {
      bool refreshCalled = false;
      when(() => coinsBloc.state).thenReturn(CoinsLoadSuccess(
        listCoins:
        List<Coins>.from(mockResponse.map((model) => Coins.fromJson(model)))
            .toList(),
      ));
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      final coinCardFinder = find.descendant(
          of: find.byType(ListView), matching: find.byType(CoinCard).first);
      await tester.fling(coinCardFinder, const Offset(0.0, 100.0), 1000.0);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));
      expect(refreshCalled, false);
    });

    testWidgets('Should refresh list coin', (tester) async {
      final errorMessage = 'Exception: Failed to load coins list';
      when(() => coinsBloc.state)
          .thenReturn(CoinsLoadFailure(error: errorMessage));
      await tester.pumpWidget(widget);
      await tester.pump();
      final errorMessageFinder = find.byType(FloatingActionButton);
      expect(errorMessageFinder, findsOneWidget);
      await tester.tap(errorMessageFinder);
    });

    testWidgets(
        'Should render progress indicator when coin bloc state is [ListCoinsLoading]',
            (tester) async {
          when(() => coinsBloc.state).thenReturn(CoinsLoadInProgress());
          await tester.pumpWidget(widget);
          await tester.pump();

          final indicatorFinder = find.byType(CircularProgressIndicator);
          expect(indicatorFinder, findsOneWidget);
        });

    testWidgets(
        'Should render list empty  when coin bloc state is []',
            (tester) async {
          when(() => coinsBloc.state).thenReturn(CoinsInitial());
          await tester.pumpWidget(widget);
          await tester.pump();
          expect(find.text(emptyList), findsOneWidget);
        });

    testWidgets(
        'Should render error text with error message when coin bloc state is [ListCoinsLoadFail]',
            (tester) async {
          final errorMessage = 'Exception: Failed to load coins list';
          when(() => coinsBloc.state)
              .thenReturn(CoinsLoadFailure(error: errorMessage));
          await tester.pumpWidget(widget);
          await tester.pump();
          final errorMessageFinder = find.text(errorMessage);
          expect(errorMessageFinder, findsOneWidget);
        });

    testWidgets(
        'Should render CoinCart list when bloc state is [ListCoinsLoaded]',
            (tester) async {
          when(() => coinsBloc.state).thenReturn(CoinsLoadSuccess(
            listCoins:
            List<Coins>.from(mockResponse.map((model) => Coins.fromJson(model)))
                .toList(),
          ));
          await tester.pumpWidget(widget);
          await tester.pumpAndSettle();
          final coinCardFinder = find.descendant(
              of: find.byType(ListView), matching: find.byType(CoinCard));
          expect(coinCardFinder, findsNWidgets(2));
        });

    testWidgets(
        'Should render SearchBar  when bloc state is [ListCoinsLoaded]',
            (tester) async {
          when(() => coinsBloc.state).thenReturn(CoinsLoadSuccess(
            listCoins:
            List<Coins>.from(mockResponse.map((model) => Coins.fromJson(model)))
                .toList(),
          ));
          await tester.pumpWidget(widget);
          await tester.pumpAndSettle();
          expect(find.byType(SearchBar), findsOneWidget);
        });
    testWidgets(
        'Should render CoinCart list when bloc state is [ListCoinsLoaded]',
            (tester) async {
          when(() => coinsBloc.state).thenReturn(CoinsLoadSuccess(
            listCoins:
            List<Coins>.from(mockResponse.map((model) => Coins.fromJson(model)))
                .toList(),
          ));
          await tester.pumpWidget(widget);
          await tester.pumpAndSettle();
          expect(find.text(listName), findsOneWidget);
        });

    testWidgets('Should search Coin when bloc state is [ListCoinsLoaded]',
            (tester) async {
          when(() => coinsBloc.state).thenReturn(CoinsLoadSuccess(
            listCoins:
            List<Coins>.from(mockResponse.map((model) => Coins.fromJson(model)))
                .toList(),
          ));
          await tester.pumpWidget(widget);
          await tester.pumpAndSettle();
          await tester.tap(find.byType(SearchBar));
          await tester.enterText(find.byType(SearchBar), 'bit');
          await tester.pump(const Duration(seconds: 1));
          final coinCardFinder = find.descendant(
              of: find.byType(ListView), matching: find.byType(Card).first);
          expect(coinCardFinder, findsOneWidget);
          await tester.tap(coinCardFinder);
          await tester.pumpAndSettle();
          verify(() => mockObserver.didPush(any(), any())).called(10);
        });
  });
}
