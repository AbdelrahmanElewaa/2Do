import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Pie extends StatelessWidget {
  Pie({super.key});
  final dataMap = <String, double>{
    "Finished": 5,
    "Not Finished": 15,
  };

  final colorList = <Color>[
    Colors.greenAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
     final deviceOrientation= MediaQuery.of(context).orientation;
    return Container(
      decoration: BoxDecoration(color: Colors.white70),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: PieChart(
        chartRadius: deviceOrientation== Orientation.portrait? 500:75,
       
        dataMap: dataMap,
        chartType: ChartType.ring,
        baseChartColor: Colors.grey[50]!.withOpacity(0.15),
        colorList: colorList,
        chartValuesOptions: ChartValuesOptions(
          showChartValuesInPercentage: true,
        ),
        totalValue: 20,
      ),
    );
  }
}
