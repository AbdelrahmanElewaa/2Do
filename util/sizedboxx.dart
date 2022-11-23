import 'package:flutter/material.dart';

class SizedBoxx extends StatelessWidget {
  final double size;
  const SizedBoxx({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:size
    );
  }
}