// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Shared/Widgets/formm.dart';
import '../../Shared/Widgets/iconn.dart';
import '../../Shared/Widgets/sizedboxx.dart';
import '../../Shared/Widgets/textt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController name=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController mob=TextEditingController();
  final TextEditingController pw=TextEditingController();
  final TextEditingController conpw=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        //* back button to signup
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
            child: Wrap(
              children: [
               Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //*Signup text
                  Textt(
                    text: 'Sign up',
                    size: 50,
                  ),
                  SizedBoxx(h: 10.0),
                  //*Create account text
                  Textt(
                    text: 'Create a free account',
                    size: 20,
                  ),
                  SizedBoxx(h: 20.0),
                  //*email textfield
                  Formm(htext: 'Name',cont: name),
                  SizedBoxx(h: 12.0),
                  //*password textfield
                  Formm(htext: 'Email',cont: email),
                  SizedBoxx(h: 12.0),
            
                  Formm(htext: 'Mobile Number', cont: mob),
                  SizedBoxx(h: 12.0),
            
                  Formm(htext: 'Password', obsectext: true,cont: pw),
                  SizedBoxx(h: 12.0),
                  //*confirm password textfield
                  Formm(htext: 'Confrim Password', obsectext: true,cont: conpw),
                  SizedBoxx(h: 4.0),
                  //*signup button
                  Container(
                    padding: const EdgeInsets.all(25),
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            minimumSize: const Size.fromHeight(70), // NEW
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          final isValidForm = formKey.currentState!.validate();
                          if (isValidForm) {
                            print(name.text+email.text+mob.text+pw.text+conpw.text);
                            GoRouter.of(context).go('/login');
                            
                          }
                        },
                        child: Textt(
                          text: 'Sign up',
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //* already have an account text
                      Textt(
                        text: "Already have an account? ",
                        size: 17,
                      ),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).go('/login');
                        },
                        //* login switch text
                        child: Textt(
                          text: 'Login',
                          size: 17,
                          colorr: Theme.of(context).colorScheme.secondary,
                          decorationn: TextDecoration.underline,
                        ),
                      ),
                    ],
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
