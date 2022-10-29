import 'package:flutter/material.dart';
import 'package:todo/Widgets/splashscreen.dart';

class start extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return
     GestureDetector(
     onTap: () {
       Navigator.of(context).push(
         MaterialPageRoute(
           builder: (context) =>  SplashScreen(),
         ),
       );
     },

   );
  }


}