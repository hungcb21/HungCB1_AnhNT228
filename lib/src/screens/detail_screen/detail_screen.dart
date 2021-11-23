import 'dart:ui';

import 'package:crypto_mobile_application/src/constants/string_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:syncfusion_flutter_charts/sparkcharts.dart';

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
  double borderWidthOfChart = 2;
  double _heightOfTopContainer = 400;
  double _heightOfBottomContainer = 300;
  final _chartCoinPadding = EdgeInsets.fromLTRB(20, 40, 20, 10);
  final _chartCoinBorderRadius = BorderRadius.only(
    topRight: Radius.circular(40),
    topLeft: Radius.circular(40),
  );

  @override
  Widget build(BuildContext context) {
    TextStyle _currencyPerCoin = Theme.of(context)
        .textTheme
        .headline6!
        .copyWith(color: Colors.grey, fontSize: 15);
    TextStyle _lastPriceOfChart =
        Theme.of(context).textTheme.headline6!.copyWith(fontSize: 15);
    TextStyle _labelOfChart = Theme.of(context).textTheme.headline6!.copyWith(
          color: Colors.orange,
        );
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
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
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
                    children: [],
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
                        children: [
                          Text(
                              '${_coins.symbol.toUpperCase()}/${StringData.USD}',
                              style: _currencyPerCoin),
                          Text(
                            '${_coins.sparklineIn_7d.last.toStringAsFixed(3)}',
                            style: _lastPriceOfChart,
                          )
                        ],
                      ),
                      Flexible(
                        child: SfSparkAreaChart(
                          borderWidth: borderWidthOfChart,
                          color: ColorsApp.chartColor,
                          borderColor: Colors.orange,
                          trackball: SparkChartTrackball(
                            borderColor: Colors.white,
                            backgroundColor: Colors.white,
                            labelStyle: _labelOfChart,
                          ),
                          data: _coins.sparklineIn_7d.cast<double>(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
