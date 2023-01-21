// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'stat_page.dart';

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
      body: StatPage(),
    );
  }
}
