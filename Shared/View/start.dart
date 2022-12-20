import 'package:flutter/material.dart';
import 'package:todo/Shared/View/splashscreen.dart';

class start extends StatefulWidget{
  @override
  s createState() {
    return s();
  }
}
class s extends State<start> {

  @override
  Widget build(BuildContext context) {
    return
      Container();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>  SplashScreen(),
        ),
      );
    });

  }
}
