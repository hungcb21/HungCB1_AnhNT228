import 'package:crypto_mobile_application/src/constants/string_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';
import '../../models/coins.dart';

class DetailScreen extends StatefulWidget {
  Coins coins;

  DetailScreen(this.coins);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Coins get _coins => widget.coins;
  double _heightOfTopContainer = 100;
  double _heightOfBetweenContainer = 250;
  double _heightOfBottomContainer = 300;
  double _sizeOfCoinImage = 60;
  final _coinInfoPadding = EdgeInsets.symmetric(horizontal: 38);
  final _coinPropsPadding = EdgeInsets.only(left: 80);
  final _chartCoinPadding = EdgeInsets.fromLTRB(20, 40, 20, 10);
  final _chartCoinBorderRadius = BorderRadius.only(
    topRight: Radius.circular(40),
    topLeft: Radius.circular(40),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        title: Text('${_coins.name} ${_coins.symbol.toUpperCase()}'),
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: _heightOfTopContainer,
            ),
            Container(
              padding: _chartCoinPadding,
              height: _heightOfBottomContainer,
              decoration: BoxDecoration(
                  color: ColorsApp.backgroundBottomColor,
                  borderRadius: _chartCoinBorderRadius),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
