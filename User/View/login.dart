// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Shared/Widgets/formm.dart';
import '../../Shared/Widgets/iconn.dart';
import '../../Shared/Widgets/sizedboxx.dart';
import '../../Shared/Widgets/textt.dart';
import '../Domain/authservice.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController email=TextEditingController();
  final TextEditingController pw=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        // resizeToAvoidBottomInset: false,
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
        body: SingleChildScrollView(
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
                  Formm(htext: 'Email',cont: email),
                  SizedBoxx(h: 12.0),
                  //* Password textfield
                  Formm(htext: 'Password', obsectext: true,cont: pw),
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
                        onPressed: () async{
                          final isValidForm = formKey.currentState!.validate();
                          if (isValidForm) {
                            print(email.text+pw.text);
                            final message = await AuthService().login(
                              email: email.text, 
                              password: pw.text);
                              if (message=='Success')
                            GoRouter.of(context).go('/TodoList');
                            else{
                              showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Error"),
                                  content: Text(message!),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text("Close"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
                            }
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
