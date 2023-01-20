// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:todo/Statistics/Widgets/piechart.dart';
import 'stat_horizental.dart';
import 'stat_vertical.dart';
import '../../Shared/Widgets/sizedboxx.dart';
// import '../../Common widgets/sizedboxx.dart';

class Stat extends StatefulWidget {
  Stat({super.key});

  @override
  State<Stat> createState() => _StatState();
}

class _StatState extends State<Stat> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: StatVertical(),
    );
  }
}
