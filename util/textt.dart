import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textt extends StatelessWidget {
  final text;
  final double size;
  final color;
  final decorationn;
  const Textt({
    Key? key,
    this.text,
    required this.size,
    this.color = Colors.black,
    this.decorationn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: size,
            color: color,
            decoration: decorationn));
  }
}
