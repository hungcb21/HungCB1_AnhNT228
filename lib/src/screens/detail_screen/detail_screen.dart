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
  double heightOfTopContainer = 150;
  double heightOfChartCoin = 200;
  final chartCoinPadding = EdgeInsets.fromLTRB(20, 40, 20, 0);
  final chartCoinBorderRadius = BorderRadius.only(
    topRight: Radius.circular(40),
    topLeft: Radius.circular(40),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: ColorsApp.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backwardsCompatibility: false,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(_coins.name,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: AppFontWeight.extraBold, color: Colors.white)),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 40,
            ),
            onPressed: () => {Navigator.pop(context)},
          ),
        ),
        body: Column(
          children: [
            Container(
              height: heightOfTopContainer,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: chartCoinPadding,
                decoration: BoxDecoration(
                    color: ColorsApp.backgroundBottomColor,
                    borderRadius: chartCoinBorderRadius),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: heightOfChartCoin,

                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
