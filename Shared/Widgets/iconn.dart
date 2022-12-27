// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Iconn extends StatelessWidget {
  final icN;
  final sizee;
  const Iconn({
    Key? key,
    required this.icN,
    this.sizee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icN,
      color: Theme.of(context).colorScheme.primary,
      size: sizee,
    );
  }
}
