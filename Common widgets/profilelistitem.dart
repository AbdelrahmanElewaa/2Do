//account bars (account,login,feedback,logout)
import 'package:flutter/material.dart';

class ProfileListItemm extends StatelessWidget {
  final IconData icon;
  final text;
  const ProfileListItemm({super.key, required this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: 70,
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(139, 255, 106, 7),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(children: [
            Icon(
              icon,
              size: 40,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 30,
            ),
          ]),
        ),
      ),
    );
  }
}
