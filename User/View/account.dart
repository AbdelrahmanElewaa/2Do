// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/Home/Widgets/account_tile.dart';
import 'package:todo/globals.dart';
import 'dart:io';
import '../../Shared/Widgets/textt.dart';
import '../../Shared/Widgets/iconn.dart';

class Account extends StatefulWidget {
  final name;
  final email;
  final password;
  final date;
  const Account({super.key, this.name, this.email, this.password, this.date});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final ImagePicker _picker = ImagePicker();
  String profilePicLink = currUser!.profileURL;

 @override
  void initState() {

  // FirebaseAuth.instance
  // .idTokenChanges()
  // .listen((User? user) {
  //   if (user == null) {
  //     print('User is currently signed out!');
  //     // GoRouter.of(context).go('/login');
  //     context.go('/login');
  //   } else {
  //    // currUser!.uid! = user.uid;
  //     print('User is signed in!');
  //   }
  // });
   currUser==null? context.go('/login'): '';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //* back button to Account
        title: Textt(text: 'Account', size: 25.0),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Iconn(icN: Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Stack(
                children: [
                  //* Avatar + edit button
                  profilePicLink == " "
                      ? const Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 80,
                  )
                      : CircleAvatar(
                    radius: 50.0,
                    backgroundImage:
                    NetworkImage(profilePicLink),
                    backgroundColor: Colors.transparent,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Wrap(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Upload from camera'),
                                onTap: () => imgFromCamera(),
                              ),
                              ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Upload from gallery'),
                                onTap: () => imgFromGallery(),
                              ),
                              ListTile(
                                leading: Icon(Icons.delete),
                                title: Text('Delete'),
                                onTap: () {
                                  setState(() {
                                    profilePicLink = " ";
                                  });
                                },
                              ),
                              // ListTile(
                              //   leading: Icon(Icons.info),
                              //   title: Text('Info'),
                              // ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(70, 80, 0, 0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          shape: BoxShape.circle),
                      child: Iconn(
                        icN: Icons.mode_edit_outline,
                        sizee: 30.0,
                      ),
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Padding(
              padding: const EdgeInsets.fromLTRB(
                  0,
                  10,
                  0,
                  10
              ),
                    child: Textt(
                      text: currUser!.name,
                      size: 20.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),

                    child: Textt(

                      text: currUser!.uid,
                      size: 15.0,
                    ),
                  ),
                  TextButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                        Theme.of(context).colorScheme.secondary,
                        // minimumSize: const Size.fromHeight(70), // NEW
                        shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(15)
                        )),
                    child: Text('Copy'),
                    onPressed: (){
                      Clipboard.setData(ClipboardData(text: currUser!.uid));
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Copied to clipboard!!')));
                    },
                  ),
                ],

              )
            ]),
          ),
          // ignore: prefer_const_literals_to_create_immutables

          Divider(
            height: 50,
            thickness: 1,
          ),
          Expanded(
            child: ListView(
              // ignore: prefer_const_literals_to_create_immutables
              //* tiles containing account info
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                ProfileListItem(
                  header: 'Name',
                  text: currUser!.name,
                ),
                ProfileListItem(
                  header: 'Email',
                  text: currUser!.email,
                ),
                ProfileListItem(
                  header: 'Password',
                  text: currUser!.pw,
                ),
                ProfileListItem(
                  header: 'Date of birth',
                  text: currUser!.dob,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

 void imgFromCamera() async {
   final pickedFile = await _picker.pickImage(source: ImageSource.camera);

   Reference ref = FirebaseStorage.instance.ref().child(pickedFile!.name);
   await ref.putFile(File(pickedFile.path));
   ref.getDownloadURL().then((value) async {
     setState(() {
       profilePicLink = value;
     });
   });
 }

 void imgFromGallery() async {
   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

   Reference ref = FirebaseStorage.instance.ref().child(pickedFile!.name);
   await ref.putFile(File(pickedFile.path));
   ref.getDownloadURL().then((value) async {
     setState(() {
       profilePicLink = value;
     });
   });
 }
}
