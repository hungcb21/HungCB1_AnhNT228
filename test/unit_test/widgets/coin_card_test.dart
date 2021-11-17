import 'package:crypto_mobile_application/src/widgets/coin_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_data/navigator_mock.dart';

main() {
  String image = '';
  String name = 'bitcoin';
  String symbol = 'btc';
  var price = 12345;
  var priceChange = 324234;

  testWidgets('Coin card should be tapped', (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();
    bool isTapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CoinCard(
            symbol: symbol,
            priceChange: priceChange,
            price: price,
            name: name,
            image: image,
            onTap: () {
              isTapped = true;
            },
          ),
        ),
        navigatorObservers: [mockObserver],
      ),
    );
    var button = find.byType(CoinCard);
    expect(button, findsOneWidget);
    await tester.tap(button);
    expect(isTapped, true);
    await tester.pumpAndSettle();
  });
}
