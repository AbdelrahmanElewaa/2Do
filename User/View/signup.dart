// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:todo/User/Data/UserData.dart';
import '../../Shared/Widgets/formm.dart';
import '../../Shared/Widgets/iconn.dart';
import '../../Shared/Widgets/sizedboxx.dart';
import '../../Shared/Widgets/textt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Domain/authservice.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // File? image;
  // Future pickImage() async {
  //   try{
  //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (image == null) return;
  //   final imageTemporary = File(image.path);
  //   setState(() {
  //     this.image = imageTemporary;
  //   });
  //   }on PlatformException catch(e){
  //     print(e);
  //   }
  // }

  final RegExp namevalid = RegExp('[a-zA-Z]');
  final formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mob = TextEditingController();
  final TextEditingController pw = TextEditingController();
  final TextEditingController conpw = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //*Signup text
                  Textt(
                    text: 'Sign up',
                    size: 50,
                  ),

                  SizedBoxx(h: 10.0),
                  // Stack(
                  //   children: [
                  //     //* Avatar + edit button
                  //     CircleAvatar(
                  //       radius: 45,
                  //       backgroundImage: AssetImage('assets/1024.png'),
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {
                  //         showModalBottomSheet(
                  //           context: context,
                  //           builder: (context) {
                  //             return Wrap(
                  //               // ignore: prefer_const_literals_to_create_immutables
                  //               children: [
                  //                 ListTile(
                  //                   leading: Icon(Icons.edit),
                  //                   title: Text('Edit'),
                  //                 ),
                  //                 ListTile(
                  //                   leading: Icon(Icons.delete),
                  //                   title: Text('Delete'),
                  //                   // onTap: () => pickImage(),
                  //                 ),
                  //                 // ListTile(
                  //                 //   leading: Icon(Icons.info),
                  //                 //   title: Text('Info'),
                  //                 // ),
                  //               ],
                  //             );
                  //           },
                  //         );
                  //       },
                  //       child: Container(
                  //         margin: EdgeInsets.fromLTRB(60, 60, 0, 0),
                  //         decoration: BoxDecoration(
                  //             color: Theme.of(context).colorScheme.secondary,
                  //             shape: BoxShape.circle),
                  //         child: Iconn(
                  //           icN: Icons.mode_edit_outline,
                  //           sizee: 30.0,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBoxx(),

                  //*Name textfield
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Formm(
                            htext: 'Name',
                            cont: name,
                            valid: (value) {
                              if (value == '') {
                                // && value.length < 7
                                return 'Required';
                              } else if (value.length < 7) {
                                return 'Invalid Name';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(15)),
                          child: IconButton(
                            onPressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now());
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate??DateTime.now());
                              print(formattedDate);
                            },
                            icon: Iconn(
                              icN: Icons.date_range_outlined,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBoxx(),
                  //*Email textfield
                  Formm(
                    htext: 'Email',
                    cont: email,
                    valid: (value) {
                      if (value == '') {
                        return 'Required';
                      } else {
                        return null;
                      }
                    },
                  ),

                  //*password textfield
                  SizedBoxx(),
                  Formm(
                    htext: 'Password',
                    obsectext: true,
                    cont: pw,
                    valid: (value) {
                      if (value == '') {
                        return 'Required';
                      } else if (value.length < 7) {
                        return 'Password must be at least 7 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBoxx(),
                  //*confirm password textfield
                  Formm(
                    htext: 'Confrim Password',
                    obsectext: true,
                    cont: conpw,
                    valid: (value) {
                      if (value == '') {
                        return 'Required';
                      } else if (value.length < 7) {
                        return 'Password Does not match';
                      } else {
                        return null;
                      }
                    },
                  ),

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
                        onPressed: () async {
                          final isValidForm = formKey.currentState!.validate();
                          if (isValidForm) {
                            if (pw.text == conpw.text) {
                              Userr u = Userr(
                                  name: name.text,
                                  email: email.text,
                                  mobile: mob.text,
                                  pw: pw.text);
                              final message =
                                  await AuthService().registration(user: u);
                              if (message == 'Success') {
                                GoRouter.of(context).go('/login');
                              } else {
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
                                // print(name.text+email.text+mob.text+pw.text+conpw.text);

                              }
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Error"),
                                      content:
                                          Text("The passwords do not match"),
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
                              // print(name.text+email.text+mob.text+pw.text+conpw.text);

                            }
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
            ),
          ),
        ),
      ),
    );
  }
}
