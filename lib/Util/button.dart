import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final String text;
  VoidCallback onpressed;
  Button({Key? key,required this.text,required this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onpressed,
      color: Colors.purple[400],
    child: Text(text),);
  }
}
