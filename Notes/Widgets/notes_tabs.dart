// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Shared/Widgets/textt.dart';

class MySquare extends StatelessWidget {
  final title;
  final content;
  final time;
  final id;

  MySquare({super.key, this.title, this.content, this.time, this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).goNamed(
          "notesdetails",
          params: {'title': title, 'content': content, 'id': id},
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(0.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Textt(
                        text: title,
                        size: 16.0,
                        mlines: 1,
                      ),
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
                        colorr: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                    Flexible(
                      child: Textt(
                        text: '$time',
                        size: 12.0,
                        mlines: 1,
                        colorr: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
