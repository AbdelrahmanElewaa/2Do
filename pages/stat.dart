import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:todo/util/colorextension.dart';


class Stat extends StatefulWidget {
  const Stat({super.key});

  @override
  State<Stat> createState() => _StatState();
}

class _StatState extends State<Stat> {
  late List<GPDData> _chartData;
  @override
  void initState() {
    // TODO: implement initState
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 'FFC045'.toColor(),
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
                            'Statistics',
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
           
            Expanded(
              child: SizedBox(
                height: 0,
                child: Container(
                
                  color: '065471'.toColor(),
                  child: Center(
                    child: SfCircularChart(series:<CircularSeries>[
                      PieSeries<GPDData,String>(
                        dataSource:_chartData,
                        xValueMapper: (GPDData data, _) => data.continent,
                        yValueMapper: (GPDData data, _) => data.gdb,
                         )
                    ],),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<GPDData> getChartData() {
    final List<GPDData> chartData = [
      GPDData('Ocenia', 1600),
      GPDData('Ocenia', 1600),
      GPDData('Ocenia', 1600),
      GPDData('Ocenia', 1600),
      GPDData('Ocenia', 1600),
      GPDData('Ocenia', 1600),
    ];
    return chartData;
  }
}

class GPDData {
  GPDData(this.continent, this.gdb);
  final String continent;
  final int gdb;
}
