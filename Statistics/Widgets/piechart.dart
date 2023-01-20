// ignore_for_file: prefer_const_constructors, unnecessary_this, avoid_print, must_be_immutable

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../Tasks/Data/tasksRepository.dart';
import '../../Tasks/Data/TasksData.dart';

class Pie extends StatefulWidget {
  var list, checked;
  Pie({super.key, this.list, this.checked});

  @override
  State<Pie> createState() => _PieState();
}

class _PieState extends State<Pie> {
  final gradientList = <List<Color>>[
    [
      Color.fromRGBO(223, 250, 92, 1),
      Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      Color.fromRGBO(129, 182, 205, 1),
      Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      Color.fromRGBO(175, 63, 62, 1.0),
      Color.fromRGBO(254, 154, 92, 1),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    return Container(
      // decoration: BoxDecoration(color: Colors.white70),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          PieChart(
            chartRadius: deviceOrientation == Orientation.portrait ? 500 : 75,
            animationDuration: Duration(milliseconds: 300),
            dataMap: <String, double>{
              "Finished": widget.checked,
              "Not Finished": widget.list - widget.checked,
            },
            chartLegendSpacing: 32,
            chartType: ChartType.ring,
            baseChartColor: Colors.grey[50]!.withOpacity(0.15),
            gradientList: gradientList,
            // ignore: prefer_const_literals_to_create_immutables
            emptyColorGradient: [
              Color(0xff6c5ce7),
              Colors.blue,
            ],
            initialAngleInDegree: 0,
            chartValuesOptions: ChartValuesOptions(
              showChartValuesInPercentage: true,
              decimalPlaces: 1,
            ),
            totalValue: widget.list,
          ),
        ],
      ),
    );
  }
}
