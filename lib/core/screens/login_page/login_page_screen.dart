import 'package:flutter/material.dart';

class LoginPageScreen extends StatefulWidget {
  LoginPageScreen({Key? key}) : super(key: key);

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
      child:ListView(
        children: <Widget> [
          Container(
            alignment: Alignment.center,
          )
        ],
      )
    );
  }
}