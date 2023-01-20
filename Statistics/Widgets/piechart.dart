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
      Color.fromARGB(255, 189, 132, 0),
      Color.fromARGB(255, 255, 211, 100),
    ],
    [
      Color(0xFF911F27),
      Color(0xFF630A10),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    return Container(
      height: 300,
      child: PieChart(
        chartRadius: deviceOrientation == Orientation.portrait
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        animationDuration: Duration(milliseconds: 300),
        dataMap: <String, double>{
          "Finished": widget.checked,
          "Not Finished": widget.list - widget.checked,
        },
        chartLegendSpacing: 32,
        chartType: ChartType.disc,
        baseChartColor: Colors.grey[50]!.withOpacity(0.15),
        gradientList: gradientList,
        // ignore: prefer_const_literals_to_create_immutables

        initialAngleInDegree: 0,
        chartValuesOptions: ChartValuesOptions(
          showChartValuesInPercentage: true,
          decimalPlaces: 1,
        ),
        totalValue: widget.list,
      ),
    );
  }
}
