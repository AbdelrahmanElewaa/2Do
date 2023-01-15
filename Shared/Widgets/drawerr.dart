// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/Shared/Widgets/sizedboxx.dart';
import 'package:todo/Shared/Widgets/textt.dart';
import 'drawerrheader.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/dark_theme_provider.dart';

class Drawerr extends StatefulWidget {
  const Drawerr({super.key});

  @override
  State<Drawerr> createState() => _DrawerrState();
}

class _DrawerrState extends State<Drawerr> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Drawer(
      elevation: 0.0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Expanded(
        child: ListView(
          children: [
            DrawerrHeader(),
            ListTile(
              leading: Icon(Icons.person,
                  color: Theme.of(context).colorScheme.primary),
              title: Textt(text: 'My Profile', size: 15.0),
              onTap: () {
                GoRouter.of(context).go('/account');
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.login, color: Theme.of(context).colorScheme.primary),
              title: Textt(text: 'Login', size: 15.0),
              onTap: () {
                GoRouter.of(context).go('/login');
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.logout, color: Theme.of(context).colorScheme.primary),
              title: Textt(text: 'Logout', size: 15.0),
              onTap: () async{
                // GoRouter.of(context).go('/login');
                await FirebaseAuth.instance.signOut();
              },
            ),
            Container(
              child: SwitchListTile(
                title: Textt(text: 'Theme', size: 15.0),
                secondary: Icon(
                  themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onChanged: (bool value) {
                  setState(() {
                    themeState.setDarkTheme = value;
                  });
                },
                value: themeState.getDarkTheme,
              ),
            ),
            SizedBoxx(h: 270.0),
            Column(
              children: [
                GestureDetector(
                  child: Container(
                    width: 120.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4.0,
                            color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Textt(size: 25.0, text: 'Logout'),
                    )),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
