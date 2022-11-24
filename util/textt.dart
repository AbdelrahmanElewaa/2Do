import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textt extends StatelessWidget {
  final text;
  final double size;
  final color;
  const Textt({
    Key? key,
    this.text,
    required this.size, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.bebasNeue(
          fontWeight: FontWeight.bold,
          fontSize: size,
          color: color,
        ));
  }
}
