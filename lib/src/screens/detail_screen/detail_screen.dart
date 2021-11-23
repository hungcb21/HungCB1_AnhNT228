import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';
import '../../constants/string_data.dart';
import '../../models/coins.dart';

class DetailScreen extends StatefulWidget {
  Coins coins;

  DetailScreen(this.coins);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Coins get _coins => widget.coins;
  double _heightOfTopContainer = 300;
  double _heightOfBottomContainer = 300;
  double _sizeOfCoinImage = 60;
  final _coinPropsPadding = EdgeInsets.only(left: 80);
  final _coinInfoPadding = EdgeInsets.symmetric(horizontal: 38);
  final _chartCoinPadding = EdgeInsets.fromLTRB(20, 40, 20, 10);
  final _chartCoinBorderRadius = BorderRadius.only(
    topRight: Radius.circular(40),
    topLeft: Radius.circular(40),
  );

  @override
  Widget build(BuildContext context) {
    TextStyle _coinInfo =
        Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white);
    TextStyle _coinData =
        Theme.of(context).textTheme.headline6!.copyWith(color: Colors.grey);
    TextStyle _positivePercentage =
        Theme.of(context).textTheme.headline6!.copyWith(color: Colors.green);
    TextStyle _negativePercentage =
        Theme.of(context).textTheme.headline6!.copyWith(color: Colors.red);
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: _sizeOfCoinImage,
                            padding: _coinInfoPadding,
                            child: Image.network(
                              widget.coins.image,
                              errorBuilder: (context, error, strackTrace) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '${double.parse(_coins.currentPrice.toString()).toStringAsFixed(2)} ${_coins.symbol.toUpperCase()}',
                                  style: _coinData),
                              Text(
                                  double.parse(
                                          _coins.priceChange_24h.toString())
                                      .toStringAsFixed(2),
                                  style: _coins.priceChange_24h
                                          .toString()
                                          .contains('-')
                                      ? _negativePercentage
                                      : _positivePercentage),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: _coinPropsPadding,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(StringData.highIn24h, style: _coinInfo),
                                Text(
                                    '${double.parse(_coins.high_24h.toString()).toStringAsFixed(2)}',
                                    style: _coinData),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(StringData.lowIn24h, style: _coinInfo),
                                Text(
                                    '${double.parse(_coins.low_24h.toString()).toStringAsFixed(2)}',
                                    style: _coinData),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(StringData.ath, style: _coinInfo),
                                Text(
                                    '${double.parse(_coins.ath.toString()).toStringAsFixed(2)}',
                                    style: _coinData),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(StringData.athChange, style: _coinInfo),
                                Text(
                                    '${double.parse(_coins.athChangePercentage.toString()).toStringAsFixed(2)}',
                                    style: _coins.athChangePercentage
                                            .toString()
                                            .contains('-')
                                        ? _negativePercentage
                                        : _positivePercentage),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(StringData.atl, style: _coinInfo),
                                Text(
                                    '${double.parse(_coins.atl.toString()).toStringAsFixed(2)}',
                                    style: _coinData),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(StringData.atlChange, style: _coinInfo),
                                Text(
                                    '${double.parse(_coins.atlChangePercentage.toString()).toStringAsFixed(2)}',
                                    style: _coins.atlChangePercentage
                                            .toString()
                                            .contains('-')
                                        ? _negativePercentage
                                        : _positivePercentage),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(StringData.marketCap, style: _coinInfo),
                                Flexible(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                        '${double.parse(_coins.marketCap_24h.toString()).toStringAsFixed(2)}',
                                        style: _coinData),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(StringData.marketCapChange,
                                    style: _coinInfo),
                                Text(
                                    '${double.parse(_coins.marketCapChangePercentage_24h.toString()).toStringAsFixed(2)}',
                                    style: _coins.marketCapChangePercentage_24h
                                            .toString()
                                            .contains('-')
                                        ? _negativePercentage
                                        : _positivePercentage),
                              ],
                            ),
                          ],
                        ),
                      ),
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
      }),
    );
  }
}
