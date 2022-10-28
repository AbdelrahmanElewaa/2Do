import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
extension ColorExtension on String {
  toColor() {
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

class Stat extends StatefulWidget {
  const Stat({super.key});

  @override
  State<Stat> createState() => _StatState();
}

class _StatState extends State<Stat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 'FFC045'.toColor(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
        backgroundColor: 'FFC045'.toColor(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
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
                           'Statistics',
                           style: TextStyle(
                             color: '0C2233'.toColor(),
                             fontSize: 40,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         SizedBox(
                           height: 8,
                         ),
                       ],
                     ),
                     //Notifcation
                     Container(
                       decoration: BoxDecoration(
                         color: '0C2233'.toColor(),
                         borderRadius: BorderRadius.circular(12),
                       ),
                       padding: EdgeInsets.all(12),
                       child: Icon(
                         Icons.add_circle,
                         color: '0A91AB'.toColor(),
                       ),
                     )
                   ],
                    ),
                  //Calender
                  
                 TableCalendar(
                   
                   firstDay: DateTime.utc(2010, 10, 16),
                   lastDay: DateTime.utc(2030, 3, 14),
                   focusedDay: DateTime.now(),
                   
                 )
                  
                  
                ],
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                color: '065471'.toColor(),
                child: Center(
                  child: Column(
                    children: [
                      // Excercise Heading
                      Row(
                        
                        children: [
                        //  SfCircularChart(
                          
                        //  ),
                        ],
                      ),
                  
                      
                  
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
