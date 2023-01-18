// ignore_for_file: prefer_const_constructors

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        child: Icon(
          Icons.more_horiz,
          color: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Wrap(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Edit'),
                    
                  ),
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Delete'),
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('Info'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
