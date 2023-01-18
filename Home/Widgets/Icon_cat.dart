import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IconCat extends StatelessWidget {
  const IconCat({super.key});
  
iconcat(String cat)
  {
    if(cat=="other")
    {
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon( Icons.category_outlined),
      ],
    );
  }
}