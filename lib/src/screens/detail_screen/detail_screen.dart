import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../constants/colors.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

//Class which is used as type for the data source.

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    // Calling getData method to add data to the list
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
            Navigator.pop(context);
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
}
