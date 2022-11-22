import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:todo/util/colorextension.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:todo/util/piechart.dart';

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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 0,
            ),
            //greating Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Calender',
                            style: TextStyle(
                              color: '0C2233'.toColor(),
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 0,
                          ),
                        ],
                      ),
                      //Notifcation
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(140, 255, 193, 7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(12),
                        child: GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/TodoList');
                          },
                          child: Icon(
                            Icons.add,
                            color: Color.fromARGB(255, 12, 34, 51),
                          ),
                        ),
                      )
                    ],
                  ),
                  //Calender

                  Container(
                    height: 395,
                    child: TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                    ),
                  )
                ],
              ),
            ),

         Pie(),
          ],
        ),
      ),
    );
  }
}
