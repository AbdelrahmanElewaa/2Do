import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Drawerr extends StatelessWidget {
  const Drawerr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(' My Profile '),
                onTap: () {
                  GoRouter.of(context).go('/settings');
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text(' Edit Profile '),
                onTap: () {
                  GoRouter.of(context).go('/account');
                },
              ),
              ListTile(
                leading: const Icon(Icons.login),
                title: const Text(' Login '),
                onTap: () {
                  GoRouter.of(context).go('/login');
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ), 
    );
  }
}
