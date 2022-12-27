// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Iconn extends StatelessWidget {
  const Iconn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_back_ios_new,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
