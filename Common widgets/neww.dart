// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Common%20widgets/searchbar.dart';

import 'drawerr.dart';

import 'notes_searchbar.dart';
import 'sizedboxx.dart';
import 'textt.dart';
import '../Data/NotesData.dart';

class MySquare extends StatelessWidget {
  final title;
  final content;
  final time;

  MySquare({super.key, this.title, this.content, this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Textt(
                    text: title,
                    size: 16.0,
                    mlines: 1,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Textt(
                      text: content,
                      size: 12.0,
                      mlines: 1,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                  Flexible(
                    child: Textt(
                      text: '$time',
                      size: 12.0,
                      mlines: 1,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
