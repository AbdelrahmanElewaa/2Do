// ignore_for_file: prefer_const_constructors

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.all(12),
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Icon(
            Icons.search,
            color: Color.fromARGB(255, 12, 34, 51),
          ),
          SizedBox(
            width: 5,
          ),
          Text('Search',
              style: TextStyle(
                color: Color.fromARGB(255, 12, 34, 51),
                fontSize: 20,
              )),
        ],
      ),
    );
  }
}
