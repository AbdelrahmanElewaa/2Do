// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todo/User/Data/UserFirestore.dart';
import 'package:todo/User/Domain/authservice.dart';
import 'package:todo/globals.dart';

import '../../Shared/Widgets/sizedboxx.dart';

class ProfileListItem extends StatefulWidget {
  final header;
  final text;
  const ProfileListItem({super.key, required this.header, this.text});

  @override
  State<ProfileListItem> createState() => _ProfileListItemState();
}

class _ProfileListItemState extends State<ProfileListItem> {
  TextEditingController textcontroller = TextEditingController();
  void initState() {
    textcontroller.text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      //* container
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        //* text field
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* header
                  Text(
                    widget.header,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //* update button
                  GestureDetector(
                    child: Text(
                      'update',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    onTap: () async{
                      if (textcontroller.text != widget.text)
                        //* update the text
                        widget.header=='Name'?currUser!.name=textcontroller.text:
                        widget.header=='Email'?currUser!.email=textcontroller.text:
                        widget.header=='Password'?currUser!.pw=textcontroller.text:
                        currUser!.dob=textcontroller.text;
                       await editUser(currUser!.uid!, currUser!);
                        widget.header=='Passowrd'?await AuthService().updatepw(widget.text,textcontroller.text):
                        widget.header=='Email'?'':'';
                        // print(textcontroller.text);
                    },
                  ),
                ],
              ),
              //* text
              TextField(
                controller: textcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.text,
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
