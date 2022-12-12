import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Widgets/splashscreen.dart';

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
