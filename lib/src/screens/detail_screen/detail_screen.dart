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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backwardsCompatibility: false,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 40,
          ),
          onPressed: () {
            canPop();
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 150,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
              decoration: BoxDecoration(
                color: ColorsApp.backgroundBottomColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      child: SfSparkAreaChart(
                          color: Colors.yellow,
                          labelDisplayMode: SparkChartLabelDisplayMode.high,
                          borderColor: Colors.orange,
                          borderWidth: 2,
                          trackball: SparkChartTrackball(
                              borderWidth: 2,
                              borderColor: Colors.black,
                              activationMode: SparkChartActivationMode.tap),
                          data: [5, 3, 6, 10, 7]),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  void canPop(){
    Navigator.pop(context);
  }
}
