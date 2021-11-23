import 'package:crypto_mobile_application/src/constants/string_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/app_theme.dart';
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
  double _heightOfTopContainer = 400;
  double _heightOfBottomContainer = 300;
  final _chartCoinPadding = EdgeInsets.fromLTRB(20, 40, 20, 10);
  double _heightOfTopContainer = 150;
  double _heightOfChartCoin = 200;
  final _chartCoinPadding = EdgeInsets.fromLTRB(20, 40, 20, 0);

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
      body: LayoutBuilder(
          builder:
              (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: _heightOfTopContainer,
                    child: Column(
                      children: [
                      ],
                    ),
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
      ),
    );
  }
}
