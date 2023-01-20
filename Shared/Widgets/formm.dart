// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';

class Formm extends StatelessWidget {
  final errmax;
  final w;
  final valid;
  final htext;
  final bool obsectext;
  final TextEditingController cont;
  const Formm({
    Key? key,
    this.w = 1.0,
    this.valid,
    this.htext,
    this.obsectext = false,
    this.errmax,
    required this.cont,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * w,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          scrollPadding: EdgeInsets.only(bottom: 40),
          controller: cont,
          //-Validation
          validator: valid,
          obscureText: obsectext,

          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            // textfield input color
            errorMaxLines: errmax,
            labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 2.0),
            ),

            labelText: htext,
          ),
        ),
      ),
    );
  }
}
