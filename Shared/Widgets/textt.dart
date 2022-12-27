import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textt extends StatelessWidget {
  final text;
  final size;
  final colorr;
  final decorationn;
  final mlines;
  final textAli;
  const Textt({
    Key? key,
    required this.text,
    required this.size,
    this.colorr = Colors.black,
    this.decorationn,
    this.mlines,
    this.textAli,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: mlines,
        textAlign: textAli,
        style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: checkDouble(size),
            color: colorr,
            decoration: decorationn));
  }

  double? checkDouble(dynamic value) {
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }
}
