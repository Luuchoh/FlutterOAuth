import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextMessage extends StatelessWidget {

  String text;

  TextMessage(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15
      ),
    );
  }
  
}