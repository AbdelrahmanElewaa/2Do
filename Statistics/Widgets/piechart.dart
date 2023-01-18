// ignore_for_file: prefer_const_constructors

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../Tasks/Data/tasksRepository.dart';
import '../../Tasks/Data/TasksData.dart';
import '../../Tasks/Domain/TasksModel2.dart';

class Pie extends StatefulWidget {
  Pie({super.key});

  @override
  State<Pie> createState() => _PieState();
}

class _PieState extends State<Pie> {
  final taskrep = TasksRepository.instance;
  List<Todo> todoss = [];
  double checked = 0;
  @override
  void initState() {
    taskrep.fetchTodoList().then((value) {
      setState(() {
        todoss = value;
        for (int i = 0; i < todoss.length; i++) {
          if (todoss[i].checked == "true") {
            checked++;
          }
        }
      });
    });
    super.initState();
  }

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
      child: PieChart(
        chartRadius: deviceOrientation == Orientation.portrait ? 500 : 75,
        animationDuration: Duration(milliseconds: 300),
        dataMap: <String, double>{
          "Finished": checked,
          "Not Finished": todoss.length.toDouble() - checked,
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
        totalValue: todoss.length.toDouble(),
      ),
    );
  }
}
