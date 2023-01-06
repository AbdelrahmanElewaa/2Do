import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(140, 255, 193, 7),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(12),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).go('/settings');
        },
        child: Icon(
          Icons.settings,
          color: Color.fromARGB(255, 12, 34, 51),
        ),
      ),
    );
  }
}
