import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../Home/View/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      // disableNavigation: ,
      splash: Lottie.asset('assets/splashscreen.json'),
      splashTransition: null,
      // function: ,
      // Column(
      //   children: [
      // /TODO Add your image under assets folder
      //     // Image.asset('assets/logo_icon.png'),
      //     const Text('Cake app', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),)
      //   ],
      // ),
      backgroundColor: Colors.white,
      nextScreen:   HomePage(selectedIndex: 0),
      // nextRoute: context.go("")
      // nextRoute:
      // );

      splashIconSize: 250,
      duration: 3000,
      // splashTransition: SplashTransition.decoratedBoxTransition,
      // pageTransitionType: PageTransitionType.leftToRightWithFade,
      // animationDuration: const Duration(seconds: 1),
      disableNavigation: false,
    );
  }
}



