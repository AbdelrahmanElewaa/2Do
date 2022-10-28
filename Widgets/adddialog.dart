
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class LottieScreen extends StatefulWidget {
  const LottieScreen({Key? key}) : super(key: key);

  @override
  _LottieScreenState createState() => _LottieScreenState();
}

class _LottieScreenState extends State<LottieScreen> with SingleTickerProviderStateMixin{
  late AnimationController lottieController;

  @override
  void initState() {
    super.initState();

    lottieController = AnimationController(
      vsync: this,
    );

    lottieController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        lottieController.reset();
      }
    });
  }

  @override
  void dispose() {
    lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lottie Implementation"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset("assets/cards.json",
                height: 300,
                width: 300,
                animate: true
            ),
            const SizedBox(height: 24,),
            ElevatedButton(
              onPressed: () => showSuccessfulDialog(),
              child: const Text("Update Transactions"),
            )
          ],
        ),

      ),
    );
  }
  void showSuccessfulDialog() => showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset("assets/transaction-completed.json",
                  repeat: false,
                  height: 200,
                  width: 200,
                  controller: lottieController,
                  onLoaded: (composition) {
                    lottieController.duration = composition.duration;
                    lottieController.forward();
                  }
              ),
              const Center(
                child: Text("Done!", style: TextStyle(
                    color: Colors.green,
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