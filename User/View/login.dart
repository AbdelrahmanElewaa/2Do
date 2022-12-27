// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Shared/Widgets/formm.dart';
import '../../Shared/Widgets/iconn.dart';
import '../../Shared/Widgets/sizedboxx.dart';
import '../../Shared/Widgets/textt.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          //* back button to login
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Iconn(
              icN: Icons.arrow_back_ios_new,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Center(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // *login text

                  Textt(
                    text: 'Login',
                    size: 50,
                  ),
                  SizedBoxx(h: 10.0),
                  // *wlecome back text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Center(
                      child: Textt(
                        text: 'Welcome back! Login with your credentials',
                        textAli: TextAlign.center,
                        size: 20,
                      ),
                    ),
                  ),

                  SizedBoxx(h: 20.0),
                  //* Email textfield
                  Formm(htext: 'Email'),
                  SizedBoxx(h: 12.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //* password text field
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: TextFormField(
                          //-password validation
                          validator: (value) {
                            if (value != null && value.length < 7) {
                              return 'Enter minmum 7 characters';
                            } else {
                              return null;
                            }
                          },
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
                  SizedBoxx(h: 4.0),
                  Container(
                    padding: const EdgeInsets.all(25),
                    child: SizedBox(
                      height: 50,
                      //*login button
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            minimumSize: const Size.fromHeight(70), // NEW
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        //-validation (button)
                        onPressed: () {
                          final isValidForm = formKey.currentState!.validate();
                          if (isValidForm) {
                            GoRouter.of(context).go('/TodoList');
                          }
                        },
                        child: const Textt(
                          text: 'Login',
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //*dont have an account text
                      Textt(
                        text: "Don't have an account ? ",
                        size: 17,
                      ),
                      GestureDetector(
                        onTap: () {
                          print("You have");
                        },
                        //* switch to signup button
                        child: GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/signup');
                          },
                          child: Textt(
                            text: 'Sign up',
                            size: 17,
                            colorr: Theme.of(context).colorScheme.secondary,
                            decorationn: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
