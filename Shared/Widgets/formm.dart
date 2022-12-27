// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';

class Formm extends StatelessWidget {
  final htext;
  final bool obsectext;
  const Formm({
    Key? key,
    this.htext,
    this.obsectext = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: TextFormField(
            //-Validation
            validator: (value) {
              if (value != null && value.length < 7) {
                return 'Enter minmum 7 characters';
              } else {
                return null;
              }
            },
            obscureText: obsectext,

            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: htext,
            ),
          ),
        ),
      ),
    );
  }
}
