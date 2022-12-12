import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textt extends StatelessWidget {
  final text;
  final size;
  final color;
  final decorationn;
  final mlines;
  const Textt({
    Key? key,
    required this.text,
    required this.size,
    this.color = Colors.black,
    this.decorationn,
    this.mlines
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
            maxLines: mlines,
        style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: size,
            color: color,
            decoration: decorationn));
  }
}
