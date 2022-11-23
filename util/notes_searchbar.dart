import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class NotesSearchbar extends StatefulWidget {
  const NotesSearchbar({super.key});

  @override
  State<NotesSearchbar> createState() => _NotesSearchbarState();
}

class _NotesSearchbarState extends State<NotesSearchbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          SizedBox(
            width: 5,
          ),
          Text('Search',
              style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontSize: 20,
              )),
        ],
      ),
    );
  }
}
