import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:crypto_mobile_application/src/constants/routes.dart';
import 'package:crypto_mobile_application/src/models/coins.dart';
import 'package:crypto_mobile_application/src/routes/app_route.dart';
import 'package:crypto_mobile_application/src/screens/detail_screen/detail_screen.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

main() {
  final mockObserver = MockNavigatorObserver();
  final String _currency = 'USD';
  final String highPrice = 'High price in 24h: ';
  final String lowPriceIn24h = 'Low price in 24h: ';
  final String ath = 'ATH: ';
  final String athChange = 'ATH change: ';
  final String atl = 'ATL: ';
  final String atlChange = 'ATL change: ';
  final String marketCap = 'Market Cap: ';
  final String marketCapChange = 'Market Cap change: ';
  Coins _coins = Coins(
      id: 'bitcoin',
      name: 'Bitcoin',
      symbol: 'btc',
      image:
          'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
      currentPrice: 2131231.123,
      high_24h: 66572,
      low_24h: 62061,
      priceChange_24h: 123123.98,
      ath: 12123,
      athChangePercentage: 12321312,
      athDate: '2021-11-08T15:48:00.987Z',
      atl: 123123,
      atlChangePercentage: 123213,
      atlDate: '2021-11-08T15:48:00.987Z',
      lastUpdated: '2021-11-08T15:48:00.987Z',
      sparklineIn_7d: [12313.12, 123123.131, 123123.99823],
      marketCap_24h: 4256.23,
      marketCapChangePercentage_24h: 6.85817);
  var widget = MaterialApp(
    onGenerateRoute: AppRoute.generateRoute,
    initialRoute: RouteConstant.welcomeRoute,
    home: DetailScreen(_coins),
    navigatorObservers: [mockObserver],
  );

  group('Detail Screen Test', () {
    testWidgets('Should render title in AppBar when DetailScreen displayed',
        (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      final title = find.text('${_coins.name} ${_coins.symbol.toUpperCase()}');
      expect(title, findsOneWidget);
    });
    testWidgets('Should render current price when DetailScreen displayed',
        (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      final currentPrice = find.text(
          '${double.parse(_coins.currentPrice.toString()).toStringAsFixed(2)} ${_coins.symbol.toUpperCase()}');
      expect(currentPrice, findsNWidgets(1));
    });
    testWidgets('Should render price change in 24h when DetailScreen displayed',
        (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      final priceChange24h = find.text(
          '${double.parse(_coins.priceChange_24h.toString()).toStringAsFixed(2)}');
      expect(priceChange24h, findsOneWidget);
    });

    testWidgets('Should render high price in 24h when DetailScreen displayed',
        (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      final highPriceDesc = find.text(highPrice);
      final highPriceData = find.text(
          '${double.parse(_coins.high_24h.toString()).toStringAsFixed(2)}');
      expect(highPriceData, findsOneWidget);
      expect(highPriceDesc, findsOneWidget);
    });
    testWidgets('Should render low price in 24h when DetailScreen displayed',
        (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      final lowPriceDesc = find.text(lowPriceIn24h);
      final lowPriceData = find.text(
          '${double.parse(_coins.low_24h.toString()).toStringAsFixed(2)}');
      expect(lowPriceData, findsOneWidget);
      expect(lowPriceDesc, findsOneWidget);
    });
    testWidgets('Should render ATH when DetailScreen displayed',
        (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      final athDesc = find.text(ath);
      final athData = find
          .text('${double.parse(_coins.ath.toString()).toStringAsFixed(2)}');
      expect(athDesc, findsOneWidget);
      expect(athData, findsOneWidget);
    });
    testWidgets('Should render ATH change when DetailScreen displayed',
        (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      final athChangeDesc = find.text(athChange);
      final athChangeData = find.text(
          '${double.parse(_coins.athChangePercentage.toString()).toStringAsFixed(2)}');
      expect(athChangeDesc, findsOneWidget);
      expect(athChangeData, findsOneWidget);
    });
    testWidgets('Should render ATL when DetailScreen displayed',
        (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      final altDesc = find.text(atl);
      final atlData = find
          .text('${double.parse(_coins.atl.toString()).toStringAsFixed(2)}');
      expect(altDesc, findsOneWidget);
      expect(atlData, findsOneWidget);
    });

    testWidgets('Should render ATL change when DetailScreen displayed',
        (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      final altChangeDesc = find.text(atlChange);
      final atlChangeData = find.text(
          '${double.parse(_coins.athChangePercentage.toString()).toStringAsFixed(2)}');
      expect(altChangeDesc, findsOneWidget);
      expect(atlChangeData, findsOneWidget);
    });

    testWidgets('Should render market cap when DetailScreen displayed',
        (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      final marketCapDesc = find.text(marketCap);
      final marketCapData = find.text(
          '${double.parse(_coins.marketCap_24h.toString()).toStringAsFixed(2)}');
      expect(marketCapDesc, findsOneWidget);
      expect(marketCapData, findsOneWidget);
    });
    testWidgets(
        'Should render market cap change 24h when DetailScreen displayed',
        (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      final marketCapChangeDesc = find.text(marketCapChange);
      final marketCapChangeData = find.text(
          '${double.parse(_coins.marketCapChangePercentage_24h.toString()).toStringAsFixed(2)}');
      expect(marketCapChangeData, findsOneWidget);
      expect(marketCapChangeDesc, findsOneWidget);
    });
    testWidgets('Should render price description when DetailScreen displayed',
        (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      final priceDesc =
          find.text('${_coins.symbol.toUpperCase()}/${_currency}');
      expect(priceDesc, findsOneWidget);
    });

    testWidgets(
        'Should render last price of sparkline chart  when DetailScreen displayed',
        (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      final lastPrice = find.text(
          '${double.parse(_coins.sparklineIn_7d.last.toString()).toStringAsFixed(3)}');
      expect(lastPrice, findsOneWidget);
    });

    testWidgets('Should render sparkline chart when DetailScreen displayed',
        (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      final spartLineChart = find.byType(SfSparkAreaChart);
      expect(spartLineChart, findsOneWidget);
    });
  });
}
