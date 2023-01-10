// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Shared/Widgets/searchbar.dart';
import '../../Shared/Widgets/sizedboxx.dart';
import '../../Shared/Widgets/drawerr.dart';
import '../../Tasks/Domain/AddTask.dart';
import '../Widgets/tasks_tile.dart';
import '../../Shared/Widgets/calenderweek.dart';
import 'package:intl/intl.dart';
import 'home_horizental.dart';
import 'home_vertical.dart';

class home extends StatelessWidget {
  home({super.key});

  String formattedDate = DateFormat('MM-yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    final deviceOrientation= MediaQuery.of(context).orientation;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: Theme.of(context).iconTheme,
        ),
        drawer: Drawerr(),
        body: Center(
          child: deviceOrientation== Orientation.portrait? HomeVertical():HomeHorizental(), 
        )
      ),
    );
  }
}
