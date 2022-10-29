import 'package:go_router/go_router.dart';
import 'package:todo/util/colorextension.dart';
import 'package:flutter/material.dart';
import '../util/tasks_tile.dart';
class home extends StatelessWidget{
  const home({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                          'Oct 2022',
                          style: TextStyle(
                            color: 'FFC045'.toColor(),
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
                        color: '065471'.toColor(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(12),
                      child: GestureDetector(
                        onTap:() {
                          GoRouter.of(context).go('/settings');
                        },
                        child: Icon(
                          Icons.settings,
                          color: 'FFC045'.toColor(),
                        ),
                      ),
                    )
                  ],
                ),
//Search Bar
                SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: '065471'.toColor(),
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color:'FFC045'.toColor(),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Search',
                          style: TextStyle(
                            color: 'FFC045'.toColor(),
                            fontSize: 20,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),

//Calender
                Center(
                  child: Row(
                    children: [

                      Container(
                        width: 340,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: '065471'.toColor(),
                        ),
                        child:

                        Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),

//Name Of Days
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                Text('Sat', style: TextStyle(color: 'FFC045'.toColor(), fontSize: 20),),
                                Text('Sun', style: TextStyle(color: 'FFC045'.toColor(), fontSize: 20),),
                                Text('Mon', style: TextStyle(color: 'FFC045'.toColor(), fontSize: 20),),
                                Text('Tue', style: TextStyle(color: 'FFC045'.toColor(), fontSize: 20),),
                                Text('Wed', style: TextStyle(color: 'FFC045'.toColor(), fontSize: 20),),
                                Text('Thu', style: TextStyle(color: 'FFC045'.toColor(), fontSize: 20),),
                                Text('Fri', style: TextStyle(color: 'FFC045'.toColor(), fontSize: 20),),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
// Days Numbers
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

                                Text('20', style: TextStyle(color: 'FFC045'.toColor(), fontSize: 20),),
                                Text('21', style: TextStyle(color: 'FFC045'.toColor(), fontSize: 20),),
                                Text('22', style: TextStyle(color: 'FFC045'.toColor(), fontSize: 20),),
                                Text('23', style: TextStyle(color: 'FFC045'.toColor(), fontSize: 20),),

                                Container(
                                  width: 28,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: '0A91AB'.toColor(),
                                  ),
                                  child: Center(child: Text('24', style: TextStyle(color:'FFC045'.toColor(), fontSize: 20),),),
                                ),

                                Text('25', style: TextStyle(color: 'FFC045'.toColor(), fontSize: 20),),
                                Text('26', style: TextStyle(color: 'FFC045'.toColor(), fontSize: 20),),
                              ],
                            ),
                          ],
                        ),

                      ),

                    ],
                  ),
                ),

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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tasks',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20, color: 'FFC045'.toColor()),
                        ),
                        Icon(Icons.more_horiz,color: 'FFC045'.toColor(),)
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
//Tasks Dashboard
                    Expanded(child: ListView(
                      children: [
                        TasksTile(
                          icon:Icons.work,
                          taskName: 'Project Meeting',
                          subTitle: 'Emergency',
                          color: Colors.blue,
                        ),
                        TasksTile( icon:Icons.sports_gymnastics,
                          taskName: 'Gym',
                          subTitle: 'Sports',
                          color: Colors.green,),
                        TasksTile( icon:Icons.dinner_dining,
                          taskName: 'Dinner',
                          subTitle: 'Appoitment',
                          color: Colors.red,),
                      ],
                    )),
                    SizedBox(
                      height: 8,
                    ),
// ADD Button
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: '0C2233'.toColor(),
                      ),
                      child: Center(child: Icon(Icons.add, color:'FFC045'.toColor() ,)),
                    ),

                  ],

                ),

              ),

            ),

          ),
        ],
      ),
    );
  }

}
