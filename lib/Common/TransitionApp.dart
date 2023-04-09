import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransitionApp {

  static closePageOrDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  static openPage(BuildContext context, var page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

}