import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldBase extends StatelessWidget {

  String name;
  IconData icon;
  bool obscureText;
  TextEditingController? controller = TextEditingController();

  TextFieldBase(this.name, this.icon, {this.obscureText = false, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      height: 45,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          )
        ]
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.deepPurple
          ),
          hintText: name,
          border: InputBorder.none,
        ),
      ),
    );
  }

}