// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/login-signup_text.dart';
import '../util/sizedboxx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor: Color.fromARGB(255, 31, 86, 115),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBoxx(size: 10),
                // *login text

                LoginPageText(
                  text: 'Login',
                  size: 60,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                SizedBoxx(size: 10),
                // *wlecome back text
                LoginPageText(
                  text: 'Welcome back! Login with your credentials',
                  size: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),

                SizedBoxx(size: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBoxx(size: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextField(
                        obscureText: true,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBoxx(size: 4),
                Container(
                  padding: const EdgeInsets.all(25),
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          minimumSize: const Size.fromHeight(70), // NEW
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        GoRouter.of(context).go('/TodoList');
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginPageText(
                      text: "Don't have an account ? ",
                      size: 17,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("You have");
                      },
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).go('/signup');
                        },
                        child: Text('Sign up',
                            style: GoogleFonts.bebasNeue(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.amber,
                              decoration: TextDecoration.underline,
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
