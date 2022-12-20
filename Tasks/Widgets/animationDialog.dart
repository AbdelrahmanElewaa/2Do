
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../Home/View/home_page.dart';


class animationDialog extends StatefulWidget {

   String animationTitle='';

  animationDialog({
    required this.animationTitle,
    // required this.onTodoChanged,
  }) : super(key: ValueKey(animationTitle));
  @override
  animate createState() {
    return animate();
    // animationTitle: animationTitle
  }

}

class animate extends State<animationDialog>  with SingleTickerProviderStateMixin {
  late AnimationController lc;


  @override
  void initState() {
    super.initState();

    lc = AnimationController(
      vsync: this,
    );

    lc.addStatusListener((status)  {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  HomePage(selectedIndex:2)),
        );
      }
    });
  }

  @override
  void dispose() {
    lc.dispose();
    super.dispose();
  }
  void showUpdatedDialog(BuildContext context) {
      lc = AnimationController(
        vsync: this,
      );

  lc.addStatusListener((status)  {
  if (status == AnimationStatus.completed) {
  Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) =>  HomePage(selectedIndex:2)),
  );
  }
  });
      showDialog(
      context: context,
      builder: (context) => Dialog(

        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(100.2),
          ),
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset("assets/added.json",
                  repeat: false,
                  height: 200,
                  width: 200,
                  controller: lc,
                  onLoaded: (composition) {
                    lc.duration = composition.duration;
                    lc.forward();
                    // lc.
                  }


              ),
              const Center(
                child: Text("Updated!", style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),),
              ),
              const SizedBox(height: 21),
            ]
        ),
      )
  );
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      // child: showUpdatedDialog(),
    );
  }
}

